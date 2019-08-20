Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC76E7ECB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 06:48:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7K6mwTQ027370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2019 23:48:58 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 23:48:57 -0700
To: <drew.moseley@northern.tech>, <openembedded-devel@lists.openembedded.org>
References: <20190719195856.4305-1-drew.moseley@northern.tech>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e92453f6-cd7b-6adc-23cc-8c2255c3b232@windriver.com>
Date: Tue, 20 Aug 2019 14:48:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719195856.4305-1-drew.moseley@northern.tech>
Subject: Re: [meta-networking][PATCH] networkmanager: Use ALTERNATIVES for resolv-conf handling.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2019 06:48:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/20 上午3:58, drew.moseley@northern.tech wrote:
> From: Drew Moseley <drew.moseley@northern.tech>
>
> This brings the networkmanager in sync with how systemd-resolved and connman
> work. Additionally this allows it to function with a read-only rootFS.
>
> Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
> ---
>   .../networkmanager/networkmanager_1.18.0.bb          | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
> index 21fbea9c1..037566783 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
> @@ -20,7 +20,7 @@ DEPENDS = " \
>       curl \
>   "
>   
> -inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc
> +inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
>   
>   SRC_URI = " \
>       ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
> @@ -141,6 +141,16 @@ FILES_${PN}-nmtui-doc = " \
>   
>   SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
>   
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
> +ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
> +ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
> +
>   do_install_append() {
>       rm -rf ${D}/run ${D}${localstatedir}/run
> +
> +    # For read-only filesystem, do not create links during bootup
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
> +    fi
>   }

Hi Drew,

After apply your patch, I meet a error with systemd init manager that 
/etc/resolv.conf is a mangling link file:

root@qemux86-64:~# ls -l /etc/resolv*
lrwxrwxrwx    1 root     root            33 Aug 20 03:22 
/etc/resolv-conf.NetworkManager -> ../run/NetworkManager/resolv.conf
lrwxrwxrwx    1 root     root            34 Aug 15 06:14 
/etc/resolv-conf.systemd -> ../run/systemd/resolve/resolv.conf
lrwxrwxrwx    1 root     root            31 Aug 20 03:26 
/etc/resolv.conf -> /etc/resolv-conf.NetworkManager
root@qemux86-64:~# cat /etc/resolv.conf
cat: can't open '/etc/resolv.conf': No such file or directory

There is no /run/NetworkManager/resolv.conf actually. What's the 
behavior in your environment?


-- 
Kai Kang



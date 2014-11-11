Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3218720BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 02:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAB2Jfwk013145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 18:19:41 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 10 Nov 2014 18:19:41 -0800
Message-ID: <54617239.1020609@windriver.com>
Date: Tue, 11 Nov 2014 10:19:37 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1414664583-26791-1-git-send-email-Chong.Lu@windriver.com>
	<1414664583-26791-2-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1414664583-26791-2-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-oe][PATCH 2/2] samba: fix error messages when startup samba service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Nov 2014 02:19:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

//Chong

On 10/30/2014 06:23 PM, Chong Lu wrote:
> This solves the following error messages when startup samba:
>
>    Unable to open new log file '/var/log/samba/log.smbd': No such file or directory
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-connectivity/samba/samba.inc | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
> index 4392821..68e1b1f 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -35,7 +35,7 @@ EXTRA_OECONF='--disable-cups \
>                 --with-privatedir=${sysconfdir}/samba/private \
>                 --with-lockdir=${localstatedir}/lock \
>                 --with-piddir=${localstatedir}/run \
> -              --with-logfilebase=${localstatedir}/log \
> +              --with-logfilebase=${localstatedir}/log/samba \
>                 --libdir=${libdir} \
>                 --with-mandir=${mandir} \
>                 --with-swatdir=${datadir}/swat \
> @@ -123,6 +123,12 @@ do_install_append() {
>       sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
>           -e 's,@SBINDIR@,${sbindir},g' \
>           -i ${D}${systemd_unitdir}/system/*.service
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +	install -d ${D}${sysconfdir}/tmpfiles.d
> +	echo "d ${localstatedir}/log/samba 0755 root root -" \
> +            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
> +    fi
>   }
>   
>   DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"



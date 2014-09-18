Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9EBF71467
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 01:25:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I1Ptid013599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 18:25:55 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Sep 2014 18:25:55 -0700
Message-ID: <541A34A0.80008@windriver.com>
Date: Thu, 18 Sep 2014 09:25:52 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1411003439-20287-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1411003439-20287-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-oe][PATCH] collectd: add systemd unit file
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
X-List-Received-Date: Thu, 18 Sep 2014 01:25:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

This patch based on http://patches.openembedded.org/patch/79835/

Thanks
Chong

On 09/18/2014 09:23 AM, Chong Lu wrote:
> Add systemd unit file for collectd.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta-oe/recipes-extended/collectd/collectd/collectd.service | 12 ++++++++++++
>   meta-oe/recipes-extended/collectd/collectd_5.4.1.bb         | 13 +++++++++++--
>   2 files changed, 23 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd.service
>
> diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd.service b/meta-oe/recipes-extended/collectd/collectd/collectd.service
> new file mode 100644
> index 0000000..d835b73
> --- /dev/null
> +++ b/meta-oe/recipes-extended/collectd/collectd/collectd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=Collectd
> +After=local-fs.target network.target
> +Requires=local-fs.target network.target
> +
> +[Service]
> +ExecStart=@SBINDIR@/collectd -C /etc/collectd.conf -f
> +Restart=always
> +RestartSec=10
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
> index dc5f88f..46752c8 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
> @@ -9,11 +9,14 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
>              file://no-gcrypt-badpath.patch \
>              file://collectd-version.patch \
>              file://glibc-2.20-compatiblity.patch \
> -           file://collectd.init"
> +           file://collectd.init \
> +           file://collectd.service"
>   SRC_URI[md5sum] = "6f56c71c96573a7f4f7fb3bfab185974"
>   SRC_URI[sha256sum] = "75452129f271cb0aad28e57f12a49070618bbb7b6a9d64cf869e8766fa2f66e0"
>   
> -inherit autotools pythonnative update-rc.d pkgconfig
> +inherit autotools pythonnative update-rc.d pkgconfig systemd
> +
> +SYSTEMD_SERVICE_${PN} = "collectd.service"
>   
>   # Floatingpoint layout, architecture dependent
>   # 'nothing', 'endianflip' or 'intswap'
> @@ -55,6 +58,12 @@ do_install_append() {
>   
>       rmdir "${D}${localstatedir}/run"
>       rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
> +
> +    # Install systemd unit files
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/collectd.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' \
> +        ${D}${systemd_unitdir}/system/collectd.service
>   }
>   
>   INITSCRIPT_NAME = "collectd"



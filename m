Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 783E165D70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 04:17:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5B4HUJG023361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 21:17:30 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Jun 2014 21:17:29 -0700
Message-ID: <5397D858.8020408@windriver.com>
Date: Wed, 11 Jun 2014 12:17:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1401987607-32495-1-git-send-email-eduardo@monkey.io>
In-Reply-To: <1401987607-32495-1-git-send-email-eduardo@monkey.io>
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Wed, 11 Jun 2014 04:17:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2014 01:00 AM, Eduardo Silva wrote:
> This patch adds the Monkey HTTP Server v1.5.0 recipes. The content
> on this patch includes the modifications suggested by people in the
> Maling List.
>
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>   .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> new file mode 100644
> index 0000000..07a202f
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Fast and Lightweight HTTP Server for Linux"
> +HOMEPAGE = "http://monkey-project.com"
> +BUGTRACKER = "https://github.com/monkey/monkey/issues"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +SECTION = "net"
> +
> +SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> +SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
> +SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
> +
> +EXTRA_OECONF = " \
> +             --plugdir=${libdir}/monkey/ \
> +             --logdir=${localstatedir}/log/monkey/ \
> +             --pidfile=${localstatedir}/run/monkey.pid \
> +             --default-user=www-data \
> +             --datadir= ${localstatedir}/www/monkey/ \

Here is an extra space, perhaps a typo, please ?

// Robert

> +             --sysconfdir=${sysconfdir}/monkey/ \
> +             --enable-plugins=* \
> +             --disable-plugins=polarssl \
> +             --debug \
> +             --malloc-libc \
> +"
> +
> +inherit autotools pkgconfig update-rc.d systemd
> +
> +INITSCRIPT_NAME = "monkey"
> +INITSCRIPT_PARAMS = "defaults 70"
> +
> +SYSTEMD_SERVICE_${PN} = "monkey.service"
> +
> +FILES_${PN} += "${localstatedir}/www/monkey/"
> +
> +CONFFILES_${PN} = "${sysconfdir}/monkey/"
>


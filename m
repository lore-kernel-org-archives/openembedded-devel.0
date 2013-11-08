Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97F8E6D467
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 05:08:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA858GaA001549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Nov 2013 21:08:16 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 7 Nov 2013 21:08:16 -0800
Message-ID: <527C71BF.3020002@windriver.com>
Date: Fri, 8 Nov 2013 13:08:15 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1383884700.git.hongxu.jia@windriver.com>
	<568c0cba0af47d5f6a0402ef4ac8316db7769326.1383884700.git.hongxu.jia@windriver.com>
In-Reply-To: <568c0cba0af47d5f6a0402ef4ac8316db7769326.1383884700.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] quagga: add pam support for vtysh
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
X-List-Received-Date: Fri, 08 Nov 2013 05:08:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/08/2013 12:32 PM, Hongxu Jia wrote:
> According to DISTRO_FEATURES to add pam support for quagga, and import
> configure file from Fedora.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-networking/recipes-protocols/quagga/files/quagga.pam | 13 +++++++++++++
>   meta-networking/recipes-protocols/quagga/quagga.inc       | 13 ++++++++++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga.pam
>
> diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.pam b/meta-networking/recipes-protocols/quagga/files/quagga.pam
> new file mode 100644
> index 0000000..3541a97
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/files/quagga.pam
> @@ -0,0 +1,13 @@
> +#
> +# The PAM configuration file for the quagga `vtysh' service
> +#
> +
> +# This allows root to change user infomation without being
> +# prompted for a password
> +auth		sufficient	pam_rootok.so
> +
> +# The standard Unix authentication modules, used with
> +# NIS (man nsswitch) as well as normal /etc/passwd and
> +# /etc/shadow entries.
> +auth       include      common-auth
> +
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 2106c9b..52cd7a3 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -32,10 +32,12 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
>              file://watchquagga.init \
>              file://watchquagga.default \
>              file://volatiles.03_quagga \
> +           file://file://quagga.pam \

Why is there be two file://?

>              file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
>   PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
> +PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
>
>   inherit autotools update-rc.d useradd
>
> @@ -98,6 +100,15 @@ do_install () {
>       # Remove generated info dir file, it doesn't belong in the generated
>       # package.
>       rm -f ${D}${infodir}/dir
> +
> +    # For PAM
> +    for feature in ${DISTRO_FEATURES}; do
> +        if [ "$feature" = "pam" ]; then
> +            install -D -m 644 ${WORKDIR}/quagga.pam ${D}/${sysconfdir}/pam.d/quagga
> +            break
> +        fi
> +    done
> +


Could you use the below method to simply this loop

     if 
${@base_contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
     if

-Roy

>   }
>
>   # Split into a main package and separate per-protocol packages
>

-- 
Best Reagrds,
Roy | RongQing Li


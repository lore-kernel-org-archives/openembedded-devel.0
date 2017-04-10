Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC7FC77D86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 06:06:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3A66gYO018761
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Apr 2017 23:06:42 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 9 Apr 2017 23:06:41 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1491804073-7781-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <58EB2084.7020304@windriver.com>
Date: Mon, 10 Apr 2017 14:04:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1491804073-7781-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.137]
Subject: Re: [PATCH] waf-samba.bbclass: redefine WAF_CROSS_ANSWERS_PATH
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
X-List-Received-Date: Mon, 10 Apr 2017 06:06:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this one.

Thanks,
Mingli

On 2017年04月10日 14:01, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * Redefine WAF_CROSS_ANSWERS_PATH in waf-samba.bbclass
>    to fix checksum mismatch for those packages which
>    inherit waf-samba.bbclass when install eSDK
>    # bitbake-diffsigs $Prj/build/sdkext_dir/tmp/stamps/core2-64-wrs-linux/libtalloc/2.1.8-r0.do_configure.sigdata.8a0fd2871f1e464f4586c32f0e67378f $Prj/build/tmp/stamps/core2-64-wrs-linux/libtalloc/2.1.8-r0.do_configure.sigdata.16b87e6ddccb52ca5e988e928f111e5a
>    basehash changed from ea2fea38e7efe710a11fa9d13c7ad94c to 943a7ead4ed10ce794532a942569bcf9
>    Variable WAF_CROSS_ANSWERS_PATH value changed from '$Prj/build/sdkext_dir/layers/meta-networking/files/waf-cross-answers' to '$Prj/layers/meta-openembedded/meta-networking/files/waf-cross-answers'
>
> * Remove the previous WAF_CROSS_ANSWERS_PATH definition
>    in layer.conf
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta-networking/classes/waf-samba.bbclass | 1 +
>   meta-networking/conf/layer.conf           | 3 ---
>   2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
> index b94ed48..e490176 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -45,6 +45,7 @@ CROSS_METHOD ?= "answer"
>   do_configure() {
>
>       # Prepare the cross-answers file
> +    WAF_CROSS_ANSWERS_PATH="${THISDIR}/../../files/waf-cross-answers"
>       CROSS_ANSWERS="${B}/cross-answers-${TARGET_ARCH}.txt"
>       if [ -e ${CROSS_ANSWERS} ]; then
>           rm -f ${CROSS_ANSWERS}
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index c09ba4a..85ad93b 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -19,8 +19,5 @@ LAYERDEPENDS_networking-layer += "meta-python"
>
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>
> -# used by waf-samba.bbclass
> -WAF_CROSS_ANSWERS_PATH = "${LAYERDIR}/files/waf-cross-answers"
> -
>   # Override security flags
>   require conf/distro/include/meta_networking_security_flags.inc
>


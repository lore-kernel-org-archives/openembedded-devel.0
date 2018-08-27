Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5136E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:18:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R3ILXP017736
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:18:21 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 26 Aug 2018 20:18:20 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1535339666-364064-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <c3d96ad6-fc4e-03b7-5d3f-e37511e41d9f@windriver.com>
Date: Mon, 27 Aug 2018 11:18:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1535339666-364064-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] libsndfile1: patch for CVE-2017-14634
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
X-List-Received-Date: Mon, 27 Aug 2018 03:18:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry,  please ignore this patch.

On 08/27/2018 11:14 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../libsndfile/libsndfile1/CVE-2017-14634.patch    | 40 ++++++++++++++++++++++
>   .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
>
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
> new file mode 100644
> index 0000000..12dce56
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
> @@ -0,0 +1,40 @@
> +From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
> +From: Fabian Greffrath <fabian@greffrath.com>
> +Date: Thu, 28 Sep 2017 12:15:04 +0200
> +Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
> +
> +This prevents division by zero later in the code.
> +
> +While the trivial case to catch this (i.e. sf.channels < 1) has already
> +been covered, a crafted file may report a number of channels that is
> +so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
> +miscalculated to zero (if this makes sense) in the determination of the
> +blockwidth. Since we only support a limited number of channels anyway,
> +make sure to check here as well.
> +
> +Closes: https://github.com/erikd/libsndfile/issues/318
> +Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
> +
> +Upstream-Status: Backport[https://github.com/erikd/libsndfile/commit/
> +85c877d5072866aadbe8ed0c3e0590fbb5e16788#diff-61db6a4422d4ff5453548f73548f4ca1]
> +
> +CVE: CVE-2017-14634
> +---
> + src/double64.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/double64.c b/src/double64.c
> +index b318ea8..78dfef7 100644
> +--- a/src/double64.c
> ++++ b/src/double64.c
> +@@ -91,7 +91,7 @@ int
> + double64_init	(SF_PRIVATE *psf)
> + {	static int double64_caps ;
> +
> +-	if (psf->sf.channels < 1)
> ++	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
> + 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
> + 		return SFE_INTERNAL ;
> + 		} ;
> +--
> +1.7.9.5
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index 281ac82..9416e52 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
>              file://CVE-2017-8361-8365.patch \
>              file://CVE-2017-8362.patch \
>              file://CVE-2017-8363.patch \
> +           file://CVE-2017-14634.patch \
>             "
>   
>   SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"

-- 
BRs

Sandy(Li Changqing)
Wind River Linux



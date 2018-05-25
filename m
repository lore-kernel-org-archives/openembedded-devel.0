Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 92C9074E40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 03:19:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 20:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,438,1520924400"; d="scan'208";a="231513014"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.23.24])
	([10.221.23.24])
	by fmsmga005.fm.intel.com with ESMTP; 24 May 2018 20:19:38 -0700
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-17-twoerner@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <d91e91a8-9196-b2b2-83d3-fcc69a58e3a4@intel.com>
Date: Fri, 25 May 2018 11:19:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180524143854.24096-17-twoerner@gmail.com>
Subject: Re: [meta-oe][master-next][PATCH v3 16/17] opencv: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 25 May 2018 03:19:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/24/2018 10:38 PM, Trevor Woerner wrote:
> The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
> ${datadir}/cmake end up in the dev package, so recipes no longer need to
> provide custom packaging rules to handles these files.
> 
> 	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
> 
> Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> index ca62de7c8f..1cadbdb533 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
> @@ -167,7 +167,7 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
>  
>  FILES_${PN} = ""
>  FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
> -FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"

${datadir}/OpenCV/*.cmake won't be handled by the bbclass and if you
remove this change, *.cmake files in OpenCV directory will go to
${PN}-apps which is probably not the intention here.


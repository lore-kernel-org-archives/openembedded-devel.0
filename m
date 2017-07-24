Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9B51478369
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:41:02 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 11:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,408,1496127600"; d="scan'208";a="111421689"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga004.jf.intel.com with ESMTP; 24 Jul 2017 11:40:48 -0700
Message-ID: <1500922159.2230.32.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Derek Straka <derek@asterius.io>
Date: Mon, 24 Jul 2017 13:49:19 -0500
In-Reply-To: <1500920155-14828-1-git-send-email-derek@asterius.io>
References: <1500920155-14828-1-git-send-email-derek@asterius.io>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-cmd2: update to version 0.7.5
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
X-List-Received-Date: Mon, 24 Jul 2017 18:41:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-24 at 14:15 -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/{python-cmd2_0.7.2.bb => python-cmd2_0.7.5.bb}           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cmd2_0.7.2.bb => python-cmd2_0.7.5.bb} (67%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb b/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
> rename to meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
> index a379de0..9621326 100644
> --- a/meta-python/recipes-devtools/python/python-cmd2_0.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python-cmd2_0.7.5.bb
> @@ -1,10 +1,10 @@
>  SUMMARY = "Extra features for standard library's cmd module"
>  HOMEPAGE = "http://packages.python.org/cmd2/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=43;endline=43;md5=0f13c9cfc75288223cf7edd2f3b985a2"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=49;endline=49;md5=0f13c9cfc75288223cf7edd2f3b985a2"

looking at the beginline & endline values, it means that just from one
line the license is being taken, which I believe it just contains the
name and not the terms&conditions. Is this ok?

Leo

>  
> -SRC_URI[md5sum] = "4a5b5aab407bdeb49634789f9a42902b"
> -SRC_URI[sha256sum] = "d06301cc578a83531261121c0b11d79d29d0a80aca01ed6752c20c4cfcda2dd9"
> +SRC_URI[md5sum] = "9f758f3a6a20f1220d60f6320bb839b3"
> +SRC_URI[sha256sum] = "7a47afafc5ad45649a2998df8d96f39d8e1d0686f55c785285889e45151ff75f"
>  
>  inherit pypi setuptools
>  
> -- 
> 2.7.4
> 




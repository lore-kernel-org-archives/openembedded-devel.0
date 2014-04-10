Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 86CE365E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 14:11:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2014 07:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,834,1389772800"; d="scan'208";a="417359507"
Received: from pbrannig-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.73])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2014 07:11:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: krzysztof.m.sywula@intel.com
Date: Thu, 10 Apr 2014 15:11:11 +0100
Message-ID: <2855210.1gdhVWA7ix@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1397135968-42902-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1397135968-42902-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 14:11:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 10 April 2014 14:19:28 krzysztof.m.sywula@intel.com wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> 
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> 
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb new file mode 100644
> index 0000000..f5fe9b9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> +SECTION = "devel"
> +
> +inherit autotools
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
> +SRC_URI[sha256sum] =
> "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d" +
> +BBCLASSEXTEND = "native"

Super clean now - thanks :)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


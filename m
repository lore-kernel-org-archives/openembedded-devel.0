Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7A365E68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:21:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2014 03:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,833,1389772800"; d="scan'208";a="510814338"
Received: from pbrannig-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.73])
	by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2014 03:21:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: krzysztof.m.sywula@intel.com
Date: Thu, 10 Apr 2014 11:21:10 +0100
Message-ID: <2798156.CHVGKmv6i4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1397124314-37150-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1397124314-37150-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 10:21:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

On Thursday 10 April 2014 11:05:14 krzysztof.m.sywula@intel.com wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> 
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb |  3 +++
>  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb        | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> 
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb new file mode
> 100644
> index 0000000..23cc10e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> @@ -0,0 +1,3 @@
> +require dejagnu_${PV}.bb
> +S = "${WORKDIR}/dejagnu-${PV}"
> +inherit native
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb new file mode 100644
> index 0000000..b202ae4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "GNU unit testing framework, written in Expect and Tcl"

Would you mind making this SUMMARY instead since it's short?

> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> +SECTION = "devel"
> +PR = "r1"

PR still needs to be dropped here.

Also, when sending new versions of patches could you please ensure they are 
marked [PATCH v2], [PATCH v3] etc. (i.e. with the --subject-prefix argument to 
git-send-email or git-format-patch).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


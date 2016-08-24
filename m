Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 083C56FF76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 15:25:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2016 08:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,571,1464678000"; d="scan'208";a="870487111"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 24 Aug 2016 08:25:35 -0700
Date: Wed, 24 Aug 2016 18:25:04 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Kyle Russell <bkylerussell@gmail.com>
Message-ID: <20160824152504.GA13305@mbabyjoh-desk.ger.corp.intel.com>
References: <1472045320-26803-1-git-send-email-bkylerussell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1472045320-26803-1-git-send-email-bkylerussell@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] Reimplement helper method for parallelizing JDK builds
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
X-List-Received-Date: Wed, 24 Aug 2016 15:25:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Aug 24, 2016 at 09:28:40AM -0400, Kyle Russell wrote:
> Simplifies duplicated implementation across multiple recipes that all
> inherited from java.bbclass.
> 
> Previously implementation was not flexible in supporting other make
> job-limiting flags (like -l for load) that are typically passed in
> through PARALLEL_MAKE.  (OpenJDK doesn't know about these other flags
> that might have gotten tagged on after the value for -j.)
> 
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  classes/java.bbclass                      | 17 ++++++++++++++++
>  recipes-core/icedtea/icedtea7-native.inc  | 23 +---------------------
>  recipes-core/openjdk/openjdk-7-common.inc | 32 +------------------------------
>  recipes-core/openjdk/openjdk-8-common.inc | 21 --------------------
>  recipes-core/openjdk/openjdk-8-cross.inc  |  6 +++---
>  recipes-core/openjdk/openjdk-8-native.inc |  2 +-
>  6 files changed, 23 insertions(+), 78 deletions(-)

That was fast !

Pushed to master-next.

Thanks,
Maxin

<snip>


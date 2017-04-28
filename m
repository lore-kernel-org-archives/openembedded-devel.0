Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBF971B50
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 08:15:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2017 01:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,387,1488873600"; d="scan'208";a="850746370"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2017 01:15:38 -0700
Date: Fri, 28 Apr 2017 11:16:13 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: liu.ming50@gmail.com
Message-ID: <20170428081613.GB16301@mbabyjoh-desk.ger.corp.intel.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/5] Fix some issues of openjdk-8/openjre-8 headful build
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
X-List-Received-Date: Fri, 28 Apr 2017 08:15:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Apr 23, 2017 at 08:54:51AM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> This patch series fix some issues, so the openjdk-8/openjre-8 now can build
> with X11 system (headful).
> 
> Ming Liu (5):
>   openjdk-8-cross.inc: change a dependency alsa-lib-native to alsa-lib
>   openjdk-8-cross.inc: fix wrong sysroot path
>   openjdk-8-cross.inc: tweak PACKAGECONFIG default value
>   openjdk-8/openjre-8: merge some redundant code
>   openjdk-8-cross.inc: fix a libpng build issue
> 
>  recipes-core/openjdk/openjdk-8-cross.inc           | 32 +++++++++++++++++++---
>  recipes-core/openjdk/openjdk-8_102b14.bb           | 14 ----------
>  recipes-core/openjdk/openjre-8_102b14.bb           | 14 ----------
>  .../openjdk8-fix-libpng-neon-build.patch           | 29 ++++++++++++++++++++
>  4 files changed, 57 insertions(+), 32 deletions(-)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
>

Pushed to master-next. Thanks a lot !

Best Regards,
Maxin


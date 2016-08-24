Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD21731C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 10:58:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2016 03:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,570,1464678000"; d="scan'208";a="1019561037"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2016 03:58:14 -0700
Date: Wed, 24 Aug 2016 13:57:42 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160824105742.GA31035@mbabyjoh-desk.ger.corp.intel.com>
References: <1471940096-12112-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1471940096-12112-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH v2] openjdk-8: Fix QA error caused by a missing hash
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
X-List-Received-Date: Wed, 24 Aug 2016 10:58:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Tue, Aug 23, 2016 at 11:14:56AM +0300, Erkka K‰‰ri‰ wrote:
> EXTRA_LDFLAGS were not used when building certain shared objects. This
> means that the Yocto specific linker flags were lost, which caused build
> failures due to a bad hash style QA error.
> 
> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  recipes-core/openjdk/openjdk-8_102b14.bb           |  1 +
>  recipes-core/openjdk/openjre-8_102b14.bb           |  1 +
>  .../openjdk8-add-missing-linker-flags.patch        | 57 ++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8_102b14.bb b/recipes-core/openjdk/openjdk-8_102b14.bb
> index 79c4cda..210c897 100644
> --- a/recipes-core/openjdk/openjdk-8_102b14.bb
> +++ b/recipes-core/openjdk/openjdk-8_102b14.bb
> @@ -12,6 +12,7 @@ PATCHES_URI_append = "\
>      file://openjdk8-fix-adlc-flags.patch;apply=no \
>      file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>      file://openjdk8-fix-zero-mode-crash.patch;apply=no \
> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>  "
>  
>  do_install() {
> diff --git a/recipes-core/openjdk/openjre-8_102b14.bb b/recipes-core/openjdk/openjre-8_102b14.bb
> index 736269d..88160e1 100644
> --- a/recipes-core/openjdk/openjre-8_102b14.bb
> +++ b/recipes-core/openjdk/openjre-8_102b14.bb
> @@ -12,6 +12,7 @@ PATCHES_URI_append = "\
>      file://openjdk8-fix-adlc-flags.patch;apply=no \
>      file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
>      file://openjdk8-fix-zero-mode-crash.patch;apply=no \
> +    file://openjdk8-add-missing-linker-flags.patch;apply=no \
>  "
>  
>  do_install() {
> diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
> new file mode 100644
> index 0000000..92f29b0
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-add-missing-linker-flags.patch
> @@ -0,0 +1,57 @@
> +makefiles: Add missing EXTRA_LDFLAGS to certain files
> +
> +EXTRA_LDFLAGS were not used when building certain shared objects. This
> +means that the Yocto specific linker flags were lost, which caused build
> +failures due to a bad hash style.
> +
> +Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> +
> +Upstream-Status: Pending
> +---
> + hotspot/make/linux/makefiles/jsig.make   | 2 +-
> + hotspot/make/linux/makefiles/saproc.make | 2 +-
> + hotspot/make/linux/makefiles/vm.make     | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git hotspot/make/linux/makefiles/jsig.make hotspot/make/linux/makefiles/jsig.make
> +index ce29eb1..e1d6c07 100644
> +--- hotspot/make/linux/makefiles/jsig.amake
> ++++ hotspot/make/linux/makefiles/jsig.make
> +@@ -44,7 +44,7 @@ LIBJSIG_MAPFILE = $(MAKEFILES_DIR)/mapfile-vers-jsig
> + # cause problems with interposing. See CR: 6466665
> + # LFLAGS_JSIG += $(MAPFLAG:FILENAME=$(LIBJSIG_MAPFILE))
> +
> +-LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE)
> ++LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
> +
> + # DEBUG_BINARIES overrides everything, use full -g debug information
> + ifeq ($(DEBUG_BINARIES), true)
> +diff --git hotspot/make/linux/makefiles/saproc.make hotspot/make/linux/makefiles/saproc.make
> +index 7c6e4a8..369a0ba 100644
> +--- hotspot/make/linux/makefiles/saproc.make
> ++++ hotspot/make/linux/makefiles/saproc.make
> +@@ -73,7 +73,7 @@ ALT_SAINCDIR=-I$(ALT_SASRCDIR) -DALT_SASRCDIR
> + else
> + ALT_SAINCDIR=
> + endif
> +-SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE)
> ++SA_LFLAGS = $(MAPFLAG:FILENAME=$(SAMAPFILE)) $(LDFLAGS_HASH_STYLE) $(EXTRA_LDFLAGS)
> +
> + SAARCH ?= $(BUILDARCH)
> +
> +diff --git hotspot/make/linux/makefiles/vm.make hotspot/make/linux/makefiles/vm.make
> +index 1a48df9..72f8d11 100644
> +--- hotspot/make/linux/makefiles/vm.make
> ++++ hotspot/make/linux/makefiles/vm.make
> +@@ -122,7 +122,7 @@ CFLAGS += $(CFLAGS/NOEX)
> +
> + # Extra flags from gnumake's invocation or environment
> + CFLAGS += $(EXTRA_CFLAGS)
> +-LFLAGS += $(EXTRA_CFLAGS)
> ++LFLAGS += $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)
> +
> + # Don't set excutable bit on stack segment
> + # the same could be done by separate execstack command
> +--
> +2.7.4

Thanks, Merged.

Best Regards,
Maxin


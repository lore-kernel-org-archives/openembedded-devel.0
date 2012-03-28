Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SCjcl-0006eA-U7
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 05:32:40 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1K00I7KPAHSA20@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	27 Mar 2012 21:23:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CBAFC201F9; Tue,
	27 Mar 2012 22:23:05 -0400 (EDT)
Date: Tue, 27 Mar 2012 22:23:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120328022305.GD17470@denix.org>
References: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [toolchain-layer][PATCH 1/2] eglibc-2.12: Move to toolchain-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 03:32:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 27, 2012 at 06:42:06PM -0700, Khem Raj wrote:
> Its relevant in toolchain layer
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Hmm, seems like we cross-posted the same change :)

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../eglibc/cross-localedef-native_2.12.bb          |    0
>  .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    0
>  .../eglibc-2.12/armv4-eabi-compile-fix.patch       |    0
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>  .../recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf |    0
>  .../eglibc/eglibc-2.12/generate-supported.mk       |    0
>  .../eglibc/eglibc-2.12/ld-search-order.patch       |    0
>  .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    0
>  .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |    0
>  .../eglibc-2.12/shorten-build-commands.patch       |    0
>  .../recipes-core/eglibc/eglibc-initial_2.12.bb     |    0
>  .../recipes-core/eglibc/eglibc-locale_2.12.bb      |    0
>  .../recipes-core/eglibc/eglibc_2.12.bb             |    0
>  13 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/cross-localedef-native_2.12.bb (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/generate-supported.mk (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-initial_2.12.bb (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc-locale_2.12.bb (100%)
>  rename {meta-oe => toolchain-layer}/recipes-core/eglibc/eglibc_2.12.bb (100%)
> 
> diff --git a/meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb b/toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/cross-localedef-native_2.12.bb
> rename to toolchain-layer/recipes-core/eglibc/cross-localedef-native_2.12.bb
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch b/toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
> rename to toolchain-layer/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-initial_2.12.bb
> rename to toolchain-layer/recipes-core/eglibc/eglibc-initial_2.12.bb
> diff --git a/meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc-locale_2.12.bb
> rename to toolchain-layer/recipes-core/eglibc/eglibc-locale_2.12.bb
> diff --git a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb b/toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb
> similarity index 100%
> rename from meta-oe/recipes-core/eglibc/eglibc_2.12.bb
> rename to toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb
> -- 
> 1.7.9.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



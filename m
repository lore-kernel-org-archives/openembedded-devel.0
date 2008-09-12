Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KeF6M-00067f-2w
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 22:18:46 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080912201556.WBFA6526.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 12 Sep 2008 16:15:56 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id DwFx1a0021E665w04wFxvl; Fri, 12 Sep 2008 16:15:57 -0400
X-Authority-Analysis: v=1.0 c=1 a=rCeM5v77lmsA:10 a=OZgQiQfKk9MA:10
	a=b2ZvGRdsAAAA:8 a=aR16PxjQAAAA:8 a=aKtHT69KrXWaEuUFFQMA:9
	a=_BjdvzpsXmzhfRYBjPgA:7 a=AX5WgomOXpHhZOlrxA4WnuBojiMA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 12 Sep 2008 13:15:57 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080912201557.GG29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<gaeef7$cvi$1@ger.gmane.org>
	<20080912192123.GF29676@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20080912192123.GF29676@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Fri, 12 Sep 2008 20:18:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2008 at 12:21:23PM -0700, Tom Rini wrote:
> On Fri, Sep 12, 2008 at 09:04:07PM +0200, Koen Kooi wrote:
> > Tom Rini wrote:
> >> [ This is all also available at
> >> http://bugs.openembedded.net/show_bug.cgi?id=4549 ]
> >>
> >> A number of xorg dev packages (both literally -dev and util-macros) are
> >> uninstallable on the target.  The problem is that by default (with ipk)
> >> any given -dev package will depend on the main package, for example
> >> xproto-dev depends on xproto.  But in these packages case, there is no
> >> main package (no xproto).  The following patch fixes the issue.
> >
> > No, it doesn't, your patch actually *breaks* the depends chaining, the  
> > real fix would be to do ALLOW_EMPTY_${PN} = "1" in the recipes.
> 
> Well, they did all suddenly actually install.  I'll rework the patch per
> your suggestion, make sure that works too and re-post.  Thanks.

Same problem as before, Koen's solution instead:

#
# old_revision [e5b917e5de77a3e1e649867986fdd33f141c7bd3]
#
# patch "packages/xorg-lib/xtrans_1.0.3.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [4326a8948884215174299f16364f47e8b6c07295]
# 
# patch "packages/xorg-lib/xtrans_1.0.4.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [4326a8948884215174299f16364f47e8b6c07295]
# 
# patch "packages/xorg-lib/xtrans_1.1.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [4326a8948884215174299f16364f47e8b6c07295]
# 
# patch "packages/xorg-lib/xtrans_1.2.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [4326a8948884215174299f16364f47e8b6c07295]
# 
# patch "packages/xorg-proto/xorg-proto-common.inc"
#  from [2f88e96e17c9a539cf5bf9383cad1500375eae86]
#    to [aa528c4cf7863704e0d3ae2a0203fe669205bc06]
# 
# patch "packages/xorg-util/util-macros_1.1.5.bb"
#  from [e4dba9f37b257cea60724c9fd34b82e27e27e349]
#    to [4ba31d550f6c3a239d2a4ed31e41804281401a41]
# 
# patch "packages/xorg-util/util-macros_1.1.6.bb"
#  from [9dd3c08d7715e6e845ab141fd67cbb4e3a962977]
#    to [89aa974c4232d1c544e4924996946a514b924bb6]
#
============================================================
--- packages/xorg-lib/xtrans_1.0.3.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.0.3.bb	4326a8948884215174299f16364f47e8b6c07295
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.0.4.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.0.4.bb	4326a8948884215174299f16364f47e8b6c07295
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.1.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.1.bb	4326a8948884215174299f16364f47e8b6c07295
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.2.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.2.bb	4326a8948884215174299f16364f47e8b6c07295
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-proto/xorg-proto-common.inc	2f88e96e17c9a539cf5bf9383cad1500375eae86
+++ packages/xorg-proto/xorg-proto-common.inc	aa528c4cf7863704e0d3ae2a0203fe669205bc06
@@ -1,9 +1,10 @@ XORG_PN = "${PN}"
 DESCRIPTION = "X protocol headers: ${XORG_PN}"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
 XORG_PN = "${PN}"
+ALLOW_EMPTY_${PN} = "1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${XORG_PN}-${PV}.tar.bz2"
 
============================================================
--- packages/xorg-util/util-macros_1.1.5.bb	e4dba9f37b257cea60724c9fd34b82e27e27e349
+++ packages/xorg-util/util-macros_1.1.5.bb	4ba31d550f6c3a239d2a4ed31e41804281401a41
@@ -1,5 +1,7 @@ require xorg-util-common.inc
 require xorg-util-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "X autotools macros"
 PR = "r1"
 PE = "1"
============================================================
--- packages/xorg-util/util-macros_1.1.6.bb	9dd3c08d7715e6e845ab141fd67cbb4e3a962977
+++ packages/xorg-util/util-macros_1.1.6.bb	89aa974c4232d1c544e4924996946a514b924bb6
@@ -1,4 +1,6 @@ require xorg-util-common.inc
 require xorg-util-common.inc
 
+ALLOW_EMPTY_${PN} = "1"
+
 DESCRIPTION = "X autotools macros"
 PE = "1"

-- 
Tom Rini



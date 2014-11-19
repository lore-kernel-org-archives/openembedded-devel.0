Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A19A072154
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 00:36:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2014 16:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,413,1413270000"; d="scan'208";a="610116393"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.130])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2014 16:36:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 19 Nov 2014 00:36:04 +0000
Message-ID: <6684481.TtqaFjxDdy@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.2-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <FB5465D5-3846-479F-A194-52F1FB16192E@dominion.thruhere.net>
References: <cover.1415758217.git.hongxu.jia@windriver.com>
	<6715207.EkvTqHTqRG@peggleto-mobl5.ger.corp.intel.com>
	<FB5465D5-3846-479F-A194-52F1FB16192E@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
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
X-List-Received-Date: Wed, 19 Nov 2014 00:36:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 November 2014 19:32:19 Koen Kooi wrote:
> > Op 18 nov. 2014, om 16:27 heeft Paul Eggleton
> > <paul.eggleton@linux.intel.com> het volgende geschreven:
> > 
> > Hi Koen,
> > 
> > On Tuesday 18 November 2014 13:48:15 Koen Kooi wrote:
> >> Hongxu Jia schreef op 13-11-14 12:42:
> >>> On 11/13/2014 07:02 PM, Koen Kooi wrote: Hongxu Jia schreef op 12-11-14
> >>> 
> >>> 03:13:
> >>>>>> The previous libbonobo package contains perl scripts, while
> >>>>>> installing libbonobo, package management detected perl required,
> >>>>>> but it actually not needed as lib. So add libbonobo-bin package to
> >>>>>> contain these scripts. It refers debian:
> >>>>>> https://packages.debian.org/sid/libbonobo2-bin
> >>>>>> 
> >>>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> ---
> >>>>>> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file
> >>>>>> changed, 2 insertions(+), 1 deletion(-)
> >>>>>> 
> >>>>>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> >>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index
> >>>>>> 8b6007e..e0f6168 100644 ---
> >>>>>> a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
> >>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 +5,11 @@
> >>>>>> LIC_FILES_CHKSUM =
> >>>>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \ SECTION =
> >>>>>> "x11/gnome/libs" DEPENDS = "glib-2.0 orbit2 intltool-native libxml2
> >>>>>> dbus dbus-glib"
> >>>>>> 
> >>>>>> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc lib_package
> >>>>>> 
> >>>>>> ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> >>>>>> 
> >>>>>> +RDEPENDS_${PN}-bin = "${PN} perl" FILES_${PN} +=
> >>>>>> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
> >>>>>> FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
> >>>>>> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
> >>> 
> >>> This breaks the upgrade path
> >>> 
> >>>> I am sorry I do not understand what you mean, do you mean running
> >>>> 'smart upgrade' failed?
> >> 
> >> You are moving files between packages, which makes 'opkg update ; opkg
> >> upgrade' fail with conflicts unless you carefully craft
> >> RREPLACES/RCONFLICTS or enforce ordering in upgrade order (which isn't
> >> currently possible).> 
> > So what would you suggest - never make any packaging changes?
> 
> No. I suggest thinking about what you're doing and minimizing the damage. So
> far the patches I've seen are misguided (recipe==package assumption) or
> plain weird. And in all cases break upgrade paths. Since arguing the use
> case seems to fall on deaf ears I can only argue the technical problems
> with them.

What do you mean by "arguing the use case" ?

> > It's not as if this is the first time we've done this kind of thing...
> 
> And people still sound surprised when I say upgrade paths are broken between
> releases. You yourself told me I should speak up when seeing such patches
> and so I did.

I did yes, and I hadn't forgotten. However we do need to make packaging 
changes from time to time, so we need to work out how to do them properly - 
and I'll bang the same drum as I always do - if we want to ensure these 
changes are properly considered and done in the correct manner, we need to 
have those things documented. If we do not, you shouldn't be surprised when 
people miss things. This is clearly an area you are interested in so it's an 
area you could help document.

Getting back to this specific problem, when splitting out a set of files into a 
different package as is being done by this patch, as far as I am aware there is 
no means to ensure that the new package gets installed on upgrade without 
introducing a hard dependency which would defeat the purpose of making the 
change. So that means you either make the change or you don't. Are any of 
these files that are being split out actually of interest on a typical system 
that OE would build for? If not, do we care that those files will disappear?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A49F72128
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 15:27:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2014 07:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,410,1413270000"; d="scan'208";a="624284489"
Received: from ncmcquil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2014 07:27:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Nov 2014 15:27:22 +0000
Message-ID: <6715207.EkvTqHTqRG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.2-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <m4ff6f$nlo$1@ger.gmane.org>
References: <cover.1415758217.git.hongxu.jia@windriver.com>
	<5464990A.5030400@windriver.com> <m4ff6f$nlo$1@ger.gmane.org>
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
X-List-Received-Date: Tue, 18 Nov 2014 15:27:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Koen,

On Tuesday 18 November 2014 13:48:15 Koen Kooi wrote:
> Hongxu Jia schreef op 13-11-14 12:42:
> > On 11/13/2014 07:02 PM, Koen Kooi wrote: Hongxu Jia schreef op 12-11-14
> > 
> > 03:13:
> >>>> The previous libbonobo package contains perl scripts, while
> >>>> installing libbonobo, package management detected perl required,
> >>>> but it actually not needed as lib. So add libbonobo-bin package to
> >>>> contain these scripts. It refers debian:
> >>>> https://packages.debian.org/sid/libbonobo2-bin
> >>>> 
> >>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> ---
> >>>> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file
> >>>> changed, 2 insertions(+), 1 deletion(-)
> >>>> 
> >>>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> >>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index
> >>>> 8b6007e..e0f6168 100644 ---
> >>>> a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
> >>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 +5,11 @@
> >>>> LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \ SECTION =
> >>>> "x11/gnome/libs" DEPENDS = "glib-2.0 orbit2 intltool-native libxml2
> >>>> dbus dbus-glib"
> >>>> 
> >>>> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc lib_package
> >>>> 
> >>>> ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> >>>> 
> >>>> +RDEPENDS_${PN}-bin = "${PN} perl" FILES_${PN} +=
> >>>> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
> >>>> FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
> >>>> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
> > 
> > This breaks the upgrade path
> > 
> >> I am sorry I do not understand what you mean, do you mean running
> >> 'smart upgrade' failed?
> 
> You are moving files between packages, which makes 'opkg update ; opkg
> upgrade' fail with conflicts unless you carefully craft RREPLACES/RCONFLICTS
> or enforce ordering in upgrade order (which isn't currently possible).

So what would you suggest - never make any packaging changes? It's not as if 
this is the first time we've done this kind of thing...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


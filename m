Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A86D7605B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 08:26:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2014 01:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,885,1392192000"; d="scan'208";a="543216733"
Received: from mcomyns-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.122])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2014 01:16:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Date: Thu, 22 May 2014 09:16:05 +0100
Message-ID: <8008105.uChK18SGlL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <537CD60D.7020602@opendreambox.org>
References: <CAMKF1sqfoiANL7jcnVA3Q7sWz8mzjcUfkCNE5FxQFweWd905Rw@mail.gmail.com>
	<1400657458-32231-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<537CD60D.7020602@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] faac: fix S!=B failure
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
X-List-Received-Date: Thu, 22 May 2014 08:26:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 May 2014 18:36:29 Andreas Oberritter wrote:
> Hello Matthieu,
> 
> On 21.05.2014 09:30, Matthieu Crapet wrote:
> > Also use ${BP} and ${BPN}.
> 
> What problem does this solve?
> 
> > Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> > ---
> > 
> >  meta-multimedia/recipes-multimedia/faac/faac_1.28.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> > b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb index
> > c7dcdb9..d96c1a4 100644
> > --- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> > +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
> > @@ -4,15 +4,15 @@ LICENSE = "LGPLv2+"
> > 
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> >  
> >                      file://libfaac/coder.h;beginline=5;endline=17;md5=fa1
> >                      fd6a5fa8cdc877d63a12530d273e0"> 
> > -inherit autotools
> > +inherit autotools-brokensep
> > 
> > -SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
> > +SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
> > 
> >             file://build-fix.patch"
> >  
> >  SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
> >  SRC_URI[sha256sum] =
> >  "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"> 
> > -PACKAGES =+ "lib${PN} lib${PN}-dev"
> > +PACKAGES =+ "lib${BPN} lib${BPN}-dev"
> > 
> >  FILES_${PN} = " ${bindir}/faac "
> >  FILES_lib${PN} = " ${libdir}/libfaac.so.*"
> 
>               ^
> This differs from PACKAGES now.

Also, BPN should not generally be used in PACKAGES, or nativesdk packages will 
clash with target ones.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


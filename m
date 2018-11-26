Return-Path: <raj.khem@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id A41BE6C0C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:46:36 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id u16so17424069otk.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:from:date:message-id:subject:to:cc;
	bh=VuduuPbUphU1sOT+5Ry851Hs1PWR5BD6Mxmi3RmTTo4=;
	b=nVPhj6dMmbChrqa6Vav4xtu5Ymr1N/KxAzkVZTi0h67lt3fsp89QWb7JdALTaiv7V5
	1YkXd3Nbc/fRbHVU1goG9OrnuTkqfbwo2uB0hCa13q71fBdnFrccndJjm+76ixy6gBtv
	6cldAPgF5QNmqhspQF8dBOYdp0oou3uKefYwfkKAVar2fshf2IxXMJzhS7M81MHsRMyG
	JLF7zJmG+0Y86uyxAzcmYV2lqd9XVKF4/S50A44cWB2rUDJ9eGT7AXPXKCjWiCJFHRlZ
	AJhk2GNetM/Z37OaWJepL/JOZIvElpXHn4swe1FTi02OfBbfCoXGFsxbCVe3hVSxtT4P
	Zphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:from:date:message-id
	:subject:to:cc;
	bh=VuduuPbUphU1sOT+5Ry851Hs1PWR5BD6Mxmi3RmTTo4=;
	b=akvAPfY8qWLyi3RLKos7w42F5m6ZkiIeV9B1vHqdDAEx1WS0ns3o5yRZfccqnA1j3W
	Twf3IGSZ8+z/EftuGX576eydgxRKA0BrJtIYsSmm8yKYbWFDI8pk458lbsHAgAWa/d67
	MkjpSTO3GwYVj6J6wTC0S5KzLLALZVtIFFPwQj9tw0bysLeYiyn/pLuNrkjK8q45rihC
	aqkbi2rpA5PpUivXC8BGpVoDrEqZ4lPuKYcos3Tiu178dPkwLwk38iWByMzB67t8SNVQ
	GmtNdDnVh8oOuATTPo9xaMe4LnqSRyNWryyzyqCdMk87m9+TpxUeZwex970AmzJSSKzm
	m9BA==
X-Gm-Message-State: AA+aEWa5KOjKHGxLRMV4f+JFCAjT3ISCMAEEJusMaIz9bOVa2xqCbETc
	B45Plal0NtJEmhlWAzQNNaEv5fmBatVxv8JxEuU=
X-Google-Smtp-Source: AFSGD/VZieM2FR1uj6OzG4OTd2JvK1EiWgbLf/JSaiXG1skpnLWIGWm2mdrXWESYzHGYEmcimkne5qwiYMIjGh/Qtfc=
X-Received: by 2002:a05:6830:110:: with SMTP id
	i16mr16552471otp.72.1543254397268; 
	Mon, 26 Nov 2018 09:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
	<CAMKF1soR+4fXBd1q0bLCndQjROO-zTnvcQSs80TmDP=KKZcMuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 09:46:11 -0800
Message-ID: <CAMKF1spxrVArMxYMvcwSZv+3ogruamL6k_d4zP2Yw54cvrGt6Q@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Mon, 26 Nov 2018 17:46:36 -0000
Content-Type: text/plain; charset="UTF-8"

and sumo too
On Mon, Nov 26, 2018 at 9:45 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Armin
>
> This is ok for rocko
> On Tue, Nov 20, 2018 at 7:40 AM Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> wrote:
> >
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Latest Chromium needs it during build
> >
> > (cherry picked from commit d7d0cc5227d0dc7d3ff91ded9da841d65c3f3632)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
> > ---
> >  meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> > index 8930cd902..132ee0f2b 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> > @@ -3,7 +3,9 @@ HOMEPAGE = "http://nodejs.org"
> >  LICENSE = "MIT & BSD & Artistic-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
> >
> > -DEPENDS = "openssl10 zlib"
> > +DEPENDS = "openssl10 zlib icu"
> > +
> > +inherit pkgconfig
> >
> >  COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
> >  COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
> > @@ -44,7 +46,7 @@ do_configure () {
> >      export LD="${CXX}"
> >      GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
> >      # $TARGET_ARCH settings don't match --dest-cpu settings
> > -   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
> > +   ./configure --prefix=${prefix} --with-intl=system-icu --without-snapshot --shared-openssl --shared-zlib \
> >                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
> >                 --dest-os=linux \
> >                 ${ARCHFLAGS}
> > --
> > 2.19.1
> >


Return-Path: <denis@denix.org>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Jun 2017 13:32:25 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 102EB7780A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30F5620BD4;
	Mon,  5 Jun 2017 13:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2xt-CknYKkiK; Mon,  5 Jun 2017 13:23:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E9C5A20072;
	Mon,  5 Jun 2017 13:22:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 80AA81624E2; Mon,  5 Jun 2017 09:22:56 -0400 (EDT)
Date: Mon, 5 Jun 2017 09:22:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170605132256.GH28053@denix.org>
References: <20170602055545.20448-1-mns@gomspace.com>
	<20170602055545.20448-2-mns@gomspace.com>
	<CA+chaQdFmNp71fVfgRn=X7QyzP5mAgqcP6_ZMz_5+EvX8ioELQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdFmNp71fVfgRn=X7QyzP5mAgqcP6_ZMz_5+EvX8ioELQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][PATCH 2/2] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Mon, 05 Jun 2017 13:32:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2017 at 01:11:09PM +0200, Martin Jansa wrote:
> You should mention to which branch you want this to be applied and CC the
> maintainer of that branch.
> 
> I can move it to correct bundle in patchwork, but that can still easily
> slip release maintainer attention.
> 
> Also I wonder why Denys added do_unpack_append() instead of just changing
> do_compile to:
> 
> ${CC} -o devmem2 devmem2-new.c ${CFLAGS} ${LDFLAGS}

Because the patch won't apply - it expects devmem2.c:

http://lists.openembedded.org/pipermail/openembedded-devel/2017-March/111799.html
http://lists.openembedded.org/pipermail/openembedded-devel/2017-March/111807.html


> but that should be improved in master first to keep your backport request
> identical with what we got in master.
> 
> On Fri, Jun 2, 2017 at 7:55 AM, Martin Siegumfeldt <mns@gomspace.com> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > The newly resurrected devmem2.c file besides having a new location, also
> > updates its header, producing different checksums, which would conflict
> > with any previously cached or mirrored instances. To avoid such conflicts,
> > use a different filename in fetch(). Rename it back to original name at
> > unpack() for devmem2-fixups-2.patch to succeed w/o modifications.
> >
> > WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: '
> > http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
> > File: '/OE/master/downloads/devmem2.c' has md5 checksum
> > be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b
> > was expected
> > File: '/OE/master/downloads/devmem2.c' has sha256 checksum
> > ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when
> > 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was
> > expected
> > If this change is expected (e.g. you have upgraded to a new version
> > without updating the checksums) then you can use these lines within the
> > recipe:
> > SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> > SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
> > 1e58ac482c4e29d6c9ebca8768f699c191"
> > Otherwise you should retry the download and/or check with upstream to
> > determine if the file has become corrupted or otherwise unexpectedly
> > modified.
> >
> > WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to
> > /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> > b/meta-oe/recipes-support/devmem2/devmem2.bb
> > index c42eb5e..c86eb2e 100644
> > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > @@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
> > a9eb9f3890384519f435aedf986297cf"
> >  PR = "r7"
> >
> > -SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
> > +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;
> > downloadfilename=devmem2-new.c \
> >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
> >  S = "${WORKDIR}"
> >
> >  CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
> >
> > +python do_unpack_append() {
> > +    os.rename("devmem2-new.c", "devmem2.c")
> > +}
> > +
> >  do_compile() {
> >      ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
> >  }
> > --
> > 2.9.3
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


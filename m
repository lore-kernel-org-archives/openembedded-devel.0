Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EBFC8782C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 19:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7284D20879;
	Mon, 12 Jun 2017 19:01:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WdZGsEhWRWP5; Mon, 12 Jun 2017 19:01:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F4B520156;
	Mon, 12 Jun 2017 19:01:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C81B81624F4; Mon, 12 Jun 2017 15:01:53 -0400 (EDT)
Date: Mon, 12 Jun 2017 15:01:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170612190153.GV28053@denix.org>
References: <1497185642-1678-1-git-send-email-liu.ming50@gmail.com>
	<CA+chaQfAjd5Zgm5wYE+w9nmTLHUQyRqnv37_Czo7kzym_j+9yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfAjd5Zgm5wYE+w9nmTLHUQyRqnv37_Czo7kzym_j+9yg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [meta-oe] [PATCH] dos2unix: add recipe
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
X-List-Received-Date: Mon, 12 Jun 2017 19:01:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FWIW, Mentor layer has a tofrodos recipe that does the same... Maybe Chris can 
submit that one here? :)

-- 
Denys


On Mon, Jun 12, 2017 at 08:53:55PM +0200, Martin Jansa wrote:
> Please pass LDFLAGS to resolve following QA warning:
> 
> ERROR: QA Issue: No GNU_HASH in the elf binary:
> dos2unix/7.3.4-r0/packages-split/dos2unix/usr/bin/dos2unix'
> No GNU_HASH in the elf binary:
> 'dos2unix/7.3.4-r0/packages-split/dos2unix/usr/bin/unix2dos' [ldflags]
> 
> On Sun, Jun 11, 2017 at 2:54 PM, <liu.ming50@gmail.com> wrote:
> 
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > The Dos2unix package includes utilities dos2unix and unix2dos to
> > convert plain text files in DOS or Mac format to Unix format and
> > vice versa.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb | 34
> > ++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> >
> > diff --git a/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> > b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> > new file mode 100644
> > index 0000000..f3d5173
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> > @@ -0,0 +1,34 @@
> > +SUMMARY = "Convert text file line endings between CRLF and LF"
> > +DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
> > +unix2dos to convert plain text files in DOS or Mac format to Unix \
> > +format and vice versa."
> > +HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
> > +SECTION = "support"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f
> > 3f"
> > +
> > +SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
> > +
> > +# Release 7.3.4
> > +SRCREV = "8381ba4e1c4cd5ce98ebd9c24726d51cb203cde0"
> > +
> > +S = "${WORKDIR}/git/dos2unix"
> > +
> > +inherit gettext perlnative
> > +
> > +# The dos2unix NLS relies on po4a-native, while po4a recipe is
> > +# provided by meta-perl layer, so make it optional here, you
> > +# need have meta-perl in bblayers.conf before enabling nls in
> > +# PACKAGECONFIG.
> > +PACKAGECONFIG ??= ""
> > +PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
> > +
> > +EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
> > +EXTRA_OEMAKE_class-native = "ENABLE_NLS="
> > +
> > +do_install () {
> > +    oe_runmake DESTDIR="${D}${base_prefix}" install
> > +}
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


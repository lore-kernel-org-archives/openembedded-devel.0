Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4979C727B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 17:00:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Y75a0-0002t9-1l for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jan 2015 18:00:04 +0100
Received: from 167.127.187.81.in-addr.arpa ([81.187.127.167])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 18:00:04 +0100
Received: from bluelightning by 167.127.187.81.in-addr.arpa with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jan 2015 18:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Paul Eggleton <bluelightning@bluelightning.org>
Date: Fri, 2 Jan 2015 16:39:32 +0000 (UTC)
Message-ID: <loom.20150102T173715-663@post.gmane.org>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
	<3f651d7b200c06d29a1e236f613d2f8f745a5a03.1420190530.git.paul.eggleton@linux.intel.com>
	<20150102124721.GG2469@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 81.187.127.167 (Mozilla/5.0 (X11; Ubuntu; Linux x86_64;
	rv:34.0) Gecko/20100101 Firefox/34.0)
Subject: Re: [meta-oe][PATCH 06/11] uw-imap: make libpam dependency dependent on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 02 Jan 2015 17:00:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> On Fri, Jan 02, 2015 at 09:32:01AM +0000, Paul Eggleton wrote:
> > If pam is not in DISTRO_FEATURES, we shouldn't be building it.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton <at> linux.intel.com>
> > ---
> >  meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> > index e1a9877..867c2d0 100644
> > --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> > +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> >  <at>  <at>  -4,7 +4,7  <at>  <at>  SECTION = "devel"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM =
"file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
> >  
> > -DEPENDS = "openssl libpam"
> > +DEPENDS = "openssl"
> >  
> >  SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
> >             file://quote_cctype.patch \
> >  <at>  <at>  -17,13 +17,17  <at>  <at>  SRC_URI[sha256sum] =
"53e15a2b5c1bc80161d42e9f69792a3fa18332b7b771910131004eb520
> >  
> >  S = "${WORKDIR}/imap-${PV}"
> >  
> > +PACKAGECONFIG ??= "${ <at> bb.utils.contains('DISTRO_FEATURES', 'pam',
'pam', '', d)}"
> > +PACKAGECONFIG[pam] = ",,libpam"
> > +
> > +#EXTRA_OEMAKE = "CC='${CC}' ${ <at> bb.utils.contains('PACKAGECONFIG',
'pam', '', 'PAMLDFLAGS=
> CHECKPW=psx', d)}"
> 
> ^ is this needed to prevent autodetecting it from sysroot?

No, that's from an earlier attempt that I forgot to remove. Will fix in v2.

Cheers,
Paul





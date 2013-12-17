Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6941960CE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:29:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2013 08:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,502,1384329600"; d="scan'208";a="451457401"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.28])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2013 08:29:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 17 Dec 2013 16:29:04 +0000
Message-ID: <2191053.tE6l0jqt1n@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAF+NyK5patvnud=V=DUC28y4b8BKEXL1vc67brY8FNir7T5d_g@mail.gmail.com>
References: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
	<CAF+NyK5patvnud=V=DUC28y4b8BKEXL1vc67brY8FNir7T5d_g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH V2] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Tue, 17 Dec 2013 16:29:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"


Hongxu, could you please look at this and the other outstanding meta-perl 
patch?

http://patchwork.openembedded.org/project/oe/list/?q=meta-perl&archive=both

Thanks,
Paul

On Tuesday 17 December 2013 16:34:38 patrick patat wrote:
> ping
> 
> On Wed, Dec 4, 2013 at 3:59 PM, Patrick Patat 
<patrick.patat@innotis.org>wrote:
> > This recipe build cpan module Crypt-OpenSSL-RSA
> > 
> > Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
> > ---
> > 
> >  .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   24
> > 
> > ++++++++++++++++++++
> > 
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-perl/recipes-perl/libcrypt/
> > 
> > libcrypt-openssl-rsa-perl_0.28.bb
> > 
> > diff --git a/meta-perl/recipes-perl/libcrypt/
> > libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/
> > libcrypt-openssl-rsa-perl_0.28.bb
> > new file mode 100644
> > index 0000000..f0c610f
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "Crypt Openssl RSA cpan module"
> > +SECTION = "libs"
> > +LICENSE = "Artistic-1.0 | GPL-1.0+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
> > +
> > +SRC_URI = "
> > http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz
> > "
> > +
> > +SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
> > +SRC_URI[sha256sum] =
> > "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
> > +
> > +DEPENDS += "openssl"
> > +
> > +RDEPENDS_${PN}="libcrypt-openssl-random-perl"
> > +
> > +EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR}
> > -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
> > +
> > +S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> > +
> > +inherit cpan
> > +
> > +do_compile() {
> > +    export OTHERLDFLAGS='-Wl,-rpath'
> > +    cpan_do_compile
> > +}
> > --
> > 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
-- 

Paul Eggleton
Intel Open Source Technology Centre


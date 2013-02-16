Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U6kcf-00014B-9X
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 17:28:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Feb 2013 08:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,678,1355126400"; d="scan'208";a="286607772"
Received: from unknown (HELO helios.localnet) ([10.252.120.76])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2013 08:12:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Feb 2013 16:12:12 +0000
Message-ID: <1950016.9PpQygz0Wq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130216045138.GR3300@jama>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
	<d27fbed307bc6afc4e260622a8c36b32fc2d89ce.1360337212.git.paul.eggleton@linux.intel.com>
	<20130216045138.GR3300@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/6] python-feedparser: add new recipe for version 5.1.3
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
X-List-Received-Date: Sat, 16 Feb 2013 16:28:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 February 2013 05:51:38 Martin Jansa wrote:
> On Fri, Feb 08, 2013 at 03:33:08PM +0000, Paul Eggleton wrote:
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  .../recipes-devtools/python/python-feedparser_5.1.3.bb   |   14
> >  ++++++++++++++ 1 file changed, 14 insertions(+)
> >  create mode 100644
> >  meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb> 
> > diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> > b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb new file
> > mode 100644
> > index 0000000..86e4fd6
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "Python Atom and RSS feed parser"
> > +HOMEPAGE = "http://code.google.com/p/feedparser"
> > +SECTION = "devel/python"
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=39082dbc030b4a3ee3e48e162eab408e"
> > +
> > +SRC_URI =
> > "http://feedparser.googlecode.com/files/feedparser-${PV}.tar.bz2"
> > +SRC_URI[md5sum] = "f8790accd379b578261cb5b0047bd20c"
> > +SRC_URI[sha256sum] =
> > "91a28a76b5cbaf7457a22e47e04347568a1f21fac85c806867ac72d32aabe718" +
> > +S = "${WORKDIR}/feedparser-${PV}"
> > +
> > +inherit distutils
> 
> Can you please check if the checksum was changed?

Oops - it appears I never built this version of the recipe as the 
LIC_FILES_CHKSUM was also changed (copyright date changed). I have build-
tested all recipes again and pushed a new branch with the python-feedparser 
recipe fixed.

Sorry about that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



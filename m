Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 42174762B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 12:11:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 12 Sep 2016 05:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,322,1470726000"; d="scan'208";a="1054785043"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2016 05:11:17 -0700
Date: Mon, 12 Sep 2016 15:11:23 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160912121122.GA27275@mbabyjoh-desk.ger.corp.intel.com>
References: <1473668091-5615-1-git-send-email-sujith.h@gmail.com>
	<CADyYWLnzkgD+B3R1qjX1tF2PeVULe686qU14m=ntSo54C7LtXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADyYWLnzkgD+B3R1qjX1tF2PeVULe686qU14m=ntSo54C7LtXQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] xpp[23]: fix/remove bashism
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
X-List-Received-Date: Mon, 12 Sep 2016 12:11:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sujith,

On Mon, Sep 12, 2016 at 03:17:34PM +0530, sujith h wrote:
> Hi,
> 
> Hope the patch looks ok. Else do let me know I can work on the same.

Yes, it looks good. Pushed to master.

> Thanks,
> Sujith H

Best Regards,
Maxin

> On Mon, Sep 12, 2016 at 1:44 PM, Sujith H <sujith.h@gmail.com> wrote:
> 
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This was breaking on hosts with dash as /bin/sh.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  recipes-core/xml-commons/xpp2_2.1.10.bb    | 2 +-
> >  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb
> > b/recipes-core/xml-commons/xpp2_2.1.10.bb
> > index d3baca4..c926722 100644
> > --- a/recipes-core/xml-commons/xpp2_2.1.10.bb
> > +++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
> > @@ -19,7 +19,7 @@ do_compile() {
> >
> >      sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:
> > src/java/impl/factory:src/java/impl/format:src/java/
> > impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
> >
> > -    findpath="${sourcepath//:/ }"
> > +    findpath="$(echo "$sourcepath" | tr : " ")"
> >
> >      javac -sourcepath $sourcepath -d build-oe `find $findpath -name
> > "*.java"`
> >
> > diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> > b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> > index bedb8a9..f264022 100644
> > --- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> > +++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
> > @@ -19,7 +19,7 @@ do_compile() {
> >      mkdir -p build-oe
> >
> >      sourcepath="src/java/api:src/java/builder:src/java/dom2_
> > builder:src/java/mxp1_min:src/java/mxp1_standard:src/java/
> > parser_pool:src/java/sax2_driver:src/java/serializer_
> > impl:src/java/util:src/java/wrapper"
> > -    findpath="${sourcepath//:/ }"
> > +    findpath="$(echo "$sourcepath" | tr : " ")"
> >
> >      javac -sourcepath $sourcepath -d build-oe `find $findpath -name
> > "*.java"`
> >
> > --
> > 1.9.1
> >
> >
> 
> 
> -- 
> സുജിത് ഹരിദാസന്
> Bangalore
> <Project>Contributor to KDE project
> <Project>Contributor to Yocto project
> http://fci.wikia.com/wiki/Anti-DRM-Campaign
> <Blog> http://sujithh.info
> C-x C-c
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


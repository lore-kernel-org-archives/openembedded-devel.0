Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 745A26067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 22:31:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 13 Jul 2016 15:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733830889"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 15:31:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
Date: Thu, 14 Jul 2016 10:31:52 +1200
Message-ID: <3494682.OJBsBs5TlE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20160712135845.pva3tpjpq34yxwes@jama>
References: <1467995452-30013-1-git-send-email-joe_macdonald@mentor.com>
	<20160712135845.pva3tpjpq34yxwes@jama>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] plymouth: remove virtual prefix for RPROVIDES
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
X-List-Received-Date: Wed, 13 Jul 2016 22:32:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 12 Jul 2016 15:58:45 Martin Jansa wrote:
> On Fri, Jul 08, 2016 at 12:30:52PM -0400, Joe MacDonald wrote:
> > The 'virtual' namespace is only intended to be used for build-time
> > dependencies, not in the runtime package namespace.
> > 
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> > 
> >  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb index de23dcd..597d8cd
> > 100644
> > --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"> 
> >  DEPENDS = "libcap libpng cairo dbus udev"
> >  PROVIDES = "virtual/psplash"
> > 
> > -RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
> > +RPROVIDES_${PN} += "psplash psplash-support"
> 
> This causes new NOTE in every build:
> NOTE: multiple providers are available for runtime psplash (psplash,
> plymouth) NOTE: consider defining a PREFERRED_RPROVIDER entry to match
> psplash
> 
> Do you want to update
> meta/conf/distro/include/default-providers.inc
> to resolve this first?

Is this even the right thing to do? Is plymouth a direct drop-in replacement 
for psplash as this implies or (as I suspect) are there subtle differences?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


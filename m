Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UT8C5-0007Pm-L2
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 12:05:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Apr 2013 02:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,508,1363158000"; d="scan'208";a="288528067"
Received: from unknown (HELO helios.localnet) ([10.255.13.209])
	by azsmga001.ch.intel.com with ESMTP; 19 Apr 2013 02:47:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Apr 2013 10:47:48 +0100
Message-ID: <6541282.oud0nkVgoR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130419093325.GF2489@jama>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
	<51710428.1050309@communistcode.co.uk> <20130419093325.GF2489@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, meta-webserver][PATCH 1/2] cherokee: move to meta-webserver and tweak
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
X-List-Received-Date: Fri, 19 Apr 2013 10:05:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 April 2013 11:33:25 Martin Jansa wrote:
> On Fri, Apr 19, 2013 at 09:45:28AM +0100, Jack Mitchell wrote:
> > On 18/04/13 07:39, Paul Eggleton wrote:
> > > * Set SUMMARY instead of DESCRIPTION
> > > 
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > > 
> > >   .../recipes-httpd}/cherokee/cherokee/cherokee.init                 |  
> > >    0
> > >   .../recipes-httpd}/cherokee/cherokee_1.2.98.bb                     |  
> > >    4 ++-- 2 files changed, 2 insertions(+), 2 deletions(-)
> > >   rename {meta-oe/recipes-connectivity =>
> > >   meta-webserver/recipes-httpd}/cherokee/cherokee/cherokee.init (100%)
> > >   rename {meta-oe/recipes-connectivity =>
> > >   meta-webserver/recipes-httpd}/cherokee/cherokee_1.2.98.bb (93%)> > 
> > > diff --git
> > > a/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init
> > > b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> > > similarity index 100%
> > > rename from meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init
> > > rename to meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> > > diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> > > b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb similarity
> > > index 93%
> > > rename from meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> > > rename to meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> > > index 6c030a6..1510e70 100644
> > > --- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> > > +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> > > @@ -1,5 +1,5 @@
> > > -DESCRIPTION = "Cherokee Web Server fast and secure"
> > > -DESCRIPTION_cget = "Small downloader based in the Cherokee client
> > > library"
> > > +SUMMARY = "Cherokee Web Server fast and secure"
> > > +SUMMARY_cget = "Small downloader based in the Cherokee client library"
> > > 
> > >   HOMEPAGE = "http://www.cherokee-project.com/"
> > >   SECTION = "network"
> > >   LICENSE = "GPLv2"
> > 
> > Building this morning I received this warning:
> > 
> > WARNING: Unable to get checksum for cherokee SRC_URI entry
> > cherokee.service: file could not be found
> > 
> > On a second build it disappeared, something to look into?
> 
> Thanks for report..
> 
> pushing
> $ git mv
> ./meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
> meta-webserver/recipes-httpd/cherokee/cherokee/

This was my fault for rebasing an earlier commit without checking, sorry about 
that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



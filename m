Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4B60D60CF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 20:29:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jan 2014 12:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,592,1384329600"; d="scan'208";a="433154556"
Received: from unknown (HELO helios.localnet) ([10.252.122.88])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2014 12:29:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 02 Jan 2014 20:28:56 +0000
Message-ID: <1806373.Cm6jJ4qLDy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20140102075724.GC3717@jama>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
	<1388581046-8713-7-git-send-email-Martin.Jansa@gmail.com>
	<20140102075724.GC3717@jama>
MIME-Version: 1.0
Cc: Kevin Strasser <kevin.strasser@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][WIP][PATCH 7/8] ajenti: Bump SRCREV a bit got get revision included in some branch
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
X-List-Received-Date: Thu, 02 Jan 2014 20:29:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Thursday 02 January 2014 08:57:24 Martin Jansa wrote:
> On Wed, Jan 01, 2014 at 01:57:25PM +0100, Martin Jansa wrote:
> > * old c08fb4da65923aebd09116750a1f43f13b98a51a exists only in 0.6.2 tag
> > and latest> 
> >   bitbake refuses to fetch it
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > 
> >  meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> > b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb index
> > 83e92f6..f499339 100644
> > --- a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> > +++ b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
> > @@ -9,7 +9,7 @@ DEPENDS += "python-pyopenssl python-lxml python-gevent
> > python-greenlet \> 
> >  PV = "0.6.2+git${SRCPV}"
> > 
> > -SRC_URI = "git://github.com/Eugeny/ajenti.git \
> > +SRC_URI = "git://github.com/Eugeny/ajenti.git;branch=ajenti-0.6.x \
> > 
> >             file://0001-setup.py-remove-extra-data-files.patch \
> >             file://0002-plugins-hddstat-fix-disk-usage-check-to-work-with-
> >             bu.patch \
> >             file://0003-plugins-sysload-fix-to-work-with-busybox.patch \
> > 
> > @@ -22,8 +22,7 @@ SRC_URI = "git://github.com/Eugeny/ajenti.git \
> > 
> >  DISTRO_FILES = "file://distro-detection-openembedded.patch \
> >  
> >                  file://distributor-logo-openembedded.png"
> 
> This one wasn't merged, because the patches need to be rebased, is there
> someone who cares about ajenti and will test it properly in runtime?
> 
> Paul? Kevin?
> Paul? Kevin?

Unfortunately upstream have recently changed their licensing scheme for newer 
versions, to the point where I'm much less interested in maintaining the 
recipe. I have a patch here to just drop it which I'll send out soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


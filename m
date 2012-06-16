Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sfypz-0002Oc-DL
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 21:39:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 12:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166494083"
Received: from unknown (HELO helios.localnet) ([10.252.120.135])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2012 12:28:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Jun 2012 20:28:28 +0100
Message-ID: <5704152.9u4br1nZj5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <20120616070117.GC3140@jama.jama.net>
References: <1337788237-9475-1-git-send-email-Martin.Jansa@gmail.com>
	<20120616070117.GC3140@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] meta-handheld: append to BBPATH instead of prepend so order of bblayers.conf is respected
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
X-List-Received-Date: Sat, 16 Jun 2012 19:39:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 June 2012 09:01:17 Martin Jansa wrote:
> On Wed, May 23, 2012 at 05:50:37PM +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> ping
> 
> > ---
> > 
> >  conf/layer.conf |   11 ++++++++---
> >  1 files changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index 7a2441b..31dcb16 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -1,13 +1,18 @@
> > 
> >  # Layer configuration for meta-handheld layer
> >  # Copyright 2011 Intel Corporation
> > 
> > -# We have a conf and classes directory, prepend to BBPATH to prefer our
> > versions -BBPATH := "${LAYERDIR}:${BBPATH}"
> > +# We have a conf and classes directory, append to BBPATH
> > +BBPATH .= ":${LAYERDIR}"
> > 
> >  # We have a recipes directory, add to BBFILES
> > 
> > -BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb
> > ${LAYERDIR}/recipes-*/*/*.bbappend" 
> > +BBFILES +=
> > "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"> 
> >  BBFILE_COLLECTIONS += "meta-handheld"
> >  BBFILE_PATTERN_meta-handheld := "^${LAYERDIR}/"

I was all set to apply this now (sorry for the delay) and then I noticed you 
changed the above without comment - why was that?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



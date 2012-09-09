Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAmW4-0002gK-8P
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 20:45:56 +0200
Received: by daks35 with SMTP id s35so951029dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Uvs2CuUIK3ek3MaVNMhVnnOeYcTY74ERFIRKw5hTKUA=;
	b=pUHIi9zIzJVWfk0pzrQACuMXR4U7PMVpjhuMjQ/BEB+V3Yz04Q+KUqWZ2cvqFagc5l
	TZNwA54ajpH+p8LksBO83x8zxbaK46bI8jAE3VBj+PBdvkeh3ATuZ3ZuUQOUIY9LklpS
	XszTigjofzSRiX76s9qh3T3d9633kbRw0bjPEkWL8NHtdoU1FH8eTNWaGBR6rRSlOZ4D
	B+LKqAvMAwoZamS/2ycFGFwQYDwjf9LpaeInlksfcE6d3A+AtdpEVC77P1sxEncbk9+i
	OxHkOopGqB6b683OsM+oe2qTzjbL0x8W7KUY5gauie6a6foiq+Syrmr0Yy3ckgQ/FJXq
	PDBg==
Received: by 10.66.76.130 with SMTP id k2mr17613327paw.19.1347215607018;
	Sun, 09 Sep 2012 11:33:27 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id uu6sm6619148pbc.70.2012.09.09.11.33.25
	(version=SSLv3 cipher=OTHER); Sun, 09 Sep 2012 11:33:26 -0700 (PDT)
Date: Sun, 9 Sep 2012 11:32:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120909183245.GB14698@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1347210779-20115-1-git-send-email-raj.khem@gmail.com>
	<20120909173353.GA3647@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120909173353.GA3647@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-smartphone][PATCH] task-base.bbappend: Rename to packagegroup-base.bbappend to match OE-Core
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
X-List-Received-Date: Sun, 09 Sep 2012 18:45:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/09/12 19:33), Martin Jansa wrote:
> On Sun, Sep 09, 2012 at 10:12:59AM -0700, Khem Raj wrote:
> > Fixes
> > WARNING: No recipes available for:
> >   meta-smartphone/meta-openmoko/recipes-core/tasks/task-base.bbappend
> 
> Thanks for reminder, I've merged shr branch (where it was fixed for a
> while) to master.
> 

good. Thanks

> I was waiting for
> http://patchwork.openembedded.org/patch/35989/
> in meta-oe (because I've removed PRINC for foxtrotgps in meta-shr with
> it), but nobody cares about upgrade path of foxtrotgps with meta-shr I
> guess (except me, but I have shr branches for that).
> 
> Cheers,
> 
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../packagegroup-base.bbappend}                    |    0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-openmoko/recipes-core/{tasks/task-base.bbappend => packagegroups/packagegroup-base.bbappend} (100%)
> > 
> > diff --git a/meta-openmoko/recipes-core/tasks/task-base.bbappend b/meta-openmoko/recipes-core/packagegroups/packagegroup-base.bbappend
> > similarity index 100%
> > rename from meta-openmoko/recipes-core/tasks/task-base.bbappend
> > rename to meta-openmoko/recipes-core/packagegroups/packagegroup-base.bbappend
> > -- 
> > 1.7.9.5
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem



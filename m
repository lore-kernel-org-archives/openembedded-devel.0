Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SVWW2-00064y-Cr
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 May 2012 01:23:22 +0200
Received: by dalh21 with SMTP id h21so3936511dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=V7UjED6tjOWazYvubnG6iZhujNcalBa3LlPjz+EV6aY=;
	b=Yhp0UE8lN8NyvCnlm+FTvWkMrRGWLPcnXmFzuCZqC/lHYodQLyDhcfosoAMvW/K6Wp
	xO4NdRAMZQGGbCDqHS++aBzIQ2BkutEnYrU1a/hz2nr9jGZpgan4hh6vD7ZtP7h1B7DH
	RnTPec7Go3/Qyslk/U7lAzugv/QbaOjzv8KCx1XQqnrKcbXjgMNT+73fydl5o4mA/5/8
	QOO2De75EmMU565BtgA5ukVUdmwyOO51pGrylc0a7h5JW22E+go83kSlLqPiUC6oXIvj
	YIH5QcVtK9eht8PNk+Zzqno2HFlewfoYf1u5t1PdY6L5/2CiXbXD1CqP9+uXieuyKrnj
	e71g==
Received: by 10.68.131.35 with SMTP id oj3mr2344026pbb.156.1337382797007;
	Fri, 18 May 2012 16:13:17 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id qo8sm543228pbc.6.2012.05.18.16.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 16:13:15 -0700 (PDT)
Date: Fri, 18 May 2012 16:13:27 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120518231327.GA7422@bill-the-cat>
References: <1337018980-29630-1-git-send-email-Chase.Maupin@ti.com>
	<20120514194409.GD8995@denix.org>
	<7D46E86EC0A8354091174257B2FED10138E3E470@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10138E3E470@DLEE12.ent.ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance] Pull request 20120514
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
X-List-Received-Date: Fri, 18 May 2012 23:23:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 17, 2012 at 01:48:05PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Monday, May 14, 2012 2:44 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: Re: [oe] [2011.03-maintenance] Pull request 20120514
> > 
> > On Mon, May 14, 2012 at 01:09:40PM -0500, Chase Maupin wrote:
> > > Tom,
> > >
> > > Please pull the following commits that update the LICENSE field
> > to
> > > list the actual license version for licenses like GPL and LGPL.
> > These
> > > patches have previously been sent to the list with each patch
> > identifying
> > > where it was derived from.  I have also submitted patches for
> > oe-core where
> > > appropriate.
> > >
> > > I'm looking for feedback on how to properly mark a package as
> > having two
> > > licenses in oe-classic since "&" causes issues.  If these
> > patches are OK
> > > then they can be pulled.  If there is a better way to mark the
> > dual licensing
> > > then I'll update them accordingly.
> > 
> > As far as I recall, we don't use "&" in oe-classic for dual
> > licenses.
> > 
> > 
> > > The following changes since commit
> > 36a56cbb69cda0c89f478e01183d61c6a66525c9:
> > >   Steffen Sledz (1):
> > >         icedtea6-native-1.7.10: backport S7103224
> > >
> > > are available in the git repository at:
> > >
> > >   http://arago-project.org/git/projects/arago-oe-amsdk.git
> > update-licenses
> > 
> > Also the same in different format:
> > 
> > Pull URL: git://arago-project.org/git/projects/arago-oe-amsdk.git
> >   Branch: update-licenses
> >   Browse: http://arago-project.org/git/projects/?p=arago-oe-
> > amsdk.git;a=shortlog;h=refs/heads/update-licenses
> > 
> > 
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> 
> Ping on this pull request.  Any issues?

Since it's large I want to give folks the weekend to notice and comment
before I pull.  Thanks!

-- 
Tom



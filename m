Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PEMjO-00016O-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:53:27 +0100
Received: by fxm3 with SMTP id 3so2310094fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 06:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=gqxwHtrFK2JWQVURWSPXPWs9P188IYCjw83Xaz1gFN4=;
	b=JL4a8Dr85yfLUPISnx42J5QEGYiLdvqpQpA2k9VJwyBCjMg/znPrGOL/Jm0v58aFdG
	9WxBsrFk86Pjr8Qf4cDvM5J8vPsC9IcZ8WYSmhqwQCL/Pb01Ms278uqEvUiNir5sHrnB
	G3KkfgEo8nBJDcDl6ADHo0jKR2ys4Va+ltGBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=I12ht2J8CMo1sJultVj1iFV92zr37TE8z+UQ7Evx76KvFsaMc6zDtBx5DWTH6ubg9v
	DbAUqxe0bHKpaPfL931xNs79p81B5k3cm3UTo39ABrYugkSXIb8d6Wr7iLVVHZ6uFP1t
	1sSYHQApscfEsEygGGGjWDiwH3ihoL9mcpRjY=
Received: by 10.223.100.4 with SMTP id w4mr990677fan.26.1288965153821;
	Fri, 05 Nov 2010 06:52:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l23sm602297fam.43.2010.11.05.06.52.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 06:52:32 -0700 (PDT)
Date: Fri, 5 Nov 2010 14:52:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105135212.GQ3440@jama>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
	<20101104224752.GH28852@denix.org> <20101105065240.GI3440@jama>
	<4CD3CCDE.3080306@eukrea.com> <20101105094915.GM3440@jama>
	<4CD3D68A.9040704@eukrea.com> <1288963938.3826.20.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1288963938.3826.20.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Fri, 05 Nov 2010 13:53:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 05, 2010 at 02:32:18PM +0100, Paul Menzel wrote:
> Dear OE folks,
> 
> Am Freitag, den 05.11.2010, 11:03 +0100 schrieb Eric Bénard:
> 
> > Le 05/11/2010 10:49, Martin Jansa a écrit :
> > >>> I know it could lower number of people using this future release branch
> > >>> during testing period before release, but still seems better then pushing 3
> > >>> weeks of commits from my local branch as soon as release is branched and
> > >>> master open for new recipes again.
> > >
> > >> That's the way linux, u-boot&  co are running and when the new merge window
> > >> opens several thousand of patches can be merged in a few days.
> > >
> > > And also why there is linux-next, but I agree that in our scale we can keep new
> > > recipes and features in local checkouts/out-of-tree branches without too
> > > much pain in merging them after 3 weeks.
> >
> > a temporary next branch could be open to host new big patches and then merged 
> > to master once stable is out.
> 
> I certainly would encourage to push your changes to the OE repository as
> soon as possible to share your work so other can use it or improve it.
> Be it `master` or some different branch.

I have gitorious repo for my patch queue (but that's always rebased on
top of master - to keep the diff small and changes ready for easy
cherry-pick from it).
 
> > This way most peoples getting oe during the stabilization period will get 
> > master and will test it and developers will be able to follow their 
> > development in the next branch.
> > I think that during this stabilization weeks, developers have to do the effort 
> > to checkout the next branch if they want to work on it and user must get the 
> > master branch being stabilized as a default, but not the reverse.
> 
> I guess both sides have good arguments. I would decide on what the
> documentation suggests to beginners and new contributors. If it suggests
> that `master` is the development branch new contributions should be
> based on, I suggest to create a new branch for the next stable release.
> If the documentation suggests something different, then the next stable
> release can be based on the master branch.
> 
> In either case the documentation has to be correct or needs to be
> updated to reflect the changes.

Well if it goes to master-next, then will we rebase it on top of current
master (and solve ie that PR bump because of new feature in master-next
needs another PR bump, because there was PR bump in current master due
to some small fix). Or will we just merge current master to it and
resolve conflicts there and then when "stabilizing" ends, merge
master-next back to master with all those ugly "merge+resolve" commits?

On the otherside if there is "release" branch created asap it's quite
easy that cherry-picked fix from master has newer PR changed (and edit
it to change it only by 1). But it will also force "release" maintainers
to push patch first to master and then cherry-pick.

Also whoever will be using master just to test next released version
should be really carefull not to call "git pull" after it is taged as
release and branched (or he will get stuff from maybe already merged
master-next).

So both ways have pros and cons, depends if you look at it as
"master-next" developer or "release" maintainer :).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



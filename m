Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OK5qR-0005IO-G7
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:32:09 +0200
Received: by fxm9 with SMTP id 9so1633877fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7A0gGFh/T02vj5tub5udv/+xCEoDl18kiGZGOUhnWAk=;
	b=kCBl0VwwN3spMyfjRMrAGX7TYnB6XVzRMCHwHb0c3AcaT3pmcVoe37VtkWkm7tASF5
	fq6G19JHpJfGESUtRhIQ0MRlY5GvcLfIVqSoPC+IFqRMNVgTOskIu39mpD5kfWvN5097
	vzlQrtLIYSfv3iWY/Iks9nTbME3teUDeS9e4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jvrm8T16Kuw70C7qAtIWrUx4n8x5oUb2swOkX+QX1qgvcr7IrAAvxDEt/+CZHLbUZw
	t1Ydm1oDvqzuQlCZca8dCD++FjiGWgT7cT4FUw3sdq8UwX+cswBp909FX5AImR5w7bQg
	oD7Ss4dvq0t3uXoVF/UMpuv6XMwdDo+Yo7XF4=
Received: by 10.223.46.135 with SMTP id j7mr9784022faf.105.1275553671709;
	Thu, 03 Jun 2010 01:27:51 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm56387478fah.4.2010.06.03.01.27.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 01:27:51 -0700 (PDT)
Date: Thu, 3 Jun 2010 10:27:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100603082740.GL16035@jama>
References: <201006022351.38129.pieterg@gmx.com>
	<201006030915.57362.pieterg@gmx.com> <20100603073717.GK16035@jama>
	<201006031002.31685.pieterg@gmx.com>
MIME-Version: 1.0
In-Reply-To: <201006031002.31685.pieterg@gmx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 08:32:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 03, 2010 at 10:02:31AM +0200, pieterg wrote:
> On Thursday 03 June 2010 09:37:17 Martin Jansa wrote:
> > On Thu, Jun 03, 2010 at 09:15:56AM +0200, pieterg wrote:
> > > On Thursday 03 June 2010 06:35:05 Martin Jansa wrote:
> 
> <snip>
> 
> But if you then decide to remove BB_GIT_CLONE_FOR_SRCREV again because you 
> no longer need it, and somebody starts a clean build, the LOCALCOUNT would 
> start at 0 again I guess.

SRCPV is storing LOCALCOUNT in the same persistent db as AUTOREV with or without
BB_GIT_CLONE_FOR_SRCREV (at least for bitbake-1.10 and higher). The
BB_GIT_CLONE_FOR_SRCREV caching changed that you won't count revisions
if the requested SRCREV (latest for AUTOREV or specified in recipe) is
the same as was for last parsing and so the same LOCALCOUNT can be taken
from persistent db.

I'm not sure if 1.8 was storing LOCALCOUNT from BB_GIT_CLONE_FOR_SRCREV
but then never used it from db (then switching BB_GIT_CLONE_FOR_SRCREV
off would keep same LOCALCOUNTs) or if it didn't even store it (less
likely - but you can easily check).

Either way if you upgrade bitbake first (while keeping
BB_GIT_CLONE_FOR_SRCREV) and then switch BB_GIT_CLONE_FOR_SRCREV off,
you should have same LOCALCOUNTs


> So the versioning isn't consistent anyway when toggling 
> BB_GIT_CLONE_FOR_SRCREV.
> 
> > The other is when you change SRCREV in recipe without updating PV. Then
> > SRCPV will give you newer PV which will upgrade resulting package on
> > target.
> 
> Yes, but only if you stick to the same buildserver, and as soon as the hdd 
> crashes for instance and you have to start with a clean build, everybody is 
> in trouble.

Yes and that's the same for AUTOREV (without BB_GIT_CLONE_FOR_SRCREV).

> So personally, I would never even want to use SRCPV, unless it's for 
> AUTOREV.

So what you say is that you would also never use AUTOREV without
BB_GIT_CLONE_FOR_SRCREV, no matter if SRCPV is used.

> Would it be an idea to be able to only have BB_GIT_CLONE_FOR_SRCREV for 
> those packages which have SRCREV = ${AUTOREV}?

Well then it will be a bit inconsistent, because those AUTOREV recipes
will restore their LOCALCOUNT (ie after hdd breakage) but notAUTOREV
recipes (which usually could be considered more stable) will "downgrade"
to LOCALCOUNT 0 (if you didn't restore cache).

A bit better would be to disable LOCALCOUNT_OVERRIDE only for recipes
you want to be AUTOREV (then git clone will stop for recipes you don't
care about even with BB_GIT_CLONE_FOR_SRCREV and after removing cache
those LOCALCOUNT will stay 0 as it was before).

Best solution would be to ask git devs to implement "git remote-count
HASH" as remote-ls works.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         



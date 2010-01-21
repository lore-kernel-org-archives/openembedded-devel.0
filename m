Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NY332-0006db-6X
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 20:50:35 +0100
Received: by fxm28 with SMTP id 28so400807fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 11:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BcQ6BArS15hUZIMO9FlQRqyxN3Tqs3K8ESXoYro8Br8=;
	b=bVoY9u94EnoTpAb+fQtQEqt0+JiYkiK8ZaW0nhOweCCQdfN7uJLAx/4ZAMDYEDliWk
	Td8nsVfvsW2TJG8M38tVgJ0Kbsul03Iwme8kXF36y0DS4Plir8JbtevzypeTfA8kRYS6
	JT7rnGN2iYGwSnp5y8/bH3IpZWMm0pvl32vHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=w2EKe8MKlVlYw/OOOjZ7DFCKuI/xGOfDVtwMuCytNdze2a2PizmV25G0BFoaZjiCQF
	LdysmX9lKZTxCpodIgWDdMkhotnS35ZelyMDxxb6YeZl2znRulNEY9HTeNPZKUz0Am4s
	4lPFcqUB2c+iikCOZPTZYtfC5Ht7VUM4irB3U=
Received: by 10.223.76.91 with SMTP id b27mr1950809fak.4.1264103295158;
	Thu, 21 Jan 2010 11:48:15 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm835239fxm.7.2010.01.21.11.48.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 11:48:14 -0800 (PST)
Date: Thu, 21 Jan 2010 20:48:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100121194812.GD3208@jama>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hj9giu$mfp$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.228
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 19:50:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2010 at 01:16:26PM +0100, Rolf Leggewie wrote:
> Dr. Michael Lauer wrote:
> > I fully agree. I'm neither using patchwork nor do I find patches on the list a good idea.
> > I'd welcome for-oe-upstream trees that would contain patches that -- if good -- we could
> > just pull from.
> 
> Yes, me too would prefer to pull another branch from somewhere and
> cherry-pick from it over other solutions.
> 
> I have two questions.
> 
> 1) is it possible to host such a free-for-all branch somewhere?

Would be OK to create also branch for stuff I'm going to push upstream
soon? with developer name prefix like WIP branches ie
martin_jansa/for-oe-upstream ?

When I'm changing something far from my comfort zone, and I would like to 
discuss it on ML/get ACK before pushing. It would be nice to send just
summary to ML with link to that branch instead of whole patch-series.

And creating new branch for every occasion like this would be overkill
as branch delete needs admin hand.

> 2) although generally not a good idea, would it be possible to rebase
>    this branch frequently so that the unapplied patches always come
>    up first in "git log"?

Yes rebase would be really usefull in this type of branch also to be
able to integrate changes from ML discussion or some minor bug noticed
just after pushing. 

Also if some modified solution to some problem is already pushed to
oe.dev by someone else to see after rebase what is left and if not
needed then remove that change.

Sometimes I got feeling that I should push something ASAP as there is
high probability that someone else would like to test some new version
too and when I already have those recipes and checksums etc I want to
share at least to avoid duplicate work. 
ie xorg recipe upgrades... which I have in semi-automated way.


BTW: Maybe there should be some info from sender, if he has commit right
or not. Because if someone sends patch just for discussion (like me)
then it should be clear if someone else is needed to call 
contrib/patchwork/git-am.sh or not. (not sure how to indicate that in git
send-mail without introductory e-mail and still valid commit message)

Regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol5Zc-0004f0-Va
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:42:21 +0200
Received: by fxm6 with SMTP id 6so3246913fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=E70AdTIyv2MWauV4uG/iN5jOPzCjWKa4FmTgA+C4JvM=;
	b=qT4skGjdKq0RIDcbKQTh/0WqO+fSTEJahk0rV5h6cZXDYXilQ53RcWNuZiA3x2plAm
	1vojJ44znauioEWuVuEJzufNBmRKOjSEh2Q/vaP2CkM0oWoL+bI2WFpzAZWd59852x7B
	qHuhX6AjffK7gGLvW5yNtaO7YjtAEKuxnEISs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LSlzgWF15IJSFxQo+rR05ANqOo4zzcOW5DDYZeKT0kTaL99z+8fnjSUXAU8psSmRCa
	qnssuUCKq3YoCz2yrNsln4qFcprALhrClmzB4ut3JK+4VpHHC+BXAqAkNXOwkWFD/0m8
	lUI+0ySTj/iSevLqLseIhLljOKNqaxKvI+UMA=
Received: by 10.223.103.148 with SMTP id k20mr5526345fao.101.1281987723858;
	Mon, 16 Aug 2010 12:42:03 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c20sm2213607fak.33.2010.08.16.12.42.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 12:42:03 -0700 (PDT)
Date: Mon, 16 Aug 2010 21:42:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816194216.GH10076@jama>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTinbdx5rKQOckS3BEuEE=mZsnLmER8TqA0U87YUY@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinbdx5rKQOckS3BEuEE=mZsnLmER8TqA0U87YUY@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xorg recipes cleanup
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
X-List-Received-Date: Mon, 16 Aug 2010 19:42:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2010 at 09:25:51PM +0200, Frans Meulenbroeks wrote:
> 2010/8/16 Martin Jansa <martin.jansa@gmail.com>:
> > Hi,
> >
> > all distributions are now using
> > preferred-xorg-versions-X11R7.5.inc or
> > preferred-xorg-versions-live.inc or
> > no preferred-xorg-versions*.inc at all
> >
> > So we can remove some older versions not pinned in those 2
> > to make future maintanance of xorg-* dirs a bit easier.
> >
> > As this is really easy to test (if you apply all 9 and build your
> > favourite target again, no xorg package should be rebuilt - version changed),
> > please test and ACK or don't scream later that you had some strange version
> > preferred from local.conf.
> 
> I could not test, as patch 2 is not on patchwork (and retrieving them
> from gmail is somewhat tricky)

I'm checking why :/ only clue is
bitbake@jama ~/oe $ git send-email 0002-xorg-lib-move-older-not-pinned-versions-to-obsolete-.patch
The following files are 8bit, but do not declare a
Content-Transfer-Encoding.
    0002-xorg-lib-move-older-not-pinned-versions-to-obsolete-.patch
Which 8bit encoding should I declare [UTF-8]? 
<enter>

> Do we indeed want to move this to obsolete? Is there a point in
> retaining it? Why not just rm them (they are still in git)
> Or do we want obsolete to become the graveyard of old recipes?

I usually move it to obsolete where it's not parsed if you have
'standard'
BBFILES := "/OE/dev/recipes/*/*.bb"
and if nobody screams then I'll remove whole obsolete/xorg dir after a
while.

I know it's SCM and I can look to every version in history, but while
it's still in obsolete it's faster to call just diff if I need to check
what changed since previous version.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



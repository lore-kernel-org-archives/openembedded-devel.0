Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oukj7-0006Ge-GV
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 13:28:06 +0200
Received: by iwn2 with SMTP id 2so4084254iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SXyRbGmLZZe4wmck3Var0AArAQV4UTgz1iEY8oD7BgY=;
	b=w/Y2QPFLt4ENeoZG7/SOm23S+Sl7OuWBv1UZPl8xBGCegvWyFYxrq0Jwa1r6My+fa4
	QuICZ8oR2SUNjfvLv3Thqv/bx7UFIZ9kfSgq8+qTJft05fOd0vcHzYF5uShvEDKu3tvB
	XEx4iP8x3Sfk2NyOMo0CDW19JOs4o8mG+AWTM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vpiHUOquFq1pjXfoqpup+bHmCkYo40d4tT2BfYCugbKdFy7IvlNg/glPx7pHVP4jMv
	ScZjyZtTgr1jwTc9n66oHnkswZpf6G1KLb97JvqPHPNAPRdzuYOpIZ9FIvvrRsQCithu
	89aTOPbphUddAJJlTR3dl2hOAxQHfjPax3xIg=
MIME-Version: 1.0
Received: by 10.231.166.139 with SMTP id m11mr4148603iby.136.1284290841181;
	Sun, 12 Sep 2010 04:27:21 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 04:27:21 -0700 (PDT)
In-Reply-To: <i6i5g8$ums$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>
	<i6i5g8$ums$1@dough.gmane.org>
Date: Sun, 12 Sep 2010 13:27:21 +0200
Message-ID: <AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 11:28:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12-09-10 10:34, Frans Meulenbroeks wrote:

>> Haven't had time to test this yet, but I feel at least a PR bump is
>> missing (or perhaps a set of PR bumps)
>
> Since it would require a PR bump for everything that is built with gcc,
> I'm going to say:
>
> That's what DISTRO_PR is for, which is up to distro maintainers to bump.

Still I feel PR or INC_PR bumps of the affected gcc recipes is
appropriate, if only to fix it for distro's that do not immediately
bump DISTRO_PR.
We have quite some distro's and not all are maintained equally well,
so I can imagine it'll take some time for them to bump
Actually some distro's seem orphaned, so for those it might never
happen and bumping the GCC PR's at least will give them the fix too.

Thinking of it let's see how many distro's actually use DISTRO_PR:
../../conf/distro/angstrom-2008.1.conf:DISTRO_PR = ".6"
../../conf/distro/kaeilos-2010.conf:DISTRO_PR = ".1"
../../conf/distro/kaeilos.conf:DISTRO_PR = ".5"
../../conf/distro/angstrom-2010.x.conf:DISTRO_PR = ".7"
../../conf/distro/shr.conf:DISTRO_PR = ".5"

So that is 5 out of the 32 recipes.
Even one of your own (angstrom-2008.1-legacy.conf) does ot use DISTRO_PR

Very nice to keep the users of those 27 distro's in the cold!
Not.

Frans.



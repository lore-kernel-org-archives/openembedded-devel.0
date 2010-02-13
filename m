Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgMB7-0001Ws-Iz
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 18:53:16 +0100
Received: by fxm26 with SMTP id 26so3551253fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 09:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3p8tA11WsnlP1Fcqj+dqFsM/t0+NVg5yajWFxZQJDBU=;
	b=GSg4U69QpXAg8v3r/7Exq1zIMqIEhZcGeYMzHKRMtruBWn6QEDqI5eS79lM+k3TdJG
	2SsxuR/ChTJQdeCfYNYDmpINmRQQQKVer46CNgTsFG8Bcb6+lwBCXdP1IET+GAv63P1A
	PUs3qjmv9vGTEEEn+A2cRRdCgit6Ka6aqY5R4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sMCDdtqYDOrb9Wc0vy57IG4qgcbwHzkcbXNukdNIcpr3mQwwwuW34H+1mPtcK+D/lh
	zR1i2YjjtrvBSm4k+tlm1djnTkZPk3Un7zXfUQ1LJscKtEdxWMWl6cAbUqb1PkX4Bvwz
	VLnrxxio3EMel5lftp8fRMAbCcyNOsgBZu2b4=
MIME-Version: 1.0
Received: by 10.223.17.80 with SMTP id r16mr2653698faa.28.1266083433408; Sat, 
	13 Feb 2010 09:50:33 -0800 (PST)
In-Reply-To: <b6ebd0a51002130757p5125ce53h999263dfcd45c66d@mail.gmail.com>
References: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
	<ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com>
	<ac9c93b11002130725h19c5ee93t867da2d889811a9f@mail.gmail.com>
	<ade1bdc1002130752j4e773410s2ace075b90fbb206@mail.gmail.com>
	<b6ebd0a51002130757p5125ce53h999263dfcd45c66d@mail.gmail.com>
Date: Sat, 13 Feb 2010 18:50:33 +0100
Message-ID: <ade1bdc1002130950ua50546dre8063f4dbb5e3118@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 17:53:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Chris,

> Given that the rootfs dir used in the image creation process is of limited,
> if any, use, it makes most sense to just put it under the WORKDIR of the
> recipe.
>
> IMAGE_ROOTFS = "${WORKDIR}/rootfs"

Reading again this thread I remind one of my OE setup problems.
Due to my little experience I keep two #OE_HOME dir for each project,
one for stable/2009, and the other for dev branch, in order to make
comparisons.
If inthesame#OE_HOME builds are really possible (different from
parallel) I'll have one OE_HOME for dev branch , and the other for
stable one.

product1stable + product2stable + product3stable --> OE_HOME=oe_stable
product1dev + product2dev + product3dev --> OE_HOME=oe_dev

Anyway, I'll have to be able to backup some situation
(recipes+downloads at least) --> by now I'm using rsync.

I'm afraid of cache invalidation when I pass from product1 to product2.
I know that complete cache invalidation is necessary when eabi version changes.
I guess that if I do git pull maybe I don't have cache invalidation.

-----
Maybe be there is a good book about this setup?

Thx
Raffaele


> --
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
www.opensurf.it



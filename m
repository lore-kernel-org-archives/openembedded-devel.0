Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5jK-0005Di-Db
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:52:23 +0200
Received: by gyd8 with SMTP id 8so2106169gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2E8sFE/qfFqQRKb8Pt/uRG2yybTMREyomZngYpBAscI=;
	b=kPJeMRuJcZCVgiDpyHFXuE9qyuGdmOuqHvW5wyimSMwRrHFtrFGpM05Q42ZYlt8ez2
	xRwd77yDX6FKxz4wLQRlo50q49KF8GFhSQunbJ/0rOsOBKhoXQOmagD47CAMMMe5euhO
	s71nwYSzFICTbdEzxMK5gedRqQx7VH3gnOy6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SqLl1QMiFvjxkqXsX+4/DBcBvs3yia9fTpPIMVepPzFSLhw/OoRkHmYNImS+Gu/ag6
	Yy37TEpAMnU8xndv76cBp2obv3GREXk7hUbD2JyCDLbeiZYWhJjGJO0Fu3xM2o7sWHfX
	9TmL2Qw506vTJBr3GrlSIVDQI6IhM0SvwaPXs=
MIME-Version: 1.0
Received: by 10.101.176.2 with SMTP id d2mr6449469anp.101.1281988320591; Mon,
	16 Aug 2010 12:52:00 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 12:52:00 -0700 (PDT)
In-Reply-To: <20100816194216.GH10076@jama>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTinbdx5rKQOckS3BEuEE=mZsnLmER8TqA0U87YUY@mail.gmail.com>
	<20100816194216.GH10076@jama>
Date: Mon, 16 Aug 2010 21:52:00 +0200
Message-ID: <AANLkTi=OYuOWVPO1f_HmjWFRob-Mg7AgK=e=Y9BHUZL6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Mon, 16 Aug 2010 19:52:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Aug 16, 2010 at 09:25:51PM +0200, Frans Meulenbroeks wrote:

>>
>> I could not test, as patch 2 is not on patchwork (and retrieving them
>> from gmail is somewhat tricky)
>
> I'm checking why :/ only clue is
> bitbake@jama ~/oe $ git send-email 0002-xorg-lib-move-older-not-pinned-ve=
rsions-to-obsolete-.patch
> The following files are 8bit, but do not declare a
> Content-Transfer-Encoding.
> =A0 =A00002-xorg-lib-move-older-not-pinned-versions-to-obsolete-.patch
> Which 8bit encoding should I declare [UTF-8]?
> <enter>
>
>> Do we indeed want to move this to obsolete? Is there a point in
>> retaining it? Why not just rm them (they are still in git)
>> Or do we want obsolete to become the graveyard of old recipes?
>
> I usually move it to obsolete where it's not parsed if you have
> 'standard'
> BBFILES :=3D "/OE/dev/recipes/*/*.bb"
> and if nobody screams then I'll remove whole obsolete/xorg dir after a
> while.
>
> I know it's SCM and I can look to every version in history, but while
> it's still in obsolete it's faster to call just diff if I need to check
> what changed since previous version.

Ah ok, well in that case I have no problems with moving to obsolete.
I was assuming that would be the end-of-the-line. If it is temp until
things stabilize, fine with me.

Frans



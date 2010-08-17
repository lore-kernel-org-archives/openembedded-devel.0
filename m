Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlGG0-0000qp-Sh
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 09:07:16 +0200
Received: by yws5 with SMTP id 5so1299537yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=txGvmgU4XgzzZqI4Ng6WXYVdZ5i3ueJS4IzTcAIs3Tk=;
	b=EaQD/ym1s/FeNUGQ71uVXaVR1cb89T5ZS5XpB/6mIoCUr4buU5FQxGDTpi122/ciB8
	rpnhfmhu4VFT0+CxBT6X2x60arEjUyx5KsBmid+gnNUDuItmfMP4H7eZL+0iVFbH9Rp3
	WTs7h/wW/LOdwhkpEj1qnSOZgbUVxIfntAZis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hoBce/hGbzlACc+pzxh+xO+Mkz2b2ILXlzk1PGHcJdpZIg+xgogADyYMI+59lNsCn3
	Dvz1oF8rNML4luF8AEzZfqO8SBUJi/3Ylur902mk35v/XvX/tWbGtOHyMrwltADkHeS+
	WAkX/s1zR2Blwk6sW5It4k9N2+JdG8Ii0/dRk=
MIME-Version: 1.0
Received: by 10.231.14.137 with SMTP id g9mr6946080iba.183.1282028784576; Tue,
	17 Aug 2010 00:06:24 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 00:06:24 -0700 (PDT)
In-Reply-To: <201008171050.16611.roman@khimov.ru>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
	<201008171050.16611.roman@khimov.ru>
Date: Tue, 17 Aug 2010 09:06:24 +0200
Message-ID: <AANLkTi=dD1Cpym3pOVEBP8zGMHOu3cXxsjLhJ5OV_wZf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Tue, 17 Aug 2010 07:07:18 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/17 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
16 =C1=D7=C7=D5=D3=D4=C1 2010 23:35:59 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=
=C9=D3=C1=CC:
>> IMO the newest version in a recipe should always be default preference
>> this way we can
>> stabilize recipe upgrades quicker. This also means a wider testing
>> before pushing a new recipe
>> DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.
>
> Well, consider Perl, for example. Making 5.10.1 a default preference woul=
d
> break binary packaged perl modules built for 5.8.8, so technically some
> massive PR bump (most probably DISTRO_PR) is needed when updating to 5.10=
.1.
> Forcing distro maintainers to do that is not nice, IMO.
>
> Although the way it is now Perl 5.10.1 seems to be rarely used, which is =
also
> not nice. Probably, there is no way to solve this problem for everyone. W=
ith
> D_P it's not used much, removing D_P is asking for "YOU BROKE MY BUILD!!!=
"
> love messages from random corners.

We really need a mechanism that takes changes of all lower versions
into account.
This has been discussed before. I seem to recall that RP had some ideas on =
that.

Removing D_P is not too nice for the reasons you specify (and bumping
DISTRO_PR for all distro's in unison is hard too (and some distro's do
not seem to be that acive).
A distro could decide to go there on its own by pinning to 5.10.1 and
do a DISTRO_PR bump. It would already help if the major distro's did
this.

Frans



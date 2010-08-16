Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5QO-0000Kv-35
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:32:49 +0200
Received: by yxd39 with SMTP id 39so1553058yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Q5l5jT+Ix4HLey9blMEMC1F2ZiRYZWZZid4p0OdodDE=;
	b=uH1FXB7FXoA0IFuJXnuPqB9ak6+5jnLH8difNnQmMAZyjJm9CZ7Pa5WMJimL0WCMq5
	siqtKH0GNEKRl+lnAi8syMOrTDBEXp28TWhXB8TWNzG5QoBqBRQhjjCnb6ArcT7lIUUp
	RqfgZVRtERY44v1j3zkLQVIQTzYOLCK0JMXTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tn57788vfUIw0rIbrtZSEurLhskUIuQKDgG/kBSiTwSJHudE1WoEx81hqkSazl5u9S
	6LKeQ7f8Lr4icXNKPP1iqADUzVG7RvVMPBkjsugiBesKBc5jG5VM9AUqsq/NFB7raqjV
	Dgwnk0OadBSCQ5VKyrpwPpG9Eohw3/xaVsal8=
MIME-Version: 1.0
Received: by 10.231.59.83 with SMTP id k19mr6229122ibh.178.1281987145782; Mon,
	16 Aug 2010 12:32:25 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 12:32:25 -0700 (PDT)
In-Reply-To: <201008162325.59305.roman@khimov.ru>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
	<201008162325.59305.roman@khimov.ru>
Date: Mon, 16 Aug 2010 21:32:25 +0200
Message-ID: <AANLkTim3TYOOG4NPhE85eT2-t8gjqq+wP3Twydjk7MjQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
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
X-List-Received-Date: Mon, 16 Aug 2010 19:32:49 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/16 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
16 =C1=D7=C7=D5=D3=D4=C1 2010 22:59:53 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> One small question: Do we want to keep this recipe at
>> DEFAULT_PREFERENCE =3D "-1" ??
>
> Well, we're using 1.0.0 since the day it's been released, and it's a perf=
ect
> fit for us, but I know that it _might_ break some things, just google for
> openssl 1.0.0 breakage/compatibility patches/etc, that's why I've pushed =
it
> that way so that distro maintainers could test whether it works for them =
with
> their particular package sets and act accordingly.
>
> I certainly have nothing against removing that line if everyone is OK wit=
h
> that.

Reason for bringing this up is that for a recipe (forgot which one) I
noticed that the last 5 versions or so have DEFAULT_PREFERENCE =3D "-1".
This at least seems odd.

For me DEFAULT_PREFERENCE =3D "-1" is mainly to be used if the highest
versioned recipe is not well tested or unfinished or so.
Also it can be used e.g. if a certain version does not build for a
specifc machine (DEFAULT_PREFERENCE_machine =3D "-1")
Then again it might be that the common understanding on how to use
DEFAULT_PREFERENCE is different.
Probably this is something to be documented.

Frans



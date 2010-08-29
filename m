Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opdna-0001Yi-PG
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:03:36 +0200
Received: by iwn2 with SMTP id 2so3867238iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4KOwbdFGwdaRSWwCZdKEUgKnqReV3bIyE7jHCkRxJ7Q=;
	b=A/Ylh6dSRxBBjk5yjH554jZpz1lsdgHfcvW24lotswQ/Wcl64JHnoRNakUx8BiCsMH
	WTRhnL6hvINo51sdTaJZZlDBPEL/uKeQfa9+M0NCl86P8cH7ypp6sEDtLTv1w7QOyUJ1
	pAW1kKho/hlcpcNIxkm78iQESAP42BmXmrJLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=f30k3F66fAChVfbp7fjSrssjr1TNzMv1BZMHBS9qB49bu1rlUrKG3AMSAxXN2hBnLf
	yRAMBl7+cN432uCJUS76zjk7EQn9PEcXWQc1jV7/awiOvMS1EF5dxF0kvGRmBzSbiT+I
	O9DGyj0R0+0LfctxtoCY/fkdCq1VM9iKxfdZE=
MIME-Version: 1.0
Received: by 10.231.79.213 with SMTP id q21mr3497905ibk.137.1283072583008;
	Sun, 29 Aug 2010 02:03:03 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 02:03:02 -0700 (PDT)
In-Reply-To: <20100829074414.GM17268@jama>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-22-git-send-email-raj.khem@gmail.com>
	<AANLkTinto0DJo6_PQ+c55fdsn45xfP6RgTHV-CUednpQ@mail.gmail.com>
	<20100829074414.GM17268@jama>
Date: Sun, 29 Aug 2010 11:03:02 +0200
Message-ID: <AANLkTimcCY+ZtEjcCwsbctrOWHsXfr6d9HqNimhDh69r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 21/23] xqt2_20060509.bb: DEPEND on libxmu instead of xmu
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
X-List-Received-Date: Sun, 29 Aug 2010 09:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/29 Martin Jansa <martin.jansa@gmail.com>:
> On Sun, Aug 29, 2010 at 09:14:03AM +0200, Frans Meulenbroeks wrote:
>> I think this is very bad that we apparenlty have a recipe from 2006
>> that has a problem with a lib that is not there:
>> The DEPENDS is also from 2006.
>> Was it possible to have broken depends in the past, or was xmu a good
>> depends in the past?
>> If not, is it worthwhile to keep recipes from 2006 that are apparently
>> not maintained and have been kept around for so long ?
>
> This was my fault from 2010-06-24
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc470dca9dd=
eaa911c4d63edd8e863f31e537e97f
>
> and the fix is right

Ah ok, that explains why I saw that the depends on Xmu was already
there for 4 years.
Thanks for explaining this.

Frans
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>> Anyway wrt the patch:
>> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>
>>
>>
>> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > =A0recipes/xqt2/xqt2_20060509.bb | =A0 =A02 +-
>> > =A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_2006050=
9.bb
>> > index 7634d27..4492bc7 100644
>> > --- a/recipes/xqt2/xqt2_20060509.bb
>> > +++ b/recipes/xqt2/xqt2_20060509.bb
>> > @@ -1,6 +1,6 @@
>> > =A0DESCRIPTION =3D "Xqt2 is an X-Server than runs within the Opie envi=
ronment"
>> > =A0HOMEPAGE =3D "http://xqt.sourceforge.jp"
>> > -DEPENDS =3D "freetype libxi xmu flex-native virtual/libqte2 libqpe-op=
ie"
>> > +DEPENDS =3D "freetype libxi libxmu flex-native virtual/libqte2 libqpe=
-opie"
>> > =A0LICENSE =3D "GPL"
>> > =A0SECTION =3D "opie/applications"
>> > =A0APPTYPE =3D "binary"
>> > --
>> > 1.7.1
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



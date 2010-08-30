Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oq9wE-00069O-HS
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:22:39 +0200
Received: by yxk30 with SMTP id 30so2244664yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fdug1IflH3NO5bhjl91iUYTqu6p3E6X4qdLYsgnJ5+w=;
	b=mbKhTci2UdGD5Y7+y7dy7ENlEhTUhtR92xY4s9QgWMKTV61V7ZbGtwCZPA1/JaXb1Q
	nAQ0zaVICYdVCu2HGnsHvcxXKW09u1hCWml0OjWiKvWKsVwAIPnHjcu2PkDnWWgGfmyF
	GEeTkXvh38z3dxpCZv4waAJA6lZrRnhbKm4mA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iEu7sXGmnzfUlZppca4RrzjUbOrGV230AZBKLq+kHpK49KOeOON8a78htO2tTl4GBO
	kzAulk7SjnIgY4MyXPCC5dEN0EVsTzyj+/V00oWGC/v8ijrzTRFDb/1wH3xtZOyHuxaS
	s5NfP2S3LDvGbrrXN0JJcU73P2VqoYXr1a5/c=
MIME-Version: 1.0
Received: by 10.150.215.21 with SMTP id n21mr559712ybg.298.1283196125777; Mon,
	30 Aug 2010 12:22:05 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 12:22:05 -0700 (PDT)
In-Reply-To: <AANLkTinJqDYX1UGCF0yiX6FP+tORvA5wcHEOZDX=thLF@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
	<AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
	<AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
	<AANLkTin+3XSMcnYqk4HNC4C2Mur4zsQw5Oc9nV2hbGOS@mail.gmail.com>
	<AANLkTikZDtaCN_VMKLTS=SD=JNGr2omwxTdg4LTmqh=t@mail.gmail.com>
	<AANLkTinJqDYX1UGCF0yiX6FP+tORvA5wcHEOZDX=thLF@mail.gmail.com>
Date: Mon, 30 Aug 2010 21:22:05 +0200
Message-ID: <AANLkTimBbpjo+zDQppAhOTqvKNojUg9qb6iJGWoLPUkm@mail.gmail.com>
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
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Mon, 30 Aug 2010 19:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/30 Chris Larson <clarson@kergoth.com>:
> On Mon, Aug 30, 2010 at 11:38 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> 2010/8/30 Chris Larson <clarson@kergoth.com>:
>> >
>> >
>> > The logic already exists. =A0SPECIAL_PKGSUFFIX has to have current
>> information
>> > about the suffixes in order for BPN to be correct. =A0It seems pretty =
silly
>> to
>> > duplicate it, but whatever works.
>>
>> I thought there was no suffix for target. It would be nice to have
>> that. For _native, _sdk etc it exists, but I cannot say
>> DEPENDS_target =3D ...
>> which could be handy in recipes using BBCLASSEXTEND =3D "native"
>
>
> There is no suffix for target, which is why the previously mentioned snip=
pet
> compares PN to BPN (BPN is PN with the SPECIAL_PKGSUFFIX'es removed).
> --
Yes, well my concern is that that solution is not too understandable
for the average developer.
And from a consistent/standard viewpoint it seems to have sense to
have _target adjacent to _natve etc.

Frans



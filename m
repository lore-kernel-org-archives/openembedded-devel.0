Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D06A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:06:34 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id q3so35795125pav.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=oxTdiIvK7kEji+xFHyW5QyPDRtk1lUW26PXu0RfUis4=;
	b=TSrdAZLzY12SOH7I6Cuf9razZpUB6QKsISyEecNjbXGFMHnePLfZu7U+rPt0N1BXRZ
	Q3MDx51CC0keyCpN8LnYgQe/2LVPqkVylQ6giamnoeFXncQuCGaFqg+qcT/d1Cg22j33
	LmOLeASOuJ0fuJydlllc4P6KqjBWOqc3kV0ToSYNZf7dtE+yddnrldGlUOMQWulYGrD9
	Tj+mXaQE5+B4RhlooPbuLnEi7OshtWUJ6hbyNdcYUqWjr00E/usZnBSMptnx3uPlUJoO
	8z5nPa5TWALp9iXprwKjUYdE0+W4aUUlUQ8sP2D/48jZQSjf468oJIi4nUmydWhsshu8
	y77A==
X-Received: by 10.66.142.78 with SMTP id ru14mr2988120pab.66.1450422395164;
	Thu, 17 Dec 2015 23:06:35 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3df1:6e85:f350:aa60?
	([2601:646:8802:5d5c:3df1:6e85:f350:aa60])
	by smtp.gmail.com with ESMTPSA id
	n64sm15519465pfi.19.2015.12.17.23.06.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 23:06:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151123202155.GA17303@jama>
Date: Thu, 17 Dec 2015 23:06:27 -0800
Message-Id: <D3E9F0E7-BCA4-4875-A646-51A2F9D4CC24@gmail.com>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
	<CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
	<D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
	<CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
	<20151123202155.GA17303@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2015 07:06:35 -0000
X-Groupsio-MsgNum: 59083
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E4001E3-F753-4BE5-B664-C15C24FD5957";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E4001E3-F753-4BE5-B664-C15C24FD5957
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

ping^1

> On Nov 23, 2015, at 12:21 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Nov 23, 2015 at 05:25:59PM -0200, Otavio Salvador wrote:
>> On Mon, Nov 23, 2015 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>>> On Nov 23, 2015, at 4:29 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>>>>=20
>>>> On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
>>>> <mario.goulart@gmail.com> wrote:
>>>>> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>>>>=20
>>>>>> The imsettings requires xfconf to run, making it dependent of =
XFCE. It
>>>>>> makes no sense to make meta-ruby dependent of XFCE so we move the
>>>>>> imsettings recipe to meta-xfce and add the meta-ruby dependency =
there.
>>>>>=20
>>>>> s/dependent of/dependent on/
>>>>=20
>>>> Agreed; Martin, can you fix it when applying or do you wish me to =
send a v2?
>>>=20
>>> I have sent a patch for same last week see.
>>>=20
>>> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/72211
>>=20
>> You missed the addition of meta-ruby dependency for meta-xfce now.
>=20
> I think he didn't because ruby was moved from meta-ruby to oe-core.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_1E4001E3-F753-4BE5-B664-C15C24FD5957
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzsHYACgkQuwUzVZGdMxRGdACeK7/OzUwyQLRIUtcKl0vwRYKM
zlEAnR77plbX+ZNd4UDrLKyJqhXgicyP
=QVpn
-----END PGP SIGNATURE-----

--Apple-Mail=_1E4001E3-F753-4BE5-B664-C15C24FD5957--

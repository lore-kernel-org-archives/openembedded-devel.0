Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E41C7404E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2015 00:30:54 +0000 (UTC)
Received: by paza2 with SMTP id a2so22026973paz.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 17:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=WL5cX1tRaV4bT4gKaPOKmLvbJBeoWCgtaW/amGxrmcw=;
	b=OHTYJ1UqjhqIpIvwzi5TUYjdHh/ZmK7KBeD0bAAijD5/NwhVEUpWVS9uL20TO1LOle
	J8vS3WF7YTYUKiFqd4W1vbyW8cRbKcoZs24pPODnBMsx/XU1xPf54MrYID7uUBqk3iBY
	PRni6WKyGo2ljQCNgev9qNz8Otu2ZCQocME8FLpmfFfp68L6JeD0nUD2bwhedpEzykj1
	DUqrIyC0LprczWq9RHxe2p89tO08ViV2Stt84YiCssvczdVlOKv3gCVkEGlSdxCKq70P
	XdwrVzffR/SPNy3OJpDYoYNDMJvim/PuvzGKskdN4SgW6MjixpkcLdfPyNxCAtKh+95W
	jFSQ==
X-Received: by 10.66.136.170 with SMTP id qb10mr19977665pab.56.1432341056113; 
	Fri, 22 May 2015 17:30:56 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2847:ae2e:9041:6f88?
	([2601:9:3580:84c:2847:ae2e:9041:6f88])
	by mx.google.com with ESMTPSA id zv8sm3203084pbc.45.2015.05.22.17.30.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 May 2015 17:30:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <555FB899.9040301@gmail.com>
Date: Fri, 22 May 2015 17:30:50 -0700
Message-Id: <60F0FBF5-E55D-4088-81D4-C1D5563006B9@gmail.com>
References: <5548E485.6080505@gmail.com> <555E2359.3080509@gmail.com>
	<8824256D-28B9-48F4-8155-2185F236B4F2@gmail.com>
	<555FB899.9040301@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: ODROID-C1 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 May 2015 00:30:55 -0000
X-Groupsio-MsgNum: 55609
Content-Type: multipart/signed;
	boundary="Apple-Mail=_246A0685-8948-41F3-810F-E7D06CCC7094";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_246A0685-8948-41F3-810F-E7D06CCC7094
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 22, 2015, at 4:15 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> On 05/21/15 17:18, Khem Raj wrote:
>>> On May 21, 2015, at 11:26 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>>=20
>>>=20
>>> Why would someone include your layer and not build for odroidc1 or
>>> wetekplay? Sometimes that's what people do ;-) (look at Angstrom, =
for
>>> example). Besides, a BSP layer should be able to play nicely with =
other
>>> layers even when its machines aren't being used :-)
>> This is very much desirable, in todays times. In angstrom e.g. we =
want to generalize feeds across
>> many machines for arm especially, so we can share common feeds across =
multiple armv7a machines
>> so BSP maintainers have to start thinking that their BSP layer will =
be put along with other BSP layers
>> and they not change common components mindlessly to fit for just one =
given machine.
>>=20
>> secondly more and more end users especially big companies have more =
than 1 machine tied into their useless
>> so its desirable for them to use one distro across all the product =
lines and hence a requirement to have
>> BSP layers play well with each others.
>=20
> Shouldn't this be true of distro layers as well?

May be but its not a practical requirement.
Remember OE is a framework to build embedded Linux distributions, we can =
have multiple machines
supported for a given OE based distribution so thats a usual case, =
distribution is the global set of policies
under which your build then works. Now if you have two distribution =
layers then they may impose certain policies
that may be in conflict.

>=20
> Simply included meta-angstrom in conf/bblayers.conf causes one's =
DISTRO
> to be set to angstrom, even if they select poky in conf/local.conf.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_246A0685-8948-41F3-810F-E7D06CCC7094
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVfyj4ACgkQuwUzVZGdMxREEACcCF/z3qrLSFsNmkPM8aLt4o8+
BRkAn3KewI8kBB9WzzFyynB/7UM938hQ
=AxbY
-----END PGP SIGNATURE-----

--Apple-Mail=_246A0685-8948-41F3-810F-E7D06CCC7094--

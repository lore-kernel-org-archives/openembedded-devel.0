Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C99DC76294
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:22:15 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so17582044pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 19:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=29zivRQCrmhdvAZADpTf3QZhK3FwQhmpk5A6tjiWr5Y=;
	b=CqWIyCR0yqohuoQs+eGJpCZNcep3QVOkFDUtMvRnLfvrrLNFRdRZRkBMGPXj43Srr+
	/mw8qdzCaxDIX6dSD6B4S3aDdfAWvpa6mO7jgYj2/Zt/zJbBrPI+COF7Z/oyUQfT/K/W
	6ZLoayQ/7IE5/Uuu0nd28fbkiSCfrLnONIJjBlCqL+K/pJZaw9iGAQesfFiggdIKxm2B
	KezPg5TqyqJyAW4Gfh2MRuA6IYYVg9D2IUzd+fWdfVN5xIpE4hRQ28xxZh24/mlmO5h0
	paSlNunugyljRP04MGiqPRntUoB2lWQHDUG0ElOU8ckNhWuVBjcJuEuZ2G+z0ICOi7Nk
	RUnw==
X-Received: by 10.68.173.5 with SMTP id bg5mr11033462pbc.104.1447212136022;
	Tue, 10 Nov 2015 19:22:16 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:716d:29f5:a55d:699f?
	([2601:646:8601:4580:716d:29f5:a55d:699f])
	by smtp.gmail.com with ESMTPSA id
	fx3sm6783735pbb.60.2015.11.10.19.22.14
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 19:22:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
Date: Tue, 10 Nov 2015 19:22:16 -0800
Message-Id: <88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3108)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Wed, 11 Nov 2015 03:22:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Nov 10, 2015, at 2:00 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>=20
>=20
>> Am 10.11.2015 um 22:42 schrieb Christopher Larson =
<clarson@kergoth.com>:
>>=20
>> On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> +                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'lsb',
>>> '', d)} \
>>>=20
>>=20
>> This really requires lsb to able build, for all sysvinit distros? =
That
>> seems unlikely. Was this intended to be based on the lsb distro =
feature?
>> Also, why add lsb to rdepends independently of the packageconfig? I'd =
think
>> using the packageconfig's 4th field for rdepends, if necessary, would =
work
>> better, unless I'm missing something?
>=20
> You do ;)
>=20
> It uses the LSB init-script for systemv-init - and lsb doesn't suck in =
that
> much that it hurts. But the line you quoted just adds an item to =
PACKAGECONFIG :)
> Do a PACKAGECONFIG_remove-pn-samba =3D "lsb" to avoid the 4 scripts =
=E2=80=A6
>=20

that should be tied to =E2=80=98lsb=E2=80=99 distro feature as it =
exists. Distro=E2=80=99s then automatically get the intended behavior =
based upon the selected distro policy.



> I will be happy supporting a patch distinguishing between lsb's =
init-script
> and basic init-script with only rudimentary start and stop and nothing =
else.
>=20
> Cheers
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8E9365CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:00:14 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22124050wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tlXeEbzH66OJD55e2fGNNoCG5Y4KZH5pTig7vgY6vEo=;
	b=HDM6pjgbvrmrpWDZDbzGPF5/tK5v6/rnRG5Nvn+kxCuaKbLtwedG7xCM1MVfZnhu0J
	w/MVXyYABGJ3Ap1siUzmFUJT5Ds4vk7g39FyjkbKDHlrM5eV/T6tAGbc4Z+Et0u96vfd
	vxqmOERKqw8gyzvGwkb4yd6L3wwImlOPYiNSgLZqMx9MnK71p3FO5KrGgePISdJNtyDa
	aLcuyBrWLIIEcEpp6u1Y3o8UibtsADbXA5eW40G6UCnC2kDRmoZTHjOyD4fycU6Dv+Kn
	wFqLKSA7OXJFyY/94Lm+h4SueE8SXexQkdmVDpOCowWGxP4C1JzWuP26wUZh7IwpFkQl
	3lyA==
X-Received: by 10.195.18.6 with SMTP id gi6mr6083191wjd.83.1447192814779;
	Tue, 10 Nov 2015 14:00:14 -0800 (PST)
Received: from [172.22.33.55] (ip-37-24-117-137.hsi14.unitymediagroup.de.
	[37.24.117.137]) by smtp.gmail.com with ESMTPSA id
	v192sm5164709wmv.5.2015.11.10.14.00.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 14:00:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
Date: Tue, 10 Nov 2015 23:00:13 +0100
Message-Id: <B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Tue, 10 Nov 2015 22:00:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 10.11.2015 um 22:42 schrieb Christopher Larson =
<clarson@kergoth.com>:
>=20
> On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>=20
>> +                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'lsb',
>> '', d)} \
>>=20
>=20
> This really requires lsb to able build, for all sysvinit distros? That
> seems unlikely. Was this intended to be based on the lsb distro =
feature?
> Also, why add lsb to rdepends independently of the packageconfig? I'd =
think
> using the packageconfig's 4th field for rdepends, if necessary, would =
work
> better, unless I'm missing something?

You do ;)

It uses the LSB init-script for systemv-init - and lsb doesn't suck in =
that
much that it hurts. But the line you quoted just adds an item to =
PACKAGECONFIG :)
Do a PACKAGECONFIG_remove-pn-samba =3D "lsb" to avoid the 4 scripts ...

I will be happy supporting a patch distinguishing between lsb's =
init-script
and basic init-script with only rudimentary start and stop and nothing =
else.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



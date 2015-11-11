Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 99D0177182
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:20:31 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so123882740wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=e995/QPNvTO1HLBymOCCIERyVH4Uo11CC+aMPDCOB7g=;
	b=bxRo5wBtVtpnbThUpmYqrrm3UnQwtvEn6eMyqbsNZfW1lb0TvqAS25h0fFaD0VE/Oo
	ZR9pAluwRXrqcu5RhywP4Zy6LcrS3aq0PnabOyZWUVY8werfy49Vjsp2pNqV9lQFNR12
	eY78IQH1xFMXVhWLcbZ1nFR4wm3hIvFtOP2GlypGdYNz9Zdra2V8STiDXfHyoa1UA/h2
	77DDbpLTaPPdUj3P2Zos4TBTkpi8EG3Re5TWAd1cn+DhHU2SDd1DO+90lHTurwLg3xhC
	kRNUzFzzrpHLhtzJopWQIggBsBkURUAcghFg+g5Wr2QyvjIEGAc8FcA55vTtAQv4SEk0
	IkkA==
X-Received: by 10.28.26.78 with SMTP id a75mr12463457wma.13.1447266030890;
	Wed, 11 Nov 2015 10:20:30 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pc2sm10242449wjb.11.2015.11.11.10.20.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 10:20:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
Date: Wed, 11 Nov 2015 19:20:29 +0100
Message-Id: <B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
	<7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 18:20:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 19:07 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 8:37 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>> grep remains silent regarding DISTRO_FEATURES and linuxstdbase :(
>=20
> right, its a OVERRIDE so you can do something like
>=20
> foo_linuxstdbase =3D .....

And? That's why? ...

I still don't get your initial argument why the PACKAGEOPTION shall not =
be named lsb,
when init support based on lsb is added by it.

Best regards
--=20
Jens Rehsack - rehsack@gmail.com



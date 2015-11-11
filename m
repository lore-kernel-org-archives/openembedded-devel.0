Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4904577190
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:54:46 +0000 (UTC)
Received: by wmec201 with SMTP id c201so195540631wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3XIz/C1/O5ty428sdYvQ8DP1XZFnKvDHlcRp/YeOcU4=;
	b=Mau9DfapgoTtgqCXt1IwOQFRdNS8gG7ae4dLlk2ACgNlTGPiMndtE9ju3wVnVl2TkQ
	OUkILfvlsUkpCsnpgwGvQyXaKnbElGjVzJijB33xX+o/3LNcaMDG7abPphkpwep1z3Mp
	Wdbs0SM87s+d9y/kqG9YjHJTQrQrPRWibZv4TaSGhS4bYOfli/phAUjtqh77doyNsreg
	t7UUzX7af9IaeIVDOoBZjf0fsrWXie2ayDDZQPei+wmx1hI7TwKOOgI3AiRTTtYtg5q9
	Yuj3m4sMmq49JMgAYvgd+Y1cb7Zqogq5TnMg9cU+576F04q+jNRIw1JZuqDx6Z3aPxOQ
	L5yQ==
X-Received: by 10.28.139.143 with SMTP id n137mr12197271wmd.8.1447268086542;
	Wed, 11 Nov 2015 10:54:46 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	j4sm10946122wmg.18.2015.11.11.10.54.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 10:54:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
Date: Wed, 11 Nov 2015 19:54:44 +0100
Message-Id: <75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
	<7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
	<B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
	<CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 18:54:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 19:47 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 10:20 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 11.11.2015 um 19:07 schrieb Khem Raj <raj.khem@gmail.com>:
>>>=20
>>> On Wed, Nov 11, 2015 at 8:37 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>> grep remains silent regarding DISTRO_FEATURES and linuxstdbase :(
>>>=20
>>> right, its a OVERRIDE so you can do something like
>>>=20
>>> foo_linuxstdbase =3D .....
>>=20
>> And? That's why? ...
>>=20
>> I still don't get your initial argument why the PACKAGEOPTION shall =
not be named lsb,
>> when init support based on lsb is added by it.
>=20
> my only ask was that if I have linuxstdbase in overrides then I should
> get lsb behaviour enabled for this package automatically weather its
> PACKAGRECONFIG or not. and similarly disabled when I dont have it in
> my distro overrides

In this special case I intend to say no, because:

  The lsb support is limited to startup only - and the distro features
  controlling startup are "sysvinit" and "systemd", respectively.

Mixing systemd with linuxstdbase in overrides is possible but installing
two init-script not knowing each other is likely asking for trouble. =
Maybe
I'm wrong with that :)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



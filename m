Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A6CB0771A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 20:20:43 +0000 (UTC)
Received: by wmww144 with SMTP id w144so60131185wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0qPmEVDsr+M63v/ZGS3Ng92t/9YQfrMYBQAKkY7jmoU=;
	b=O/GnymrS8c9XM4ZpY72Og2jgSrbiPzcM5XrLlu486Xe0Mvatrpa0jLrv/O7nKwEYJ5
	0nJb9visnNhS3QrZ2Kzq1qO954LU9cKJEScEiWN9jNzJaUmPYU1OcWL1orMPEB0cvrWQ
	+Cz4eglLNExTDgKN4bxjAo50acDhWgCGQ4jlMcj5BJD0ai/ym+a/OfJtN1iehj1WImgy
	LvfwWObaXrMJfVy7HH12Jtlyp8vO6ZMSe4Wixs68neZ7Ua2TVnd0E9KQrSoSeXJkUDqk
	bPTGfp6qSYWuWuV/ukq8PPIF3whv8EcsE4vnv9c1eGyTeWqj5VuIeoqvCMBrYvKOmT3w
	Dqkw==
X-Received: by 10.28.170.18 with SMTP id t18mr14062608wme.73.1447273243724;
	Wed, 11 Nov 2015 12:20:43 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	197sm26978212wmx.23.2015.11.11.12.20.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 12:20:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1sruZfx4tO+_cwmzrM0XQj39L3mCyXK_WfSOdx8yfWnFvA@mail.gmail.com>
Date: Wed, 11 Nov 2015 21:20:41 +0100
Message-Id: <6B63E7FC-B65B-450B-871D-182CCAE06796@gmail.com>
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
	<75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
	<CAMKF1soRPp6yxDK+iF_SB0EO=Dvzx9oKDiRgRJqw0WXv2BbbAA@mail.gmail.com>
	<662EEA96-421F-46A1-97F1-F07CE05D08FA@gmail.com>
	<CAMKF1sruZfx4tO+_cwmzrM0XQj39L3mCyXK_WfSOdx8yfWnFvA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 20:20:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 20:48 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 11:22 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 11.11.2015 um 20:12 schrieb Khem Raj <raj.khem@gmail.com>:
>>>=20
>>> On Wed, Nov 11, 2015 at 10:54 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>> In this special case I intend to say no, because:
>>>>=20
>>>> The lsb support is limited to startup only - and the distro =
features
>>>> controlling startup are "sysvinit" and "systemd", respectively.
>>>>=20
>>>> Mixing systemd with linuxstdbase in overrides is possible but =
installing
>>>> two init-script not knowing each other is likely asking for =
trouble. Maybe
>>>> I'm wrong with that :)
>>>=20
>>> and only sysvinit is valid for LSB, if you use systemd then lsb is
>>> violated anyway
>>> you can encode that logic for completion if you want
>>=20
>> Currently I'd like not to complicate things before jethro :)
>>=20
>> When you have an example somewhere how it can be sanely done, and =
it's easily
>> adopted - I'm happy to send an update for that. Otherwise I intend to =
wait
>> after release and take the patch as it is to fix remaining issues =
before
>> release is done.
>=20
> jethro announcement went out yesterday so ..
>=20
> =
https://lists.yoctoproject.org/pipermail/yocto/2015-November/027342.html

Cool - so it's shipped with a 3 month known bug =
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8127 ... anyway ;)

So, do you have an example around how to reasonable add your suggestion =
to check for lsb override?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



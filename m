Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 799BD769A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:24:19 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so77691338wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=IrnXRK4zydHV3XHLY1je6YLY5xoYr4yidMAVojKLtQg=;
	b=OtiF1RUIYHP5rRvOtENpykdgyiFt2iSZT2RVX/mJjfvpruFDwAmmQAptw324xdBYOl
	A9YPt/i5OLu/JouJvr/96su368ZY/jXocM4F0NE1rlr/MjqLT7jpt47Co8Lv1Zk2M6Sc
	MQ88i7QLs8ajKuDzSm2WVv/PukBhE6jPBhQyLJFNlyylXgljmhXu7/fp9ZvT9Z/8HZRm
	rRK078L7AKb+0eTLvzXcJ45UA04R1Rtscs93r7mJvDAFqvmMy9fnNZrsYVO0kqDmJzP/
	IJMgp9OL9qrM5rlTLJMnDFOC3Q99kM9xcYoxivHTXtjDUWBrha6dXco2lxyAn1aiQQRj
	NaKg==
X-Received: by 10.195.11.72 with SMTP id eg8mr12592563wjd.14.1445437459660;
	Wed, 21 Oct 2015 07:24:19 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	wz5sm10745981wjc.20.2015.10.21.07.24.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Oct 2015 07:24:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151021141118.GC2556@jama>
Date: Wed, 21 Oct 2015 16:24:17 +0200
Message-Id: <A80CC947-3B00-47C1-8A21-81FD2D4127B2@gmail.com>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama> <20151021110944.GB2556@jama>
	<20151021141118.GC2556@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 21 Oct 2015 14:24:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 21.10.2015 um 16:11 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> On Wed, Oct 21, 2015 at 01:09:44PM +0200, Martin Jansa wrote:
>> On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
>>> On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
>>>>=20
>>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes =
ARM in 3.5
>>>> (see =
http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-b=
ackend).
>>>>=20
>>>> Ensure JIT is built with llvm
>>>=20
>>> I'm tempted to leave this one after jethro is branched, unless
>>> default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
>>>=20
>>> Otherwise everybody will need to set LLVM_RELASE in their mesa =
bbappend
>>> or we'll need to bbappend it in meta-oe.
>>=20
>> Or better, update this to keep 3.3 as llvm is meant to allow multiple
>> versions being built and installed in parallel.
>=20
> Another reason to keep 3.3 around is build on older hosts, current 3.5
> fails in Ubuntu-12.04
>=20
> | checking whether GCC is new enough... no
> | configure: error:
> | The selected GCC C++ compiler is not new enough to build LLVM. =
Please upgrade
> | to GCC 4.7. You may pass --disable-compiler-version-checks to =
configure to
> | bypass these sanity checks.

I'm fine with keeping both. Shall I resend the patch keeping 3.3, or can =
you
extract the relevant part?

>>> What others think?
>>>=20
>>> And was this tested with mesa or just with java?
>>>=20
>>> Regards,

Unfortunately (my DISTRO's are without X11) with Java only.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



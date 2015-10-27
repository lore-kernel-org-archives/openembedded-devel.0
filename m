Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEC575CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:29:43 +0000 (UTC)
Received: by wikq8 with SMTP id q8so228973561wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=EaFUHbvgllXs94EY5FvdKpvC0aS+aEKKQzwvc1zsCj4=;
	b=puR9Th4+v64CSz8Fes0xRXxhXvIvodUeeRTdMsJI1bE1g5WJD3pJgsIM8u/Zm7OsKa
	Q+2oD+yoRhBYmtvki+xdtigXpdPZAIMPU/6duvMMsM18A7xanAqAVUy8IssvXElLlXnO
	dUVP066XxV1Km7+NgS2a5ZgoyapnNriJNM9GCDX7z8574QmtWcwfDTXFlLPvkuoXSM4g
	tp4HxvdCBXOSg0hItlbTS8FjPzf4WFL+m2xL8dhB3S+Gml8oVrFYX+TBvC1qt3Qa7rq6
	F+SC5VmxBWbrq5btfFLh65gmdtLey7pDzWRhAsd6qkrb/GJaIYQz4gPkKOrPNCoiEWDg
	ruJQ==
X-Received: by 10.180.221.227 with SMTP id qh3mr28028111wic.71.1445977783197; 
	Tue, 27 Oct 2015 13:29:43 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id 5sm2858819wmg.14.2015.10.27.13.29.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:29:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
Date: Tue, 27 Oct 2015 21:29:41 +0100
Message-Id: <6D229B13-9330-4670-9655-073E0E4C8223@gmail.com>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
	<39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
	<CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Tue, 27 Oct 2015 20:29:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 27.10.2015 um 21:24 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Tue, Oct 27, 2015 at 6:21 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 27.10.2015 um 21:15 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>=20
>>> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes =
ARM in 3.5
>>>> (see =
http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-b=
ackend).
>>>>=20
>>>> Ensure JIT is built with llvm
>>>>=20
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>=20
>>> There is a patch to add LLVM 3.7[1]; I think this one can be =
dropped.
>>>=20
>>> 1. http://patchwork.openembedded.org/patch/106281/
>>=20
>> I'v seen this and I guarantee that OpenJDK-8 will fail heavily with =
llvm3.7 - the guys
>> put an end to an antiquated API's with each release, and OpenJDK's =
zeroshark uses lot's
>> of them.
>=20
> So we will need to figure how to deal with this. I see following =
options:
>=20
> - add needed llvm recipe in meta-java (I dislike this)
> - fix openjdk
> - update openjdk so it work with 3.7 (preferred)

I would prefer that, too - but we have to find a sponsor for that.

We also have the option to have an llvm3.5 for a while in meta-oe ;)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



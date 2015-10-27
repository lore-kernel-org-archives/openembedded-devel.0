Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 57468755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 21:19:57 +0000 (UTC)
Received: by wijp11 with SMTP id p11so232887983wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=VoFF/Goyuq/15FyjgVtamJpuqM7tcXBbqKZ+5JDTZyc=;
	b=hIRdgsL+nwmNRWTp7uxNR8D9AbcyWzKIfbW/k84X7cfy9u0PUZAPE36GARl1DNVw6Q
	TYxindaLNvzroVh9LZq3kU7bWqNt3wBZi0OC3NbWqkgK0BQWkT2Oou77TCEMtvWjCVgM
	KcDIN/uWSrWmz7MZkVhWdHRz7D4TTEkkBxhCg4mxsJcBJHG6pGPgpfycqSvHDgargDu9
	yIQStaOz/2rNiIs5FxKY0OvVdkF+9vkrfWQ+sNqFA2pTWCJlTbPQ5eja2or/KmXWbD+h
	3qCjV3BbOdtWRGQ0G6BrJNnuqfcLgaCbHUb3K1NpOjZt00szzkiT5Glq4ABZeUbd1cIW
	5lyg==
X-Received: by 10.180.211.101 with SMTP id nb5mr16366573wic.0.1445980797588;
	Tue, 27 Oct 2015 14:19:57 -0700 (PDT)
Received: from [172.22.1.249] (ip-37-24-117-137.hsi14.unitymediagroup.de.
	[37.24.117.137]) by smtp.gmail.com with ESMTPSA id
	gl9sm46837873wjb.10.2015.10.27.14.19.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Oct 2015 14:19:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <20151027203241.GI2577@jama>
Date: Tue, 27 Oct 2015 22:19:56 +0100
Message-Id: <73112C92-D207-4BE8-A953-E1F50B387429@gmail.com>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
	<39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
	<CAP9ODKp5yhi1GqwciLueq1mwzhBekg6DtTxXrPFfP=9gNSEu6w@mail.gmail.com>
	<20151027203241.GI2577@jama>
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
X-List-Received-Date: Tue, 27 Oct 2015 21:19:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 27.10.2015 um 21:32 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> On Tue, Oct 27, 2015 at 06:24:52PM -0200, Otavio Salvador wrote:
>> On Tue, Oct 27, 2015 at 6:21 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>=20
>>>> Am 27.10.2015 um 21:15 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>>=20
>>>> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>>=20
>>>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes =
ARM in 3.5
>>>>> (see =
http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-b=
ackend).
>>>>>=20
>>>>> Ensure JIT is built with llvm
>>>>>=20
>>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>>=20
>>>> There is a patch to add LLVM 3.7[1]; I think this one can be =
dropped.
>>>>=20
>>>> 1. http://patchwork.openembedded.org/patch/106281/
>>>=20
>>> I'v seen this and I guarantee that OpenJDK-8 will fail heavily with =
llvm3.7 - the guys
>>> put an end to an antiquated API's with each release, and OpenJDK's =
zeroshark uses lot's
>>> of them.
>>=20
>> So we will need to figure how to deal with this. I see following =
options:
>>=20
>> - add needed llvm recipe in meta-java (I dislike this)
>> - fix openjdk
>> - update openjdk so it work with 3.7 (preferred)
>=20
> I don't mind having all 3 llvm versions in parallel until all this is
> sorted out.
>=20
> People can select the right one based on mesa version they are using =
and
> 3.8 for OpenJDK.
>=20
> But I would appreciate this recipe rebased on top of Philip's (or vice
> versa), because I don't have spare time to text it with newer mesa
> Philip is using or with OpenJDK Jens is using.

Since OpenJDK waits for autoconf patch anyway, I'm happy to rebase my
patch when Philip's is in.

I'm also happy to try out how complex a move to 3.7 will be for =
openjdk-8 if
I find a tuit. I think, next week or so we'll make an initial decision
about our way to get a JVM with JIT support.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



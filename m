Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 99F8F75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:21:56 +0000 (UTC)
Received: by wikq8 with SMTP id q8so228715995wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=T5K3arfeB9XLPgsp5v0ONGGWW2UsHrJNusYSuqWqa0I=;
	b=KAXxTb8yjdQnRqotzQHl3xMbjeioRLyy8hibnLpC2aMROytDPZa4+Ej3ks3dpNgj+h
	XJgLLS0AoyJ3W57ka4bNIwXADFaebXbLhARVPUSlhwOiQiZixZXq2Gv1SV3tYG9OUIjn
	dOme8IeyYE8iSO5u/zlebIdpSYV+FNAqZtH9rxZDINJ3QF3GgNkaBiZ30uS5OZSAwD1n
	0GaocRZkIgdg5RPltIXikwUNNbRlV0zZCoGgUwAePPAgD7CJPO+QAp/sx2KVUjSGBGE5
	o2kNEk2zWfpx9Oa3HtA9t0C8pZRxRr7IJ86r3WwZlO32cx6S/OkKKoLIqrSavsp4hyYD
	Yofw==
X-Received: by 10.194.190.19 with SMTP id gm19mr33360454wjc.0.1445977316825;
	Tue, 27 Oct 2015 13:21:56 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	jf13sm19009075wic.8.2015.10.27.13.21.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:21:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
Date: Tue, 27 Oct 2015 21:21:55 +0100
Message-Id: <39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Oct 2015 20:21:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 27.10.2015 um 21:15 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM =
in 3.5
>> (see =
http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-b=
ackend).
>>=20
>> Ensure JIT is built with llvm
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>=20
> There is a patch to add LLVM 3.7[1]; I think this one can be dropped.
>=20
> 1. http://patchwork.openembedded.org/patch/106281/

I'v seen this and I guarantee that OpenJDK-8 will fail heavily with =
llvm3.7 - the guys
put an end to an antiquated API's with each release, and OpenJDK's =
zeroshark uses lot's
of them.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7F73475E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 14:54:03 +0000 (UTC)
Received: by wikq8 with SMTP id q8so73280587wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=XT/I1WV93HsLovv5KN4WSgyTykhBndrUXUOJNKd8ynw=;
	b=WBnXa3oPmh0o3G7qUHtpFbTxfRjw3bVJCJbX3q03Pd2bvcNTJY3JVJwfcVUOpW4z0H
	yc+fiPHY5Mh7MgavNMvHySq+5Ii8EB3rajZfinqiSds5owhQUFhog7dYcER1vSJ5pyly
	H4uFgB9HwI9o6FFX2PUGPk3nVb9ncCvXpytdQOKWGsoFW8tdaD1atg5x0KTN5mKjxYrt
	T8P118rrD+GqPKKa5dYoCSfVyWepdp8zK/9OD2PwNPcf7uxiIqrguQgQJlWEMJTScwXU
	YB/E28nhgWenKO03+hCSDX+iC0vT0W+TAWFyJqAJUikT4Q1uHgmZb3ub1YU9Gi9RWTHo
	bV3Q==
X-Received: by 10.194.24.201 with SMTP id w9mr33857820wjf.71.1446562443747;
	Tue, 03 Nov 2015 06:54:03 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	q1sm27948384wjy.31.2015.11.03.06.54.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 06:54:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5638C28E.7040505@skidata.com>
Date: Tue, 3 Nov 2015 15:54:01 +0100
Message-Id: <2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 14:54:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 03.11.2015 um 15:19 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 11/03/2015 10:36 AM, Jens Rehsack wrote:
>> This adds openjdk-8 for native and target builds and allows a =
stripped
>> openjre-8 being built as well instead of trying to cherry-pick jre
>> components from jdk-image.
>>=20
>> The recipes allow building openjdk-8 with or without:
>> * x11
>> * cups
>> * alsa/pulseaudio
>> and let packager enable unlimited-crypto, if desired.
>>=20
>> Since there can be only one PROVIDES for virtual/java-native and =
virtual/javac-native,
>> move the provides to openjdk-8-native (I think everyone agrees it's a =
better
>> choice than ecj-bootstrap-native).
>>=20
>> Plus: Applying a fix from openjdk-9 repository which fixes build =
issues using gcc5
>=20
> For me the patch fails to apply on current master:
>=20
> git am patches-from-emails/openjdk-8_and_openjre-8.eml
> Applying: openjdk-8: add recipes for openjdk-8 and openjre-8
> /home/leri/git/meta-java/.git/rebase-apply/patch:515: trailing =
whitespace.
>      xargs -0 -n1
> ${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack
> --effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest =
--strip-debug
> /home/leri/git/meta-java/.git/rebase-apply/patch:1232: trailing =
whitespace.
> #
> /home/leri/git/meta-java/.git/rebase-apply/patch:1265: trailing =
whitespace.
>=20
> /home/leri/git/meta-java/.git/rebase-apply/patch:1270: trailing =
whitespace.
>=20
> /home/leri/git/meta-java/.git/rebase-apply/patch:1289: trailing =
whitespace.
>=20
> fatal: corrupt patch at line 4592
> Patch failed at 0001 openjdk-8: add recipes for openjdk-8 and =
openjre-8

That's maybe because I copy the format-patch output manually into the =
mail.
Use this one: =
https://github.com/rehsack/meta-java/commit/57eba04b0f68a55b3250a692bc5834=
902709c903

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



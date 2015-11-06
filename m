Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 54AC760124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:00:29 +0000 (UTC)
Received: by wmll128 with SMTP id l128so36239393wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=rLLgiV4PKBTgJWqauEJqx+yweBGSsJYIVcYKe4iRjrg=;
	b=jJ5xj9WL4R+xWEqiGqNnBXsHVBxBlco++/uHAUZIHBEuYAABMX0N+K5IovzTKsYQzv
	nkeKY/cQEDfePMtWcejW/BbckZQWtPYZ8lkCvPHjJXkziF6N5EPzOnU6+vKeXj0ZyHJ4
	MwSLFYiMrvPWYP8v5sxkxKhpeRFqkGw4EqgHHPuIxpxgNo8vtyN4ubt/uLsJ6SQvM5zI
	OPCou8vWtpb71IZVp3pKnYS/4GjqOXx997LYxitT3N1gJ8SzDPwWngC2IZEP6HKVrwHn
	15zJKR2c53Hzns6+ChR19+LmJo9fF8HQsdLq9EI4uktrpmKrD46bx92JNy/AMMqsaBSw
	GROA==
X-Received: by 10.28.229.70 with SMTP id c67mr9760944wmh.48.1446804029771;
	Fri, 06 Nov 2015 02:00:29 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	gl4sm11363386wjd.49.2015.11.06.02.00.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Nov 2015 02:00:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <563B5D58.6070709@skidata.com>
Date: Fri, 6 Nov 2015 11:00:28 +0100
Message-Id: <CE8264A7-E646-45D4-A602-1916107D94EE@gmail.com>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
	<5638D571.3090500@skidata.com>
	<7448BFE6-D551-4E46-A7B0-F568423C219A@gmail.com>
	<5639BBD0.2050201@skidata.com>
	<F46AA2E3-B76D-4B6D-ABC9-2423E80EA882@gmail.com>
	<563B5D58.6070709@skidata.com>
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
X-List-Received-Date: Fri, 06 Nov 2015 10:00:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 05.11.2015 um 14:44 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 11/04/2015 06:57 PM, Jens Rehsack wrote:
>> Sure? Didn't you "bitbake openjdk-8"? Or is it because =
virtual/javac-native now points
>> to openjdk-8-native and there is no known way for me to let a user =
sanely pick the
>> beloved one on his/her own?
>>=20
>> But openjdk-7 should not depend on virtual/javac-native -- so some =
enlightening is
>> required ...
>=20
> I'm sure I built openjdk-7 ;-)
>=20
> Following PREFERRED_PROVIDES were defined:
> PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
> PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
>=20
> Any idea?

Yes. Say bye to "PREFERRED_PROVIDER_virtual/java-native" - since they're =
insane.

1) openjdk-7 must not use such a virtual provider, but a well known =
bootstrap path
   DEPENDS =3D " ... icedtea7-native ... "
   do a "bitbake -g openjdk-7" to figure out which bootstrap-component =
requires virtual/java-native or virtual/javac-native
2) When several recipes in bootstrap path define the same provider, =
bitbake refuses install, because one can only one particular package =
satisfying such a provider

I have with such a limitation no idea how to let people choose the =
desired provider for virtual/javac-native between jamvm/ecj, =
icedtea7-native or openjdk-8-native.

But this is stated in the commit message of both patches you had applied =
and is mentioned in the README as well. Please read the provided =
documentation, no worries that you cant' debug problems later on ...

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



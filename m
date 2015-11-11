Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C80D4736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:11:33 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so46317199wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=InmLkSba2hpw8OvkT3G7SmhHQ8hyQl3QuXIwd3DfyOs=;
	b=e4uuXlfUFUIO5uQWFQUddCPoQSHuJmmXoK23cujzcv3ZWxAbOWpOtXWN0KuX4F0qVb
	eIKcz4kSi2t6u+wtvFs51HDmW2iyHQHChr6uzJeDiCGkGm9bTj6+rCcveMbv7IVmopWP
	zm88qyomp+NO54mKS77YOwW6/BLh9C4RkL+RS0EwaMHyjq03fX+qA4fwgakNrqRcqT9e
	aws0zVgZaa9HTjvmRoeGy4l3OUu0/PBvO5m1jHzwlb0bGC/YTIoGegBiuyCM8HegzUlJ
	im1Z2Z/42RlDtsURMBn0pShSPZJ4dhdsjG9T+MFrtkiYf/trKGmetS+lMQwDfs8ZJc2b
	ug8Q==
X-Received: by 10.194.118.226 with SMTP id kp2mr9061612wjb.59.1447233093260;
	Wed, 11 Nov 2015 01:11:33 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	u185sm1944540wmu.19.2015.11.11.01.11.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Nov 2015 01:11:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
Date: Wed, 11 Nov 2015 10:11:31 +0100
Message-Id: <FE25E51D-6F1B-4DB0-8391-9B8B152ECF3F@gmail.com>
References: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
	<892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 3/3] libldb: make openldap optional, but default
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
X-List-Received-Date: Wed, 11 Nov 2015 09:11:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 04:26 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
>>=20
>> On Nov 10, 2015, at 1:26 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>>=20
>> Since openldap isn't required, but used when found, allow qualified
>> users to disable the requirement to save some space.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>> index 44f061a..07a839d 100644
>> --- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>> @@ -4,9 +4,12 @@ SECTION =3D "libs"
>> LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>>=20
>> DEPENDS +=3D "libtdb talloc libtevent popt"
>> -RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
>> +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
>> RDEPENDS_pyldb +=3D "python libtdb libtalloc"
>>=20
>> +PACKAGECONFIG ??=3D "ldap"
>> +PACKAGECONFIG[ldap] =3D ",,openldap"
>> +
>> SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>           =
file://do-not-import-target-module-while-cross-compile.patch \
>>          "
>> --=20
>> 1.9.1
>>=20
>> This results from analysing why there's still an openldap ...
>>=20
>> I know, having no knob to disable ldap is dirty, but there is no such =
switch.
>> Even more dirty, the switch in samba_4% is for embedded samba3 =
source-base only,
>> the ldb bundled with samba4 just uses ldap when found.
>>=20
>> The patch relies on the idea of qualified users - those who know that =
they
>> don't want ldap, disable it everywhere and whistle.
>=20
> it seems to not fix the problem completely, for exact reasons that =
some other package may bring in openldap and stage it before this recipe =
is built so you
> have exact same problem again. I think if this package is patched to =
add a knob to disable/enable openldap support explicitly then the fix =
will be complete and I am sure upstream will also accept such a patch.

NO! Please read carefully what "qualified user expected" means!

Forcing a dependency because someone else might introduce it either
is insane - and adding RDEPENDS is just hiding the symptom, not
fixing the root cause. The root cause is, that waf is broken
by design.

And no, I'm not going to fix waf.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



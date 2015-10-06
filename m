Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0257680D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 11:42:00 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so154543263wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=VRK8Tkmivr9QcQQlxIpmWU5tnou2gPQdl85olyUSGVs=;
	b=GSisz6vWo7QpAbLmU6agkqnswNUtjwLiM88mwyh8OFM0XiwABYze6Xw6gVhXJuE3Jh
	cajhAS/eEuyYZTinyogoKAHjIxa9vSmwdAbZUXLLHB7UmFhofSlOBrTXdfBEr/oEY4H9
	4VmfKETUbuwDeM0NMc6gDl+caOVPl9JX9Nd4qOta2mbg5LCec3Iaa1pUc7NYRJyJG2Op
	OW+wkKbZrO+L/CgX2Ry8egRkIGT0ziZV8O7CrvTUrrKQbnDF7RSwaLfMHuctIuZh4qFe
	LA/5rTJoqOT+E7WmOiVOJBsryJYtcMnMTGhKzsVv4v/TeObM0wD1tKNh6jMie7bR6Res
	gQyA==
X-Received: by 10.180.198.48 with SMTP id iz16mr18107911wic.63.1444131719638; 
	Tue, 06 Oct 2015 04:41:59 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	pb4sm32127507wjb.8.2015.10.06.04.41.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Oct 2015 04:41:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZAN=kqUjdKUqvziBkTa=yhVUFvOw-oGL6LQdzgMeUNGqLyw@mail.gmail.com>
Date: Tue, 6 Oct 2015 13:41:57 +0200
Message-Id: <3E673099-DB5C-4269-92FC-019C985A63F6@gmail.com>
References: <1443897005-23957-1-git-send-email-andrei.kholodnyi@gmail.com>
	<CABcZAN=kqUjdKUqvziBkTa=yhVUFvOw-oGL6LQdzgMeUNGqLyw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] talloc: remove default packages from the packages list since empty
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
X-List-Received-Date: Tue, 06 Oct 2015 11:42:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 03.10.2015 um 20:37 schrieb Christopher Larson =
<clarson@kergoth.com>:
>=20
> On Sat, Oct 3, 2015 at 11:30 AM, Andrei Kholodnyi <
> andrei.kholodnyi@gmail.com> wrote:
>=20
>> populate_sdk fails with following message:
>> error: talloc-dev-2.1.1-r0 requires talloc =3D 2.1.1-r0
>>=20
>> these packages are empty,remove them from the package list
>> ---
>> meta-oe/recipes-support/talloc/talloc_2.1.1.bb | 5 +----
>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>> b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>> index 89c390f..0c98bb6 100644
>> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>> @@ -20,12 +20,9 @@ EXTRA_OECONF +=3D "--disable-rpath \
>>                  --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
>>                 "
>>=20
>> -PACKAGES +=3D "libtalloc libtalloc-dbg libtalloc-dev pytalloc =
pytalloc-dbg
>> pytalloc-dev"
>> +PACKAGES =3D "libtalloc libtalloc-dbg libtalloc-dev pytalloc =
pytalloc-dbg
>> pytalloc-dev"
>>=20
>> #ALLOW_EMPTY_${PN} =3D "1"
>> -FILES_${PN} =3D ""
>> -FILES_${PN}-dev =3D ""
>> -FILES_${PN}-dbg =3D ""
>>=20
>=20
> Question, why does this use libtalloc as the package names rather than =
the
> default of talloc? In the common case of the debian bbclass inherited,
> they'll get renamed based on the library soname anyway. Also, =
overriding
> the PACKAGES list isn't ideal, since it means future changes to the =
default
> value of PACKAGES will not be picked up here. Also, this packaging is =
worse
> than default, as it doesn't have the -staticdev package.

In current situation you have to touch every recipe depending on
talloc - not only in poky and meta-oe, also in any 3rd party layer.

I agree to the rename, but at a better time (e.g. when jethro has been =
settled).

Cheers
--=20
Jens Rehsack - rehsack@gmail.com



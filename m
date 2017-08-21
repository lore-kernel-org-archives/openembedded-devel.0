Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7323878285
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:29:44 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id q42so3374234uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IxWweWt4KiyMjWrYJrhhjV3/XqgWw9tNe0n89VdPsr8=;
	b=oBUhceEWUITEcK5oKEmgmnAUv5z22cbCP+ckNNQTg0KUo9MNqZEFX4bZqrhbVkb5/D
	Jy716lda7SujSyec59MvvIZH2hS9/KKv4Zn3+l8uv8sJUzAmHJmOrioYsD7hfmH3ORLk
	MZkBuPGixZ8OYcKUzOvsfwBz5UVBRWtFv6Sv3RTeTSvxfuEskQAGsERThiz1efh/UD+s
	Y3u+Eq75hBVsDwXQFnXNf86/V+0hfEsvMPHMuHDko775ggEASioi/9Gtz0cfRVMe2GKD
	7JGutBCpgYgtCM0k7Iqv/RWuNDl2X8CUGWuFV3+Q/D5fTZ7qQLaa3IUqDLWkgWU8UtlA
	48hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IxWweWt4KiyMjWrYJrhhjV3/XqgWw9tNe0n89VdPsr8=;
	b=RjYKmrGx8SsNrzJMY2Z5B90GcNOp9qD+lVdBbwYUpXcarkGCT7sEQKtztapbGZ/eMN
	QMeBoVknJL+2rS2ODMCVfN9MzF9dZ9DNDuAs5h8lBA44ISuvNl7UeXut2itRkMM3g3Ug
	OJic71TJbd6tkNZrJOKW+igP/noOme9mmtlrHEy47gnD9B8Uqf3TAmqhVfC+rD483cZS
	yHbCkIrnvv1Q2Ojz3Fok1KNpTpN/Jl6//kbdjuKzxUsd8SPJ9v8AQjB+vfQ4pa13uJk5
	fPzEqDKV8iWVUknYBxEA7Fb7Hxu2DJ548Zv6oa0n8fVCUZvSNeSUeCP61vJR/H0gndX7
	Msrg==
X-Gm-Message-State: AHYfb5iLABvbURoXLGbn7dx/0tufUkrucpSqRXbpzxYwBZA7UaHKIg6Q
	1m5+abq3xSdvC1cAvFYHT1yHVoK50Q==
X-Received: by 10.176.1.75 with SMTP id 69mr1801146uak.160.1503300585472; Mon,
	21 Aug 2017 00:29:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 00:29:44 -0700 (PDT)
In-Reply-To: <CA+chaQeoFXxW7NomAOsT4U47nTo9cZgCwjmqTa-ciaUYv3oJ3Q@mail.gmail.com>
References: <20170817092828.3629-1-kai.kang@windriver.com>
	<5ff3ea2b-e7e2-5a68-563b-5786ad038e4d@windriver.com>
	<CA+chaQeZAssT0CUJPQREUZqx0ti0OycLPsGSFcXg2Y96R8PC4Q@mail.gmail.com>
	<515b5bdf-dd12-05fc-8585-0193e7dadbd1@windriver.com>
	<CA+chaQeoFXxW7NomAOsT4U47nTo9cZgCwjmqTa-ciaUYv3oJ3Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 09:29:44 +0200
Message-ID: <CA+chaQc_UUr47w4beEA0FEuGJ2BOd9h=KCVbxpK0EMXoeioOvA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: 5.5.55 -> 5.5.57
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Aug 2017 07:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've quickly tried it on the jenkins builder and without thumb it builds ok=
.

So if you don't want to dig what wents wrong in our toolchain when
security_flags.inc is used, you can just add:

ARM_INSTRUCTION_SET_armv4 =3D "arm"
ARM_INSTRUCTION_SET_armv5 =3D "arm"

and check if it builds with some armv7a with thumb enabled, or

ARM_INSTRUCTION_SET =3D "arm"

if it fails for armv7a as well. And include link to this thread + error log
or something like that.



On Mon, Aug 21, 2017 at 6:46 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Hi,
>
> the security_flags.inc:
>
> require conf/distro/include/security_flags.inc
>
> and if still doesn't reproduce than last bit is thumb:
>
> PREFERRED_ARM_INSTRUCTION_SET              ?=3D "thumb"
> ARM_INSTRUCTION_SET =3D "${PREFERRED_ARM_INSTRUCTION_SET}"
>
> Regards,
>
> On Mon, Aug 21, 2017 at 6:08 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> On 2017=E5=B9=B408=E6=9C=8821=E6=97=A5 07:48, Martin Jansa wrote:
>>
>> Like the previous version this one fails to build for qemuarm when
>> security_flags.inc are enabled (maybe only in combination with gold and
>> thumb), can you please look into it?
>>
>> http://errors.yoctoproject.org/Errors/Details/152655/
>>
>>
>> I built qemuarm with following configures in local.conf and no failure.
>>
>> require conf/distro/include/security_flags.inc
>>
>> DISTRO_FEATURES_append =3D " ld-is-gold"
>>
>>
>> Any other configure did I miss? Thanks.
>>
>>
>> Regards,
>> Kai
>>
>>
>>
>> On Fri, Aug 18, 2017 at 4:51 AM, Kang Kai <Kai.Kang@windriver.com> wrote=
:
>>
>>> On 2017=E5=B9=B408=E6=9C=8817=E6=97=A5 17:28, kai.kang@windriver.com wr=
ote:
>>>
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Upgrade mariadb from 5.5.55 to 5.5.57.
>>>>
>>>
>>> Forgot [meta-oe] in title. Sorry for inconvenience.
>>>
>>> --Kai
>>>
>>>
>>>
>>>> * update SRC_URI that mariadb.com doesn't provides source tarball of
>>>> 5.5.57
>>>> * remove gcc7.patch which is not needed any more
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>   .../{mariadb-native_5.5.55.bb =3D> mariadb-native_5.5.57.bb}  |  0
>>>>   meta-oe/recipes-support/mysql/mariadb.inc                   |  8
>>>> ++++----
>>>>   meta-oe/recipes-support/mysql/mariadb/gcc7.patch            | 13
>>>> -------------
>>>>   .../mysql/{mariadb_5.5.55.bb =3D> mariadb_5.5.57.bb}          |  0
>>>>   4 files changed, 4 insertions(+), 17 deletions(-)
>>>>   rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.55.bb =3D>
>>>> mariadb-native_5.5.57.bb} (100%)
>>>>   delete mode 100644 meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>>>   rename meta-oe/recipes-support/mysql/{mariadb_5.5.55.bb =3D>
>>>> mariadb_5.5.57.bb} (100%)
>>>>
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>>>> b/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>>>> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>>>> b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> index fd9dcbd..32e3eaa 100644
>>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>>>>   LICENSE =3D "GPLv2"
>>>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260a
>>>> a954499f7abaabaa882bbe"
>>>>   -SRC_URI =3D "http://downloads.mariadb.com/
>>>> MariaDB/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
>>>> +SRC_URI =3D "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.g=
z \
>>>>              file://fix-cmake-module-path.patch \
>>>>              file://remove-bad-path.patch \
>>>>              file://fix-mysqlclient-r-version.patch \
>>>> @@ -17,10 +17,10 @@ SRC_URI =3D "http://downloads.mariadb.com/
>>>> MariaDB/mariadb-${PV}/source/mariadb-${P
>>>>              file://fix-a-building-failure.patch \
>>>>              file://change-cc-to-cc-version.patch \
>>>>              file://0001-disable-ucontext-on-musl.patch \
>>>> -           file://gcc7.patch \
>>>>             "
>>>> -SRC_URI[md5sum] =3D "54a0bbbc9b67308e7c076622d02f0fcd"
>>>> -SRC_URI[sha256sum] =3D "cb94e315d0fc90c62db5a6c7829c9
>>>> 966f674285d99b3ba3ffa575fb4a26edc86"
>>>> +
>>>> +SRC_URI[md5sum] =3D "2d4104aae0b9e5efa8878918bd329cb4"
>>>> +SRC_URI[sha256sum] =3D "5dbde98d7e4a5a1721b6cbed7898b
>>>> 2549a88866247951cf586057975c6cea641"
>>>>     S =3D "${WORKDIR}/mariadb-${PV}"
>>>>   diff --git a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>>> b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>>> deleted file mode 100644
>>>> index 3e75b26..0000000
>>>> --- a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>>> +++ /dev/null
>>>> @@ -1,13 +0,0 @@
>>>> -Index: mariadb-5.5.55/client/mysql.cc
>>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> ---- mariadb-5.5.55.orig/client/mysql.cc
>>>> -+++ mariadb-5.5.55/client/mysql.cc
>>>> -@@ -2850,7 +2850,7 @@ You can turn off this feature to get a q
>>>> -         mysql_free_result(fields);
>>>> -         break;
>>>> -       }
>>>> --      field_names[i][num_fields*2]=3D '\0';
>>>> -+      field_names[i][num_fields*2][0]=3D '\0';
>>>> -       j=3D0;
>>>> -       while ((sql_field=3Dmysql_fetch_field(fields)))
>>>> -       {
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>>>> b/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>>>> rename to meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>>>>
>>>
>>>
>>> --
>>> Regards,
>>> Neil | Kai Kang
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>>
>


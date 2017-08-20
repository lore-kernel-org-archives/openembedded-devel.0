Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 57E00700F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:48:56 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id q40so821618uag.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zJrjg33hZqpuER6AxQs23Q1sVCVgnZ3QWmMLZcA5W8=;
	b=mqEknbBl/atde81qGoe5L3dd74X/yQqQJ02fQgO0z9ksTK3YnGy7ehKnd30psjk1Yj
	c7KvbMQFeIM2yLL0uqeolQH9VfvmInf7DrWiaGFBByvF28j9+Ia0S7qSlEaLrRKwdFY3
	GYDcbtHGdmVwQUyufgMvdyr3WTGEmIED8hS0veapS8L7CvBMvGyhVfNqihzib1fdlGb3
	YRMc/i6f5OzBaslFBFrlPLkhIEMD/V+g3NZah98Ch21fcroq24MJ8GjYuxq2xTVCysCu
	GopCtVKutBvyOlqOlO51plx8hy4GJID+5AnE0QUWEJ2uqGFHMiVWOu8IBQCB7oFRTXIx
	d6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zJrjg33hZqpuER6AxQs23Q1sVCVgnZ3QWmMLZcA5W8=;
	b=ehf/MjFkFLsFBkcOihyfzzvlPqTYxqi6yGmYnlSuxl24a6tChN8uNZ4/+Kosndttlg
	1hGbJn5tHueRB5nF8zUHn6e6YTiyzqFRf9xEoFmT+1bLejQDjrY+OInkSBsAtmRG71gt
	KlnwiZxaxnQBnzmnCoO9zDqt/gI0ZGoPQ4FLtLROJkGM22QM190GHKlYgDUcOgLUNcn0
	v/mzqEFPyq8Ifj1gDGZeKxsYHyl7UcmI45gEjdpGabVgIa1PhoOl01yDBlST4i1GK+po
	lFXcaJxko0rjrcTay5LV9O+IzhKGoVBwDsqq8EVl8D6zVGAssqo6b+amV/45WJAefO5/
	Jrjw==
X-Gm-Message-State: AHYfb5ilWXcl+IDeFibWon1Ul0pRCW50zFaludycs2XBnLij/9DPsNF7
	l03R7e3dIT8nVj7gItU95x/cXm9Z7w==
X-Received: by 10.176.8.194 with SMTP id o2mr9294533uaf.191.1503272938234;
	Sun, 20 Aug 2017 16:48:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sun, 20 Aug 2017 16:48:57 -0700 (PDT)
In-Reply-To: <5ff3ea2b-e7e2-5a68-563b-5786ad038e4d@windriver.com>
References: <20170817092828.3629-1-kai.kang@windriver.com>
	<5ff3ea2b-e7e2-5a68-563b-5786ad038e4d@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 01:48:57 +0200
Message-ID: <CA+chaQeZAssT0CUJPQREUZqx0ti0OycLPsGSFcXg2Y96R8PC4Q@mail.gmail.com>
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
X-List-Received-Date: Sun, 20 Aug 2017 23:48:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Like the previous version this one fails to build for qemuarm when
security_flags.inc are enabled (maybe only in combination with gold and
thumb), can you please look into it?

http://errors.yoctoproject.org/Errors/Details/152655/

On Fri, Aug 18, 2017 at 4:51 AM, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2017=E5=B9=B408=E6=9C=8817=E6=97=A5 17:28, kai.kang@windriver.com wrot=
e:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade mariadb from 5.5.55 to 5.5.57.
>>
>
> Forgot [meta-oe] in title. Sorry for inconvenience.
>
> --Kai
>
>
>
>> * update SRC_URI that mariadb.com doesn't provides source tarball of
>> 5.5.57
>> * remove gcc7.patch which is not needed any more
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../{mariadb-native_5.5.55.bb =3D> mariadb-native_5.5.57.bb}  |  0
>>   meta-oe/recipes-support/mysql/mariadb.inc                   |  8
>> ++++----
>>   meta-oe/recipes-support/mysql/mariadb/gcc7.patch            | 13
>> -------------
>>   .../mysql/{mariadb_5.5.55.bb =3D> mariadb_5.5.57.bb}          |  0
>>   4 files changed, 4 insertions(+), 17 deletions(-)
>>   rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.55.bb =3D>
>> mariadb-native_5.5.57.bb} (100%)
>>   delete mode 100644 meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>   rename meta-oe/recipes-support/mysql/{mariadb_5.5.55.bb =3D>
>> mariadb_5.5.57.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>> b/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>> b/meta-oe/recipes-support/mysql/mariadb.inc
>> index fd9dcbd..32e3eaa 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>>   LICENSE =3D "GPLv2"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260a
>> a954499f7abaabaa882bbe"
>>   -SRC_URI =3D "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/sourc=
e/m
>> ariadb-${PV}.tar.gz \
>> +SRC_URI =3D "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz =
\
>>              file://fix-cmake-module-path.patch \
>>              file://remove-bad-path.patch \
>>              file://fix-mysqlclient-r-version.patch \
>> @@ -17,10 +17,10 @@ SRC_URI =3D "http://downloads.mariadb.com/
>> MariaDB/mariadb-${PV}/source/mariadb-${P
>>              file://fix-a-building-failure.patch \
>>              file://change-cc-to-cc-version.patch \
>>              file://0001-disable-ucontext-on-musl.patch \
>> -           file://gcc7.patch \
>>             "
>> -SRC_URI[md5sum] =3D "54a0bbbc9b67308e7c076622d02f0fcd"
>> -SRC_URI[sha256sum] =3D "cb94e315d0fc90c62db5a6c7829c9
>> 966f674285d99b3ba3ffa575fb4a26edc86"
>> +
>> +SRC_URI[md5sum] =3D "2d4104aae0b9e5efa8878918bd329cb4"
>> +SRC_URI[sha256sum] =3D "5dbde98d7e4a5a1721b6cbed7898b
>> 2549a88866247951cf586057975c6cea641"
>>     S =3D "${WORKDIR}/mariadb-${PV}"
>>   diff --git a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>> b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>> deleted file mode 100644
>> index 3e75b26..0000000
>> --- a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -Index: mariadb-5.5.55/client/mysql.cc
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- mariadb-5.5.55.orig/client/mysql.cc
>> -+++ mariadb-5.5.55/client/mysql.cc
>> -@@ -2850,7 +2850,7 @@ You can turn off this feature to get a q
>> -         mysql_free_result(fields);
>> -         break;
>> -       }
>> --      field_names[i][num_fields*2]=3D '\0';
>> -+      field_names[i][num_fields*2][0]=3D '\0';
>> -       j=3D0;
>> -       while ((sql_field=3Dmysql_fetch_field(fields)))
>> -       {
>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>> b/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>> rename to meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


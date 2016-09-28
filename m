Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CCE4260621
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 13:01:22 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 100so1419356uaj.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=PoeSi5rJWJE5Jl5iGz6FDwZkOhm+E8muOfTc+TrqBUU=;
	b=kkEd5TLPt96Ofjaj5oo2wfrZ5telR6vw2vUHdp1x3JqkyVyw45Wn78RvDjSZ7UbMpl
	xdF/3YggCezFpf83/G66Wc2aKClAuv0ifE1UP+vljIXk0ZnCZz4Of0gsK5doqu7AOhJn
	mPX0aUgWdEAhnkYyDTnqvYFM6FcLQobf/ek2mgTGhbfCtjwNPhW/Z4jk/6Qa9DgL4IbR
	Y2/X5zA4QPLlMQrSY3XvRx2gYAG/1YIxGZ+hKE2KlCkgs/21zXqPVeFK4SEldM+yqIAY
	c058hccgOsW6ASrUYYAG2p+OZ8N4zppjTtsDh+FNoofgFho8J1BmMqgLVU7xgg1brgrs
	0SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=PoeSi5rJWJE5Jl5iGz6FDwZkOhm+E8muOfTc+TrqBUU=;
	b=Lno0X2Wy5YiyhZFJ3ODkWNOaKOW1Q+KqvhAXCabLGnJGxvF+7vvmQwZvyDdAnpQi04
	ZQ4MHN3U7mHLQyHCrQIEKd/VUxrn/kf/ABrVFCbjMXtzAA79x6lVV81p8HSEpp2PqNQb
	0dxCtdaY0e+skhOYE2UytL/7Bsu7lR7buBb7cSqCsslmZroPrM06M9M8MAs9BuDzR4mD
	58BmqcnvYxM00F2Mw0zy1yOw5EZa5wWgcYiyc5cGlB1GEP4E4U7VTUNxmzSLff9kAH3x
	+qRlxOcFglg+WhzHHSjxfN9HqdsCYOv8vvATqnbTXkr+ePhF9BApNBhFOAPjJkZRG/VY
	y8TQ==
X-Gm-Message-State: AA6/9RmhrToS0S4s1gjlYP8viG929+z+F2UnU1KpPmAc4Jbmj0dk8eLKQr9rDUp1bBFAC1vatdOBYswHUrA8Og==
X-Received: by 10.159.36.239 with SMTP id 102mr6300690uar.59.1475067683609;
	Wed, 28 Sep 2016 06:01:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 28 Sep 2016 06:01:23 -0700 (PDT)
In-Reply-To: <20160928123523.GA2653@jama>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
	<1474955733-30185-10-git-send-email-schnitzeltony@googlemail.com>
	<20160928123523.GA2653@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 28 Sep 2016 15:01:23 +0200
Message-ID: <CALbNGRQzLODh20-LGiJLvFZ8k3nF7QT9mt_8V1Y4UHv+fg+cjA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 9/9] physfs: move to sources found at github/supertux
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
X-List-Received-Date: Wed, 28 Sep 2016 13:01:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2016 at 2:35 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Sep 27, 2016 at 07:55:33AM +0200, Andreas M=C3=BCller wrote:
>> It seems that physfs is still maintained there and has the functionality
>> required by latest supertux.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 +++++++++++++++=
+++++++
>>  .../physfs/{physfs_2.0.3.bb =3D> physfs_git.bb}      | 10 +++--
>>  2 files changed, 59 insertions(+), 3 deletions(-)
>>  create mode 100644 meta-filesystems/recipes-support/physfs/files/0001-f=
ix-build-with-gcc-6.patch
>>  rename meta-filesystems/recipes-support/physfs/{physfs_2.0.3.bb =3D> ph=
ysfs_git.bb} (55%)
>>
>> diff --git a/meta-filesystems/recipes-support/physfs/files/0001-fix-buil=
d-with-gcc-6.patch b/meta-filesystems/recipes-support/physfs/files/0001-fix=
-build-with-gcc-6.patch
>> new file mode 100644
>> index 0000000..805c4a1
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-=
gcc-6.patch
>> @@ -0,0 +1,52 @@
>> +From 06fe4c205094e0b65d3e5d1244f52089ed5bdafb Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> +Date: Sun, 25 Sep 2016 23:50:22 +0200
>> +Subject: [PATCH] fix build with gcc-6
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +---
>> + src/archiver_zip.c | 1 -
>> + src/physfs_miniz.h | 3 +++
>> + 2 files changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/archiver_zip.c b/src/archiver_zip.c
>> +index 5c4996d..3b436db 100644
>> +--- a/src/archiver_zip.c
>> ++++ b/src/archiver_zip.c
>> +@@ -845,7 +845,6 @@ static ZIPentry *zip_hash_ancestors(ZIPinfo *info, =
char *name)
>> +     if (sep)
>> +     {
>> +         const size_t namelen =3D (sep - name) + 1;
>> +-        ZIPentry *parent;
>> +
>> +         *sep =3D '\0';  /* chop off last piece. */
>> +         retval =3D zip_find_entry(info, name);
>> +diff --git a/src/physfs_miniz.h b/src/physfs_miniz.h
>> +index 619cb71..fd877c0 100644
>> +--- a/src/physfs_miniz.h
>> ++++ b/src/physfs_miniz.h
>> +@@ -194,6 +194,8 @@ struct tinfl_decompressor_tag
>> +     code_len =3D TINFL_FAST_LOOKUP_BITS; do { temp =3D (pHuff)->m_tree=
[~temp + ((bit_buf >> code_len++) & 1)]; } while (temp < 0); \
>> +   } sym =3D temp; bit_buf >>=3D code_len; num_bits -=3D code_len; } MZ=
_MACRO_END
>> +
>> ++#pragma GCC diagnostic push
>> ++#pragma GCC diagnostic ignored "-Wmisleading-indentation"
>> + static tinfl_status tinfl_decompress(tinfl_decompressor *r, const mz_u=
int8 *pIn_buf_next, size_t *pIn_buf_size, mz_uint8 *pOut_buf_start, mz_uint=
8 *pOut_buf_next, size_t *pOut_buf_size, const mz_uint32 decomp_flags)
>> + {
>> +   static const int s_length_base[31] =3D { 3,4,5,6,7,8,9,10,11,13, 15,=
17,19,23,27,31,35,43,51,59, 67,83,99,115,131,163,195,227,258,0,0 };
>> +@@ -465,6 +467,7 @@ common_exit:
>> +   }
>> +   return status;
>> + }
>> ++#pragma GCC diagnostic pop
>> +
>> + /* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FI=
NISH. The other stuff is for advanced use. */
>> + enum { MZ_NO_FLUSH =3D 0, MZ_PARTIAL_FLUSH =3D 1, MZ_SYNC_FLUSH =3D 2,=
 MZ_FULL_FLUSH =3D 3, MZ_FINISH =3D 4, MZ_BLOCK =3D 5 };
>> +--
>> +2.5.5
>> +
>> diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/m=
eta-filesystems/recipes-support/physfs/physfs_git.bb
>> similarity index 55%
>> rename from meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
>> rename to meta-filesystems/recipes-support/physfs/physfs_git.bb
>> index 5618f28..3f1c156 100644
>> --- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
>> +++ b/meta-filesystems/recipes-support/physfs/physfs_git.bb
>> @@ -6,6 +6,10 @@ DEPENDS =3D "readline zlib"
>>
>>  inherit cmake
>>
>> -SRC_URI =3D "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
>> -SRC_URI[md5sum] =3D "c2c727a8a8deb623b521b52d0080f613"
>> -SRC_URI[sha256sum] =3D "ca862097c0fb451f2cacd286194d071289342c107b6fe69=
079c079883ff66b69"
>> +SRC_URI =3D " \
>> +    git://github.com/SuperTux/physfs.git \
>> +    file://0001-fix-build-with-gcc-6.patch \
>> +"
>> +SRCREV =3D "f3b45a94d0b7c0a85469b1e60fefd8383b6719ba"
>
> ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: QA Issue: p=
hysfs: The LIC_FILES_CHKSUM does not match for file://LICENSE.txt;md5=3D5d9=
4e3eaaa10b00ca803ba35a3e87cde
> physfs: The new md5 checksum is 4424d2cfb8a288df2843c4467b5d719a
> physfs: Check if the license information has changed in /home/jenkins/oe/=
world/shr-core/tmp-glibc/work/i586-oe-linux/physfs/2.0.3+gitAUTOINC+f3b45a9=
4d0-r0/git/LICENSE.txt to verify that the LICENSE value "Zlib" remains vali=
d [license-checksum]
> ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: Fatal QA er=
rors found, failing task.
> ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: Function fa=
iled: populate_lic_qa_checksum
>
>> +S =3D "${WORKDIR}/git"
>> +PV =3D "2.0.3+git${SRCPV}"
>> --
>> 2.5.5
>>
Strange thought I tested that - will check and send V2.

Andreas


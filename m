Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 09D6A6006E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 03:43:12 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 76so12565208ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 20:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pdo9VgJZyTC9cPkgI56LaJ9ik4tK52DpZue58hXzFbg=;
	b=LxTqpaU6p3CmUJ4qSpkeTW/Xae2inch4TyA8Id5xXmWUJJcWj9bwxN/3pL0hXKqOzn
	l3psSrQr90Tr4u89JRlEbAQb2Jh6Oa+O7kwwGJMoQ2gt8cCdC38d+73QriiDJdTnb5O7
	Ecm/Yz2iYOW698YVgfmQ73tzg3ctyXVeQ4HJ87NCFfeMtIpRWOm70kkjCmpFUXcGv3wq
	fwvvFV7AQhkFs5Rb/6l1WdOOW1giaNBKbcG6GRz+2XMpdondPgDjtZ3G3RVBscHvZnZ/
	V1l601w5Z7jfPPMKFYo1fMcO741Jl7aIT16RlfErFtFjP1c+dVxCxFnJ+T646dZRu7RZ
	u4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pdo9VgJZyTC9cPkgI56LaJ9ik4tK52DpZue58hXzFbg=;
	b=N0pMX4ox/ugUPk8nw5GcNWovOC6WCM3lVwN27ofQzfpZm8aPQCxEXSOZy4o7cn95Ko
	56EB9vProAMXKNMZ9h421eX6YeLV3o8ex+cfAa99QsOHByl1KQaNaq69707qjEdm/4az
	NJZbPoaofixa18rAANAWc7OJ7+En42W6IZ/gEUjKceKSnpWu2qMPN/ki2HKWvsJw+JMC
	NFGTzFGXR3bErQ03BLyRMilt3MzIP+hpW5ve0rXuGS4As9KqwW03pGCnL8LkQtZ/4G1h
	V39XrvnHXy8jKawvw/22GSXF4oHMv4cNeSzlz6DU9jmEu/1WpFFXJHfk1QoMHn1fGrLI
	pXXQ==
X-Gm-Message-State: AHYfb5gSasGgH+oMKWXKH/Dq4h6htL64ag2y/zPB0SeLHi7AG3QjsrHX
	R1K9AHVLEZ9ZaJbgJ82ZPgAgUZYA0CqM
X-Received: by 10.36.28.70 with SMTP id c67mr3064077itc.80.1502163793993; Mon,
	07 Aug 2017 20:43:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.67.77 with HTTP; Mon, 7 Aug 2017 20:43:13 -0700 (PDT)
In-Reply-To: <db8e786c-0814-769d-2748-5984592b2ba4@gmail.com>
References: <1501183875-5296-1-git-send-email-jkrishnanjanappa@mvista.com>
	<db8e786c-0814-769d-2748-5984592b2ba4@gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Tue, 8 Aug 2017 09:13:13 +0530
Message-ID: <CAD3vsf7syzPq0gxiCOdVz8fZsY+h-MgkbOnn+y86VfvhfeNhvQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] drbd: Add recipe
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
X-List-Received-Date: Tue, 08 Aug 2017 03:43:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2017 at 9:33 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/27/2017 12:31 PM, Jagadeesh Krishnanjanappa wrote:
>
>> DRBD is a block device which is designed to build high availability
>> clusters. This is done by mirroring a whole block device via (a dedicate=
d)
>> network. You could see it as a "network RAID-1".
>>
>> This recipe provides DRBD9 kernel modules drbd.ko and
>> drbd_transport_tcp.ko.
>>
>
> If this a kernel module, shouldn't it reside under recipes-kernel ?
>

The drbd-utils recipe, which provides DRBD userland tools is already reside
in recipes-support directory. The intention was to place DRBD related
recipes under one common place, so I placed drbd recipe under
recipes-support.

I can send v2 to place it under recipes-kernel, if it is really needed.

Regards,
jagadeesh

>
> - armin
>
>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>   ...ck_existence_of_modules_before_installing.patch | 24
>> ++++++++++++++++++++++
>>   .../recipes-support/drbd/drbd_9.0.8-1.bb           | 22
>> ++++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 meta-networking/recipes-suppor
>> t/drbd/drbd/check_existence_of_modules_before_installing.patch
>>   create mode 100644 meta-networking/recipes-support/drbd/drbd_9.0.8-1.b=
b
>>
>> diff --git a/meta-networking/recipes-support/drbd/drbd/check_existence_
>> of_modules_before_installing.patch b/meta-networking/recipes-supp
>> ort/drbd/drbd/check_existence_of_modules_before_installing.patch
>> new file mode 100644
>> index 0000000..6414f73
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/drbd/drbd/check_existence_
>> of_modules_before_installing.patch
>> @@ -0,0 +1,24 @@
>> +If CONFIG_BLK_DEV_DRBD kernel config is enabled, then DRBD
>> +does not build drbd.ko here. Under this circumstance do_install
>> +task is going to fail with a below error:
>> +-- snip --
>> +| install: cannot stat =E2=80=98drbd.ko=E2=80=99: No such file or direc=
tory
>> +| make[1]: *** [install] Error 1
>> +-- snip --
>> +
>> +So, check for kernel module existence before installing.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> +--- drbd-9.0.1-1/drbd/Makefile 2016-07-03 06:54:19.421538690 -0700
>> ++++ drbd-9.0.1-1/drbd/Makefile_mod     2016-07-03 06:53:18.938801628
>> -0700
>> +@@ -158,7 +158,7 @@ else
>> +       fi
>> +       install -d $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR)
>> +       set -e ; for ko in $(MODOBJS); do \
>> +-              install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEA=
SE)/$(MODSUBDIR);
>> \
>> ++              [ -e $$ko ] && install -m 644 $$ko
>> $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
>> +       done
>> +     ifeq ($(DESTDIR),/)
>> +       ifeq ($(shell uname -r),$(KERNELRELEASE))
>> diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
>> b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
>> new file mode 100644
>> index 0000000..e943f24
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "Distributed block device driver for Linux"
>> +DESCRIPTION =3D "DRBD is a block device which is designed to build high=
 \
>> +               availability clusters. This is done by mirroring a whole=
 \
>> +               block device via (a dedicated) network. You could see \
>> +               it as a network raid-1."
>> +HOMEPAGE =3D "http://oss.linbit.com/drbd/"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fb=
b018"
>> +DEPENDS =3D "virtual/kernel"
>> +
>> +SRC_URI =3D "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz=
 \
>> +           file://check_existence_of_modules_before_installing.patch"
>> +
>> +SRC_URI[md5sum] =3D "c1dd58043f46e9926b579aa65d4ea980"
>> +SRC_URI[sha256sum] =3D "87f72d46db9bad926415b3ab9f5f1
>> 397de8c581d2e2ec1addbdd5ce2604e6123"
>> +inherit module
>> +
>> +EXTRA_OEMAKE +=3D "KDIR=3D'${STAGING_KERNEL_DIR}'"
>> +
>> +do_install () {
>> +    oe_runmake install DESTDIR=3D"${D}"
>> +}
>>
>
>


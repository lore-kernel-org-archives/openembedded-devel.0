Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCD23783A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 18:05:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m30so1019423pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wab+YpA0134BUTL8DhWE1owSr3CRp6nW0KQlp5CHM4Y=;
	b=EWHygeb1mXaqJ7YyPs31MZE+g9e7XYs/3d/F1Jyk7OQ4ZnYjyLuACV8o0sPycHwQiR
	mhMRyyQc2qVtiHivtnoundQ5H0zptvwG75GUPDLLKUQoueM0PWOcnHO9y309PrrQv7xV
	MV+STlWF6EuDchHVR48Ucx+HbWuJUlnlIIJsZCZDl0auheikRfKksQt7qAm10I1UbfOo
	fJoLUujo2e5UI/byuxP59NTEpGChXvJXzIoR++7EKpTvU/JKXIqWaF5yxf7L1dy40qOV
	MDPWiF5RHiOL7s36ONNpJNA+21VAKFgfe8OePv7i2NO45wRQNby8AyBIbxywunkrvnnZ
	XC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wab+YpA0134BUTL8DhWE1owSr3CRp6nW0KQlp5CHM4Y=;
	b=TxfQc21EaBWAwlXabZgwb+Nfh1WvVKkk4bPOituFt6yWuK46Sh1sGpzF1vsV2esGnN
	IQlTdCFYL/VPPT4B8yo/sxj0cX6yKxEgn0iW9zCm7Gnt/ZNYl/nKnk0Qz4uwjrGEAbk0
	FExYagDbOsRwLzM0Ok95T1GQaYFsE/rVmyf+cUwTq3PlBmOQ/oDjyJ6PGAUAWsvpowV8
	4XXu8VNIzEzSfNm2wzg6dXadtKUInS0yNwtLyzawDdLIxi28f2R2VEBozOft4vPN+BVT
	rr0tWRTiRXXw6VaFk5VuO+YVEqeQhGA8Jf//K8UOqgM7niIE+Qwm57EImiBOadl47e0/
	wjUg==
X-Gm-Message-State: AHPjjUin/BN56TY/FcQX2UDUy+mZTuCz00QV82kKOuBU0O5ddnPIqAQt
	FZ3ZfUkhNlbdVwAbRv7gVJmNPYCl7+CJw3e6jas=
X-Google-Smtp-Source: AOwi7QDLZ6jWOl4kgkr6hz+B9Y951X3ByrN3thozEL0nzKcoKBB0H9sjIE5mWpNR8D5dnA+vuCBZQtjAWbKbNIB2mxw=
X-Received: by 10.98.157.74 with SMTP id i71mr11844pfd.168.1506103540774; Fri,
	22 Sep 2017 11:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Fri, 22 Sep 2017 11:05:10 -0700 (PDT)
In-Reply-To: <CAJ86T=Uvpi34oriQe4CNY7hS0t0WXU8o4RNMo4+b1M278fp-rQ@mail.gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
	<20170922032316.18616-4-raj.khem@gmail.com>
	<CAJ86T=Uvpi34oriQe4CNY7hS0t0WXU8o4RNMo4+b1M278fp-rQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Sep 2017 11:05:10 -0700
Message-ID: <CAMKF1soECyBsfpwkiZjEwmYeo+vtD_27FkcqFw85zGZ0JBAOOg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/7] toybox: Upgrade to 0.7.4
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
X-List-Received-Date: Fri, 22 Sep 2017 18:05:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 10:43 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Sep 21, 2017 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> enable parallel build
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb}   | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>  rename meta-oe/recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb} (87%)
>>
>> diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
>> similarity index 87%
>> rename from meta-oe/recipes-core/toybox/toybox_0.7.3.bb
>> rename to meta-oe/recipes-core/toybox/toybox_0.7.4.bb
>> index 0cd44ff64..76a7af459 100644
>> --- a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb
>> +++ b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
>> @@ -2,12 +2,10 @@ SUMMARY = "Toybox combines common utilities together into a single executable."
>>  HOMEPAGE = "http://www.landley.net/toybox/"
>>  DEPENDS = "attr"
>>
>> -SRC_URI = " \
>> -    http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>> +SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>>  "
>> -
>> -SRC_URI[md5sum] = "6fa2a001402cb067ba541e0d8948da50"
>> -SRC_URI[sha256sum] = "e6469b508224e0d2e4564dda05c4bb47aef5c28bf29d6c983bcdc6e3a0cd29d6"
>> +SRC_URI[md5sum] = "55ea59a31c7da9510c8fabe70f4bc561"
>> +SRC_URI[sha256sum] = "49d74ca897501e5c981516719870fe08581726f5c018abe35ef52c6f0de113e7"
>>
>>  LICENSE = "BSD-0-Clause"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
>> @@ -16,7 +14,7 @@ SECTION = "base"
>>
>>  TOYBOX_BIN = "generated/unstripped/toybox"
>>
>> -EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
>> +EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()}'
>
> Is dropping ${BUILD_CFLAGS} and ${BUILD_LDFLAGS} from HOSTCC intentional?

yes it is intentional. This allows the native programs to build with dev files
from native system. Instead of creating a hybrid of OE's native
sysroot with build system provided one.

>
>>  do_configure() {
>>      oe_runmake defconfig
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


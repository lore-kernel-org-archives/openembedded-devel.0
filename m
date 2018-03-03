Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id EC28360107
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 19:24:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520105046; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=8ZMxbcSKH3ibTozK0iXHmsSMS6wTylOZpMdaMkBZiNY=;
	b=PfL5FYjxTR7FT8IQRLJ8dSKbpN8ekx9pfdMkRiLZX+hFlVI2BzSZ4zU4IXhI/gnOpY3owuQE
	fskbA3kiYukPOSLT3K2dXCbaaNyEy31QT4apc4QG/a3o6FXVmoY6WoF+oCZez9Povbc3yH9q
	1cPY9/nQX2zOrqgrSuQ1u+IlO6s=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mxa.mailgun.org with ESMTP id 5a9af656.7f51502a5370-smtp-out-n03;
	Sat, 03 Mar 2018 19:24:06 -0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id l206so16131548qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 11:24:05 -0800 (PST)
X-Gm-Message-State: AElRT7GejXHZlm9SKwxB3lFsmRPV+6Q8bg2yxPc9R7wFpURcKhQgzUja
	PoZzTNKqGLSlWf/1d9cHSpDrXA3sef2tQF5spTc=
X-Google-Smtp-Source: AG47ELvq33bCEddRHwEejsfyf3b6fR1tx8sHVfYBA5A4H/qLzvNlE0dUajVmBWVU8ENtUU7gxUyU4drLErrLVLhNLxU=
X-Received: by 10.55.166.215 with SMTP id p206mr15214849qke.69.1520105045238; 
	Sat, 03 Mar 2018 11:24:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Sat, 3 Mar 2018 11:24:04 -0800 (PST)
In-Reply-To: <4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
	<4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 3 Mar 2018 14:24:04 -0500
X-Gmail-Original-Message-ID: <CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
Message-ID: <CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 19:24:06 -0000
Content-Type: text/plain; charset="UTF-8"

Is there a reason the patchtest scripts are not run on the openembedded
layers?  Is it just a matter of doing the work?

On Sat, Mar 3, 2018 at 11:42 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 3/3/18 6:59 AM, Derek Straka wrote:
>
>> Update the license checksum for copyright year and verify the terms
>> remain the same
>>
>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
>> --- SQLAlchemy-1.1.15/LICENSE   2017-11-03 16:47:01.000000000 -0400
>> +++ SQLAlchemy-1.1.17/LICENSE   2018-02-22 16:08:41.000000000 -0500
>> @@ -1,6 +1,6 @@
>>   This is the MIT license: http://www.opensource.org/lice
>> nses/mit-license.php
>>
>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
>> AUTHORS file>.
>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
>> AUTHORS file>.
>>
>
> Thanks for follow up. This looks good.
>
>
>   SQLAlchemy is a trademark of Michael Bayer.
>>
>>   Permission is hereby granted, free of charge, to any person obtaining a
>> copy of this
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   meta-python/recipes-devtools/python/python-sqlalchemy.inc           |
>> 6 +++---
>>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>> => python-sqlalchemy_1.1.17.bb} (100%)
>>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.
>> 15.bb => python3-sqlalchemy_1.1.17.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> index 2683a6a..0c191ae 100644
>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational
>> Mapper that gives \
>>   application developers the full power and flexibility of SQL"
>>   HOMEPAGE = "http://www.sqlalchemy.org/"
>>   LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>>     PYPI_PACKAGE = "SQLAlchemy"
>>   inherit pypi
>>   -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
>> -SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c
>> 55c140aec09e5dd5c01303e23de5fe7a95a"
>> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
>> +SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de
>> 93c7f21134323f56a56a1b0d8fbef17013c"
>>     RDEPENDS_${PN} += " \
>>       ${PYTHON_PN}-json \
>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.
>> 15.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15
>> .bb
>> rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.
>> 1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.
>> 1.17.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.1
>> 5.bb
>> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.1
>> 7.bb
>>
>>


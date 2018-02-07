Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC3A606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 12:55:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1518008157; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=HfCU8UtckcQuD7wVsbUCRXNzpm0hWRjCtswec0ScWWQ=;
	b=cBt6muOEzMsw4XfENk9ntXBwdO9cuKlp9+rZUu2oGPOT51eA8leM/4hG/p5mG6Q/BcGuaIoH
	SoTXWau+MH7pMmoIzglHRDDPjKBSxioYweM1y0QKA1bNoqm2ThGzSZdySjF0RhBYdxpsAIkE
	wMufq2Yk42ATkN4Okv0K3kGKw3w=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mxa.mailgun.org with ESMTP id 5a7af75c.7fedd0157f30-smtp-out-n03;
	Wed, 07 Feb 2018 12:55:56 -0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id t25so1247480qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 04:55:56 -0800 (PST)
X-Gm-Message-State: APf1xPB0yVP5dNmz7ahjJL8TBMEtym6uUJ5FldGW8z9b/asApnnmDcJN
	qSCDTQ7QZX3SciTBYiLMXwL20iHBLhkghiGXPC8=
X-Google-Smtp-Source: AH8x225n4sE6jSR3D9Cyy4WfELSDsqI8jverfLe67YP1VJkw0KDm2TgY/Lad64N5rwwOmXEo/zcGJaJgnitV337CmXE=
X-Received: by 10.200.57.3 with SMTP id s3mr9502692qtb.328.1518008155943; Wed,
	07 Feb 2018 04:55:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.81.10 with HTTP; Wed, 7 Feb 2018 04:55:55 -0800 (PST)
Received: by 10.140.81.10 with HTTP; Wed, 7 Feb 2018 04:55:55 -0800 (PST)
In-Reply-To: <CA+chaQcGrgxOvQ-7QC46eOZWWUQLKoTW=Mm+nzWDqA3hwn0MnQ@mail.gmail.com>
References: <1516553654-14732-1-git-send-email-derek@asterius.io>
	<CA+chaQcGrgxOvQ-7QC46eOZWWUQLKoTW=Mm+nzWDqA3hwn0MnQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 7 Feb 2018 07:55:55 -0500
X-Gmail-Original-Message-ID: <CADNbA1qY92ErjOtR7pK+NthF5DZE9-x+AeigDHG=syr6h2kETg@mail.gmail.com>
Message-ID: <CADNbA1qY92ErjOtR7pK+NthF5DZE9-x+AeigDHG=syr6h2kETg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-smbus: update to version 4.0
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
X-List-Received-Date: Wed, 07 Feb 2018 12:55:56 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah.  IIRC there is a sed to replace the path of the include.  I'll take a
look.

On Feb 7, 2018 4:05 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> We might need another upgrade for this after last oe-core changes, now it
> fails with:
>
> smbusmodule.c:26:10: fatal error: linux/i2c-dev-user.h: No such file or
> directory
>  #include <linux/i2c-dev-user.h>
>           ^~~~~~~~~~~~~~~~~~~~~~
>
> Do you have something already in your queue?
>
> On Sun, Jan 21, 2018 at 5:54 PM, Derek Straka <derek@asterius.io> wrote:
>
>> Fixes issues related to incompatibility with i2c-tools upgrade in oe-core
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-python/recipes-devtools/python/python-smbus.inc               | 7
>> +++----
>>  .../python/{python-smbus_3.1.2.bb => python-smbus_4.0.bb}          | 0
>>  .../python/{python3-smbus_3.1.2.bb => python3-smbus_4.0.bb}        | 0
>>  3 files changed, 3 insertions(+), 4 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python-smbus_3.1.2.bb =>
>> python-smbus_4.0.bb} (100%)
>>  rename meta-python/recipes-devtools/python/{python3-smbus_3.1.2.bb =>
>> python3-smbus_4.0.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-smbus.inc
>> b/meta-python/recipes-devtools/python/python-smbus.inc
>> index de2a270..0bca58f 100644
>> --- a/meta-python/recipes-devtools/python/python-smbus.inc
>> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
>> @@ -2,10 +2,9 @@ SUMMARY = "Set of i2c tools for linux - Python module"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://smbusmodule.c;beginlin
>> e=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
>>
>> -SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-
>> ${PV}.tar.bz2 \
>> -"
>> -SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
>> -SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490
>> b149c504468770f58921c8c5b8a7860a441"
>> +SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz
>> "
>> +SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
>> +SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62
>> f2054bb39f19961d67e0c91610f071ca403"
>>
>>  DEPENDS += "i2c-tools"
>>
>> diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
>> b/meta-python/recipes-devtools/python/python-smbus_4.0.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
>> rename to meta-python/recipes-devtools/python/python-smbus_4.0.bb
>> diff --git a/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
>> b/meta-python/recipes-devtools/python/python3-smbus_4.0.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
>> rename to meta-python/recipes-devtools/python/python3-smbus_4.0.bb
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


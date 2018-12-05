Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFD716BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:59:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u18so13504545lff.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 17:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=oJRg4HJ5o9fULrfFLuZaF1hntTTaMIBiMz46Qx/OckM=;
	b=C12jSAzoaACOr4Z5AKHF2OIH9W3D2iE9yFJ1Sy7epQup1Kg6qbchfDbJBK9McmQw39
	N61tcWifEaRSnE//WU7dBSGrTr81Qo1v09BIvdPIAbS4uJSd5H+Kt3CGfR6cgEto1SZS
	/fbdpvORi39io13KhMtTyXd5HrR4lmEzB0gPMkN65gzSrYEBG+z3e5kPoHIuuOKbKfS1
	022Xg9koAcUl3SeRTbTdMmsGKBN5yCPV+W3OUpRSJtkZfoOU+WNgK+tUp+2ynWjIoRYZ
	swJ1b/KOfH/syVHWrAJ9hGoXs7huJObbGrGsNzm2jWmzLZaBvmSwn2ktlHW+YYZ4vOlU
	76uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oJRg4HJ5o9fULrfFLuZaF1hntTTaMIBiMz46Qx/OckM=;
	b=ha1Lg0Qiq3xJEKGEktIKq8tzVR3ZaKUl3ZjX8ORf1Qj6d0bvEFm68s2HcAvfQK5fld
	1r0Si3NSd7og9Or0z0P31enohDPNHSYISKVq8po2FPQtU987d7DTiF8I7pXqSf/jsQVo
	is//TE6QaXhCfVF5jMsdbiwyktSPHJi0ezFtOH5TUPSWvimpCR55ToI9zkQMQSnzzY06
	uNmOmrYd8690XQhNEXHL4TT/ni6Vi0udbSEz0vXJhFqlOd3QaHPpNiGdI+hILnQcdHtV
	4H3WDobgC/c20F666PObNdLCd6W+fGoCizHgPRArPIrDH4enI+a27kub8wjtO9I1AA0q
	szQQ==
X-Gm-Message-State: AA+aEWZdAEGop2iwEa5eGXINiHCQOfCuxqSJL90cfHO1qTdEjR58olI5
	0T+5rWz5AkqtnVzrKqN4P88PcNg2Pug=
X-Google-Smtp-Source: AFSGD/Ud+fwWRZjb6ieXj2UHN33aO45nJtlvXoCZhGbHN+B4y1GmheD64x3HPX6EnQMh5pvK0gmMOA==
X-Received: by 2002:a19:8c1b:: with SMTP id o27mr12942709lfd.90.1543975154510; 
	Tue, 04 Dec 2018 17:59:14 -0800 (PST)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j18-v6sm3454171ljc.52.2018.12.04.17.59.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 17:59:14 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: Khem Raj <raj.khem@gmail.com>, open.source@oleksandr-kravchuk.com
References: <20181205014215.27690-1-dev@sashko.rv.ua>
	<CAMKF1sogkZsVND-PsSTb0BbERWHHXYPmCN0P+wXOn6SSh8v+WQ@mail.gmail.com>
Message-ID: <f233046f-65df-4b2f-ffc4-d2e15509930f@sashko.rv.ua>
Date: Wed, 5 Dec 2018 02:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sogkZsVND-PsSTb0BbERWHHXYPmCN0P+wXOn6SSh8v+WQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] jansson: update to 2.12
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
X-List-Received-Date: Wed, 05 Dec 2018 01:59:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

That was obviously a silly mistake of mine. I'll have a coffee and send
a proper patch. Sorry.

On 05/12/2018 02:45, Khem Raj wrote:
> Hi Oleksandr
>
>
> On Tue, Dec 4, 2018 at 5:42 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> License MD5 hash has been changed due to modified copyright year in the
>> LICENSE file.
>>
>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
>> ---
>>  .../0002-Fix-build-with-glibc-2.28.patch      | 34 -------------------
>>  .../{plymouth_0.9.2.bb => plymouth_0.9.4.bb}  |  7 ++--
> this seems to be accidental to me. Did you mean to include this change here ?
> in any case it would be better to create it as a separate patch.
>
>>  .../recipes-extended/jansson/jansson_2.11.bb  | 12 -------
>>  .../recipes-extended/jansson/jansson_2.12.bb  | 12 +++++++
>>  4 files changed, 15 insertions(+), 50 deletions(-)
>>  delete mode 100644 meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
>>  rename meta-oe/recipes-core/plymouth/{plymouth_0.9.2.bb => plymouth_0.9.4.bb} (91%)
>>  delete mode 100644 meta-oe/recipes-extended/jansson/jansson_2.11.bb
>>  create mode 100644 meta-oe/recipes-extended/jansson/jansson_2.12.bb
>>
>> diff --git a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch b/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
>> deleted file mode 100644
>> index 8638f75b3..000000000
>> --- a/meta-oe/recipes-core/plymouth/files/0002-Fix-build-with-glibc-2.28.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 0c0345303b7971d6cec478fd8b81d64bc1fbe0f6 Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>> -Date: Tue, 21 Aug 2018 23:26:45 +0200
>> -Subject: [PATCH] Fix build with >= glibc 2.28
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Stolen from [1]
>> -
>> -[1] https://bugs.freedesktop.org/show_bug.cgi?id=102191
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>> ----
>> - src/libply-splash-core/ply-terminal.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/src/libply-splash-core/ply-terminal.c b/src/libply-splash-core/ply-terminal.c
>> -index a0954f2..f3b32fe 100644
>> ---- a/src/libply-splash-core/ply-terminal.c
>> -+++ b/src/libply-splash-core/ply-terminal.c
>> -@@ -32,6 +32,7 @@
>> - #include <sys/socket.h>
>> - #include <sys/stat.h>
>> - #include <sys/types.h>
>> -+#include <sys/sysmacros.h>
>> - #include <termios.h>
>> - #include <unistd.h>
>> - #include <wchar.h>
>> ---
>> -2.14.4
>> -
>> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
>> similarity index 91%
>> rename from meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> rename to meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
>> index a5b16c979..b3b60cec6 100644
>> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
>> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
>> @@ -17,12 +17,11 @@ PROVIDES = "virtual/psplash"
>>  RPROVIDES_${PN} = "virtual-psplash virtual-psplash-support"
>>
>>  SRC_URI = " \
>> -    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2 \
>> +    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
>>      file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
>> -    file://0002-Fix-build-with-glibc-2.28.patch \
>>  "
>> -SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
>> -SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
>> +SRC_URI[md5sum] = "4efa5551d230165981b105e7c6a50aa7"
>> +SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6791351"
>>
>>  EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
>>      --with-logo=${LOGO} \
>> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.11.bb b/meta-oe/recipes-extended/jansson/jansson_2.11.bb
>> deleted file mode 100644
>> index 370fa2248..000000000
>> --- a/meta-oe/recipes-extended/jansson/jansson_2.11.bb
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
>> -HOMEPAGE = "http://www.digip.org/jansson/"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
>> -
>> -SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
>> -
>> -SRC_URI[md5sum] = "7af071db9970441e1eaaf25662310e33"
>> -SRC_URI[sha256sum] = "6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed534b82afc3fa5b2f4"
>> -
>> -inherit autotools pkgconfig
>> -
>> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
>> new file mode 100644
>> index 000000000..5e7a1b8b2
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
>> +HOMEPAGE = "http://www.digip.org/jansson/"
>> +BUGTRACKER = "https://github.com/akheron/jansson/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fc2548c0eb83800f29330040e18b5a05"
>> +
>> +SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "0ed1f3a924604aae68067c214b0010ef"
>> +SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9"
>> +
>> +inherit autotools pkgconfig
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


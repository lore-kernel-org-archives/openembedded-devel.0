Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id CD3466FF84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 12:54:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1462280066; h=Content-Type: Cc: To: From: Subject:
	Message-ID: Date: References: In-Reply-To: MIME-Version: Sender;
	bh=b1U4St2gXWc71jlGowJJJ48ZiyxUzJHNuNtWfoV2Mag=;
	b=SOsjp4z0PYfju2vOA07Jq6M2cCd8HILEXLEd7EldIaKvB/3R2qVh3HJ/aBpETOjNXyzHBJfd
	FiJ99E7WUJfSc/7+FqnAP3dcfS6tnpk1Zd5XHjeFn+huf6nRQzhho7WxjyHf+CdrFo5x5jOL
	0xg+rBpycBpYT175PaUa1SBrnHU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Cc: Content-Type;
	b=aNiJl5uz2O3XqeFl8vgeFnGTMiynfK0gIAFD3gkhwKx8JgpvnWpfJyKZap7ZXA5YTxe8RI
	VeMGAOJ6BNznpoovnLe+BklKu1xDgzav+jLiq0y0HXrwsw6D4BLtsMYr+3PlktOlv0QUTatJ
	457suSA78hWXZRsZHsKqm+joDqArg=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mxa.mailgun.org with ESMTP id 57289f7d.6c6d370-in2;
	Tue, 03 May 2016 12:54:21 -0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id u10so114167885igr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 05:54:21 -0700 (PDT)
X-Gm-Message-State: AOPr4FU5ClhpSRsvczJJpzb84P15AmP3gI+GDtPkfknwQ7RZm51chTN19sQ0Lr8ik884wNqwvv17xICPiOxpvA==
MIME-Version: 1.0
X-Received: by 10.50.79.162 with SMTP id k2mr27334961igx.90.1462280061645;
	Tue, 03 May 2016 05:54:21 -0700 (PDT)
Received: by 10.107.180.73 with HTTP; Tue, 3 May 2016 05:54:21 -0700 (PDT)
In-Reply-To: <CA+chaQf7vGXOz61725sEOAG4EBKGmS=KxYq3ZPZS7WfjAPYeXw@mail.gmail.com>
References: <1461947081-15513-1-git-send-email-derek@asterius.io>
	<CA+chaQf7vGXOz61725sEOAG4EBKGmS=KxYq3ZPZS7WfjAPYeXw@mail.gmail.com>
Date: Tue, 3 May 2016 08:54:21 -0400
X-Gmail-Original-Message-ID: <CADNbA1rCRsrU=H8nKKJ0J7Ek-V=HD1fnDW4t8jT4=_3SZgXP0w@mail.gmail.com>
Message-ID: <CADNbA1rCRsrU=H8nKKJ0J7Ek-V=HD1fnDW4t8jT4=_3SZgXP0w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] giflib: update to version 5.1.4
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
X-List-Received-Date: Tue, 03 May 2016 12:54:27 -0000
Content-Type: text/plain; charset=UTF-8

Yes.  I'll submit a patch for leptonica -> 1.73 to be compatible with
giflib 5.1.x

On Tue, May 3, 2016 at 3:38 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Can you check leptonica, seems to be broken by this upgrade:
>
> http://errors.yoctoproject.org/Errors/Details/61476/
>
> On Fri, Apr 29, 2016 at 6:24 PM, Derek Straka <derek@asterius.io> wrote:
>
>>   - Remove EXTRA_OECONF to disable X11 support since direct X11 window
>> rendering has been retired
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  .../recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb}   | 7
>> ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>  rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb =>
>> giflib_5.1.4.bb} (67%)
>>
>> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
>> b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
>> similarity index 67%
>> rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
>> rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
>> index e59d0e5..21fa352 100644
>> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
>> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
>> @@ -2,14 +2,11 @@ SUMMARY = "shared library for GIF images"
>>  SECTION = "libs"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
>> -PR = "r3"
>>
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
>>
>>  inherit autotools
>>
>> -EXTRA_OECONF = "--disable-x11"
>> -
>>  PACKAGES += "${PN}-utils"
>>  FILES_${PN} = "${libdir}/libgif.so.*"
>>  FILES_${PN}-utils = "${bindir}"
>> @@ -18,5 +15,5 @@ BBCLASSEXTEND = "native"
>>
>>  RDEPENDS_${PN}-utils = "perl"
>>
>> -SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
>> -SRC_URI[sha256sum] =
>> "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
>> +SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
>> +SRC_URI[sha256sum] =
>> "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


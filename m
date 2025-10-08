Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E12FCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 07:48:13 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.10592.1759909690112434000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 00:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ao39993n;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so1676390a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759909688; x=1760514488; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghfNKlDYg3vwkLRVF8p4Uz3vfKH3+IhF7X2GjuStULQ=;
        b=Ao39993nlEs7BZz3MOcrA6EUTP0Vczi3eeEHKr40of/R9t50kVcpIHOA9XN2MbgIiJ
         aTySHosoIxx8LG0/zYDiMSMNKgPxkPEU0OZTmUuTFDvllRthKHXQlRF75U90kWTJ2DGs
         Uua4vCCjRuGwsqMchrQ+9Zc1cLPbhw8cvgKRcaIsZnVy8McibgW47gp8CEsRFZYGXAbP
         ENO1vS6Yt887ukUudRifp1tTVLPyk2TgRUmEUqMkeqOJafAo/KVK07g6JTyT9IeYkhPf
         hIK1p3DY+iG3UHdisQuNknP28NiY/fDE1KQn/2lO9jpEH8mWnOJ2/GCu2Gy1oMLGEhsc
         jkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759909688; x=1760514488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghfNKlDYg3vwkLRVF8p4Uz3vfKH3+IhF7X2GjuStULQ=;
        b=NRdT+SS3+8HYcTWMBAySCRnSPkbUn+T7tuLpgPHL0RcM9kSGAOblIJHmSjVWwuvugV
         hNiHaNoLJikErdsWVATvvDdIcoxFQ1xna+YmV7yGtYRmvQtvz9lyKF28Pgkp5nQ+IJPM
         dXGHl7X13MpeQllH6ki2znibNMdN3ePM9VJEAc0m4YPSYC3JrFuenLTCSHZSU8hgHEax
         yR8b+FkCJHgTTJACXe205+1uzsWJFdRY3dh6wEVFZoTN5RPThOLzmeKj6F2KDtBETp3T
         d8X75QW96ciYYrDimI3/bES8AY8X0/lPdok8FtdDhYHpGJGXny7ozkLlQ13EhhupF/8S
         VDEQ==
X-Gm-Message-State: AOJu0YzdiV0Cgjk2IDLoF7x/msgv6/K2xaDvbfHbDh7qEr/SmkKNymrU
	pvgVbpMh9QA7mecmucShjfllUSGMLr+fi6eHozkK79RfE1abXlRgZHdq
X-Gm-Gg: ASbGnctZ0ew2wxu/MNDa9BZuMfq/YTu4509U2lGrCH5ni6s6KMllRxX6tjg4EaMHjx2
	L4B+W210e5sdhvDEhJ25HrJ3cHJuBmi94+Z15i2+RRVocg1dLpehlDijq98vR8tYcKRr78boOpV
	rpq9M5dgpZK9ej6sc/RkrXt/p89V9z8zqiF8F+OAkSUvGYBUe2lU39PFKxFxeY+bcbI58sdhEIq
	mNnKruCHrJGcIMzDMcRL9iN3JgK+EwgtyScVic/DMCBVhHuRQn9Jcstkq1YmwIZJXGShPNu3Yti
	6BeYQ5ft6w1MQ/FAGizqwW1CBDUax/DUuXvOdr6ThwfnFRT/j14RWojpd7enRkuET4sMY19yUxU
	G3SLIHMuWJ5aEJrVf8Y123omgsoE61RAxmvOVgNzL21eb46h6cwZTWFAH0i0M5dVXNg==
X-Google-Smtp-Source: AGHT+IHtSx7HjkEHxRK/iX9SbNm6ftd1o4Xyqu6Z4yvbFUfFt9QtQqmHLkIb4cq3S/gsZ6Bz8XN2BA==
X-Received: by 2002:a05:6402:d0d:b0:633:7017:fcc1 with SMTP id 4fb4d7f45d1cf-639d5b8c2e9mr2312584a12.14.1759909688080;
        Wed, 08 Oct 2025 00:48:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b6927sm14281649a12.14.2025.10.08.00.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 00:48:07 -0700 (PDT)
Message-ID: <601cccab-8a1e-47b0-b066-62a8873f3e49@gmail.com>
Date: Wed, 8 Oct 2025 09:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] emacs: upgrade 29.1 -> 30.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251005184547.1851183-1-skandigraun@gmail.com>
 <CAMKF1spc0u3pkgnA80QxKuW+kzi+EZmVphhkJ0o3P6Sm2o4A9w@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spc0u3pkgnA80QxKuW+kzi+EZmVphhkJ0o3P6Sm2o4A9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 07:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120356

On 10/8/25 02:33, Khem Raj wrote:
> I am seeing some fetching issues on Autobuilders -
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3761119/raw_inline
> Is there a mirror we need ?

Yeah, their main server seems to be quite strained in the past few
weeks. Thanks for fixing it.

> On Sun, Oct 5, 2025 at 11:45 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Added a new patch to avoid unexporting some environment variables that are set
>> by the recipe explicitly, to avoid the following build error:
>>
>> | Loading env...
>> | 'bootstrap-emacs' -batch --no-site-file --no-site-lisp -batch -l ja-dic-cnv \
>> |   -f batch-skkdic-convert -dir "../../sources/emacs-29.2/leim/../lisp/leim/ja-dic" --no-reduction "../../sources/emacs-29.2/leim/SKK-DIC/SKK-JISYO.L"
>> <...>
>> | Error: <RECIP_SYSROOT_NATIVE>/usr/share/emacs/29.2/etc/charsets: No such file or directory
>>
>> Changelogs:
>> 29.2 - 29.4: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.29
>> 30.1 - 30.2: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.30
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../emacs/{emacs_29.1.bb => emacs_30.2.bb}    |  3 ++-
>>  ...oid-running-host-binaries-for-sanity.patch |  7 ++++---
>>  .../files/leim_dont-unexport-EMACSDATA.patch  | 19 +++++++++++++++++++
>>  ...acs-native-tools-for-cross-compiling.patch | 19 +++++++------------
>>  4 files changed, 32 insertions(+), 16 deletions(-)
>>  rename meta-oe/recipes-support/emacs/{emacs_29.1.bb => emacs_30.2.bb} (99%)
>>  create mode 100644 meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch
>>
>> diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_30.2.bb
>> similarity index 99%
>> rename from meta-oe/recipes-support/emacs/emacs_29.1.bb
>> rename to meta-oe/recipes-support/emacs/emacs_30.2.bb
>> index 5cbe4551c0..6f9b8a485c 100644
>> --- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
>> +++ b/meta-oe/recipes-support/emacs/emacs_30.2.bb
>> @@ -9,9 +9,10 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
>>  SRC_URI:append:class-target = " \
>>      file://use-emacs-native-tools-for-cross-compiling.patch \
>>      file://avoid-running-host-binaries-for-sanity.patch \
>> +    file://leim_dont-unexport-EMACSDATA.patch \
>>  "
>>
>> -SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
>> +SRC_URI[sha256sum] = "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878ced9b1e6ded5befd9"
>>
>>  CVE_STATUS[CVE-2007-6109] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
>>
>> diff --git a/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
>> index 719ee4bce9..bd23358f2a 100644
>> --- a/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
>> +++ b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for-sanity.patch
>> @@ -12,14 +12,14 @@ Index: emacs-29.1/Makefile.in
>>  ===================================================================
>>  --- emacs-29.1.orig/Makefile.in
>>  +++ emacs-29.1/Makefile.in
>> -@@ -416,19 +416,10 @@ advice-on-failure:
>> +@@ -420,19 +420,11 @@
>>         @exit ${exit-status}
>>
>>   sanity-check:
>>  -      @[ -f .no-advice-on-failure ] && exit 0; true
>> --      @v=$$(src/emacs${EXEEXT} --batch --eval \
>> +-      @v=`src/emacs${EXEEXT} --batch -Q --eval \
>>  -        '(progn (defun f (n) (if (= 0 n) 1 (* n (f (- n 1))))) (princ (f 10)))' \
>> --        2> /dev/null); \
>> +-        2> /dev/null`; \
>>  -      [ "X$$v" = "X3628800" ] && exit 0; \
>>  -      echo >&2 '***'; \
>>  -      echo >&2 '*** '"\"make ${make-target}\" succeeded, but Emacs is not functional."; \
>> @@ -33,6 +33,7 @@ Index: emacs-29.1/Makefile.in
>>  +# this is not going to work since it was (probably) built for a different architecture.
>>  +# Avoid calling target binaries from the host and simply assume our build artifacts work.
>>  +      exit 0
>> ++
>>
>>   .PHONY: all ${SUBDIR} blessmail epaths-force epaths-force-w32 epaths-force-ns-self-contained etc-emacsver
>>
>> diff --git a/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch
>> new file mode 100644
>> index 0000000000..81dd2bde40
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.patch
>> @@ -0,0 +1,19 @@
>> +Upstream unexports some environment variables to avoid contamination,
>> +however OE sets these variables specifically to help the build in the
>> +recipe, and they should not be unexported.
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> +
>> +--- ./leim/Makefile.in.orig    2025-10-05 20:22:56.062508393 +0200
>> ++++ ./leim/Makefile.in 2025-10-05 20:23:05.581046818 +0200
>> +@@ -42,7 +42,7 @@
>> + -include ${top_builddir}/src/verbose.mk
>> +
>> + # Prevent any settings in the user environment causing problems.
>> +-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
>> ++# unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
>> +
>> + # Which Emacs to use to convert TIT files to Emacs Lisp files,
>> + # and generate the file leim-list.el.
>> diff --git a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
>> index df5e4bd258..a1b6ea6ddf 100644
>> --- a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
>> +++ b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cross-compiling.patch
>> @@ -18,12 +18,7 @@ Index: emacs-29.1/src/Makefile.in
>>  ===================================================================
>>  --- emacs-29.1.orig/src/Makefile.in
>>  +++ emacs-29.1/src/Makefile.in
>> -@@ -1,3 +1,4 @@
>> -+
>> - ### @configure_input@
>> -
>> - # Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2023 Free Software
>> -@@ -508,7 +509,7 @@ ifeq ($(CHECK_STRUCTS),true)
>> +@@ -542,7 +542,7 @@ ifeq ($(CHECK_STRUCTS),true)
>>   pdumper.o: dmpstruct.h
>>   endif
>>   dmpstruct.h: $(srcdir)/dmpstruct.awk
>> @@ -32,17 +27,17 @@ Index: emacs-29.1/src/Makefile.in
>>         $(AM_V_GEN)POSIXLY_CORRECT=1 awk -f $(srcdir)/dmpstruct.awk \
>>                 $(dmpstruct_headers) > $@
>>
>> -@@ -610,8 +611,7 @@ SYSTEM_TYPE = @SYSTEM_TYPE@
>> +@@ -651,8 +651,7 @@
>>   ## Strictly speaking, emacs does not depend directly on all of $lisp,
>>   ## since not all pieces are used on all platforms.  But DOC depends
>>   ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp here.
>>  -emacs$(EXEEXT): temacs$(EXEEXT) \
>> --                lisp.mk $(etc)/DOC $(lisp) \
>> -+emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
>> +-                $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
>> ++emacs$(EXEEXT): $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
>>                   $(lispsource)/international/charprop.el ${charsets}
>>   ifeq ($(SYSTEM_TYPE),cygwin)
>>         find ${top_builddir} -name '*.eln' | rebase -v -O -T -
>> -@@ -654,7 +654,7 @@ endif
>> +@@ -695,7 +695,7 @@ endif
>>   $(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(doc_obj)
>>         $(AM_V_GEN)$(MKDIR_P) $(etc)
>>         $(AM_V_at)rm -f $(etc)/DOC
>> @@ -51,7 +46,7 @@ Index: emacs-29.1/src/Makefile.in
>>           $(SOME_MACHINE_OBJECTS) $(doc_obj) > $(etc)/DOC
>>
>>   $(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
>> -@@ -671,7 +671,7 @@ buildobj.h: Makefile
>> +@@ -712,7 +712,7 @@ buildobj.h: Makefile
>>   GLOBAL_SOURCES = $(base_obj:.o=.c) $(NS_OBJC_OBJ:.o=.m)
>>
>>   gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
>> @@ -60,7 +55,7 @@ Index: emacs-29.1/src/Makefile.in
>>         $(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
>>         $(AM_V_at)echo timestamp > $@
>>
>> -@@ -685,7 +685,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
>> +@@ -726,7 +726,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
>>         $(MAKE) -C $(dir $@) all
>>
>>   ifeq ($(HAVE_PDUMPER),yes)
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120256): https://lists.openembedded.org/g/openembedded-devel/message/120256
>> Mute This Topic: https://lists.openembedded.org/mt/115605456/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>



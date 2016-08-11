Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E94C1771A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 11:18:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so737677wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=r9Q/Cd+Fj+X54HLpOZVb57R4MqqTBfYAt6JkSu0CQYI=;
	b=Mp6lDyrstGfkXIXu4v270BMEKaQeVhMPEo0Yo0zhLszm29sLWrdgalw0nmDyluMP5u
	PmFU8OSwk4q9P3ObbiXGKpXD9dw3Up7Zoh/UUJqk8zF/0dL/Jf4Z3++pyO0u8Sz/VDGn
	QKN1zD8No/GP6R13AhYCEXn+vJUKkZEh5GyuTiO1/OF/x2T8dlc3OAKgnQLiFoRaEKQI
	b8/FTZnP7jRl9hN0Eb/KzdxHqUgqB6EWBGpsg5kKZvLDM6JZRxzZOustOi+tbny05bmP
	JVpRM5YjUHv8bEQ/3oxd7UPwYExfaK59SMMtaj+aak4GSaP6L3Efi8SdXNDZySUXOkbe
	q+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=r9Q/Cd+Fj+X54HLpOZVb57R4MqqTBfYAt6JkSu0CQYI=;
	b=Hwnk0+WKxeTENe5LH66B7h4EEEY/yXJ65brDqgzRyUzUWCrz3lj9U7NS3kgsEquEsU
	EhJXwb7ZhhbctLjkIWlppLpDkReT488Bbq7tbMURPMSOcSJH9pfctSgUQZrbX9w3XBiC
	lLjMSX4DvHtmcrw5GALnXXixVIXGdbDWTWuTcdnvP1NsdxG0sps27kkmm1PVXE3k/WIQ
	CzNq0HA2uXedRiRKIKbWjLdHv5k+fZx4VYPJFkA5fPzztDMLLq34sCYdCQMkXzUM60S1
	lTR6/Ow0di+zpuPgjGPIn6lN0cH2aCneTlocsOkHzNhTvDYfljHHeD7gSXBQ+zrgMXpA
	O7Rw==
X-Gm-Message-State: AEkoout4DYwfO57wfU2aW8Wra20Ka5pjxgeCMgdkAYG3NoYP1NHoFcSFHxHbV46xTGbi4o6f534N0g7PNHyKPQ==
X-Received: by 10.194.143.17 with SMTP id sa17mr8410805wjb.97.1470914338279;
	Thu, 11 Aug 2016 04:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 04:18:37 -0700 (PDT)
In-Reply-To: <CA+chaQfOXyJgkU9W=9rxetwQfwG38FioJ_kKfg=XUcPRaqZZ5g@mail.gmail.com>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
	<1470910246-952-2-git-send-email-ricardo.ribalda@gmail.com>
	<CA+chaQfOXyJgkU9W=9rxetwQfwG38FioJ_kKfg=XUcPRaqZZ5g@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 13:18:37 +0200
Message-ID: <CAPybu_2b-YvANymDp2hzCHcyJyJNq9gVN_1+7PNPc+6BLG8qGw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] glog: Update to version 0.3.4
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
X-List-Received-Date: Thu, 11 Aug 2016 11:18:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi, I did resend this patch.

The gflag patch is ok? Shall I resend it?

Regards!

On Thu, Aug 11, 2016 at 12:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> github archives are regenerated from time to time with checksum change, so
> use normal git checkout instead of archive.
>
> Move LIC* variable bellow HOMEPAGE where they were and resend with -M.
>
> On Thu, Aug 11, 2016 at 12:10 PM, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> -The repository has been moved to github.
>> -There is a new release 0.3.4
>> -Add a user configurable dependency on gflag
>> -Merge .inc file on the recipe
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  meta-oe/recipes-support/glog/glog.inc              | 11 -------
>>  ...configure.ac-Allow-user-to-disable-gflags.patch | 35
>> ++++++++++++++++++++++
>>  meta-oe/recipes-support/glog/glog_0.3.3.bb         |  6 ----
>>  meta-oe/recipes-support/glog/glog_0.3.4.bb         | 22 ++++++++++++++
>>  4 files changed, 57 insertions(+), 17 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/glog/glog.inc
>>  create mode 100644 meta-oe/recipes-support/glog/
>> glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
>>  delete mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
>>  create mode 100644 meta-oe/recipes-support/glog/glog_0.3.4.bb
>>
>> diff --git a/meta-oe/recipes-support/glog/glog.inc
>> b/meta-oe/recipes-support/glog/glog.inc
>> deleted file mode 100644
>> index 8a1fb4250bbb..000000000000
>> --- a/meta-oe/recipes-support/glog/glog.inc
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -DESCRIPTION = "The glog library implements application-level logging.
>> This \
>> -library provides logging APIs based on C++-style streams and various
>> helper \
>> -macros."
>> -HOMEPAGE = "https://code.google.com/p/google-glog/"
>> -
>> -LICENSE = "BSD"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>> -
>> -DEPENDS = "libunwind"
>> -
>> -inherit autotools pkgconfig
>> diff --git a/meta-oe/recipes-support/glog/glog/0001-configure.ac-
>> Allow-user-to-disable-gflags.patch b/meta-oe/recipes-support/
>> glog/glog/0001-configure.ac-Allow-user-to-disable-gflags.patch
>> new file mode 100644
>> index 000000000000..596281ff6842
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/glog/glog/0001-configure.ac-
>> Allow-user-to-disable-gflags.patch
>> @@ -0,0 +1,35 @@
>> +From 0fabde0515e180c53961c27346dd7a79cffa4c1f Mon Sep 17 00:00:00 2001
>> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> +Date: Thu, 11 Aug 2016 11:49:36 +0200
>> +Subject: [PATCH] configure.ac: Allow user to disable gflags
>> +
>> +Under some circumstances like cross-compilation, the user might not want
>> +to enable support for gflags.
>> +
>> +This patch allows support for --without-gflags
>> +
>> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> +---
>> + configure.ac | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 7b4d21e7ae8a..eba5e5cda1ea 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -136,7 +136,11 @@ AC_ARG_WITH(gflags, AS_HELP_STRING[--with-gflags=
>> GFLAGS_DIR],
>> +   CFLAGS="$CFLAGS $GFLAGS_CFLAGS"
>> +   LIBS="$LIBS $GFLAGS_LIBS"
>> + )
>> +-AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1,
>> ac_cv_have_libgflags=0)
>> ++if test x"$with_gflags" = x"no"; then
>> ++  ac_cv_have_libgflags=0
>> ++else
>> ++  AC_CHECK_LIB(gflags, main, ac_cv_have_libgflags=1,
>> ac_cv_have_libgflags=0)
>> ++fi
>> + if test x"$ac_cv_have_libgflags" = x"1"; then
>> +   AC_DEFINE(HAVE_LIB_GFLAGS, 1, [define if you have google gflags
>> library])
>> +   if test x"$GFLAGS_LIBS" = x""; then
>> +--
>> +2.8.1
>> +
>> diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb
>> b/meta-oe/recipes-support/glog/glog_0.3.3.bb
>> deleted file mode 100644
>> index de3f0765dec9..000000000000
>> --- a/meta-oe/recipes-support/glog/glog_0.3.3.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require glog.inc
>> -
>> -SRC_URI = "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
>> -
>> -SRC_URI[md5sum] = "a6fd2c22f8996846e34c763422717c18"
>> -SRC_URI[sha256sum] = "fbf90c2285ba0561db7a40f8a4eefb
>> 9aa963e7d399bd450363e959929fe849d0"
>> diff --git a/meta-oe/recipes-support/glog/glog_0.3.4.bb
>> b/meta-oe/recipes-support/glog/glog_0.3.4.bb
>> new file mode 100644
>> index 000000000000..6d91ae941ac3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/glog/glog_0.3.4.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "The glog library implements application-level logging.
>> This \
>> +library provides logging APIs based on C++-style streams and various
>> helper \
>> +macros."
>> +HOMEPAGE = "https://github.com/google/glog"
>> +
>> +SRC_URI = "\
>> +          https://github.com/google/glog/archive/v${PV}.tar.gz \
>> +          file://0001-configure.ac-Allow-user-to-disable-gflags.patch \
>> +          "
>> +
>> +SRC_URI[md5sum] = "df92e05c9d02504fb96674bc776a41cb"
>> +SRC_URI[sha256sum] = "ce99d58dce74458f7656a68935d7a0
>> c048fa7b4626566a71b7f4e545920ceb10"
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>> +
>> +DEPENDS = "libunwind"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[gflags] = ",--without-gflags,gflags,"
>> +
>> +inherit autotools pkgconfig
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda


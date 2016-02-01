Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 142097725D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:14:32 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g73so165931930ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2UrU4Ez+s6EoYSXOnY5E9kMG3+kh1gBJr2sA5OFY8tg=;
	b=vHLXdpWn1hKcQcVy332KqqkY4U0CXvNGsT0++Y/ZDdLNWlpfdP3imk+Kg38+5Hne3A
	Akox3Uwing1Ol+1HNWH9NqwNpZXO9YrmOH+9LIc491GRqK13cxp037xv/AWcu36YBhKM
	j4wpeEFX+qAaEq/8vmJUy08jnpLHLHcewK+rE8jy4atREHHnpHHjsEfeJoLA4ZQoqNAz
	dmmKN+riMdUZuKZ4niYqydRhmEYJl1UfOhqOqLPHhzTvB2K2pAfBGd3EbcfnWJhfh9y4
	upYTAtFZrFzlXzyHQCsxVNjcuPfYQyVkExTpp1LcXUdL4Vhs3gDdWpfC839kb2NsxGvd
	YL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=2UrU4Ez+s6EoYSXOnY5E9kMG3+kh1gBJr2sA5OFY8tg=;
	b=a216Ibga51wnN/4TGb+qfNrMBUQ2PMzUElzr4IPYzxFJ+KMLC4/ZES2eftSFJGGT0k
	8yaYf+rxe9REV/fU28Og1bf50ZqHrHyONz4Y189dcCKMBbr9yk8tuN021X1vApOEF9iM
	Zb/0CIRDAPffm0kR9P4ZIEZ+oJ6Lc5KgfizMHNfojd/KLhtVsX7fVF8JOr1rlceCmjQF
	vjIVfzqC62utfwDI08DyYiZTHbZN1lB2Zx/Mch+3kHb1DStUlJHdpxrefGQllVcn3Nd5
	Ko+72zbz5F0FSw9rD9btu7+I28O+KejGadZLl2bh7Fo5q0sKIyZjCmxVzGNQ2XkpDAP9
	bOaQ==
X-Gm-Message-State: AG10YOTx7/sAZ84edlBmlAJnATACxm0ioI2DW9r2YNER0yBBIWMw/6Y5VCAmdNtBmwg/5jdzzSO7mFbzOFR4aw==
X-Received: by 10.107.9.211 with SMTP id 80mr17415042ioj.112.1454346873516;
	Mon, 01 Feb 2016 09:14:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 09:14:04 -0800 (PST)
In-Reply-To: <20160201145856.GB2639@jama>
References: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
	<1453266190-95648-2-git-send-email-raj.khem@gmail.com>
	<20160201145856.GB2639@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:14:04 -0800
Message-ID: <CAMKF1srg22mvgJzc68XQKhb6o+wsPgO4jDtDx0j--R_OBV6qHw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] fbset: Fix out of tree builds ( S != B )
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
X-List-Received-Date: Mon, 01 Feb 2016 17:14:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 6:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jan 20, 2016 at 05:03:09AM +0000, Khem Raj wrote:
>> Remove assumption about glibc == linux
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...ding-asm-types.h-is-needed-on-all-linux-s.patch | 34 ++++++++++++++++++++++
>>  meta-oe/recipes-support/fbset/fbset_2.1.bb         |  9 +++---
>>  2 files changed, 39 insertions(+), 4 deletions(-)
>>  create mode 100644 meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
>>
>> diff --git a/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch b/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
>> new file mode 100644
>> index 0000000..7f45dbe
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
>> @@ -0,0 +1,34 @@
>> +From 06edd88833da93361d5408b880fbb890df332497 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 19 Jan 2016 01:55:47 +0000
>> +Subject: [PATCH] fbset: including asm/types.h is needed on all linux systems
>> +
>> +including asm/types.h is needed to get Linux typedef's like
>> +__s32 and so on which are independent of C library therefore this
>> +define should not be guarded by __GLIBC__ but by __linux__
>> +
>> +Helps to compile it on musl systems
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + fbset.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/fbset.h b/fbset.h
>> +index 9b1d2ac..0d8def8 100644
>> +--- a/fbset.h
>> ++++ b/fbset.h
>> +@@ -15,7 +15,7 @@
>> + #include <stdio.h>
>> + #include <sys/types.h>
>> +
>> +-#ifdef __GLIBC__
>> ++#ifdef __linux__
>> + #include <asm/types.h>
>> + #endif
>> +
>> +--
>> +2.7.0
>> +
>> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
>> index 1855932..ce49019 100644
>> --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
>> +++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
>> @@ -16,15 +16,16 @@ PR = "r4"
>>  SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
>>             file://makefile.patch \
>>             file://fbset-2.1-fix-makefile-dep.patch \
>> -"
>> +           file://0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch \
>> +           "
>
>
> I've removed closing quote indentation change, because it should be
> first character on separate line (according to our styleguide).

old habits die hard. Thanks for correcting it, I will remember to
change myself in future.

>
>>
>>  inherit update-alternatives
>>
>>  do_install() {
>>      install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
>> -    install -m 0755 ${WORKDIR}/${BP}/fbset ${D}${sbindir}/fbset.real
>> -    install -m 0644 ${WORKDIR}/${BP}/*.5 ${D}${datadir}/man/man5
>> -    install -m 0644 ${WORKDIR}/${BP}/*.8 ${D}${datadir}/man/man8
>> +    install -m 0755 ${B}/fbset ${D}${sbindir}/fbset.real
>> +    install -m 0644 ${B}/*.5 ${D}${datadir}/man/man5
>> +    install -m 0644 ${B}/*.8 ${D}${datadir}/man/man8
>>  }
>>
>>  ALTERNATIVE_fbset = "fbset"
>> --
>> 2.7.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


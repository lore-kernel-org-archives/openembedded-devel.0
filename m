Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id E8C85772A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:05:19 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id i68so810192uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=D9MvOjgfougtEE2yMIuWfehy+EQO8x7uPeNypivGyhk=;
	b=howlik84MCGVZ7Fo5j+6UnbQTcTzK5+H3uL0pY1fvRoyN275l3XioxGAh9QSZ3sERw
	iYGsp1Fmt+EegaH5R4iF3K62fv9Ji4idIyOVyFFdQszclu+63ZsyhL38QXejhDLNxubl
	mdI5Al84oObkoO/y1IAU/pZK/LqgQG3YB2AR6okcUYVztGeknRz7+umHgWoizivy1EHc
	pXeLYyFO5xP5RbjBGT7ELWZAkEfIH8YqsPtMBwqjS9QJNSBCdXXk1XwhhtcTvczTRtmw
	06cUClFEUJjjRWPBKdsX9+QnfFU5wRXwvqKcI+L/R6XvB6oZviyizd+wFagBRHgtsg60
	/Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=D9MvOjgfougtEE2yMIuWfehy+EQO8x7uPeNypivGyhk=;
	b=maNM7+Tvs907kRmzVd/GpqSz0UXzuxPrW+zMy0e0Nh1VUo4F5/+dtZXPPbOdEvwUfZ
	g61S98AL+F1PqHg0ivN9U2rvD5ryAgzhLKuEh8ffubtnOihxuUudHOZNsrphBi/4J/46
	AahHks2S7WS+UgYj7jS/Wz4LZ7viUALueqWjE+p3fviEv7JzbZ2im7yeSKvP+LZvslP9
	nf44ww5JKFDs2nElDaoIHlqqkRBvPXQzaA7HFfQBV/RMa8HLibWcx7XSpcb0239+p6Vk
	DWFMY7r248NF1Cxz04XfOZ/yLMEjrSkM9X1hvEHKpkJtFb7UFQdC4M1zzTq0dccUSZe7
	cX3g==
X-Gm-Message-State: AIkVDXJLe2fKfNgji1e+8uqlwAe44utGJOJI9i6eNkLTFSE/6ql/gt9wz/0ChoiEge9+SQ9tWm/ZXzgbS07R5w==
X-Received: by 10.159.32.99 with SMTP id 90mr2222089uam.138.1482300320613;
	Tue, 20 Dec 2016 22:05:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 20 Dec 2016 22:04:48 -0800 (PST)
In-Reply-To: <20161220123446.GC3275@jama>
References: <20161216221033.18446-1-raj.khem@gmail.com>
	<20161220123446.GC3275@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2016 22:04:48 -0800
Message-ID: <CAMKF1sqpX67Mh+0KrqpbXKuuYVN5gnQUFkszB20Q1cDww_iaUA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hplip: Fix build with clang
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
X-List-Received-Date: Wed, 21 Dec 2016 06:05:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Dec 16, 2016 at 02:10:33PM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...de-cups-ppd.h-for-missing-ppd-definitions.patch | 42 ++++++++++++++++++++++
>>  meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  1 +
>>  2 files changed, 43 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
>>
>> diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
>> new file mode 100644
>> index 0000000..f259b5f
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
>> @@ -0,0 +1,42 @@
>> +From 7ef9c040dd959105c16d4dc67e14f3bbea25e77f Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 16 Dec 2016 19:51:19 +0000
>> +Subject: [PATCH] include cups/ppd.h for missing ppd definitions
>> +
>> +Fixes errors spotted by clang
>> +
>> +| prnt/hpcups/HPCupsFilter.cpp:365:18: error: use of undeclared identifier 'ppdFindAttr'
>> +|     if (((attr = ppdFindAttr(m_ppd, "hpPrinterLanguage", NULL)) == NULL) ||
>> +|                  ^
>> +| prnt/hpcups/HPCupsFilter.cpp:368:13: error: use of undeclared identifier 'ppdClose'
>> +|             ppdClose(m_ppd);
>> +|             ^
>> +| prnt/hpcups/HPCupsFilter.cpp:444:9: error: use of undeclared identifier 'ppdClose'
>> +|         ppdClose(m_ppd);
>> +|         ^
>> +| prnt/hpcups/HPCupsFilter.cpp:497:13: error: use of undeclared identifier 'ppdOpenFile'
>> +|     m_ppd = ppdOpenFile(getenv("PPD"));
>> +|             ^
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Pending
>> +
>> + prnt/hpcups/HPCupsFilter.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/prnt/hpcups/HPCupsFilter.h b/prnt/hpcups/HPCupsFilter.h
>> +index 0431a7a..eb0cad6 100644
>> +--- a/prnt/hpcups/HPCupsFilter.h
>> ++++ b/prnt/hpcups/HPCupsFilter.h
>> +@@ -37,6 +37,7 @@
>> + #include "Job.h"
>> +
>> + #include "dbuscomm.h"
>> ++#include <cups/ppd.h>
>> +
>> + #define             DBITMAPFILEHEADER               14
>> + #define             DBITMAPINFOHEADER               40
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
>> index 9848e5a..1f1e80c 100644
>> --- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
>> +++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
>> @@ -9,6 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
>>             file://fix-libusb-paths.patch \
>>             file://cups-1.6.patch \
>>             file://configure.patch \
>> +           file://0001-include-cups-ppd.h-for-missing-ppd-definitions.patch \
>>  "
>
> It failed to build even without clang (when using default toolchain),
> but this patch fails to apply:
>
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuarm.20161218_140914.log//2_max/failed/hplip.log

This has to do with line endings, I guess patch program on your builder is
not happy about the CR-LF endings. I have sent another patch, where I
do not introduce new empty lines. Lets see if this one applies ok.

>
>>
>>  DEPENDS += "cups python libusb"
>> --
>> 2.10.2
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


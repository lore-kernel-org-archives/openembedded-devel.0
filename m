Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB95750FC
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:15:00 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id o82-v6so2539485vko.8
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=o/GJqH3uSF9MBh3+tpsZd6K6BbVoE026UOLlsdxje7c=;
	b=i0XuViZWo7DynLg++20pn54y02iDK3gqdKB3usmOpO0k7uCcMJCktch5sp7KtTLNw3
	1dwv7AK/v2em8ZZQUK3H8yiizSy25ElBC+wW5MWOntCU0F7J0dVzmdmDLw13QE9o8KaQ
	EY2OuOef1nhboJoxaxy+EDxykpAnT+ne5aJgKUPqKDHerWM110+U8pmHdmaXbwKvI3Kl
	Zk0Iws+EXFSGKOyowDq4OWCf2kSUoLHSrYzg5wLoqKv9MkTbNL3AIdX23OePs2EMX6OQ
	ArLeuf2Oqzt9G4Ipb2JNe8BpNeaStb3iBbx/K36EInKRIRSNUd/DU2u8yJ7iORhabIeN
	aaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=o/GJqH3uSF9MBh3+tpsZd6K6BbVoE026UOLlsdxje7c=;
	b=N6LxFt0Y/y+918nwMJ0j0nFHvZDLxHsL2ugIi3XxER+3A0LucZOwCVdpxjJtxrU/4+
	P1sHiPLM1o7JWlUr1Gf8y8W9S/48fL+dWLm0cHEvfwltGWB/XhYhdv2ykCc0mwAIYH9C
	BiNnFfr2HE0GAef4JprxCSvAgvGtsu9gJar2uR3RkCMApb9Bkoil/XYy++2X+YpgVE+X
	QNPBbmFepaQU1yureP8oKm9mdR33O9New+v7WuUtnMVKY2fxk6Excicg3wc/8znFqoeg
	zaAB2+dxeJpsUtgcB+xkKSk8LNU90Ep/y6GFzYML7r4dBuOGdjDbScnt4N90pbJE37gQ
	dvjw==
X-Gm-Message-State: AOUpUlFWme8rMzpYVBz0IQ646GfaRdi6YMXp+gBZWyNSx8axe7qCRlaB
	nErQdRI7XTTGhC6/pA9t0uQcqzYvgvDJMn+5Bms=
X-Google-Smtp-Source: AA+uWPyiINOHVpFyThOc4MWS2uGzfXFgjQ+S2GIGHxZth5LTo+S7fZLhtpoRPa3m15KY+K/c8Z6OCW81k0mX3wo8Ox4=
X-Received: by 2002:a1f:420d:: with SMTP id
	p13-v6mr21805520vka.28.1534479301165; 
	Thu, 16 Aug 2018 21:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <1534478911-4084-1-git-send-email-avinash.reddy.palleti@intel.com>
	<CANx9H-Bhk8TxQuDk_Y08aK6P0222t5mKd2GPuATUdM43xGekZg@mail.gmail.com>
In-Reply-To: <CANx9H-Bhk8TxQuDk_Y08aK6P0222t5mKd2GPuATUdM43xGekZg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 16 Aug 2018 21:14:50 -0700
Message-ID: <CANx9H-DdwScivmv2jrYjV8O-QR6FurGF2rzFCSDtYoT3d+buaQ@mail.gmail.com>
To: avinash.reddy.palleti@intel.com, 
	"openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] cpuid: Fix build with glibc 2.28+
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
X-List-Received-Date: Fri, 17 Aug 2018 04:15:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Thu, Aug 16, 2018 at 9:10 PM <avinash.reddy.palleti@intel.com> wrote:
>
>> From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
>>
>> Include sys/sysmacros.h for cpuid.c
>>
>> Signed-off-by: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
>> ---
>>  meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb   |  3 ++-
>>  ...ix-Add-sys-sysmacros.h-to-fix-build-issue.patch | 24
>> ++++++++++++++++++++++
>>  2 files changed, 26 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
>>
>> diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
>> b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
>> index 7a70f75..5dd1bdd 100644
>> --- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
>> +++ b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
>> @@ -6,7 +6,8 @@ UMC, NexGen, Rise, and SiS CPUs"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>> -SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz"
>> +SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
>> +           file://0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch"
>>  SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
>>  SRC_URI[sha256sum] =
>> "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
>>
>> diff --git
>> a/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
>> b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
>> new file mode 100644
>> index 0000000..985182e
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
>> @@ -0,0 +1,24 @@
>> +From 2693a499d4eec4504962e85a9713fa6431d3025f Mon Sep 17 00:00:00 2001
>> +From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
>> +Date: Thu, 16 Aug 2018 22:36:31 +0530
>> +Subject: [PATCH] Fix: Add sys/sysmacros.h to fix build issue
>> +
>
>
> Needs Upstream-Status
> As in should this patch also be submitted to cpuid upstream project.
> See  http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
>>
>> +---
>> + cpuid.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/cpuid.c b/cpuid.c
>> +index 3c94837..0a98616 100644
>> +--- a/cpuid.c
>> ++++ b/cpuid.c
>> +@@ -31,6 +31,7 @@
>> + #include <stdio.h>
>> + #include <sys/types.h>
>> + #include <sys/stat.h>
>> ++#include <sys/sysmacros.h>
>> + #include <fcntl.h>
>> + #include <errno.h>
>> + #include <unistd.h>
>> +--
>> +2.7.4
>> +
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


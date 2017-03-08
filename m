Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id B65C573011
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 16:30:34 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id u30so5371334uau.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2h3ASFMAf9OVWKS40M3F4roxAcVwT8i/V2APzaKG4hU=;
	b=Q6uIH/Phs0aK3Y+80gKLOemxnnhsoiuYRjVPHbGd/3eHcXgrQfiBn7gOkb+/WxaUHW
	hCP43u2ISjXZY5DkKgSnsN3qtxQzLP70KvueFVQtKkMSijRsolCHlJcZVGvxp+yGMyeZ
	9fdDWFQqdcvM1Na7QaLJDT2ZoP0UNSHbJfwi+i3pYayp2qc3YTALcaGpGiISc0wkMI2f
	1lHc4rueekXt+ejdCS7AqLO7HOjnMYqz2papx3MlmMBDgIEW9vVN9rhnlKxi5uvW7YVN
	fzHQpvfyZZqcW89r3GPeStTBZ6sWPQID1g9xzbR9cPQMm1+owqfMk1TamdBQlyZR1Sxz
	OZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2h3ASFMAf9OVWKS40M3F4roxAcVwT8i/V2APzaKG4hU=;
	b=oa93hesA+moStw3o2fOBBaHdZL5GpA3DJ2gm3a2xCNtghQRUAChZfecSv+nECu4SeJ
	0Y5x98B/ejoqQcXYo4Wd+NgDeWkYBYwUFPghuCPPSmbstNJGOH1tTYUJvPqswPBHPSfN
	SPTP6PBujhgpqWijc9XBtmfBY2Q4WGNN2P36+dqSfC+PEE8bAWawb82p9sEyIGOHrrpQ
	2GijQuaA+SOo0AUwANnFZ0nRTwEvdHd85+jLF/CivPTODBCkoJbvhzw1j0lQ/ZJWx24T
	KLd1r2djP6BVjwqrQxFIb8/49UtB5yFEA/grsrETpasIQpewVYwrYMeu/IutGp01U5iw
	4JTg==
X-Gm-Message-State: AMke39mBpEGEfn9QYMoeGJgFDDMIIN2y78FVT+JTJ0m31/I3v6fUp9RNcXA6+LGb4GqLzBtupAGratbmT64STA==
X-Received: by 10.176.90.195 with SMTP id x3mr4255162uae.165.1488990635194;
	Wed, 08 Mar 2017 08:30:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Wed, 8 Mar 2017 08:30:04 -0800 (PST)
In-Reply-To: <VI1PR0301MB191902ED0C0BB1DB7F1F1F36E32E0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
References: <1488884894-30925-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1spXrXsng36SwA3zvE7yO1dSfhkubRqm=Zp=R7oTnCHSzA@mail.gmail.com>
	<VI1PR0301MB191902ED0C0BB1DB7F1F1F36E32E0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Mar 2017 08:30:04 -0800
Message-ID: <CAMKF1spFViNoHZuv39BFOXA6ZS-29HuZz8Pd1QtdSvQy=WvVuA@mail.gmail.com>
To: Peter Liu <peter.x.liu@external.atlascopco.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"liu.ming50@gmail.com" <liu.ming50@gmail.com>
Subject: Re: [meta-oe] [PATCH] rsyslog: fixes musl libc build
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
X-List-Received-Date: Wed, 08 Mar 2017 16:30:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 8, 2017 at 12:20 AM, Peter Liu
<peter.x.liu@external.atlascopco.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Wednesday, March 8, 2017 12:54:27 AM
> To: liu.ming50@gmail.com; openembedded-devel@lists.openembedded.org
> Cc: Peter Liu
> Subject: Re: [oe] [meta-oe] [PATCH] rsyslog: fixes musl libc build
>
>
> On Tue, Mar 7, 2017 at 3:10 AM <liu.ming50@gmail.com> wrote:
>>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> - struct timeval is defined in sys/time.h with a musl libc.
>> - GLOB_BRACE is not defined in posix and thus not implemented in musl
>> libc.
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  .../rsyslog/rsyslog/0001-Include-sys-time-h.patch  | 33
>> ++++++++++++++++++++
>>  .../rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch | 35
>> ++++++++++++++++++++++
>>  meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  5 ++++
>>  3 files changed, 73 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
>>  create mode 100644
>> meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
>>
>> diff --git
>> a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
>> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
>> new file mode 100644
>> index 0000000..23c0f25
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
>> @@ -0,0 +1,33 @@
>> +From 3c3c21f4735eb215206273bc714c57c969926d3d Mon Sep 17 00:00:00 2001
>> +From: Ming Liu <peter.x.liu@external.atlascopco.com>
>> +Date: Sun, 26 Feb 2017 14:10:21 +0100
>> +Subject: [PATCH] Include sys/time.h
>> +
>> +struct timeval is defined in sys/time.h with a musl libc.
>> +
>> +Upstream-Status: Inappropriate [musl libc specific]
>> +
>> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> +---
>> + tests/msleep.c | 4 ----
>> + 1 file changed, 4 deletions(-)
>> +
>> +diff --git a/tests/msleep.c b/tests/msleep.c
>> +index 26a8206..ca818be 100644
>> +--- a/tests/msleep.c
>> ++++ b/tests/msleep.c
>> +@@ -26,11 +26,7 @@
>> + #include "config.h"
>> + #include <stdio.h>
>> + #include <stdlib.h>
>> +-#if defined(__FreeBSD__)
>> + #include <sys/time.h>
>> +-#else
>> +-#include <time.h>
>> +-#endif
>> +
>> + int main(int argc, char *argv[])
>> + {
>> +--
>> +1.9.1
>> +
>> diff --git
>> a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
>> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
>> new file mode 100644
>> index 0000000..7903bb1
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
>> @@ -0,0 +1,35 @@
>> +From 6746e3a9615d1566bf228e9012d0841b15178810 Mon Sep 17 00:00:00 2001
>> +From: Ming Liu <liu.ming50@gmail.com>
>> +Date: Sun, 26 Feb 2017 13:50:33 +0100
>> +Subject: [PATCH] Undefine GLOB_BRACE
>> +
>> +GLOB_BRACE is not defined in posix and thus not implemented in musl libc.
>> +
>> +Fixed by defining it to 0 if it is undefined.
>> +
>> +Upstream-Status: Inappropriate [musl libc specific]
>> +
>> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> +---
>> + plugins/imfile/imfile.c | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/plugins/imfile/imfile.c b/plugins/imfile/imfile.c
>> +index d20471f..f9aff81 100644
>> +--- a/plugins/imfile/imfile.c
>> ++++ b/plugins/imfile/imfile.c
>> +@@ -85,6 +85,11 @@ static int bLegacyCnfModGlobalsPermitted;/* are legacy
>> module-global config para
>> +
>> + #define ADD_METADATA_UNSPECIFIED -1
>> +
>> ++/* fixes build with musl libc */
>> ++#ifndef GLOB_BRACE
>> ++#define GLOB_BRACE 0
>> ++#endif
>> ++
>> + /* this structure is used in pure polling mode as well one of the
>> support
>> +  * structures for inotify.
>> +  */
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> index 62126f8..d81117c 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> @@ -26,6 +26,11 @@ SRC_URI =
>> "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
>>             file://rsyslog-fix-ptest-not-finish.patch \
>>  "
>>
>> +SRC_URI_append_libc-musl = " \
>
>
> Do they have to be applied conditionally?
> I would suggest to make it portable across All libc
>
> OK, attempt to say that the changes would not cause problems in glibc as
> well, although glibc does not have the problem, will verify it and send a
> V2.

glibc wont have issues without patch sure. However making the patch
apply unconditionally makes maintaining easier.


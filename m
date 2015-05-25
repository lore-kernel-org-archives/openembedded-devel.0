Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36C217066B;
	Mon, 25 May 2015 00:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4P0sMuO008273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 24 May 2015 17:54:22 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 24 May 2015 17:54:21 -0700
Message-ID: <556272BC.9050202@windriver.com>
Date: Mon, 25 May 2015 08:54:20 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20150501064023.6E7B950467@opal.openembedded.org>
	<20150522114658.GC2376@jama>
In-Reply-To: <20150522114658.GC2376@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Roy Li : elfutils: Security Advisory - CVE-2015-0255
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 May 2015 00:54:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年05月22日 19:46, Martin Jansa wrote:
> On Fri, May 01, 2015 at 06:40:23AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 4a65944b89a76f18c8ff6e148f17508882d387cf
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4a65944b89a76f18c8ff6e148f17508882d387cf
>>
>> Author: Roy Li <rongqing.li@windriver.com>
>> Date:   Tue Apr 28 14:22:54 2015 +0800
>>
>> elfutils: Security Advisory - CVE-2015-0255
>
> So is it CVE-2015-0255 or CVE-2014-9447 like the link bellow says?
>


sorry, the title is wrong, it should be CVE-2014-9447

-Roy

> :/
>
> CVE-2015-0255 is "X.Org Server (aka xserver and xorg-server) before
> 1.16.3 and 1.17.x before 1.17.1 allows remote attackers to obtain
> sensitive information from process memory or cause a denial of service
> (crash) via a crafted string length value in a XkbSetGeometry request."
>
>
>>
>> Directory traversal vulnerability in the read_long_names function in
>> libelf/elf_begin.c in elfutils 0.152 and 0.161 allows remote attackers
>> to write to arbitrary files to the root directory via a / (slash) in a
>> crafted archive, as demonstrated using the ar program.
>>
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9447
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   ...f-Fix-dir-traversal-vuln-in-ar-extraction.patch | 59 ++++++++++++++++++++++
>>   meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
>> new file mode 100644
>> index 0000000..7e4e492
>> --- /dev/null
>> +++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
>> @@ -0,0 +1,59 @@
>> +From 147018e729e7c22eeabf15b82d26e4bf68a0d18e Mon Sep 17 00:00:00 2001
>> +From: Alexander Cherepanov <cherepan@mccme.ru>
>> +Date: Sun, 28 Dec 2014 19:57:19 +0300
>> +Subject: [PATCH] libelf: Fix dir traversal vuln in ar extraction.
>> +
>> +Upstream-Status: Backport
>> +
>> +read_long_names terminates names at the first '/' found but then skips
>> +one character without checking (it's supposed to be '\n'). Hence the
>> +next name could start with any character including '/'. This leads to
>> +a directory traversal vulnerability at the time the contents of the
>> +archive is extracted.
>> +
>> +The danger is mitigated by the fact that only one '/' is possible in a
>> +resulting filename and only in the leading position. Hence only files
>> +in the root directory can be written via this vuln and only when ar is
>> +executed as root.
>> +
>> +The fix for the vuln is to not skip any characters while looking
>> +for '/'.
>> +
>> +Signed-off-by: Alexander Cherepanov <cherepan@mccme.ru>
>> +---
>> + libelf/ChangeLog   | 5 +++++
>> + libelf/elf_begin.c | 5 +----
>> + 2 files changed, 6 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
>> +index 3b88d03..447c354 100644
>> +--- a/libelf/ChangeLog
>> ++++ b/libelf/ChangeLog
>> +@@ -1,3 +1,8 @@
>> ++2014-12-28  Alexander Cherepanov  <cherepan@mccme.ru>
>> ++
>> ++	* elf_begin.c (read_long_names): Don't miss '/' right after
>> ++	another '/'. Fixes a dir traversal vuln in ar extraction.
>> ++
>> + 2014-12-18  Ulrich Drepper  <drepper@gmail.com>
>> +
>> + 	* Makefile.am: Suppress output of textrel_check command.
>> +diff --git a/libelf/elf_begin.c b/libelf/elf_begin.c
>> +index 30abe0b..cd3756c 100644
>> +--- a/libelf/elf_begin.c
>> ++++ b/libelf/elf_begin.c
>> +@@ -749,10 +749,7 @@ read_long_names (Elf *elf)
>> + 	    }
>> +
>> + 	  /* NUL-terminate the string.  */
>> +-	  *runp = '\0';
>> +-
>> +-	  /* Skip the NUL byte and the \012.  */
>> +-	  runp += 2;
>> ++	  *runp++ = '\0';
>> +
>> + 	  /* A sanity check.  Somebody might have generated invalid
>> + 	     archive.  */
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
>> index 0dbe9f9..e111b34 100644
>> --- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
>> +++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
>> @@ -16,6 +16,7 @@ SRC_URI += "\
>>           file://Fix_elf_cvt_gunhash.patch \
>>           file://fixheadercheck.patch \
>>           file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
>> +        file://0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch \
>>   "
>>
>>   # pick the patch from debian
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

-- 
Best Reagrds,
Roy | RongQing Li


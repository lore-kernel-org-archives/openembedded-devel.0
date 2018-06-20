Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF76D76086
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 02:34:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5K2YwN6024021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jun 2018 19:34:58 -0700 (PDT)
Received: from [128.224.16.116] (128.224.16.116) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 19 Jun 2018 19:34:57 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180620021342.12415-1-liezhi.yang@windriver.com>
	<CAMKF1spbat6ZCxLfvo8LTM7B1oHnmwa6=1YzgJ0TyhYFG7mPhA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <98958e20-053c-931c-116f-5702093fa2c1@windriver.com>
Date: Wed, 20 Jun 2018 10:34:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spbat6ZCxLfvo8LTM7B1oHnmwa6=1YzgJ0TyhYFG7mPhA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gd: Replace strncpy with memccpy to fix -Wstringop-truncation.
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
X-List-Received-Date: Wed, 20 Jun 2018 02:34:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/20/2018 10:28 AM, Khem Raj wrote:
> On Tue, Jun 19, 2018 at 7:14 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Fixed:
>> git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   ...gdft.c-Replace-strncpy-with-memccpy-to-fi.patch | 46 ++++++++++++++++++++++
>>   meta-oe/recipes-support/gd/gd_2.2.5.bb             |  1 +
>>   2 files changed, 47 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
>>
>> diff --git a/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
>> new file mode 100644
>> index 0000000..b175c44
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
>> @@ -0,0 +1,46 @@
>> +From 85c7694a5cf34597909bdd1ca6931b0f99904c2e Mon Sep 17 00:00:00 2001
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Tue, 19 Jun 2018 00:40:49 -0700
>> +Subject: [PATCH] annotate.c/gdft.c: Replace strncpy with memccpy to fix
>> + -Wstringop-truncation.
>> +
>> +Fixed:
>> +git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
>> +
>> +Upstream-Status: Pending
>> +
> 
> could you also post this patch upstream and start a discussion?

Thanks, I will do it today.

// Robert

> 
> 
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + src/annotate.c | 2 +-
>> + src/gdft.c     | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/annotate.c b/src/annotate.c
>> +index 00aaf49..17df813 100644
>> +--- a/src/annotate.c
>> ++++ b/src/annotate.c
>> +@@ -104,7 +104,7 @@ int main(int argc, char *argv[])
>> +                                       fprintf(stderr, "Font maximum length is 1024, %d given\n", font_len);
>> +                                       goto badLine;
>> +                               }
>> +-                              strncpy(font, st, font_len);
>> ++                              memcpy(font, st, font_len);
>> +                       }
>> +               } else if(!strcmp(st, "align")) {
>> +                       char *st = strtok(0, " \t\r\n");
>> +diff --git a/src/gdft.c b/src/gdft.c
>> +index 9fa8295..81dbe41 100644
>> +--- a/src/gdft.c
>> ++++ b/src/gdft.c
>> +@@ -1696,7 +1696,7 @@ static char * font_path(char **fontpath, char *name_list)
>> +               gdFree(path);
>> +               return "could not alloc full list of fonts";
>> +       }
>> +-      strncpy(fontlist, name_list, name_list_len);
>> ++      memcpy(fontlist, name_list, name_list_len);
>> +       fontlist[name_list_len] = 0;
>> +
>> +       /*
>> +--
>> +2.10.2
>> +
>> diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
>> index 63d9acf..62d0df0 100644
>> --- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
>> +++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
>> @@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=07384b3aa2e0d39afca0d6c40286f545"
>>   DEPENDS = "freetype libpng jpeg zlib tiff"
>>
>>   SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
>> +           file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
>>             "
>>
>>   SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


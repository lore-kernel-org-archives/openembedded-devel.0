Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id F31DF7CF4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 04:33:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l11so13078742pgq.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 20:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MM9hH/xQUzVHq7BNNd9JZB6wE6OlyiPqqmFMRvKABIk=;
	b=AzfsJE15ksVBzSLVn46aGhubiKHTPEM+n0GFXGGTEl8/cAOYnMv3UXIhg7Dbs3dSYB
	zanf+ETK4CeJUMv53YneZbil9WuSsKvzwqQ7W0NpR4m5rkNJv1lNeNCh8CYl2KUcJnel
	r/FNkicnwabIEigiSV/vfoHUvaL2Y4d9kN4oYqgtgWa6k6ivq0KwtojgXnoFAWnurdK7
	g+s2B0N7eU3qdED8kr1+4W67ruYLoX7XO1WJxz/c+o7x+m8Ulxt96Ua7/e4WGB+cOrVN
	SsOZIARZDcarZdtt4JjUGSF0Xar/LlxhNEQDWsnFFjSmiNA6GEptTej/aZ7WstT94euO
	Zsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MM9hH/xQUzVHq7BNNd9JZB6wE6OlyiPqqmFMRvKABIk=;
	b=czMv466q1oWfp3YXzSd6XyhsRO3LYIe5M1ON8mmKGEVOG7I4+6oqB24R5jAnpStc2Y
	ap+zpqdGrqJudtQc/7Hm1FhPO1eWSx4jag0bj6NxJ/kwbRAv+fsrGq4CzJ8rqsE2fihI
	OQp/mw6kri+uqk/8wDmj6WM9wMkEFMBxzAx1flTpoTVt5Gmyk7RwgLV1OMa56tfrLbcC
	qSkZ3J5OMarlGTQOJZ2sc1n1RS0wrbEmTwIrexXDQ73YoEBcZNNmWoAXVHFiBEPDiykc
	52VQDBW7wI4MMgMj+ZbFKCYOz/KZneRcQtrMFWZvkQ6joTByrPSxBplqgOQSi9SOtaXZ
	HJZg==
X-Gm-Message-State: APjAAAXlbcJLIXcdLZwamb+EIW2A0kwhFBEX8SX9BLDteW8bd+XSxyUJ
	9E27OcXJJ7HVKBzoXvFJk0gaz03+
X-Google-Smtp-Source: APXvYqwRWsnh/pFwiQ5La3CnUOXFXUnLJl5A+2W4d940nCGd+XFV4NW1o5PLXOBkYefkbPz3GbuyrA==
X-Received: by 2002:a17:902:b609:: with SMTP id
	b9mr16837253pls.134.1552019633532; 
	Thu, 07 Mar 2019 20:33:53 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:b833:ede1:aa51:1d40])
	by smtp.gmail.com with ESMTPSA id
	i4sm8380571pfo.158.2019.03.07.20.33.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 20:33:53 -0800 (PST)
To: "Yu, Mingli" <mingli.yu@windriver.com>
References: <20190306091258.59600-1-mingli.yu@windriver.com>
	<CAMKF1soBAMksYZCBgzhoWsmgz7EpG8G2_VXHqJgV3GPyi1Z5NA@mail.gmail.com>
	<5C81D868.2090903@windriver.com> <5C81E53A.7010700@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0b231907-08ad-1acd-52ef-572d115a7b3a@gmail.com>
Date: Thu, 7 Mar 2019 20:33:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:66.0)
	Gecko/20100101 Thunderbird/66.0
MIME-Version: 1.0
In-Reply-To: <5C81E53A.7010700@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mysql-python: fix compilation with MariaDB 10.3.13
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
X-List-Received-Date: Fri, 08 Mar 2019 04:33:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/7/19 7:44 PM, Yu, Mingli wrote:
> BTW, what's the patch version on your system?
> 

It was failing across multiple machines. So the patch that reached 
patchwork was definitely corrupt.

I use git am to apply the patches from mbox folders. I have fixed this 
locally.

I have fixed it and is available on master-next

> On my system:
> ---------------------------------------------------------
> $ patch --version
> GNU patch 2.7.5
> Copyright (C) 2003, 2009-2012 Free Software Foundation, Inc.
> Copyright (C) 1988 Larry Wall
> 
> License GPLv3+: GNU GPL version 3 or later 
> <http://gnu.org/licenses/gpl.html>.
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> 
> Written by Larry Wall and Paul Eggert
> ---------------------------------------------------------
> 
> Thanks,
> 
> 
> On 2019年03月08日 10:50, Yu, Mingli wrote:
>>
>>
>> On 2019年03月07日 23:29, Khem Raj wrote:
>>> Applying patch
>>> 0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch
>>> patching file _mysql.c
>>> Hunk #1 FAILED at 2002 (different line endings).
>>> 1 out of 1 hunk FAILED -- saving rejects to file _mysql.c.rej
>>
>> Hi Khem,
>>
>> It's strange that I can't reproduce the Hunk issue as you mentioned
>> while I pull the commit[5173929d7 mysql-python: fix compilation with
>> MariaDB 10.3.13] from master-next.
>>
>> Does this issue still exist in your env?
>>
>> Thanks,
>>
>>>
>>> On Wed, Mar 6, 2019 at 1:12 AM <mingli.yu@windriver.com> wrote:
>>>>
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> Use standard API function MYSQL_OPT_RECONNECT
>>>> instead of direct modification of internal structures
>>>> which does not work for MariaDB to fix below compile
>>>> issue.
>>>> | _mysql.c: In function '_mysql_ConnectionObject_ping':
>>>> | _mysql.c:2005:41: error: 'MYSQL' {aka 'struct st_mysql'} has no
>>>> member named 'reconnect'
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>   ...ompilation-with-MariaDB-with-10.3.13.patch | 39 
>>>> +++++++++++++++++++
>>>>   .../recipes-dbs/mysql/mysql-python_1.2.5.bb   |  4 +-
>>>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>>>   create mode 100644
>>>> meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch 
>>>>
>>>>
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch 
>>>>
>>>> b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch 
>>>>
>>>>
>>>> new file mode 100644
>>>> index 000000000..b816618c7
>>>> --- /dev/null
>>>> +++
>>>> b/meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch 
>>>>
>>>>
>>>> @@ -0,0 +1,39 @@
>>>> +From 45436592aa64308b2ab46f84c6107c6d7de0a3ec Mon Sep 17 00:00:00 2001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Wed, 6 Mar 2019 00:16:17 -0800
>>>> +Subject: [PATCH] _mysql.c: fix compilation with MariaDB 10.3.13
>>>> +
>>>> +Use standard API function MYSQL_OPT_RECONNECT
>>>> +instead of direct modification of internal structures
>>>> +which does not work for MariaDB.
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + _mysql.c | 9 ++++++++-
>>>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/_mysql.c b/_mysql.c
>>>> +index f081346..2262e9e 100644
>>>> +--- a/_mysql.c
>>>> ++++ b/_mysql.c
>>>> +@@ -2002,7 +2002,14 @@ _mysql_ConnectionObject_ping(
>>>> +       int r, reconnect = -1;
>>>> +       if (!PyArg_ParseTuple(args, "|I", &reconnect)) return NULL;
>>>> +       check_connection(self);
>>>> +-      if ( reconnect != -1 ) self->connection.reconnect = reconnect;
>>>> ++      if ( reconnect != -1 ) {
>>>> ++             #if MYSQL_VERSION_ID >= 50013
>>>> ++               my_bool recon = reconnect;
>>>> ++               mysql_options(&self->connection,
>>>> MYSQL_OPT_RECONNECT, &recon);
>>>> ++             #else
>>>> ++                 self->connection.reconnect = reconnect;
>>>> ++             #endif
>>>> ++        }
>>>> +       Py_BEGIN_ALLOW_THREADS
>>>> +       r = mysql_ping(&(self->connection));
>>>> +       Py_END_ALLOW_THREADS
>>>> +--
>>>> +2.17.1
>>>> +
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>>>> b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>>>> index ac0df4f06..f2faec1c1 100644
>>>> --- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>>>> +++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
>>>> @@ -8,7 +8,9 @@ DEPENDS = "mysql5"
>>>>
>>>>   SRCNAME = "MySQL-python"
>>>>
>>>> -SRC_URI =
>>>> "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip" 
>>>>
>>>>
>>>> +SRC_URI =
>>>> "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.zip 
>>>>
>>>> \
>>>> +
>>>> file://0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch \
>>>> +"
>>>>   SRC_URI[md5sum] = "654f75b302db6ed8dc5a898c625e030c"
>>>>   SRC_URI[sha256sum] =
>>>> "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e140c74"
>>>>
>>>> -- 
>>>> 2.17.1
>>>>
>>>


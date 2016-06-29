Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57429731BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 08:19:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5T8JnV5029561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 01:19:50 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 29 Jun 2016 01:19:48 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
	<1467102993-4925-2-git-send-email-mingli.yu@windriver.com>
	<CANx9H-Bd94VW0SkM2=PN5LGKQ9EePa7bUO5wzX6PGP5wrJVs=g@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5773844E.9090800@windriver.com>
Date: Wed, 29 Jun 2016 16:18:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-Bd94VW0SkM2=PN5LGKQ9EePa7bUO5wzX6PGP5wrJVs=g@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH 1/3] python-mccabe: Remove pytest
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
X-List-Received-Date: Wed, 29 Jun 2016 08:19:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年06月28日 22:55, Tim Orling wrote:
> On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:
>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Remove pytest to avoid dependency on python-runner
>>    as only one file test_mccabe.py import pytest and this
>>    test_mccabe.py file not install on our target eventually.
>>
>> That "one file" is where all the tests are housed. Just because you don't
> plan to install the tests on target is no reason to disable testing. If
> anything we need to see more testing of recipes, not less. The solution is
> to add a recipe for the dependency of python-pytest-runner. Then you can
> inherit ptest and package the tests separately.
Thanks! Already update to add python-pytest-runner dependency in new commit.
>
>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../python-mccabe-Remove-pytest.patch              | 32
>> ++++++++++++++++++++++
>>   .../recipes-devtools/python/python-mccabe_0.4.0.bb |  1 +
>>   2 files changed, 33 insertions(+)
>>   create mode 100644
>> meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
>> b/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
>> new file mode 100644
>> index 0000000..ebe70c5
>> --- /dev/null
>> +++
>> b/meta-python/recipes-devtools/python/python-mccabe/python-mccabe-Remove-pytest.patch
>> @@ -0,0 +1,32 @@
>> +From 7c0dc893cd3e57df16cf43d2c51c047997ea5c69 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Wed, 22 Jun 2016 02:33:48 +0000
>> +Subject: [PATCH] python-mccabe: Remove pytest
>> +
>> +* Remove pytest to avoid dependency on python-runner
>> +  as only one file test_mccabe.py import pytest and this
>> +  test_mccabe.py file not install on our target eventually.
>> +
>> +Upstream-Status: Inappropriate[oe specific]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + setup.py | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/setup.py b/setup.py
>> +index e59903d..64c3ded 100644
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -33,8 +33,6 @@ setup(
>> +     license='Expat license',
>> +     py_modules=['mccabe'],
>> +     zip_safe=False,
>> +-    setup_requires=['pytest-runner'],
>> +-    tests_require=['pytest'],
>> +     entry_points={
>> +         'flake8.extension': [
>> +             'C90 = mccabe:McCabeChecker',
>> +--
>> +2.8.2
>> +
>> diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
>> b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
>> index 0958f75..1377446 100644
>> --- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
>> @@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
>>   LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM =
>> "file://README.rst;md5=f8b50fba1711ecac6bcdb6324f85a66d"
>>
>> +SRC_URI = "file://python-mccabe-Remove-pytest.patch"
>>   SRC_URI[md5sum] = "8c425db05f310adcd4bb174b991f26f5"
>>   SRC_URI[sha256sum] =
>> "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca49822688642207b"
>>
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


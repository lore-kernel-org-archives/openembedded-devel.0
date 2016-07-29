Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E95C6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 01:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6T1OUBk017546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jul 2016 18:24:30 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jul 2016 18:24:28 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20160726092312.16134-1-kai.kang@windriver.com>
	<CA+chaQdZE=VDh7w61d0OHi15id+oRwhj1LudsRj1B_Z0MGC7nA@mail.gmail.com>
	<57999CC9.7080504@windriver.com> <20160728090509.l3t775n7kzo3kv6x@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <579AB04B.4030604@windriver.com>
Date: Fri, 29 Jul 2016 09:24:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160728090509.l3t775n7kzo3kv6x@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mariadb: upgrade to 5.5.50
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
X-List-Received-Date: Fri, 29 Jul 2016 01:24:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年07月28日 17:05, Martin Jansa wrote:
> On Thu, Jul 28, 2016 at 01:48:57PM +0800, Kang Kai wrote:
>> On 2016年07月27日 17:50, Martin Jansa wrote:
>>> Can you please double check the checksums? Doesn't work for me:
>> Hi Martin,
>>
>> The checksums are right. Please see:
>>
>> http://archive.mariadb.org/mariadb-5.5.50/source/md5sums.txt
>> 5cfb169934170a429589e05f0f5aba9c ./mariadb-5.5.50.tar.gz
>>
>> http://archive.mariadb.org/mariadb-5.5.50/source/sha256sums.txt
>> 030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76
>> ./mariadb-5.5.50.tar.gz
> I did similar check yesterday and you're right they are ok.
>
> Downloading from downloads.mariadb.org was quick (few seconds) while
> downloading from archive.mariadb.org took over 1 hour (but in the end I
> got the same file in manual test) maybe it failed to fetch it completely
> during my jenkins builds.
>
>> Please clean the source and try it again.
> Bitbake cleans it automatically, so lets see in next bitbake world
> build.

OK. Thanks.

--Kai


>
>> Thanks.
>>
>> --Kai
>>
>>> ERROR: mariadb-native-5.5.50-r0 do_fetch: Fetcher failure for URL:
>>> 'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz'.
>>> Checksum mismatch!
>>> File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
>>> has md5 checksum 13cc3e0dfbc64698fd7838990ecae828 when
>>> 5cfb169934170a429589e05f0f5aba9c was expected
>>> File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
>>> has sha256 checksum
>>> 01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a when
>>> 030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76 was
>>> expected
>>> If this change is expected (e.g. you have upgraded to a new version
>>> without updating the checksums) then you can use these lines within
>>> the recipe:
>>> SRC_URI[md5sum] = "13cc3e0dfbc64698fd7838990ecae828"
>>> SRC_URI[sha256sum] =
>>> "01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a"
>>> Otherwise you should retry the download and/or check with upstream to
>>> determine if the file has become corrupted or otherwise unexpectedly
>>> modified.
>>>
>>> ERROR: mariadb-native-5.5.50-r0 do_fetch: Function failed: Fetcher
>>> failure for URL:
>>> 'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz'.
>>> Unable to fetch URL from any source.
>>> ERROR: Logfile of failure stored in:
>>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.50-r0/temp/log.do_fetch.31301
>>> NOTE: recipe mariadb-native-5.5.50-r0: task do_fetch: Failed
>>> ERROR: Task /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb:do_fetch
>>> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb:do_fetch)
>>> failed with exit code '1'
>>>
>>>
>>> On Tue, Jul 26, 2016 at 11:23 AM, <kai.kang@windriver.com> wrote:
>>>
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Upgrade mariadb from 5.5.46 to 5.5.50.
>>>>
>>>> * update runtime dependency of mariadb-setupdb which requires command
>>>> install
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    .../mysql/{mariadb-native_5.5.46.bb => mariadb-native_5.5.50.bb}     | 0
>>>>    meta-oe/recipes-support/mysql/mariadb.inc                            | 5
>>>> +++--
>>>>    .../recipes-support/mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb}   | 0
>>>>    3 files changed, 3 insertions(+), 2 deletions(-)
>>>>    rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.46.bb =>
>>>> mariadb-native_5.5.50.bb} (100%)
>>>>    rename meta-oe/recipes-support/mysql/{mariadb_5.5.46.bb =>
>>>> mariadb_5.5.50.bb} (100%)
>>>>
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
>>>> b/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
>>>> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>>>> b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> index 4801ffe..9c3d234 100644
>>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>>> @@ -17,8 +17,8 @@ SRC_URI = "
>>>> http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
>>>>               file://fix-a-building-failure.patch \
>>>>              "
>>>>
>>>> -SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
>>>> -SRC_URI[sha256sum] =
>>>> "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
>>>> +SRC_URI[md5sum] = "5cfb169934170a429589e05f0f5aba9c"
>>>> +SRC_URI[sha256sum] =
>>>> "030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76"
>>>>
>>>>    S = "${WORKDIR}/mariadb-${PV}"
>>>>
>>>> @@ -176,6 +176,7 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd
>>>> perl-module-benchmark perl-modu
>>>>        perl-module-file-spec perl-module-file-find perl-module-file-basename
>>>> perl-module-file-path \
>>>>        perl-module-constant perl-module-lib perl-module-file-temp
>>>> perl-module-file-spec-functions \
>>>>        perl-module-io-socket-inet perl-module-io-select"
>>>> +RDEPENDS_${PN}-setupdb = "coreutils"
>>>>
>>>>    # Allow old code to link to the backward compatible library
>>>>    RDEPENDS_libmysqlclient-dev = "libmysqlclient-r-dev"
>>>> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
>>>> b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
>>>> rename to meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
>>>> --
>>>> 2.9.2.368.g08bb350
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>
>> -- 
>> Regards,
>> Neil | Kai Kang
>>


-- 
Regards,
Neil | Kai Kang



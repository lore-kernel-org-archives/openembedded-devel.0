Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A343377CEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:58:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T2wiv7005063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Aug 2017 19:58:47 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 Aug 2017 19:58:41 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170828135913.7508-1-kai.kang@windriver.com>
	<20170828135913.7508-2-kai.kang@windriver.com>
	<CAJ86T=Xg+-=EJXT-_3+wQnu3NM58rpdeVHh1Fw=CLvRkhGs1Ug@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a38de28d-f913-113f-6909-9014bc9eb847@windriver.com>
Date: Tue, 29 Aug 2017 11:00:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xg+-=EJXT-_3+wQnu3NM58rpdeVHh1Fw=CLvRkhGs1Ug@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] mariadb: disable thumb on armv5
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
X-List-Received-Date: Tue, 29 Aug 2017 02:58:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年08月29日 02:17, Andre McCurdy wrote:
> On Mon, Aug 28, 2017 at 6:59 AM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Disable thumb on armv5 for mariadb which causes link error:
>>
>> | libsql.a(mysqld.cc.o): In function `test_if_case_insensitive(char const*) [clone .constprop.28]':
>> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8276:(.text.unlikely+0xbe):
>> | relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
>> | in .glue_7 section in linker stubs
>> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8278:(.text.unlikely+0xd0):
>> | relocation truncated to fit: R_ARM_THM_CALL against symbol `fn_format' defined
>> | in .glue_7 section in linker stubs
>> | /usr/src/debug/mariadb/5.5.57-r0/mariadb-5.5.57/sql/mysqld.cc:8285:(.text.unlikely+0x150):
>> | relocation truncated to fit: R_ARM_THM_CALL against symbol
>> | `sql_print_warning(char const*, ...)' defined in .glue_7 section in linker stubs
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-support/mysql/mariadb.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
>> index 32e3eaa6d..03cded637 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -82,6 +82,8 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>>                    -DCAT_EXECUTABLE=`which cat` \
>>                    -DCMAKE_AR:FILEPATH=${AR}"
>>
>> +ARM_INSTRUCTION_SET_armv5 = "arm"
> For Thumb1 build issues, normal approach is to over-ride
> ARM_INSTRUCTION_SET for both armv4 and armv5. Even though you may not
> be able to test armv4 it's almost certain to hit the same issue.

OK. Thanks. V2 will be sent.

--Kai

>
>>   do_configure_append() {
>>       # handle distros with different values of ${libexecdir}
>>       libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang



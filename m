Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDAE3605B3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8I7vR8g007104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:57:28 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 18 Sep 2016 00:57:27 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
	<20160901122045.gpuxub43upiiniyt@jama> <57CCF446.4050703@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57DE47D6.8010304@windriver.com>
Date: Sun, 18 Sep 2016 15:52:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <57CCF446.4050703@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-oe][PATCH] mariadb: add libdbi-perl to the depends of mariadb-server
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
X-List-Received-Date: Sun, 18 Sep 2016 07:57:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年09月05日 12:27, Zhixiong Chi wrote:
>
>
> On 2016年09月01日 20:20, Martin Jansa wrote:
>> On Tue, Aug 23, 2016 at 11:10:30AM +0800, Zhixiong Chi wrote:
>>> The commands(mysql_convert_table_format and mysql_setpermission) need
>>> to the supported API provided by the libdbi-perl package.
>>> So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.
>> This isn't possible, libdbi-perl is in meta-perl and mariadb is in
>> meta-oe.
>>
>> meta-oe doesn't depend (and cannot) on meta-perl.
> The script mysql_convert_table_format(line 50) and
> mysql_convert_table_format
> (line 20) which located xxx/mariadb/scripts/ source path will call the
> DBI function
> with the sentence "use DBI", and this DBI function is provided by the
> libdbi-perl
> package.
>
> So the scripts will fail when start to work.

Any update?

The issue also exists in my environment as mariabdb-server rdepends on 
DBI.pm which is provided by libdbi-perl.

Thanks,

>
> Thanks.
>>> Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
>>> ---
>>>   meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>>> b/meta-oe/recipes-support/mysql/mariadb.inc
>>> index 73905b6..c2d2ecf 100644
>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>> @@ -169,7 +169,7 @@ RDEPENDS_${PN}-client = "perl
>>> perl-module-getopt-long perl-module-file-temp \
>>>   RDEPENDS_${PN}-server = "perl perl-module-getopt-long
>>> perl-module-data-dumper \
>>>       perl-module-file-basename perl-module-file-path
>>> perl-module-sys-hostname \
>>>       perl-module-file-copy perl-module-file-temp perl-module-posix \
>>> -    ${PN}-client"
>>> +    ${PN}-client libdbi-perl"
>>>   RDEPENDS_${PN}-leftovers = "perl perl-module-cwd
>>> perl-module-benchmark perl-module-getopt-long \
>>>       perl-module-posix perl-module-data-dumper perl-module-sigtrap
>>> perl-module-threads \
>>>       perl-module-threads-shared perl-module-io-socket
>>> perl-module-sys-hostname perl-module-file-copy \
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>


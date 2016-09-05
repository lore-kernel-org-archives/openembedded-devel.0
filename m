Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B716C77245
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Sep 2016 04:27:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u854Rqwd001845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Sep 2016 21:27:52 -0700 (PDT)
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 4 Sep 2016 21:27:51 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
	<20160901122045.gpuxub43upiiniyt@jama>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <57CCF446.4050703@windriver.com>
Date: Mon, 5 Sep 2016 12:27:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160901122045.gpuxub43upiiniyt@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 05 Sep 2016 04:27:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年09月01日 20:20, Martin Jansa wrote:
> On Tue, Aug 23, 2016 at 11:10:30AM +0800, Zhixiong Chi wrote:
>> The commands(mysql_convert_table_format and mysql_setpermission) need
>> to the supported API provided by the libdbi-perl package.
>> So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.
> This isn't possible, libdbi-perl is in meta-perl and mariadb is in
> meta-oe.
>
> meta-oe doesn't depend (and cannot) on meta-perl.
The script mysql_convert_table_format(line 50) and 
mysql_convert_table_format
(line 20) which located xxx/mariadb/scripts/ source path will call the 
DBI function
with the sentence "use DBI", and this DBI function is provided by the 
libdbi-perl
package.

So the scripts will fail when start to work.

Thanks.
>> Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
>> ---
>>   meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
>> index 73905b6..c2d2ecf 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -169,7 +169,7 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
>>   RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
>>       perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
>>       perl-module-file-copy perl-module-file-temp perl-module-posix \
>> -    ${PN}-client"
>> +    ${PN}-client libdbi-perl"
>>   RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
>>       perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
>>       perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036



Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD9CA73BBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 00:31:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t580V8vw013148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jun 2015 17:31:08 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 7 Jun 2015 17:31:08 -0700
Message-ID: <5574E24A.2080205@windriver.com>
Date: Mon, 8 Jun 2015 08:31:06 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1433410587-20478-1-git-send-email-rongqing.li@windriver.com>
	<20150605231258.GB27123@mentor.com>
In-Reply-To: <20150605231258.GB27123@mentor.com>
Subject: Re: [PATCH][meta-networking] proftpd: upgrade to 1.3.5a
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
X-List-Received-Date: Mon, 08 Jun 2015 00:31:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月06日 07:12, Joe MacDonald wrote:
> Hi Roy,
>
> I'm seeing this when I merge this submission:
>
> ERROR: QA Issue: package proftpd contains bad RPATH /home/jjm/external/yocto-networking/build-qemux86-64/tmp/sysroots/qemux86-64/lib in file /home/jjm/external/yocto-networking/build-qemux86-64/tmp/work/core2-64-poky-linux/proftpd/1.3.5a-r0/packages-split/proftpd/usr/sbin/proftpd [rpaths]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/jjm/external/yocto-networking/build-qemux86-64/tmp/work/core2-64-poky-linux/proftpd/1.3.5a-r0/temp/log.do_package_qa.18006
> ERROR: Task 48 (/home/jjm/external/yocto-networking/meta-openembedded/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb, do_package_qa) failed with exit code '1'
>
> Can you take another look at it to make sure there aren't RPATH issues?
>
> -J.

OK, I will see it

-Roy

>
> [[oe] [PATCH][meta-networking] proftpd: upgrade to 1.3.5a] On 15.06.04 (Thu 17:36) rongqing.li@windriver.com wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> 1.3.5a includes the fix for CVE-2015-3306:
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3306
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../recipes-daemons/proftpd/{proftpd_1.3.5.bb => proftpd_1.3.5a.bb}   | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.5.bb => proftpd_1.3.5a.bb} (96%)
>>
>> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
>> similarity index 96%
>> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
>> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
>> index 13c9410..9a1852c 100644
>> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
>> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
>> @@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
>>              file://proftpd.service \
>>              "
>>
>> -SRC_URI[md5sum] = "aff1bff40e675244d72c4667f203e5bb"
>> -SRC_URI[sha256sum] = "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2ea2cc4e08ccb87715"
>> +SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
>> +SRC_URI[sha256sum] = "a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67fae5696"
>>
>>   inherit autotools-brokensep useradd update-rc.d systemd
>>
>> --
>> 1.9.1
>>
>>
>>

-- 
Best Reagrds,
Roy | RongQing Li


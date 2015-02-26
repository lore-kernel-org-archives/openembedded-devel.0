Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 755EE71F1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 00:21:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1Q0LrHo018109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Feb 2015 16:21:53 -0800 (PST)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 25 Feb 2015 16:21:53 -0800
Message-ID: <54EE6720.1000605@windriver.com>
Date: Thu, 26 Feb 2015 08:21:52 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1424853093-6107-1-git-send-email-rongqing.li@windriver.com>
	<20150225155318.GJ8949@mentor.com>
In-Reply-To: <20150225155318.GJ8949@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lksctp: adjust the shipping of the major version shared library files
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
X-List-Received-Date: Thu, 26 Feb 2015 00:21:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年02月25日 23:53, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] lksctp: adjust the shipping of the major version shared library files] On 15.02.25 (Wed 16:31) rongqing.li@windriver.com wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> not ship the major version shared library files in the dev packages,
>> and ship it into a package which is shipping the full version shared
>> library files.
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>
> This is a pretty obvious change, so I went ahead and integrated it.  I
> rewrote your commit log, though.
>
> Thanks Roy.
> -J.


thank you, Joe MacDonald


-Roy


>
>> ---
>>   meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
>> index 1651eb8..4cc955f 100644
>> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
>> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
>> @@ -43,17 +43,17 @@ SOLIBMAJORVERSION="1"
>>   PACKAGES =+ "${PN}-withsctp ${PN}-utils"
>>
>>   FILES_${PN} = " \
>> +    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
>>       ${libdir}/libsctp.so.${SOLIBVERSION} \
>>   "
>>
>>   FILES_${PN}-withsctp = " \
>> +    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
>>       ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
>>   "
>>
>>   FILES_${PN}-dev += " \
>> -    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
>>       ${libdir}/libsctp.so \
>> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
>>       ${libdir}/lksctp-tools/libwithsctp.so \
>>       ${datadir}/lksctp-tools/*.c \
>>       ${datadir}/lksctp-tools/*.h \
>> --
>> 2.1.0
>>

-- 
Best Reagrds,
Roy | RongQing Li


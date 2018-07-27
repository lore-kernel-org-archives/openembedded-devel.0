Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5285078C48
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 00:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R0NHU2008525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 17:23:18 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 26 Jul 2018 17:23:17 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1532321061-20994-1-git-send-email-yi.zhao@windriver.com>
	<96a1138705244f699e91ee1ea540c46a@XBOX02.axis.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <c8bbd74a-914c-ebd5-c86e-7c9a5a458f02@windriver.com>
Date: Fri, 27 Jul 2018 08:23:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <96a1138705244f699e91ee1ea540c46a@XBOX02.axis.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-webserver][PATCH] apache2: upgrade 2.4.33 -> 2.3.34
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
X-List-Received-Date: Fri, 27 Jul 2018 00:23:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年07月27日 08:19, Peter Kjellerstedt 写道:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
>> devel-bounces@lists.openembedded.org> On Behalf Of Yi Zhao
>> Sent: den 23 juli 2018 06:44
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.33 -> 2.3.34
> That should be 2.4.34, not 2.3.34.

Thanks. It is my mistake. I will send V2.


Regards,
Yi

>
>> Security fixes:
>>
>> CVE-2018-8011
>> mod_md: DoS via Coredumps on specially crafted requests
>>
>> CVE-2018-1333
>> mod_http2: DoS for HTTP/2 connections by specially crafted requests
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../apache2/{apache2-native_2.4.33.bb => apache2-native_2.4.34.bb} | 4 ++--
>>   .../recipes-httpd/apache2/{apache2_2.4.33.bb => apache2_2.4.34.bb} | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>   rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.33.bb => apache2-native_2.4.34.bb} (91%)
>>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.33.bb => apache2_2.4.34.bb} (98%)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
>> similarity index 91%
>> rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
>> rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
>> index a471036..a3a6804 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
>> @@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
>> -SRC_URI[md5sum] = "6ef469d3f16fffeb688bc6e0346823e5"
>> -SRC_URI[sha256sum] = "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05"
>> +SRC_URI[md5sum] = "818adca52f3be187fe45d6822755be95"
>> +SRC_URI[sha256sum] = "fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0"
>>
>>   EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
>>                   --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
>> similarity index 98%
>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
>> index 696378e..6642f2b 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
>> @@ -23,8 +23,8 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>>             "
>>
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
>> -SRC_URI[md5sum] = "6ef469d3f16fffeb688bc6e0346823e5"
>> -SRC_URI[sha256sum] = "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05"
>> +SRC_URI[md5sum] = "818adca52f3be187fe45d6822755be95"
>> +SRC_URI[sha256sum] = "fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0"
>>
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>> --
>> 2.7.4
> //Peter
>
>



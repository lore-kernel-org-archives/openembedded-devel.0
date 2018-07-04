Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD8C07606A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 00:15:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w640FWld029053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jul 2018 17:15:32 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 17:15:32 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
	<1530602486-4522-6-git-send-email-yi.zhao@windriver.com>
	<051d14fb-9bb1-e394-c04f-86246860c331@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <1d7ac94b-c31f-76f8-42c7-a0ee4a5b061c@windriver.com>
Date: Wed, 4 Jul 2018 08:15:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <051d14fb-9bb1-e394-c04f-86246860c331@gmail.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-networking][PATCH 6/8] postfix: upgrade 3.2.2 -> 3.2.6
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
X-List-Received-Date: Wed, 04 Jul 2018 00:15:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年07月04日 05:13, Khem Raj 写道:
> On 7/3/18 12:21 AM, Yi Zhao wrote:
>> License-Update: The postfix is distributed with a dual license since
>> 3.2.5: IBM Public License 1.0 and Eclipse Public License 2.0. Recipients
>> can choose to take the software under the license of their choice. Those
>> who are more comfortable with the IPL can continue with that license.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/postfix/postfix.inc                 | 4 ++--
>>   .../recipes-daemons/postfix/{postfix_3.2.2.bb => postfix_3.2.6.bb}  | 6 ++++--
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>   rename meta-networking/recipes-daemons/postfix/{postfix_3.2.2.bb => postfix_3.2.6.bb} (57%)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index a504b85..8c56801 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -11,8 +11,8 @@ DEPENDS = "db icu libpcre libnsl2 openssl postfix-native \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
>>   "
>>   
>> -LICENSE = "IPL-1.0"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
>> +LICENSE = "IPL-1.0 & EPL-2.0"
> Perhaps this should be IPL-1.0 | EPL-2.0 ? if it allows the choice of
> license

Thanks. You are right. I will send V2.

//Yi

>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b181651ad99a7dc4cc8c4ce2f491ed1a"
>>   
>>   SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
>>       file://makedefs.patch \
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
>> similarity index 57%
>> rename from meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> rename to meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
>> index 89af406..1214467 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.6.bb
>> @@ -5,5 +5,7 @@ SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.pat
>>               file://postfix-install.patch \
>>               file://icu-config.patch \
>>              "
>> -SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
>> -SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"
>> +SRC_URI[md5sum] = "d10f1fb551be86f6e48c2908dd8a12ff"
>> +SRC_URI[sha256sum] = "1df036380bae7c356bfa8989a87de58033b6aaa09b3bafcfa36c3694dd449039"
>> +
>> +UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"
>>
>



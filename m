Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D48A71B13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 16:07:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7IG7BRb023066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:07:11 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 09:07:10 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: <Qi.Chen@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <1502967091-31272-1-git-send-email-Qi.Chen@windriver.com>
	<614fa943-e47f-c40e-c99d-f5743f5dcfa9@windriver.com>
Message-ID: <cf468dcf-cc32-798c-baf2-bb6f38412dd4@windriver.com>
Date: Fri, 18 Aug 2017 12:07:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <614fa943-e47f-c40e-c99d-f5743f5dcfa9@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][PATCH] rsyslog: fix CVE-2017-12588
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
X-List-Received-Date: Fri, 18 Aug 2017 16:07:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-18 12:03 PM, Randy MacLeod wrote:
> On 2017-08-17 06:51 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Backport a patch to fix CVE-2017-12588.
>>
>> The zmq3 input and output modules in rsyslog before 8.28.0 interpreted
>> description fields as format strings, possibly allowing a format string
>> attack with unspecified impact.
>>
>> Reference: https://nvd.nist.gov/vuln/detail/CVE-2017-12588
>>
>> CVE: CVE-2017-12588
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../rsyslog/rsyslog/CVE-2017-12588.patch           | 40 
>> ++++++++++++++++++++++
>>   meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 
>> meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
>>
>> diff --git 
>> a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch 
>> b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
>> new file mode 100644
>> index 0000000..73c3310
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
>> @@ -0,0 +1,40 @@
>> +From 6bc4aa975a83abed43d734299ce76cd9e1a14aec Mon Sep 17 00:00:00 2001
>> +From: Thomas Deutschmann <whissi@whissi.de>
>> +Date: Wed, 17 May 2017 23:05:24 +0200
>> +Subject: [PATCH] imzmq3: Fix building with -Werror=format-security
>> +
>> +Reference: https://nvd.nist.gov/vuln/detail/CVE-2017-12588
>> +
>> +CVE: 2017-12588
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + contrib/imzmq3/imzmq3.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/contrib/imzmq3/imzmq3.c b/contrib/imzmq3/imzmq3.c
>> +index 9ca17871..d32dcbc2 100644
>> +--- a/contrib/imzmq3/imzmq3.c
>> ++++ b/contrib/imzmq3/imzmq3.c
>> +@@ -403,7 +403,7 @@ static rsRetVal createSocket(instanceConf_t* 
>> info, void** sock) {
>> +
>> +     /* Do the bind/connect... */
>> +     if (info->action==ACTION_CONNECT) {
>> +-        rv = zsocket_connect(*sock, info->description);
>> ++        rv = zsocket_connect(*sock, "%s", info->description);
>> +         if (rv == -1) {
>> +             errmsg.LogError(0,
>> +                             RS_RET_INVALID_PARAMS,
>> +@@ -413,7 +413,7 @@ static rsRetVal createSocket(instanceConf_t* 
>> info, void** sock) {
>> +         }
>> +         DBGPRINTF("imzmq3: connect for %s 
>> successful\n",info->description);
>> +     } else {
>> +-        rv = zsocket_bind(*sock, info->description);
>> ++        rv = zsocket_bind(*sock, "%s", info->description);
>> +         if (rv == -1) {
>> +             errmsg.LogError(0,
>> +                             RS_RET_INVALID_PARAMS,
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb 
>> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> index d1d391b..6e3a75c 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> @@ -24,6 +24,7 @@ SRC_URI = 
>> "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
>>              file://use-pkgconfig-to-check-libgcrypt.patch \
>>              file://run-ptest \
>>              file://rsyslog-fix-ptest-not-finish.patch \
>> +           file://CVE-2017-12588.patch \
>>   "
>>   SRC_URI_append_libc-musl = " \
>>
> 
> 
> Better to just upgrade to 8.25. It was released in February so
> it should be well tested.
> 
Oops, I mean 8.29, released 10 days ago:

https://github.com/rsyslog/rsyslog/releases

/me updates Wikipedia...
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC8AC6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 02:15:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w042FT7P010422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 3 Jan 2018 18:15:29 -0800
Received: from [128.224.162.209] (128.224.162.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 3 Jan 2018 18:15:28 -0800
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180103083412.9689-1-zhixiong.chi@windriver.com>
	<5125ab2e-8aba-4381-6bd1-4275f58a815e@gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <05e4b5c5-b538-004c-bdd2-f8f517a3a92c@windriver.com>
Date: Thu, 4 Jan 2018 10:15:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5125ab2e-8aba-4381-6bd1-4275f58a815e@gmail.com>
Subject: Re: [meta-networking][PATCH] wireshark: CVE-2017-17935
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
X-List-Received-Date: Thu, 04 Jan 2018 02:15:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年01月04日 06:23, akuster808 wrote:
>
> On 01/03/2018 12:34 AM, Zhixiong Chi wrote:
>> Backport patch from the upstream:
>> https://code.wireshark.org/review/gitweb?p=wireshark.git;
>> a=commit;h=137ab7d5681486c6d6cc8faac4300b7cd4ec0cf1
>> https://nvd.nist.gov/vuln/detail/CVE-2017-17935
>>
>> The File_read_line function in epan/wslua/wslua_file.c in Wireshark
>> through 2.2.11 does not properly strip '\n' characters, which allows
>> remote attackers to cause a denial of service (buffer underflow and
>> application crash) via a crafted packet that triggers the attempted
>> processing of an empty line.
> Thank you for the security patch.
>
> In master-next is an update to wireshark to version 2.2.11.  I think
> this wont be necessary once the update hits master.
Got it.
Thanks for your response.

Zhixiong.
>
> - armin
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   .../wireshark/wireshark/CVE-2017-17935.patch       | 37 ++++++++++++++++++++++
>>   .../recipes-support/wireshark/wireshark_2.2.10.bb  |  4 ++-
>>   2 files changed, 40 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch b/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
>> new file mode 100644
>> index 000000000..46ad83ea0
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/wireshark/wireshark/CVE-2017-17935.patch
>> @@ -0,0 +1,37 @@
>> +From 137ab7d5681486c6d6cc8faac4300b7cd4ec0cf1 Mon Sep 17 00:00:00 2001
>> +From: Martin Mathieson <martin.r.mathieson@googlemail.com>
>> +Date: Tue, 26 Dec 2017 11:48:04 +0000
>> +Subject: [PATCH 1/1] potential buffer underflow in File_read_line function in
>> + epan/wslua/wslua_file.c
>> +
>> +Putting up for review, though I am not completely convinced that
>> +file_gets() can return an empty line.
>> +
>> +Bug: 14295
>> +Change-Id: If36761ea511b66c01a9f167809a218a7eadbfcc5
>> +Reviewed-on: https://code.wireshark.org/review/24997
>> +Petri-Dish: Martin Mathieson <martin.r.mathieson@googlemail.com>
>> +Tested-by: Petri Dish Buildbot
>> +Reviewed-by: Anders Broman <a.broman58@gmail.com>
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> +---
>> + epan/wslua/wslua_file.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/epan/wslua/wslua_file.c b/epan/wslua/wslua_file.c
>> +index 79bf4f7..73bacc6 100644
>> +--- a/epan/wslua/wslua_file.c
>> ++++ b/epan/wslua/wslua_file.c
>> +@@ -192,7 +192,7 @@ static int File_read_line(lua_State *L, FILE_T ft) {
>> +     length = (gint)(file_tell(ft) - pos_before);
>> +
>> +     /* ...but don't want to include newline in line length */
>> +-    if (linebuff[length-1] == '\n') {
>> ++    if (length > 0 && linebuff[length-1] == '\n') {
>> +         length--;
>> +         /* Nor do we want '\r' (as will be written when log is created on windows) */
>> +         if (length > 0 && linebuff[length - 1] == '\r') {
>> +--
>> +2.7.4
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
>> index 5358ba07f..e3915d203 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
>> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
>>   
>>   DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
>>   
>> -SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>> +SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2 \
>> +           file://CVE-2017-17935.patch \
>> +"
>>   
>>   PE = "1"
>>   
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036



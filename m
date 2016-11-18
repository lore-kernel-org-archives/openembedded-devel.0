Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34F1960722
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:38:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAI2ce4Z019376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Nov 2016 18:38:40 -0800
Received: from [128.224.162.208] (128.224.162.208) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 17 Nov 2016 18:38:39 -0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
	<9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <696ebdcf-d08d-72cd-7ee8-50b2c11e63d8@windriver.com>
Date: Fri, 18 Nov 2016 10:38:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
Subject: Re: [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1" for 3.1
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
X-List-Received-Date: Fri, 18 Nov 2016 02:38:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2016 02:11 AM, Khem Raj wrote:
>
>
> On 11/16/16 7:02 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> The opencv 2.4 has been blacklisted, 3.1 should be the default choice
>> for both opencv and lib32-opencv.
>
> blacklisting does not change the norms. Is it possible to fix the reason for
> blacklisting 2.x

The reason is "Not compatible with currently used ffmpeg 3", I can try 
to fix it but I can't promise it could be fixed definitely.

Thanks
Wenzong

>
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> index 1bbb965..a212f4f 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> @@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
>>  ARM_INSTRUCTION_SET_armv4 = "arm"
>>  ARM_INSTRUCTION_SET_armv5 = "arm"
>>
>> -DEFAULT_PREFERENCE = "-1"
>> -
>>  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
>>
>>  SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
>>
>


Return-Path: <Fahad_Usman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A33127318D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:26:00 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1baS0u-0001g6-UM from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 11:26:01 -0700
Received: from [172.30.7.226] (137.202.0.76) by SVR-IES-FEM-01.mgc.mentorg.com
	(137.202.0.104) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 18 Aug 2016 19:25:59 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <1471525556-47918-1-git-send-email-fahad_usman@mentor.com>
	<114FD618-198C-43A4-BD65-30170BCE0965@gmail.com>
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
Message-ID: <737a90c6-d346-ba88-9cb5-39b8f4ff6a07@mentor.com>
Date: Thu, 18 Aug 2016 23:25:50 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <114FD618-198C-43A4-BD65-30170BCE0965@gmail.com>
X-Originating-IP: [137.202.0.76]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] testfloat: Fix No GNU_HASH in the elf binary warnings
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
X-List-Received-Date: Thu, 18 Aug 2016 18:26:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 08/18/2016 10:42 PM, Khem Raj wrote:
>> On Aug 18, 2016, at 6:05 AM, Fahad Usman <fahad_usman@mentor.com> wrote:
>>
>> These warnings are observed when testfloat is built with certain
>> external toolchains.
>>
>> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>> ---
>> meta-oe/recipes-extended/testfloat/testfloat_3a.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
>> index 28e9677..bb6e2ae 100644
>> --- a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
>> +++ b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
>> @@ -20,6 +20,8 @@ SRC_URI[SoftFloat.sha256sum] = "946fd23180559d60eb6683dda1cf8b142f5426dedfefb97b
>>
>> S = "${WORKDIR}"
>>
>> +TARGET_CC_ARCH += "${LDFLAGS}”
> it probably is not using LDFLAGS for linking cmline in makefile
> I think that will be an upstreamable fix.
Yes, it doesn't use LDFLAGS in the LINK command in Makefile, I'll make a 
patch for Makefile.

Thanks.
>
>> +
>> do_compile(){
>>      oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
>>      oe_runmake -C TestFloat-${PV}/build/Linux-Cross-Compile/
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>



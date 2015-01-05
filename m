Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7EEB609B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 01:59:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t051xk0a013312
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Jan 2015 17:59:47 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 Jan 2015 17:59:45 -0800
Message-ID: <54A9F010.4010803@windriver.com>
Date: Mon, 5 Jan 2015 09:59:44 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>	<1420329190-40280-5-git-send-email-liezhi.yang@windriver.com>
	<CA+chaQdSm-mNH8a75hpGNxy96gt94NcXaZoXghAypOxPR5zDkw@mail.gmail.com>
In-Reply-To: <CA+chaQdSm-mNH8a75hpGNxy96gt94NcXaZoXghAypOxPR5zDkw@mail.gmail.com>
Subject: Re: [meta-oe] [PATCH 5/5] tomoyo-tools: use BPN in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 01:59:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2015 05:56 PM, Martin Jansa wrote:
> ${BPN}-${PV}
> <http://pkgs.fedoraproject.org/repo/pkgs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/$%7BBPN%7D-$%7BPV%7D.tar.gz>
> ->
> ${BP} and can we use SOURCEFORGE_MIRROR again?

I'm afraid that we can't use the SOURCEFORGE_MIRROR, as the URL
is a just a web:

downloads.sourceforge.net/project/tomoyo/tomoyo-tools-2.5.0-20140601.tar.gz

I will update others and resend the patches.

// Robert

>
> On Sun, Jan 4, 2015 at 12:53 AM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
>> b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
>> index bb2676b..70c039e 100644
>> --- a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
>> +++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
>> @@ -5,11 +5,11 @@ being useful purely as a system analysis tool."
>>   HOMEPAGE = "http://tomoyo.sourceforge.jp/"
>>   SECTION = "System Environment/Kernel"
>>
>> -SRC_URI = "
>> http://jaist.dl.sourceforge.jp/tomoyo/53357/${PN}-${PV}-20140601.tar.gz"
>> +SRC_URI = "
>> http://jaist.dl.sourceforge.jp/tomoyo/53357/${BPN}-${PV}-20140601.tar.gz"
>>   SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
>>   SRC_URI[sha256sum] =
>> "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
>>
>> -S = "${WORKDIR}/${PN}"
>> +S = "${WORKDIR}/${BPN}"
>>
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


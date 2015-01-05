Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E690172828
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 22:59:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t05MxZAQ018478
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 14:59:36 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 14:59:35 -0800
Message-ID: <54AB1756.1040601@windriver.com>
Date: Tue, 6 Jan 2015 06:59:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
	<20150105115903.GE2484@jama>
In-Reply-To: <20150105115903.GE2484@jama>
Subject: Re: [meta-oe] [V2 PATCH 1/5] dash: use BP in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 22:59:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/05/2015 07:59 PM, Martin Jansa wrote:
> Thanks for v2
>
> Please remember to update your old series as superseded when pushing
> newer version, it would help me a lot when sorting the pending patches.

Hi Matin, what did you mean about: "update your old series as superseded",
please ? I can't understand this clearly.

// Robert

>
> On Sun, Jan 04, 2015 at 06:30:09PM -0800, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta-oe/recipes-extended/dash/dash_0.5.8.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
>> index c2b5249..4961d7b 100644
>> --- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
>> +++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
>>
>>   inherit autotools update-alternatives
>>
>> -SRC_URI = "http://gondor.apana.org.au/~herbert/dash/files/${PN}-${PV}.tar.gz"
>> +SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
>>   SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
>>   SRC_URI[sha256sum] = "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>


Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 698E26AD0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 07:14:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C7EuOP020090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 May 2015 00:14:56 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 12 May 2015 00:14:55 -0700
Message-ID: <5551A86D.6050905@windriver.com>
Date: Tue, 12 May 2015 15:14:53 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<20150511092704.GH2400@jama>
In-Reply-To: <20150511092704.GH2400@jama>
X-Originating-IP: [128.224.163.137]
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Tue, 12 May 2015 07:14:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin,

I re-sent these 3 patches. If it still doesn't work. I will try a repo url.

Thanks,
Yi

在 2015年05月11日 17:27, Martin Jansa 写道:
> On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Changes 03, 18, 20 didn't make it to patchwork, because they were marked
> as Spam by gmail, please try to resend or send cover letter with repo
> url where I can cherry-pick them.
>
>> ---
>>   .../smstools3/smstools3_3.1.15.bb                  |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
>> index 7a72a1e..c4b6b60 100644
>> --- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
>> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
>> @@ -12,7 +12,7 @@ SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
>>   SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
>>   
>>   
>> -S = "${WORKDIR}/${PN}"
>> +S = "${WORKDIR}/${BPN}"
>>   
>>   RDEPENDS_${PN} = "bash"
>>   INITSCRIPT_NAME = "sms3"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



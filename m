Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD50478BAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:36:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5CBYu9Q030462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jun 2018 04:35:47 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 12 Jun 2018 04:35:39 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<6bd2359a-5d58-f11e-9900-88f5de733d7f@skidata.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <4c52ac95-ccac-2e87-2874-18436eccbcb5@windriver.com>
Date: Tue, 12 Jun 2018 19:35:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <6bd2359a-5d58-f11e-9900-88f5de733d7f@skidata.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [meta-java][PATCH 1/2] openjdk-8: remove debuglink
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
X-List-Received-Date: Tue, 12 Jun 2018 11:36:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月12日 19:09, Richard Leitner wrote:
> Hi Wenlin,
>
> On 06/07/2018 11:24 AM, Wenlin Kang wrote:
>> We need remove previous debuglink before add it if it has existed,
>> because it may have a different file name with this that we will add.
> I'm sorry but I don't get the reason why we need this...
> It would be great if you may please explain it in a little more detail for me ;-)

Hi Richard

In openjdk-8, its debug file is xxx.debuginfo, and when execute 
openjdk's makefile, it will add
libjvm.debuginfo as libjvm.so's debuglink section's file name, this name 
is different  with that
we will add in splitdebuginfo() of package.bbclass, this makes we can't 
get symbol information
when debug libjvm.so in gdb.

>
> Thank you very much!
>
>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>> ---
>>   recipes-core/openjdk/openjdk-8-cross.inc | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
>> index 46f13fd..03cab11 100644
>> --- a/recipes-core/openjdk/openjdk-8-cross.inc
>> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
>> @@ -105,5 +105,21 @@ EXTRA_OEMAKE_append = '\
>>       images \
>>   '
>>   
>> +python remove_debuglink() {
>> +    dvar = d.getVar('PKGD', True)
>> +    objcopy = d.getVar("OBJCOPY", True)
>> +
>> +    # Remove the previous debuglink if it has existed, because it has a different file name with that we will add.
>> +    if d.getVar('PN', True).find("jre") != -1:
>> +        file = dvar + d.getVar("JRE_HOME", True) + "/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
>> +    else:
>> +        file = dvar + d.getVar("JDK_HOME", True) + "/jre/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
>> +
>> +    cmd = "'%s' --remove-section .gnu_debuglink '%s'" % (objcopy, file)
>> +    oe.utils.getstatusoutput(cmd)
>> +}
>> +
>> +PACKAGE_PREPROCESS_FUNCS += "remove_debuglink"
>> +
>>   # There is a symlink to a .so but this one is valid.
>>   INSANE_SKIP_${PN} = "dev-so"
>>
> regards;Richard.L
>

-- 
Thanks,
Wenlin Kang



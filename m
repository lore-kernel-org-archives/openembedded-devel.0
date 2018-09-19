Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id E947B79261
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:11:58 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id u83-v6so4629740lje.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=5vkM9G5Kl9PvFccKpjeaYp7fTVuJkT7tyjIa+ukQtGM=;
	b=DtV8ZlMrd+wI4L+Qtgs1Y0cbIWatA+KPTHCO/UaA4TZz7KAv++WRFi9kcCTfRdDC2d
	80bHk8twkc8gkwFElS4JOEOmlTFkarHZJgdojYnL6IlYSZ/P2Zn6lqgG2bGbhbTBYOZf
	CH0b0zgDw5S/ZhalDdEQIaK1gyT2pF5No7gZJwlVc7puUAN3jpEirEgMU6YcKzljlxES
	kWlIInKkJJS+6nVMWiB/DDteSmk8evQ99iSe76bbk0a0pW7MvRQdGmxKuBmfBvsAFmg7
	teCgOF/bUeAw96m0m7WznVKmwNnyAtMVHs8iv0DYOrftK3GwZ7LbmCG5wHOrxEQKGpPb
	F/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5vkM9G5Kl9PvFccKpjeaYp7fTVuJkT7tyjIa+ukQtGM=;
	b=fucOkrfCbKLmia4AFQKdnBiELnXp1Qloa0v+nmWaq6D+dKRkrnZG4sgNjaMFNrwVRy
	kX/AzQyXW1tEGuN0Qq8BGuznZbFsViTrIkNhVzEUbDxZxopHFpxplagBhG8hxHlmC/uN
	KwRNc/PBGpUTcFKBK3JxfQWmBGgc+R9pg53dkCKVAHa0479YCpr+0anzBp4yn3sgp/zK
	epUsvIkoMo9jzZgs4L3T0GgeaMXKO9epBTMUr1eH8lSNIQVK0KRCFtuMNC+ibm+OTVz1
	H7gNNOoZJlaEB5jTMVK/jK2Hg8IH9YWM0sRqE0Y7dDoHcXWxQ842MVtG6yXgr8JQp6FY
	QPtQ==
X-Gm-Message-State: APzg51CCQ2lXg2pHN18oYzOHPDzn2Q8JHULWg/w2m73a6ws+BzIAsA7W
	eSjigjsqalLls/88N+tu3j2a6MfixSA=
X-Google-Smtp-Source: ANB0VdZ/WnXZZ2oy++WIPnIIitACeNZ31QipGBG9fHA4Ctk9ebvxdRGd/rMyBzzs0IyZSVKkzwPv0g==
X-Received: by 2002:a2e:9cd0:: with SMTP id
	g16-v6mr1446859ljj.110.1537355518934; 
	Wed, 19 Sep 2018 04:11:58 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	f128-v6sm412567lff.40.2018.09.19.04.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 04:11:58 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536317071-17077-1-git-send-email-yevgenyp@pointgrab.com>
	<4f82c15835c890729dff215334ef2c8d19276230.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <3921bb40-6c32-979b-6d10-47e5e1a9a7ea@pointgrab.com>
Date: Wed, 19 Sep 2018 14:11:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4f82c15835c890729dff215334ef2c8d19276230.camel@andred.net>
Subject: Re: [meta-java][PATCH] openjdk-8, openjre-8: Fix PROVIDES assignment
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
X-List-Received-Date: Wed, 19 Sep 2018 11:11:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/17/2018 05:11 PM, André Draszik wrote:
> On Fri, 2018-09-07 at 13:44 +0300, Yevgeny Popovych wrote:
>> PROVIDES is a recipe-specific variable, not package-specific like
>> RPROVIDES.
>> This bug would prevent you from having recipes DEPEND on java2-runtime
>> or java2-vm (assuming you have set PREFERRED_PROVIDER correctly).
> 
> Looking at all uses of this, I don't think the intention is to be able to
> DEPENDS on java2-vm or java2-runtime at all.
> 
> Regarding java2-vm:
> 
> java2-vm was originally used in the OpenJDK 6 & 7 recipes to be able to
> select shark, zero, cacao, or jamvm VMs. OpenJDK-6 is not available any
> more, and OpenJDK-7 has removed support for most of this in commit
> 38f4c1365c11 ("openjdk7: remove broken/unsupported VM's")
> 
> It is not clear why it was added to the OpenJDK-8 recipe either.
> 
> Given OpenJDK-7 has no way of using the VM compiled as part of OpenJDK-8,
> and given that no part of the OpenJDK-8 makes use of the java2-vm part, the
> correct solution here is to actually *remove* the incorrect PROVIDES
> statement for java2-vm completely.
> 
> 
> Regarding java2-runtime:
> 
> Again, looking at the other uses of this:
> java2-runtime is a virtual runtime package name, which is provided by
> different *runtime* packages (created by the OpenJDK-7, OpenJDK-8, JamVM, or
> Cacao recipes). Other recipes only ever RDEPEND on java2-runtime. It makes
> not sense for OpenJDK-8 to PROVIDES java2-runtime given the above.
> 
> So for this, PROVIDES_${PN} = "java2-runtime" should be indeed removed, but
> without any replacement.

In general I agree.

For my specific use-case I wanted to pull java2-runtime
as a build time dependency (therefore DEPENDS) to be able to take JKS from it,
and so I went to fix this.
But since this variant of ca-certificates-java can generate
the keystore by itself I can skip this part.

> 
> 
> Cheers,
> Andre'
> 
>>
>> Change-Id: I602d98241d2a6f42a13a1fa1edad049d4e8792b0
>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>> ---
>>  recipes-core/openjdk/openjdk-8_172b11.bb | 4 ++--
>>  recipes-core/openjdk/openjre-8_172b11.bb | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-
>> core/openjdk/openjdk-8_172b11.bb
>> index c1c6e1e..22d0113 100644
>> --- a/recipes-core/openjdk/openjdk-8_172b11.bb
>> +++ b/recipes-core/openjdk/openjdk-8_172b11.bb
>> @@ -47,10 +47,10 @@ FILES_${PN}-doc_append = "\
>>  
>>  FILES_${PN}-source = " ${JDK_HOME}/src.zip "
>>  
>> +PROVIDES = "java2-vm"
>> +PROVIDES = "java2-runtime"
>>  RPROVIDES_${PN} = "java2-vm"
>> -PROVIDES_${PN} = "java2-vm"
>>  RPROVIDES_${PN} = "java2-runtime"
>> -PROVIDES_${PN} = "java2-runtime"
>>  
>>  inherit update-alternatives
>>  
>> diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-
>> core/openjdk/openjre-8_172b11.bb
>> index dd29691..d8d4ba8 100644
>> --- a/recipes-core/openjdk/openjre-8_172b11.bb
>> +++ b/recipes-core/openjdk/openjre-8_172b11.bb
>> @@ -35,10 +35,10 @@ FILES_${PN}-doc_append = "\
>>      ${JRE_HOME}/THIRD_PARTY_README \
>>  "
>>  
>> +PROVIDES = "java2-vm"
>> +PROVIDES = "java2-runtime"
>>  RPROVIDES_${PN} = "java2-vm"
>> -PROVIDES_${PN} = "java2-vm"
>>  RPROVIDES_${PN} = "java2-runtime"
>> -PROVIDES_${PN} = "java2-runtime"
>>  
>>  inherit update-alternatives
>>  
>> -- 
>> 2.7.4
>>
> 

-- 
Sincerely,
Yevgeny Popovych


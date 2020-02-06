Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A6B2C608AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 10:24:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so6459292wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Feb 2020 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mKYs9ESlcVRp8yI0prrqsUhn7v0NyDY7Sr+2XZ34QFU=;
	b=LkxxSRuTA9ED80Pv+JSNgwnkjXP6DXQGO6Svt6X9I7NPshn5jc+hIff8N8ROXu2zPi
	rddQnuFWhI5oRJtHpZbJXmPOKTZ+DmlxLFEh09UVguNwqG4hTIIZQQ4d4egc073WqKm2
	dXQTRj9vuQlnCR0oKYs4Hu179ePTTnXpX/q0w4Q1srNHJ29wMPIhz1XVAUWaKGcgql2v
	4lIr3Fn9/bBmC4aRWwVTU2xJ1mREqeDGRj5deo9UmwTF1m+oU+uIHjgSha487XE0OOEn
	W4lvlND/d84rD9H4dLfMuPklofj7yeJr7hzpuFHmF8kvHmn2Q6NU+e5tT/gsH+qF2QEM
	foqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mKYs9ESlcVRp8yI0prrqsUhn7v0NyDY7Sr+2XZ34QFU=;
	b=Gl9IlRqzaKyUvvSO7spgZ7CXoXhmDykSSuPpoCYnl7I/pm4YjL5mKjzYWJLYsuvS0E
	yxKwev1J2zwjEs5uMPfZtm3VkL1TdgzIzQAUowu1BBdnP/7duGfv3+Pq38/ebBIK5Zza
	2lHHXVwemWPQoDAqfeTDYuAwnuj1bGMxjyU9rAKhWKvDBn5v5kmdrgR2TG57xMYm9+1g
	ND2fNfhdLe8FL8ZRmGuV/+2qoIpRE1NCtXnzl/xuuVs9VMJZshvi8YcSAX8L7zy3VRdA
	1bw+78L9qsrzjb32iaqu8615cBLC25Gai0MtflvYnaodqYNuXB2PqyY25SivMAHh+8k4
	xJhg==
X-Gm-Message-State: APjAAAVHAkk+WsmAlyrppTVQmR/WjqUo1ojs9qdtviOLo8G3sPI9upYq
	oPWp2+htOIc4a7iuVpHfqg9V5Uzx
X-Google-Smtp-Source: APXvYqxbAUXwXoLoRZR9QcI0ykzeihItA4NP2uXMElesdgOE5o7Jw3X5VIqGa0jirjtqOn6yVOZDDQ==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr3049924wrt.408.1580984675867; 
	Thu, 06 Feb 2020 02:24:35 -0800 (PST)
Received: from [172.16.100.97] ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id
	s16sm3647350wrn.78.2020.02.06.02.24.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Feb 2020 02:24:35 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
	<424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
	<20200127052211.GA2138442@pcleri>
	<639e9a61-3ef7-e391-649d-9b53567ded40@googlemail.com>
	<20200206092407.GA7361@pcleri>
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Message-ID: <c884a4a7-c87d-00be-ba6d-13d5487536af@googlemail.com>
Date: Thu, 6 Feb 2020 11:24:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206092407.GA7361@pcleri>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Thu, 06 Feb 2020 10:24:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard,

I "fixed" it by manually copying feature_check.bbclass into the layer. I 
can confirm, that your java8u242 works on aarch64 (even could get rid of 
some patches needed to compile on kernel 5.x)!

Is there anything planed to "backport" it to zeus branch of meta-java?

Thanks and Regards,

   Matthias

On 2/6/20 10:24 AM, Richard Leitner wrote:
> Hi Matthias,
> 
> On Wed, Feb 05, 2020 at 02:20:53PM +0100, Matthias Schoepfer via Openembedded-devel wrote:
>> Hi Richard and Jacob,
>>
>> I just stumbled across the very same error, but on aarch64. I tried to
>> switch to the wip-branch, but I get
>>
>>   ParseError at
>> /[...]/meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could not
>> inherit file classes/features_check.bbclass
>>
>> I am on zeus...
> 
> This seems legit as AFAIK features_check.bbclass was introduced after the zeus
> release. For zeus you can replace it with distro_features_check.bbclass,
> but please note that I haven't tested on zeus. I'm working on master.
> 
> Futhermore please use meta-java's master-next branch for testing as I will
> remove the wip branch in the near future.
> 
> thanks for your testing!
> 
> regards;rl
> 
>>
>> Regards,
>>
>>    Matthias
>>

-- 
Dr.-Ing. Matthias Schöpfer
matthias.schoepfer@googlemail.com


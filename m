Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8887C7D537
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 16:12:10 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t187so3226505pgb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=804bzw26MuOI2zawJ9Og1sXy46fZ61SmgGu1DXXjw/s=;
	b=DVBqWeSpeZ1UMzY/644YAo15pmMcXIvHLw8k7tXM95VlQujcjaNh69h9XGhuZh0kDm
	fX7w9KBwDhow4GV+g62diQaqBi4/FG3HzK0s/twkMPoPFuJaHquLKBe7MN9Rt6q/tqfT
	WOnnJe/o65jELZ5EofPC7ALAZzIpqP1ySCRb9YBnLXO2Cawn9DwVAJQWLnRK9uf0MT//
	d7pKVDqPLNtypv+EOB76NKD6buseITLJ4zB++W9OtNrclYGuBhfyMZesRgy5r0BC8F6p
	hSTmuX7s1eC1IJ2yfu1ODDbbyFczKUgQEMJWTRRVA6bq4yTNeNlE3aexYMkam/ertP8Y
	D2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=804bzw26MuOI2zawJ9Og1sXy46fZ61SmgGu1DXXjw/s=;
	b=HySDKb5Rm2GX7tMdSLk3mxdO8OsiMJUqFQrdopGvMdv0FQObeEUKdYdtiV3YBf69Pn
	MeXM47kKeQyuzVyxtzg0dDIs8620oCRe1yLolGArf7tIR8zB6k8HF5ZQkDLE5z9RVJMm
	+cYBO5JchQohkcx9Hcqs1U81tEF/8Tgw6gxdUCiYh37Ys2adbTxnVAzjoDOYsbQ6RKuA
	ikvnq7ptVPiOI7Jzu2epcD6qUWhxGJGyJgSEAUGCAsJb5NBLa5ZOyexyez4Riz+xlFp7
	OuIU8QbZjQdUUakGZjSiT/sHkrMT/hWX8yvHNLFgFCct4XJ/4SVegI9VNyLmTJc0aAZq
	eaTA==
X-Gm-Message-State: APjAAAVPyfs+O8mRF2pDa+EjHkj83+URUzezJANSor5jmXvhNzlFxFup
	OYHAdNERhFIt4pJkE5gw8p6oZef5eGo=
X-Google-Smtp-Source: APXvYqyJveEGFX1m5l8qkCyCjX+nO2UXis5eILHMrohnv33AQQFGVHXiU3SQ6xVD2fKduJTAu02Lzw==
X-Received: by 2002:a62:2703:: with SMTP id n3mr15374087pfn.199.1557504730931; 
	Fri, 10 May 2019 09:12:10 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id f6sm5730389pgq.11.2019.05.10.09.12.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 09:12:10 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20190430060855.60494-1-sean@geanix.com>
	<CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a7026c4e-89a2-211d-e054-d42114680934@gmail.com>
Date: Fri, 10 May 2019 09:12:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
Subject: Re: [PATCH v2] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Fri, 10 May 2019 16:12:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/19 6:08 AM, Nicolas Dechesne wrote:
> On Tue, Apr 30, 2019 at 8:09 AM Sean Nyekjaer via Openembedded-devel
> <openembedded-devel@lists.openembedded.org> wrote:
>>
>> Tool for sending SocketCAN messages
>> over Ethernet tunnel.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>> Changes in v2:
>> - Added PV
>>
>>   .../cannelloni/cannelloni_git.bb                | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> new file mode 100644
>> index 000000000..df75e6342
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "a SocketCAN over Ethernet tunnel"
>> +HOMEPAGE = "https://github.com/mguentner/cannelloni"
>> +LICENSE = "GPLv2"
>> +
>> +SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
>> +SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
>> +
>> +PV = "20160414+${SRCPV}"
>> +
>> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +inherit cmake
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +PACKAGECONFIG ??= "lksctp-tools"
>> +PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
> 
> lksctp-tools recipe is in meta-networking, so we've added an implicit
> dependency on meta-networking by taking this patch. should we disable
> lksctp-tools support by default?

Yes it should be disabled by default. But looking again at it, I think 
this recipe is more appropriate for meta-networking to reside in. So
probably just moving the recipe to meta-networking is another solution.

> 
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


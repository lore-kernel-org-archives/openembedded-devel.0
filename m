Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD618605AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 13:20:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so2710970wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=3ctcmHjADzPscQ/HmTetVJjFDcNs/L/ufXtJxKUrhds=;
	b=I0NvxU9rzk138wq0vrGV6JlTyLncaccz5msBSqE3mXPyXN+HrLVaAqFt0Jio1TsPK0
	xnr5ElFgxzg05/RsNTd+mOw8ZWcvAHGE+o1LBObVxEA6CSIICC7RUgx69Jl8SvRGjMVz
	l/knRXlYQZygSknjzm2n+6I7Qlu8it11MMh42qLtSZKOvSm4Ato/311sq3jSfjIZ9dic
	7FhnzWRkAh1ORbl32CG4GabXc8QIFYg+Y7aF3svvYcqg9BaFKjd7SSPFI3Y3iVko07ih
	zKY71K0us/ySRFvLB2yoPV15Xw++LrBzzZP+xE/H+mdd7K15BZaNReK+iWGmg6rLuOFn
	rb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3ctcmHjADzPscQ/HmTetVJjFDcNs/L/ufXtJxKUrhds=;
	b=slBUDxtZSNGl74BbBqnoWjxuiKJvD1jLWqR0oSWQrRRV2j8rQY6mC4dgLZ9zyR+nbO
	kSASp5FjoxYQOV/mJx2m6nfT008MBWrKHft8OVFbGp8nUPX3yEP7Bgz3LRnemGpzZnk2
	AdAn9fKptogfi3zchCkxX2yFeDgR1HrZ9RFuPu39ItbWALq+FECnASMLrr416TxILs6B
	NH19oQGcgSgW7c4vAB5B0NTpEssswQ+xRlL+WX0Zou0fSdujRh6+ZqtVXXkz4mKd4H6b
	E+w6NF85DST3tokja8Fsz/JZ3cIHECQ4CRAtBndJHOPGuqsy+htZrW+dtczsfCWZfuV5
	D+wQ==
X-Gm-Message-State: APjAAAWi1tOlu+M/sq/cUYGoKMWYpl8U/7TFyflZQz1vHbVwCwiuuTJa
	jDgsH7SprnWP2YVmzQEE4pCJJIaA
X-Google-Smtp-Source: APXvYqxUP8Wz0MbGSQMAVtTzt+xvGQPInlLe6ZrQM9k/4U1GwnB6hKKfbBhizycUsjonsn1s9xVqRg==
X-Received: by 2002:adf:f802:: with SMTP id s2mr30452187wrp.201.1580908855006; 
	Wed, 05 Feb 2020 05:20:55 -0800 (PST)
Received: from [172.16.100.97] ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id y7sm7319536wmd.1.2020.02.05.05.20.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 05 Feb 2020 05:20:54 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
	<424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
	<20200127052211.GA2138442@pcleri>
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Message-ID: <639e9a61-3ef7-e391-649d-9b53567ded40@googlemail.com>
Date: Wed, 5 Feb 2020 14:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127052211.GA2138442@pcleri>
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
X-List-Received-Date: Wed, 05 Feb 2020 13:20:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard and Jacob,

I just stumbled across the very same error, but on aarch64. I tried to 
switch to the wip-branch, but I get

  ParseError at 
/[...]/meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could 
not inherit file classes/features_check.bbclass

I am on zeus...

Regards,

   Matthias

On 1/27/20 6:22 AM, Richard Leitner wrote:
> On Sun, Jan 26, 2020 at 09:03:45PM +0100, Jacob Kroon wrote:
>> On 1/26/20 12:26 PM, Jacob Kroon wrote:
> 
> ...
> 
>>
>> Btw, as I mentioned my build host is an up2date Fedora 31, x86-64. Any idea
>> why these errors aren't showing up on your test builds ?
> 
> In my tests I only built the openjdk package, therefore the "find" issue
> didn't trigger.
> 
> The linker errors were fixed in aarch32 [1] and aarch64 [2] upstream. I
> just double-checked my tests and it seems I only built for those two
> architectures... Time for me to rework my tests ;-)
> 
> So I will adapt and apply your PATCH and push it to the branch. Thanks
> for your work!
> If you have any further feedback/tests for the 242 update please feel
> free to share ;-)
> 
> regards;rl
> 
> [1] http://hg.openjdk.java.net/aarch32-port/jdk8u/jdk/rev/4a51a4ac7fc2
> [2] https://hg.openjdk.java.net/shenandoah/jdk8/jdk/rev/391be061dfc7
> 
>>
>> Cheers,
>> Jacob

-- 
Dr.-Ing. Matthias Schöpfer
matthias.schoepfer@googlemail.com


Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 68A0579309
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:45:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q127-v6so4407632ljq.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=hNVVRBGXFFX+0vFL4B7brvLd75ZmszO2W6lqN+Sp0zs=;
	b=vox1ibz3F0iOB7oflg9lgAyYt4IOW41PCYatMZfn/dWbbxSqsYTFXura1iCp5kb5bz
	gd//0rtBXI/mhQbxqXAUgriau+naOQNFqhdLtEVClepHOBA85W4xkpltUY8uwFTcgfti
	nfz3A57pbqW+fuzL1FwryPtbfW62tbl7RL5Lao9Rl0VR3TOnIVK7n9Zi6pTULr2PQNue
	aBRhm8g3R3um9FhENh7XQ0D3gAJAatwq4g+qtI7zjKP9vt2arj3uYgNkszH9ETq3p2/P
	jtWPUy7/xu70psufdX7RBg06OSQCx8yu7TLIgysR+x2+AAo6dAChMZazNgnr/qccHP7v
	8uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hNVVRBGXFFX+0vFL4B7brvLd75ZmszO2W6lqN+Sp0zs=;
	b=DvStqp2vBfJQ0XGwjHLzjgL6Z4HD6vGlTe6Q497a3wjHdrkLqq9PkPkmT/kQaHRO7b
	yuuiN/s45NnQ0zFwkkVbmQM0UmezPuUXRQUeJpOg3XHv05Z+fWhBnkAlkc+CJN9/CnFc
	CvkIp8myTyFQ2Q9VDa0tXFi521xCW9OvMdAnl19fHCFXfOFSAbi3Vg47Ga2aQEtNOHNW
	MKCCf8BqOrQSOiYV/t//7advuocLnzPPYWrnEtKF4pdnwKrwqjHgJH67w9Yl+jXWxp44
	r/64K3+aUsWmJ0i70MNV/L1b2zj5rhRzGVkpmfMoku/OI++2cqUH6jyXWW9hRzmbszqi
	Fkwg==
X-Gm-Message-State: APzg51CnEJsKwC1l1czKqiyA2UAJ9CiSz5I+jl6hdjXfAbdXEUprzeSX
	ITj7/pOUdrufsknf09KEci/lW0eXol4=
X-Google-Smtp-Source: ANB0VdZnIGEvYscb/pFmptsWl1hNAIzkzKLdVVP1CoH8Ua98+4G3yC+BMj1FuSd9ehNNm5+vn5nBKw==
X-Received: by 2002:a2e:9ec9:: with SMTP id
	h9-v6mr15344064ljk.133.1537350302435; 
	Wed, 19 Sep 2018 02:45:02 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	e30-v6sm3726351ljb.86.2018.09.19.02.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 02:45:01 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<0a5a90088e8a12ec2a3f3083544c545c60edbf94.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <111740ee-7d19-d140-9eeb-9a9448f25048@pointgrab.com>
Date: Wed, 19 Sep 2018 12:45:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0a5a90088e8a12ec2a3f3083544c545c60edbf94.camel@andred.net>
Subject: Re: [meta-java][PATCH 0/3] ca-certificates-java: Fix usage as a native tool, do_rootfs failure
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
X-List-Received-Date: Wed, 19 Sep 2018 09:45:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Andre,

Thanks for the feedback!


On 09/17/2018 06:10 PM, André Draszik wrote:
> On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
>> This series fixes several issues with ca-certificates-java:
>> * when used as a native tool
>> * failure on do_rootfs
> 
> Can you share complete logs? I'd like to understand the do_rootfs issues you
> are seeing (I don't see any).

The issue is that during do_rootfs, ca-certificates postinst calls
ca-certificates-java hook and the hook fails. (didn't save the log, sorry)
This is what patch #2 tries to fix (ca-certificates-java: Don't fail when called via hook on do_rootfs).

Richard also saw this issue when he tried another patch
(http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120066.html).
Although that doesn't matter IMO, I am using deb `PACKAGE_CLASSES`,
and Richard supposedly uses ipk (the default one).

> 
>> This doesn't fix all the issues and there is definitely a room for
>> improvement.
> 
> What other issues?

At least the use case for the target (the one mentioned below) and
some postinst issues that may appear (didn't test that).

> 
>> I presume that running it on the target doesn't work - at least
>> ${sysconfdir} is
>> not expanded in the hook.
> 
> True.
> 
>> I also think that will be best to drop create-ca-certificates-java usage
>> in
>> the postinst and let it be called as a hook of ca-certificates. This will
>> allow
>> us to remove some code and simplify both script and recipe.
> 
> You can't do that, because ca-certificates could be installed before ca-
> certificates-java. In which case the hook will not be run.

This can't really happen.
In OE, all packages are first unpacked and only then, in a separate step, the postinst are run.
This means that during do_rootfs, ca-certificates will always have the java hook present.

In addition to that, having the empty postinst in ca-certificates-java is desirable
for target/runtime because on upgrades, the hook should be run by ca-certificates
and our ca-certificates-java package should do nothing in this case.
What I mean is that the package should just be a way to deliver the hook.

> 
>>
>> It would be great if others could test their use cases;
>> and clarify them - is create-ca-certificates-java really needed?.
> 
> As per above.
> 
> Cheers,
> Andre'
> 
>>
>> Yevgeny Popovych (3):
>>   ca-certificates-java: Fix sysconfdir for -native recipe
>>   ca-certificates-java: Don't fail when called via hook on do_rootfs
>>   ca-certificates-java: Distinguish between SYSROOT and D
>>
>>  .../ca-certificates-java.hook.in                   | 23 +++++++++++----
>> -------
>>  .../ca-certificates-java_20180516.bb               | 11 ++++++++---
>>  2 files changed, 19 insertions(+), 15 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 

-- 
Sincerely,
Yevgeny Popovych


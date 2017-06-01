Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94C1377D2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 13:16:20 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 99so4100143lfu.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=qnlkBP8NZ5KYg6VAw6CSrR2nyI84LTmMa7arbHcq76w=;
	b=WWWZFwB5iBN9uozzPessC/tudwRkxb5amepT6Y67TIIw374KADnmjBvMKSpp9jCuy/
	CJKy8KIRJqASC2ZkAMee3kGPS7LgHSsoi6G5HaAMO6GpZ4Hv7H/n2aeZ4vcBXxxMLa2d
	1QXNSPEBaXtiYHw5ARCwIyBW+TbyuirV47hAl3AfCzcBSQW9tViBIghD6cDeH5h+rSBu
	vaJTg/LPoWCdWrhNzFYb7KxTKXO/s5D0Jpcke4m+4px/3jsyzlTcO1zy9useV9OI1Abr
	vIuGSuepwraN7SX86kbwwPKBcZ5hXXVMzfWufen2wmg0nIeIXUayo4WCV0Vs9cuTiKoq
	n+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qnlkBP8NZ5KYg6VAw6CSrR2nyI84LTmMa7arbHcq76w=;
	b=nj6iSI/SFWS6gntyXOkaZ1FXVmDhjTo4w/TH2mc8TTGJMfJqPKx0vcuLIo4Kc3wvGY
	FnGf/5lFamVrPWPlMbE5oqFWfeFfJ1OFYshMUT6ALkz6zLCbU+8yXU0SywgbMM+55nBP
	ZRj/A4JY/QsdKFBO/tti3lGl3RR/1Gvwppc4/6R3hNud0B1IP+P7R3Cnk2VAs5ik/4oi
	TIJPuJo6uGd+eSBfj+jsngYZBhfMithetFPaojl9fptFrLYPS0FXgJuFJ5YAxaNy18D7
	ivE173BNpyw0UP/tqwIG1ABr1aEhys5FagFoKyV84QYaLO8atdT3Ehi9NE9yl43HUg9F
	yorQ==
X-Gm-Message-State: AODbwcCpJnuv3hIuwxUTnGtp1ce3xevbnX5aabvf3jFkHiv/itepoXif
	RMH0VVjVSwy2r080
X-Received: by 10.25.204.200 with SMTP id c191mr525334lfg.107.1496322981052;
	Thu, 01 Jun 2017 06:16:21 -0700 (PDT)
Received: from [10.9.21.51] ([192.89.120.53])
	by smtp.googlemail.com with ESMTPSA id
	3sm4420784ljb.60.2017.06.01.06.16.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 06:16:20 -0700 (PDT)
To: Daniel Mack <daniel@zonque.org>, openembedded-devel@lists.openembedded.org
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
	<a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
	<5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
Date: Thu, 1 Jun 2017 16:16:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 01 Jun 2017 13:16:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.06.2017 15:57, Daniel Mack wrote:
> On 06/01/2017 02:35 PM, Samuli Piippo wrote:
>> Parts of the chromium is built for the host and requires gcc-multilib to
>> be installed when building on a x64 host. I should have noted that in
>> commit message.
>>
>> My /usr/bin/cc is a symlink to gcc
> 
> Hmm, same here, but that's not the case when when bitbake is executing
> it, as it modifies the PATH.
> 

OK found it. I didn't have new enough poky, so the HOSTTOOL filtering 
was not used.

We need to find proper place to add HOSTTOOLS += "cc c++" to whitelist 
the needed tools for webengine.



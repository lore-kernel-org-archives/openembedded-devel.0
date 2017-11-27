Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 26BB47834E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:07:47 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id 62so8943172plc.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CW8DCRuV4amCyrcNjwjnHNRT4ZieOdcMdvAiA9/60k8=;
	b=DqcJS/E0oEe4W6HaSqxYbUP+m11RWDRT10oBs5QLDnEOF/QyRGhDzrfq18CNtQbhzl
	A9l7SsNGhFyZXEUKCB7y6O5FmfciXnbWJrdp0EPuGWxmUjpL/slINTV7sLY0q8NSYEFQ
	GLbaidXvs2vQeQWPMLO/AlRepZeFunn/58VKnzShBcVLpAf3ZYjgY03hHgfdgjz+wGni
	1n/mf4DDPn0zXC1TMLo731kDKLNXEKhGtCI7cJ/iaQYKsGk4grWCm60K0WR10osmKQ2t
	vXTlRlOb5nMD4J/zuDCWPQQziGVt2dvmdiOg00LX9iAIvvyEqJBxAXKIHRj/CKiPwfXf
	EddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CW8DCRuV4amCyrcNjwjnHNRT4ZieOdcMdvAiA9/60k8=;
	b=SV/KLHMnD4+DMZfafbFJXifs/jaCHGS8J8LCfLW1I4QGQNpBBg7/LvYY9sbMGiloPd
	uLICDJ2Lmu08CDQysgsEf4ZvQQrED9hbzgT5e0QjcwbHgk9aD1OsM6QXfsmh97heJyPz
	pjitywK3Md7XLosU2NIT+qBWq35w/fv/U2RMaZ+mAWd1SAykjZpTutstez7tqjhaRJYq
	bqkTew1bz5Vh2yaR0nEzO29J5+tYKtLoEyGzb0qcW7qfUeaa+CTJDJzdxJVsXH/G6z4B
	Da1blkpd4R5sU0zDMBm+HAh/rwL+p2FsIHl0RN83YD1ev2k7ZgDnTHtT8l5J7F4qxlxC
	Mosg==
X-Gm-Message-State: AJaThX4fLOvKDnx8c52qFTJWHpCSTgjH7nSKCt2xfT4nTDSKbDIl5CHN
	k8O7i7Q3UDkQAgyh/s9r6OpswG25
X-Google-Smtp-Source: AGs4zMbixAfDu/1hbiio6sbHF+ydZZ9NebizadiCBCiatOMNlm/MB4UhwLi9e0npOE8w0Cqpshik3w==
X-Received: by 10.84.174.4 with SMTP id q4mr4984653plb.306.1511806068935;
	Mon, 27 Nov 2017 10:07:48 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	k8sm40889025pgt.22.2017.11.27.10.07.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:07:48 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <mailman.12095.1509099493.1653.openembedded-devel@lists.openembedded.org>
	<d5b86b79-c406-7bb2-4558-4df02ec57e0e@easyarm.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5e5b9a5c-165c-1269-f3b2-16cde53ae072@gmail.com>
Date: Mon, 27 Nov 2017 10:07:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <d5b86b79-c406-7bb2-4558-4df02ec57e0e@easyarm.com>
Subject: Re: madplay support for meta-oe
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
X-List-Received-Date: Mon, 27 Nov 2017 18:07:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/27/17 6:02 AM, siva wrote:
> Dear team,
> 
> I have added madplay support for meta-openembedded. Please find the 
> attached patch.
> 

Thanks for your contribution. This recipe seems more appropriate for 
meta-multimedia, Please rebase and send again.


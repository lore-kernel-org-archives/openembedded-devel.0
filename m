Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4064D6025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2018 17:21:43 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi12-v6so5855553plb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2018 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fJVt6M8xY3nOtBKk/MLV/cYWFbVZFSI1ESb9sWwZVBg=;
	b=azqeL6ZLGDTzeBG1Or5sIKITruTRInqDxYw78xFESbna3ow2C9O4meaJi6sZUr0VPe
	FnKGI4WM6YKwgW3IVA1b1e0h5Bu5De33XorEjgzLj1KWk7BdO1dnK9UPrrjub2NvTY10
	JVszJz5FhfEG2CWS9m8COl1e3yzn6KsDo6gwS1caXR7hQ2HRxWrLEJisPnM6DJIjt+7l
	YlPNNE1KrvWQazSnZP6LTFzShFzV0c98xFFdZ/rBesKmJHNTRhOCMh6txRYqugxIJW55
	RU+UVofXlP6FtBs/dDjUeoq9xGiYwCLZnQqkh24stKPdHsqWgEC76HAbPTVSR1vsc5DT
	wPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fJVt6M8xY3nOtBKk/MLV/cYWFbVZFSI1ESb9sWwZVBg=;
	b=OpA01MjtFlGmaxIY+/TSt33AtmuSayh3B+aTEwAGL46dsNf5BeL24RnP8pjPigV0bK
	qiG5XSVnbvY62unKCmgqbQqgktL859VxIAELACg2ifGrwGoe8DWkuAj81xbfOQAJd2s9
	vkp7U8V5GTucz7NBZ5Fcb6D+mmySSXUw81Ax7ZF6B0szDWRcH/yff1ZnYDGHbBzVhMPl
	xKKkOhke9nqQkGtxZ0+I+p53MPwzcNA7FfSPHls51zkDuyhHETvOaUrl/JGGvTHkBma6
	V8BPO7VoZjt5echfNQlL/K+rDQcZUp/vXxTuNM5bYnNQWCPnAxrVgulXoBTWki8fofmw
	Jylw==
X-Gm-Message-State: ALKqPwdkXxuXhmjFJTmcP4v2njx0VfWhmhckr77XsfdkzMG22uFrBQQz
	Y3YBjbSeoLOeLs72xsNPQHU=
X-Google-Smtp-Source: AB8JxZoyW5U7hmCnim/Z3+jj3LBBM0/nUr0Xl2i9j4kBpGc+0VWzcj/1HZ1u6WV4A6lnxcEnD+Mz6g==
X-Received: by 2002:a17:902:74cc:: with SMTP id
	f12-v6mr10585747plt.7.1527441704869; 
	Sun, 27 May 2018 10:21:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184::5a1c? ([2601:202:4000:1184::5a1c])
	by smtp.gmail.com with ESMTPSA id
	j11-v6sm35160035pgp.2.2018.05.27.10.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 May 2018 10:21:43 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Joe Slater <joe.slater@windriver.com>,
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20180504220433.47694-1-joe.slater@windriver.com>
	<47b17627-cedd-6c4e-32a9-01f2ede4280d@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <24f1f694-dc48-a933-b8be-41ca81fec4e4@gmail.com>
Date: Sun, 27 May 2018 10:21:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <47b17627-cedd-6c4e-32a9-01f2ede4280d@windriver.com>
Subject: Re: [meta-networking][morty][PATCH 1/1] dnsmasq: backport CVE fixes from dnsmasq 2.78
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
X-List-Received-Date: Sun, 27 May 2018 17:21:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 05/24/2018 07:37 AM, Randy MacLeod wrote:
>
> Khem,
>
> Are you handling backports for morty as well?
Nope. That is on me still.  I should be processing your request this
weekend.

- armin
> This _is_ in patchworks so it might reduce your ping emails
> if you state that you'll get to the backlog over the
> coming month or so.
>
> Thanks,
> ../Randy
>
>
> On 05/04/2018 06:04 PM, Joe Slater wrote:
>> From: Zhang Xiao <xiao.zhang@windriver.com>
>>
>> CVE-2017-1449{1-6}
>>
>> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   .../dnsmasq/dnsmasq-CVE-2017-14491-02.patch        |  75 ++++++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch   | 268
>> +++++++++++++++++++++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch   |  37 +++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch   |  37 +++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch   |  37 +++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch   |  48 ++++
>>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch   |  73 ++++++
>>   .../recipes-support/dnsmasq/dnsmasq_2.76.bb        |   7 +
>>   8 files changed, 582 insertions(+)
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
>>   create mode 100644
>> meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch
>>
>



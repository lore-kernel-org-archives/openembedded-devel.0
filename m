Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16BD760635
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 01:58:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 84so576073pfy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 17:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=K1FZCv7CMrcyVWKfHDsN8r6cgjP7KYdw+Wsb9WnWxv8=;
	b=bGpTYPCKmOHWpQBaLSJ/9u/Jb2jbBd4RtnibEo8l5jX3PHh2s3dpwq5XTZoE8bW/vq
	ZVmxJhPBLJN4INeOf6+eh/ejWjFOg2vVSc5yjkqMfRj25w6Fh5cC82blcnfEnf1az1iI
	+AdZD+trLUXlrsXx258Yr3WaKKT2LR3yxnWsidueUgEaoKGJpc90itfEFuoXiExAfFGV
	2r6CUOV8nMbS5yOd2z/UTTE32F4XNHbfkaFN9j/kPMGSPrSxIgfLg8/jVsHAztyYZFad
	mcg7/eft7xj4rsI0HEzNZ4A0YYUH9JHqYLAts07tQbxvOoBARxYyAJ0twROsFdUomduM
	J4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=K1FZCv7CMrcyVWKfHDsN8r6cgjP7KYdw+Wsb9WnWxv8=;
	b=Wj7wyghK7ChMIcIENmIjtrj4It1BdR/+ARE4zfT012xeruo2RZ9e184U4x00Z5G2cC
	1D1o0fkCdTPMnWogxTSvj7FAl5vmiPJdG7/eJie3BPac00SH5sw7TpGU4VOaLYyQkWAw
	QEXmVKZ7No5IkFF4wOgdrdVtjCqPtnCuhHopTZ1yOnjPKoRmpgP+KvUn9l03E1U4nX40
	gN7O7JA5P+Xd/utnHRdR0XDMVex8PnX3T6BpAQeGtQn+SXRm9VGhg1pwGVtIJsxp/us/
	U/h2jH34TK5enqsvb9hTwxC4kUiUaks7UYFFXpqH97A6sYVqKhNHHREojl62kBvb0xur
	PNdA==
X-Gm-Message-State: APjAAAVgH9UTbrV/pISYbSonfkI29IIFbqtTFtbilLB38xCFM2cimxt8
	gB72SpE9SZcVXRZuw8Mvulfv2ENkfRw=
X-Google-Smtp-Source: APXvYqx/Vkv/dkiFipQ+zxbUQLMyAXw6lH2yqS+vOoASzeRBspJL6rVEm7HuZ+c3V4LSAL2UAb7zhw==
X-Received: by 2002:aa7:8191:: with SMTP id g17mr1754156pfi.25.1582682297260; 
	Tue, 25 Feb 2020 17:58:17 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:923a:5c32:ada4:3e27?
	([2601:646:9200:4e0:923a:5c32:ada4:3e27])
	by smtp.gmail.com with ESMTPSA id
	c188sm369582pfb.151.2020.02.25.17.58.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 17:58:16 -0800 (PST)
To: Changqing Li <changqing.li@windriver.com>
References: <1582544446-241334-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1so3CU_NMnOKGmUJsrgaUsAF+SKM5XeFQAoX4NrFzRv07w@mail.gmail.com>
	<fc47113c-82c7-5c17-139c-3ea747eecc26@windriver.com>
	<23aee0bf-a9f4-b002-8277-615dfa603b04@gmail.com>
	<2459deea-b48d-a24b-17b7-7965d5b72a02@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <d0220eec-83e2-ba74-4ed8-7636c79b756f@gmail.com>
Date: Tue, 25 Feb 2020 17:58:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2459deea-b48d-a24b-17b7-7965d5b72a02@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx.service: sleep 0.1 after nginx start
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
X-List-Received-Date: Wed, 26 Feb 2020 01:58:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/25/20 5:48 PM, Changqing Li wrote:
> 
> On 2/25/20 12:49 PM, Khem Raj wrote:
>>
>>
>> On 2/24/20 7:53 PM, Changqing Li wrote:
>>>
>>> On 2/25/20 12:40 AM, Khem Raj wrote:
>>>> On Mon, Feb 24, 2020 at 3:41 AM<changqing.li@windriver.com>  wrote:
>>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>>
>>>>> Fix error info:
>>>>> nginx.service: failed to parse pid from file /run/nginx/nginx.pid:
>>>>> invalid argument
>>>>>
>>>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>>>> ---
>>>>>   meta-webserver/recipes-httpd/nginx/files/nginx.service | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>>> b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>>> index 9a6ca96..65c7752 100644
>>>>> --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>>> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
>>>>> @@ -7,6 +7,7 @@ Type=forking
>>>>>   PIDFile=/run/nginx/nginx.pid
>>>>>   ExecStartPre=@SBINDIR@/nginx -t
>>>>>   ExecStart=@SBINDIR@/nginx
>>>>> +ExecStartPost=/bin/sleep 0.1
>>>> I dont thiink we should be adding sleeps instead try to lock the
>>>> dependencies
>>>> so it happens correctly. or perhaps change the logic in code itself if
>>>> dependencies
>>>> can not handle it.
>>>
>>> error info: "nginx.service: failed to parse pid from file
>>> /run/nginx/nginx.pid: invalid argument" is caused by race condition
>>> between
>>>
>>> systemd and nginx.  And this error will not caused problem except
>>> scary log
>>>
>>> This should be a known problem:
>>> https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
>>>
>>> other distro like ubuntu, fedora, should also have this problem, I
>>> can google people report this error on different distro.
>>
>> I do not question the problem but the solution, there have been
>> different solutions posted to ml e.g.
>>
>> https://mailman.nginx.org/pipermail/nginx-devel/2016-February/007961.html
>>
>> or ubuntu fix
>>
>> https://github.com/aroth-arsoft/pkg-nginx/blob/master/debian/patches/nginx-fix-pidfile.patch
>>
>>
>> perhaps you should try one of these patches
> 
> Hi, Khem
> 
> I found that both V1 and V2 are on master-next now,  please remember to
> drop the V1 when merge to master, thanks.
> 

thanks, I needed to refresh master-next queue anyway, I will drop this
at that time
>>
>>>
>>> ubuntu 16.04 use this as a workaround.
>>>
>>>>>   ExecReload=@SBINDIR@/nginx -s reload
>>>>>   ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
>>>>>   PrivateTmp=true
>>>>> -- 
>>>>> 2.7.4
>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


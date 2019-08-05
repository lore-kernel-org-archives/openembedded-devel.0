Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3EF07F2A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 07:51:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n9so33062744pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=z0LI09bzoScNxpoGFXkOZ80RPuAbrqbKIyXD+ZuQVKk=;
	b=vZuYR6IamIXjI7poptiCMpRRk5+WRKdq6jRm/nZoPwQRhib9PhyPIVkpF3GtXjFcZT
	Ha0nhvxqEc6ISMThc6bQqBR8yeBCGvZsgsZ2PApH3rYwUT9lkj3H6k8rcRnPZ0GVQ4Qz
	ifCzXTw6hPbE7M782vx7UCPc1txQ/hkMRRQB+cAuVZlU4Bu+ulNPONixYPOq6dVIxzGS
	8wzbgtWhEJl1TdVIjoKFaIf7IP829nFcJkv6JWXkaFU7BjnRhNHUs6uxfNzR9xgbHsKm
	9mnP4Bnkz1D80vZUZPrjidYkkExi7VuTNZ8BcIWR2Hv4MZUT4jBOQzPnkmE5mIAXY3JW
	G9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=z0LI09bzoScNxpoGFXkOZ80RPuAbrqbKIyXD+ZuQVKk=;
	b=fjDeso8TRUgON1LijihXCwKveBvpv4NpJtaeceql5Ro3Qdek1OurXAcYzMQkyEVDXW
	Va6xJTsjHMgTScIl2aOg9zcheUyxY6WvnlpQP7djwdoi7MYQF/RnBprOyNGLZxwUkk4N
	uhznyw73MpiNIoYUB27CuZ45JvFAB475XUrIGZXUIAuDt/HNHmDBd3DOLaeJA6yQcrjx
	03gHYvf0Yy5dcpx/STEcKK6uFqndSkgLmSBAfmn9KK+Xz6ZN89v/9npBQqCgY+oV+te2
	NIoAprar6uoZ4jqgdJbbdoJFF9XgL0NiiJQfGtpskMjEtD3v22QGiNl7kKBCv4yZNljI
	Kwxw==
X-Gm-Message-State: APjAAAXZ2pFZQgyn2HKb+/VQ8TJwuaLI7JVcYlaJXuQUGUJhN/Tsn37K
	8VQXzOrdxCZwc9hkzfwcWj+YXenZamY=
X-Google-Smtp-Source: APXvYqyuytvsRQRZnnZstfFbSuZ2HDFw7YwwuGp7VNh/5+GirlpRK6vFfJOsrGq2+WhA8BHWXdKQ4A==
X-Received: by 2002:a65:65c5:: with SMTP id y5mr133955680pgv.342.1564991464305;
	Mon, 05 Aug 2019 00:51:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::31f9? ([2601:646:8500:6bc6::31f9])
	by smtp.gmail.com with ESMTPSA id
	o32sm15638074pje.9.2019.08.05.00.51.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Aug 2019 00:51:03 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, changqing.li@windriver.com
References: <1564975877-276033-1-git-send-email-changqing.li@windriver.com>
	<20190805050644.GB4799@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <82841743-6e64-0106-094b-c152bef6964c@gmail.com>
Date: Mon, 5 Aug 2019 00:51:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805050644.GB4799@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fio: fix typo
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
X-List-Received-Date: Mon, 05 Aug 2019 07:51:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/4/19 10:06 PM, Adrian Bunk wrote:
> On Mon, Aug 05, 2019 at 11:31:17AM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix typo "rev for v3.8" in fio_3.15.bb
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-benchmark/fio/fio_3.15.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.15.bb b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
>> index c44075c..f8fa434 100644
>> --- a/meta-oe/recipes-benchmark/fio/fio_3.15.bb
>> +++ b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
>> @@ -21,7 +21,7 @@ PACKAGECONFIG_NUMA_armeb = ""
>>   PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
>>   PACKAGECONFIG[numa] = ",--disable-numa,numactl"
>>   
>> -# rev for v3.8
>> +# rev for v3.15
>>   SRCREV = "01bf5128d0581e267383f280c6a1dcd26517240f"
>> ...
> It might be better to just delete the comment.


agreed, I improvised this patch and staged it in master-next

>
> cu
> Adrian
>


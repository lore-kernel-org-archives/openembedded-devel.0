Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id D03A271A4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:40:25 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id t6so7870917pae.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2016 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=QTzJE3BkOjJVJ66aXNtTc+ytMd6cMLZxEeKygNCX4QQ=;
	b=cYWa2MTdvZnToRpFyf0l6cZpCr2Cj/aLz6djvmMgCIowCH9C1EELuNPO0j3EBPoSvu
	/nDeBG5K9ls69lz1XnLBrYEj07dwZ5kgY2eWRdSTpE2HrtUiWJ7nWBH27GauY+3kGzdr
	B3VniI/aIUBilmmENNWCB5O9tK/UZCjhuvsK7qEIfaCp1CUXk+latRjAzJnvscfWtRkE
	UReu1eZCxHvGr3rSHhagH0zCZYC1Pm99/HTiR7lh2a8ACpm761xBH+V3x+eOavl2sWG5
	PRlqAwbB+Efom4BbHQb+ftDxUv0+sKTrckTFiWiAHExynWwj9UhnC26tfxPvzdQQ6WYT
	jFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QTzJE3BkOjJVJ66aXNtTc+ytMd6cMLZxEeKygNCX4QQ=;
	b=nFmIBoreNvE1tC0nAypnwR4JRHNLljH5awrr9zUEH5p9OMpGiLk5A6A3mcSbKQBXVA
	3Yn+5w45a46E1Dl+FQxZIPA8WWY0Zl4Eq8YB2IjMQLXrU4qJ1njpASm2UnVSPU7+dQxX
	Fr1FMqbZj34CaIzmUsqj9l/mAjIAHrbtwAazF7A2AnJl8M6IJni8pXeH5C0GISKgClPo
	AS++iMa3jD9cQ/foX1uw27b7b8PYrJIB4i2otK62OLjqb37gqqM7dAh0ZsOhL0O/JU19
	YB5O67352+3HLyUAtYTTNIGsRyAwIh0A8ich9iLn2984KXHPwjBP0FlfHvdveLQxEGgV
	M6HQ==
X-Gm-Message-State: AA6/9Rni3fenBAhdJd0PB5b/ip6ateHuB5DDXZy50+lj6AL2uPDaT2SMd3gcJTobWptMig==
X-Received: by 10.66.165.72 with SMTP id yw8mr14197355pab.128.1475682026963;
	Wed, 05 Oct 2016 08:40:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2889:3f0b:1a74:f67a?
	([2601:202:4001:9ea0:2889:3f0b:1a74:f67a])
	by smtp.gmail.com with ESMTPSA id
	ta7sm7106555pac.48.2016.10.05.08.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Oct 2016 08:40:26 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20161003201702.9024-1-otavio@ossystems.com.br>
	<CANx9H-APXBh+4Jkc5p4MQ_rBz61sQ20Y+vr3TQkwvD542XzRCQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ff56fd83-f51d-9b98-251f-a4b23a78247d@gmail.com>
Date: Wed, 5 Oct 2016 08:40:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-APXBh+4Jkc5p4MQ_rBz61sQ20Y+vr3TQkwvD542XzRCQ@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-python for-krogoth PATCH] pypi.bbclass: Allow fetching without requiring the hash
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
X-List-Received-Date: Wed, 05 Oct 2016 15:40:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/03/2016 02:08 PM, Tim Orling wrote:
> Thank you. I was about to do this myself.
>
> Acked-by: Tim Orling (Intel) <ticotimo@gmail.com>
> Tested-by: Tim Orling (Intel) <ticotimo@gmail.com>
Acked-by: Armin Kuster <akuster808@gmail.com>

>
> On Mon, Oct 3, 2016 at 1:17 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>
>> This allow the fetching of packages in a backward compatible way[1],
>> using un-hashed packages.
>>
>> 1. https://bitbucket.org/pypa/pypi/issues/438/backwards-
>> compatible-un-hashed-package
>>
>> A equivalent fix is available on master in commit 7edad4d (pypi:
>> update the base pypi url to use the package info without requiring the
>> hash) so this is really a backport but without unrelated changes.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>   meta-python/classes/pypi.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.
>> bbclass
>> index 659e1c0..cd27cd2 100644
>> --- a/meta-python/classes/pypi.bbclass
>> +++ b/meta-python/classes/pypi.bbclass
>> @@ -13,7 +13,7 @@ def pypi_src_uri(d):
>>       package = d.getVar('PYPI_PACKAGE', True)
>>       package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
>>       pv = d.getVar('PV', True)
>> -    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' %
>> (package[0], package, package, pv, package_ext)
>> +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s'
>> % (package[0], package, package, pv, package_ext)
>>
>>   PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>>
>> --
>> 2.10.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>



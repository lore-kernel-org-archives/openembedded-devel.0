Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id F058A6011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 11:00:06 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n3so75239549wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elfin-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=cZEYmwG7JGN7JWFF+x+6gQLM0ZaCzCW8N3+qNzbEmoU=;
	b=PAOzJhHhQJmwUjMtdbJwcQxnZ0496LsBbq9+Vfb2IlHcDBHyTuSkTjKlE1OKEgQ5wG
	pqAw+sTrksPOVcn67Je6erA4RKAPZlAy5Mvumbi5g5ZFlQ7u+LsWaGczy+P8YKLPF2P5
	TSC0sUVIT57Bry7NqzeUgVrmC+RemAMs+i22VkQ/8h1HtFtWSdmXCgBp0dTNI8M/N4qZ
	s9QoTN7PT7iaWj205AesYvu2CwCAIiPp+by/W/W3z3VC1CSkdg0w3MU4H2xCFQjCc3ir
	M4MReVIXEs7zhVycz7u6HJny/2Xxt0kisd5bYpSVZzKxC0Inin93ULG7Zdny/IpxuDp4
	Oe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=cZEYmwG7JGN7JWFF+x+6gQLM0ZaCzCW8N3+qNzbEmoU=;
	b=ecOzX+Qy24jUSNdtUqAqkiIF5PeJqm5YipOB2b9k8m/EKqTblE+7twy8fDSz812d08
	YDPpoO8P+Df5Bm1DtFCR0370wkl5q0Gb1AjGPzHfUjZpcPE4G3GC6NUhcq/9/UnnSRIj
	xVuhsKiRuGX2LG51+tqODKDY9psRM2PSh5m+NDyqWECsa70BheG/8FU2gOuw+oYHD5Uz
	Rdq8zBEbEaL4RVd7mszLzJSJEqDRVwge8cjjvYCnCUlfj0hfjhtMy+L0Z6XKtgK53zgv
	WmoIzocZK7ib5luTT1NiMlJQ9517kRKObOSaYVpfye+uhkon3BTdNBdetVS4nygNK2cN
	Y4Gg==
X-Gm-Message-State: AOPr4FWacbqnRSJ/XwYDnHLPidbWVQMXJmGZ42XejG/ZqWg5aj48Ytvj6jRVOdtyMseUdg==
X-Received: by 10.28.17.211 with SMTP id 202mr8243730wmr.11.1461150006507;
	Wed, 20 Apr 2016 04:00:06 -0700 (PDT)
Received: from [192.168.2.129] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	r204sm9018799wmg.20.2016.04.20.04.00.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 04:00:06 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <571750DA.5010307@elfin.de> <57175267.3020504@mlbassoc.com>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <57176135.5040904@elfin.de>
Date: Wed, 20 Apr 2016 13:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <57175267.3020504@mlbassoc.com>
Subject: Re: [meta-multimedia] libav missing
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
X-List-Received-Date: Wed, 20 Apr 2016 11:00:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

It is being used in recipe for "omxplayer".
I have already renamed "libav" to "ffmpeg". Once I'll test it (and fix 
other problems if they occur) I'll submit this simple patch.

Thanks,
Piotr

On 20.04.2016 11:56, Gary Thomas wrote:
> On 2016-04-20 11:50, piotr.lewicki wrote:
>> Hello,
>> I'm trying to build some image for raspberry pi and one of my 
>> dependencies is "libav".
>> Unfortunately it's missing from "meta-openembedded".
>> I found a commit which says that it has been moved to oe-core, but I 
>> have also cloned "openembedded-core" and there is
>> no "libav" either.
>> I'm using layers:
>> - meta-openembedded
>> - meta-raspberrypi
>> - openembedded-core
>> - poky
>> (all of them on master branches).
>>
>> Could you help me locate a recipe for libav?
>>
>
> libav in OE-core has been replaced by ffmpeg.
>
> What recipe are you missing libav for?
>
>> commit 30ba23377ec568a58c43e466582506980b67baad
>> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
>> Date:   Tue Aug 13 22:30:03 2013 +0000
>>
>>      libav: remove
>>
>>      This is now in OE-Core.
>>
>>      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>
>



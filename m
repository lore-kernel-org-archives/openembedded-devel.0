Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 28F5175400
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 14:59:34 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id g14so924951pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2BF9EPq/38Byal+9L0ewkcLxJzeqPosO2ODlKk4rq3U=;
	b=FfJyBgyxyaTsifzIZKpeQIv/jcdefY546hBksArjUDRmW1pf5mpY/mZnJsZs6zDI5Y
	bDmX20QCD2pdX1MYHT5032ahPPiohUHJ+iMrKSWS/VuDaaFyczQ3kgWXaZ2/mQhzW8h8
	07I0DCqyRTGzxeCRf1fMxX9u3t2XYsVqTJyQJhzvXUV7hY7Am4OSYPwViQKeROe7a0Wk
	XSSJjoBaSnOcht6wVPO1V3tK6izZPxrv3+l/y+1X4Kuhy81mTE2OxYyuauNJEaCW3wvR
	H6ysgU2cr3NPLg0eo9w19UuZ+TvUqAQb1/Vw9r6C9HT7nVk+CJXeU5gUiFmLM2oDajVK
	aMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=2BF9EPq/38Byal+9L0ewkcLxJzeqPosO2ODlKk4rq3U=;
	b=LoVWeeGAunXZHacZlowZcBZH6lHigQG6J7xRLRz2MpLnjlg3zW2na5fl3IJ3C82aBD
	AFmgP9zDHxyn+zPkby1PlwboqqdeuchIAuNiDoqkfJstrsjNnhN0LViwvwaSHzEvYJ4z
	Zv487LWJSS/4bW39guvGzrgUvkgVguZLyFERSfBpRCsoPn4Ri+ZoPNYSrZ+/oMVyHKyN
	AVobo7Zk4LHtuMgtsAnUZYrx7Wnaii0md4yjwfWCYITVoZeHi6Sx0pT6CaxjLGZL11x5
	2+Hrypug3tagZWVKa5gqF6hL1vWL7TzxDGaPYQ9a5s9oajiOAkFEwScZGulftGJvtYdR
	6kyg==
X-Gm-Message-State: ALQs6tCapuwdOhgXbFi1oU5myhi1zv2HSLz7QXGkH+Rgul90bwq9pbBp
	uC/PdO9yf/HV96/oIIz7gBYqhA==
X-Google-Smtp-Source: AIpwx4+qV2xvWlKmmEaSL8TfH7+SZq92XvqvbWH/wEgYB0QtdDfKXJG177JSFYSCFk8O36K4azpEcw==
X-Received: by 10.98.156.91 with SMTP id f88mr5812182pfe.128.1523026775551;
	Fri, 06 Apr 2018 07:59:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:b0a5:8e4b:7c5e:fa8f?
	([2601:202:4000:1184:b0a5:8e4b:7c5e:fa8f])
	by smtp.gmail.com with ESMTPSA id
	b73sm18400272pga.62.2018.04.06.07.59.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Apr 2018 07:59:34 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
	<2dbfe46b-f90e-9f4e-d8eb-e93f969fb45e@linux.intel.com>
	<03145566-01b3-e823-d652-902c8735b357@gmail.com>
	<19620545-fffc-8c6d-9300-b958ca28b5dd@intel.com>
	<35823800-fc80-14ce-7ad7-1aa73eaa5f0f@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fe4115dc-335f-351d-8b99-b21fcc6294ea@gmail.com>
Date: Fri, 6 Apr 2018 07:59:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <35823800-fc80-14ce-7ad7-1aa73eaa5f0f@linux.intel.com>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.4.6 and add upstream check
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
X-List-Received-Date: Fri, 06 Apr 2018 14:59:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/06/2018 12:49 AM, Alexander Kanavin wrote:
> On 04/06/2018 07:48 AM, Anuj Mittal wrote:
>>>>> +UPSTREAM_CHECK_REGEX = "wireshark-(?P<pver>2\.4(\.\d+)+)\.tar\.xz"
>>>>
>>>> Why restrict the version to only 2.4.x ?
>>> 2.5.1 is beta.. I don't want to update to it.
>>
>> It follows the odd/even versioning with odd being the development
>> releases.
>>
>> https://wiki.wireshark.org/Development/ReleaseNumbers
>>
>> Perhaps you can use a regex similar to upstream-version-is-even so this
>> is future-proof?
>
> Yes, I think you can simply inherit upstream-version-is-even directly.
Oh, cool. I will have to check it out.
Thanks.

- armin
>
> Alex



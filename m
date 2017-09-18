Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF3B6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:14:58 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id r22so12732pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=szFShBqs63b5rb96JzbuwUsNZfmXy5uAAxlk3n2Ut/A=;
	b=InPb+6aBzzyOcWrhG+3Ypr4XpocK4WvKX0uEkrzxNxyJtNHMntsuW2IR1wMaODhfq4
	aE9Enhq8fFBYWstWvS4AXbrAEkZ/HDiX8wvgoxi0uThbflY7Tbc2x6sBzmSuLLUrqvFF
	wpzJC4jhL6vcKdOlSqCDQwQIFojHfnygl3dyQi+jENZ9G2bKuWeB4NUI+2bfR+X7769z
	1YO8Yv4wUFRbLtKzniN8ay7mpEc9kkkXqHySH1GNNuNN6HWYZ+l9s40QlwE5Vhm7xyxI
	j5fSBxWTM6hu23Jxozdlt/08TEBQg+6SwcFV+r4BNOXS7gcm8qXa83sA17O0e3CRNh5m
	0mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=szFShBqs63b5rb96JzbuwUsNZfmXy5uAAxlk3n2Ut/A=;
	b=SPbtc0o6eUA5um0nsce3wrrc4S2NCEIenZ9z08EbhRngZpPIWmDF+2H10P8y/4TePK
	82dLz5iJ/aJSuXN91AuB0hKYNFjKe/1RjPwoU/iOb8IvdjMLvHjq736LHXNnlCjeHPc0
	gqBZqC6rlVIsWwpEe0KRU/nzNIJLJsW1FPoxTpEzF2Ezj9OspDaKEjuc7sBSndMA7rAE
	yBcbAJZgp62hLN20tdQMWUMkFRn0SMmlqOqgKZWkD20H7UVH1jHDGkq4iG61OieRVkiL
	cZ1aMOV0u4fW+ubqy/03FzW3OsESwFF5RVhB1nYBzflVzzPmty6vXQmFmGiFvInYqfkb
	o7GA==
X-Gm-Message-State: AHPjjUjlQP2Eaey5OFdJPntWG/vKw26y+4xHeq7uO71Jn75MQJYxh7JL
	XI8is6niO6/uhg==
X-Google-Smtp-Source: ADKCNb7j1kp4IBzTVjB5JtUbCYagWUzR5I2FHRSjteT5sx1vz8GIL+3GHiBZhaPz7QKUy3Br8a4NsQ==
X-Received: by 10.84.210.196 with SMTP id a62mr25845253pli.356.1505769300204; 
	Mon, 18 Sep 2017 14:15:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6473:8160:c9a8:5cd3?
	([2601:202:4001:9ea0:6473:8160:c9a8:5cd3])
	by smtp.gmail.com with ESMTPSA id m82sm439987pfk.90.2017.09.18.14.14.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 14:14:59 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <a7f23460-365f-925a-f5cd-6b95159749c9@balister.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <17a36396-5e99-6d61-3f53-60765981e7f5@gmail.com>
Date: Mon, 18 Sep 2017 14:14:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a7f23460-365f-925a-f5cd-6b95159749c9@balister.org>
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: Re: [meta-oe][Pyro]Update Sip to 4.19.2 from 4.19
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
X-List-Received-Date: Mon, 18 Sep 2017 21:14:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/11/2017 11:16 AM, Philip Balister wrote:
> Armin, can you pull commit 229f824568406df354bc857b31989a7777d778bb that
> upgrade sip from 4.19 to 4.19.2 into meta-oe/pyro?
sorry for the late responce.

4.19.1 added three new abi's or functions
4.19.2 was bug fix only.

I suspect 4.19.1 is what fixed QT5 issue and should have been updated
when QT5 was.

I am still thinking about it.

- armin
>
> meta-qt5/pyro uses PyQt-5.8.2, but it also requires sip-4.19.2 to build.
> Updating this package in pyro would solve a build problem for PyQt5 users.
>
> Philip



Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 07DE07E067
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 21:10:26 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id r22so7251656pfh.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Pe6rk2yevWuCt+0+Me6DMYSZUSihnN6RL5K7HWgXgb8=;
	b=BFRGln1Msj5Iy0VbAlez18SK2PKDwd6FCqDzoVI6O8wAPcSqsbh0MHRTIjciCN5Ju3
	nuxBItreRM+5q9okeRv1JbD/p6YNYbDT05yOECOpW5+99WqhbdEjbroQEOn+t4Eu/e2D
	F2jHcoRJXLZS0k0MGHR+ZSkpZpVysRYu+MBWnJBGH6i1WuBaslv9SfK1uuIjtrXH9jtj
	o/pKB1LzZWVG+unEO9W7flv0K/Lh6/MSNKE6NN4ohkwhuQBK9u/akGGJqPopyS1oidi6
	R8LoFi6e8nawwzO96KlH0L1872fzlTdkgQRoEqV9DYCE+bIrXpHe5nFUc05ES/DClPnL
	rYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=Pe6rk2yevWuCt+0+Me6DMYSZUSihnN6RL5K7HWgXgb8=;
	b=sM3m/erxYXNqGI1JqPYT9bFC58CYAeDx2TI+gHAYfE9UpBMMUoDB9JnDisFoel8D2B
	jyaa8JHis0IKFV2uYd1jjIt8divmHcGPs0kKwOegz59fTtpBh0f6OR5lYnJzkJH/Vl6k
	kigmb7MlZ3z8RGq/ZAiBFiHGnTSIQLHnFM9upe8BlgsUUECa3SQjde86sSbNU0MLLIOv
	iJ05qSHPKu0VXXnNAW9Bd/roWRl8s/TnoJFWa8oJZoKLm2g+ef40x5kRrtc/+OlpNy6r
	dlPml6jVVDDJbxEoSMPm2kkCetvILBG1zgGIDLDE6K5OSN+heEqGXUL2S48ScnRtYOVG
	h36g==
X-Gm-Message-State: APjAAAUwrE3ir4nhbXG+mMxh2KIeTae5yA2T8ooX8F0mjqyFOTWlevZ8
	iRFs56At/aRjRmk7g8jIqFgQEmEM
X-Google-Smtp-Source: APXvYqwnLzcMT/oe41FQ3y1iV7tiyw8c5ggkMf8Hw+94GEnJjtHxuI6vvVzRFE5T23An9xulLqrKoQ==
X-Received: by 2002:a17:90a:2a09:: with SMTP id
	i9mr913202pjd.103.1558991427743; 
	Mon, 27 May 2019 14:10:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6833:552f:fefb:d39?
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	k22sm11876774pfk.54.2019.05.27.14.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 14:10:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1sr9T0K71M5K4Qh+K-PrFv1dn5L0aNpn2hkN4usLY5hDpg@mail.gmail.com>
	<f69d8e4b-1603-e599-a56e-2b65a0eeb27e@gmail.com>
	<CAMKF1sqWjwdsArsPO1D3Ky3dFa8pkAO092hqdKLsPzbKBJd3JA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d28b367b-ebaa-9fba-6e48-c62438d92bbd@gmail.com>
Date: Mon, 27 May 2019 14:10:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWjwdsArsPO1D3Ky3dFa8pkAO092hqdKLsPzbKBJd3JA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Delays in patch merges
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
X-List-Received-Date: Mon, 27 May 2019 21:10:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 5/27/19 12:02 PM, Khem Raj wrote:
> Primarily master if we have stable merges I still have one day

what is in warrior-next is good to go.

For thud I am waiting for any objections to the last 3 patch reviews. I
will send merge for thud tomorrow.

- armin
>
> On Mon, May 27, 2019 at 10:49 AM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 5/27/19 9:51 AM, Khem Raj wrote:
>     > Hi All
>     >
>     > I will be on vacation and traveling for next two weeks in places
>     where
>     > I might not have internet, therefore upstream patch integration for
>     > meta-openembedded layers upstream will be a bit slow.
>
>     including stable?
>
>     - armin
>     >
>     > Thanks
>     > -Khem
>



Return-Path: <pidge@toganlabs.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2A30D60116
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 12:56:29 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v123so2111264wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 04:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=reply-to:subject:to:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jtPTOwM6losjFNv8Y9K+rZYW3Rf75hGeh/A4lMZG0+M=;
	b=fiNE15SYCeU73+BvPxfqdMNCd/qWLNPkBU/RE4AVHXo3rqXNUDYOFOeWsLKoZTT4Ic
	jzvg1fs8poKrPJHs85ya3+6Cit476aE+82Aq0OGAHdSR3Ytvkvr41ReyvW/VUKJFJmik
	3hwNzdpNm2eazNAkKM7h14yc0pV3fgX6VITwzFubZIP3Q1Mc2tklbbWZ6FLc4bfNIVCu
	VZUu5XyOG/Y0LTiZ/x/s5JR8F6M1rQloUhwa/GLmUIBl4yAHFOSV9uw4OgxJ6tIhqL2I
	fxXmQWh2SZQ6vpxf9skQezjLhRpJH0gRfdKLB+1saLFCgJkBhaCouDQofKhRPTbt6ODo
	eRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jtPTOwM6losjFNv8Y9K+rZYW3Rf75hGeh/A4lMZG0+M=;
	b=rTMKUlm32QvDej6oN4Xg3RdAbLzljQXDjjv5nr0pL86OlaJyUrhRtJ3ZHgm4sBRW11
	1uEAkm5cD5lBj03fTwbmCVS1dQKcyLRA9sa88XtUgBgolNcCo3sSl7YcQHG/JuYJtr+v
	cfLrFY5yL84RrQG2J2u/puromAuGqulN3oEyvYk+IKsRB1tK6lhFss5KHNyeVu6lna1H
	cPHxi08OEUGKY1+VKlIISNM6plxxyJJ4uEANPYjRKqncezU2UBJL082m2S5PT26eu39s
	U+ic6V96YAzAZTeEUTUY9HIrw3n49sjLLCQcD8kdzqEXUX7xtJjHh9w1JAJvWkiBWi2q
	v+Jg==
X-Gm-Message-State: APf1xPCxPu/SANLGChYnA9nO7rtfnEZxaW0tP2gwCA8kFkSMAhfnyQMP
	xNXi6u6XFA3WiN8ojxvSNu4o5HSlE/8=
X-Google-Smtp-Source: AH8x224+WeYbdheag5Ae/hk4zy/GSEch3h6Wf0Rs4eGzb9EjoXAeOW5/kUIi8yqhoa+pH7HUq0WHbg==
X-Received: by 10.80.180.16 with SMTP id b16mr7903573edh.111.1518267390556;
	Sat, 10 Feb 2018 04:56:30 -0800 (PST)
Received: from [192.168.1.104] ([83.136.43.184])
	by smtp.gmail.com with ESMTPSA id f5sm2596748edb.65.2018.02.10.04.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Feb 2018 04:56:29 -0800 (PST)
Reply-To: pidge@toganlabs.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <014bfa20-b9c7-9a23-4fc7-ac515a3c3452@toganlabs.com>
	<f51cf26bd4424c64953d3f6590289180@XBOX02.axis.com>
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Organization: =?UTF-8?Q?Tog=c3=a1n_Labs_Ltd.?=
Message-ID: <d168cb86-2614-f3ac-0037-428f16f2c0b9@toganlabs.com>
Date: Sat, 10 Feb 2018 12:56:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <f51cf26bd4424c64953d3f6590289180@XBOX02.axis.com>
Subject: Re: [RFC] Using OE with Fossology.
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
X-List-Received-Date: Sat, 10 Feb 2018 12:56:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09.02.18 17:29, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Beth 'pidge' Flanagan
>> Sent: den 8 februari 2018 17:21
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [RFC] Using OE with Fossology.
>>
>> All,
>>
>> I wanted to make folks aware that we've released a new layer to do
>> automated fossology runs within OE. The old spdx.bbclass is bitrot and
>> we needed something to make some of our license clearance and tracking
>> easier to manage.
>>
>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-license-tools/
>>
>> This layer takes patched archives created by the source archiver during
>> the build and, using a utility we wrote called fossup, sends them on to
>> a fossology instance for out of build scanning.
>>
>> The impact on build times is relatively small. If you want to use it,
>> you'll need to install fossup (https://gitlab.com/toganlabs/fossup), set
> 
> Any particular reason you don't provide a recipe for fossup in the 
> layer so you can avoid having to install it manually?

Yes. Because a fossup and a fossology instance is generally something
that I just assume is provided (username/passwd/URL etc all need
configuring).

I don't see an issue in providing that recipe, though, but for my use
cases, it's going to be something I have already installed and
configured for my fossology instances outside of the build process.

I'll be happy to work up a recipe for it when I've a moment (or a patch
is always welcome).

-b

> 
>> up the fossup rc file to point to your fossology instance (all of this
>> is in the README), and ensure that the bits needed for an archiver build
>> are included in your local.conf
>>
>> Typically this will look like the following:
>>
>> INHERIT += "archiver"
>> ARCHIVER_MODE[src] = "patched"
>> ARCHIVER_MODE[diff] = "0"
>> ARCHIVER_MODE[dumpdata] = "0"
>> ARCHIVER_MODE[recipe] = "1"
>> COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
>> COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
>> COPYLEFT_RECIPE_TYPES = 'target'
>> INHERIT += "fossology"
>>
>> Feedback welcome of course.
>>
>> -b
>>
>> ----
>> Beth 'pidge' Flanagan
>> pidge@toganlabs.com
> 
> //Peter
> 


Return-Path: <rjpdasilva@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF8D560191
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 17:27:25 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id w107so2158111wrb.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=x+lmqYFQTQ7iof7FYMBYy8DCrqcdAqqDCKZF9C5k8bo=;
	b=PzjSZ/sPvRhEnP2LasO7InV9Mmc1rgCivsVXIqY8aFxKOvZjD3yUAdEXb9LN14hhZA
	R7JIJ2ycMtHOwVlnF1xDIzRRLMUOPZLSMTSr9+cpwC5TL/hI9bGPlCJ2nvRYsp0jfo9k
	ADRCzg6984jotwDpyEOa4q9QMLA0BC1qNhzVG4fjidFDRZa/Cs+wvl2EpxHEdbklbND3
	hio0tBBgt5B+tUb8bKoBfzaQIB2DIgU01hLD59L62t7ddmrimfPuz1dvsnIhOMV0JifQ
	SVw9d1wuF0zrX9syyA0MUW7d73bJfSs9myp22HqsFZjvvxoGtkOnfm8+dQ6XOqlBpvaf
	TicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x+lmqYFQTQ7iof7FYMBYy8DCrqcdAqqDCKZF9C5k8bo=;
	b=R0N4B5U8bMTFpOEXbbXapZdS7PCk4Kt7SlMSI8m9NeIhHKKFmbfDWbwUifWPap7NKU
	EGufMR3QDcmAZ5rIkERltwb0lrRsanQpBBDbIYOHWNxh/uFWl4xLGa6YIwHubhH67muD
	bIZylquBKojB19hP5LYbr0GMI1yM1oyotxZ5++tJHCu82cySNsMBYRKyuwOHiPLv14o5
	GszXsX4/CySFKpi6kT6SQCR57qMauvGul7GDnjX/sq0xUYcuvvdqOoH3Qv4mI3qUyUZ2
	GGU37ZtMRb8TthMZWd9uWs0Jr3ivCrxePiq9UXVjP9zSdhkLa+a/thxlopJUKx2dqmNa
	RNHw==
X-Gm-Message-State: AKGB3mJt6i8u7J03CLOcYanzHejXVHRzjUVUYCO5DOAtae5sQxCeLK3y
	wMyglBXkhTU1Bv9Tf0QA9vkprQ==
X-Google-Smtp-Source: ACJfBot+AufemrfCHUvAcFVD0aGi6zy6hvucmGO3NEhhWLkZYHt8wrR38SqydpUNkdeT4hlnn9erCg==
X-Received: by 10.223.192.65 with SMTP id c1mr287891wrf.58.1515086846423;
	Thu, 04 Jan 2018 09:27:26 -0800 (PST)
Received: from ?IPv6:2001:8a0:6606:9100:7f03:4efc:e311:2e44?
	([2001:8a0:6606:9100:7f03:4efc:e311:2e44])
	by smtp.googlemail.com with ESMTPSA id
	p90sm3462402wmf.3.2018.01.04.09.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 09:27:25 -0800 (PST)
To: Tim Orling <timothy.t.orling@linux.intel.com>
References: <20180104160623.23830-1-rjpdasilva@gmail.com>
	<C86C34FA-F934-44CA-8A2B-64478F87AD82@linux.intel.com>
	<048780aa-783c-21f8-d54e-afca1545d943@gmail.com>
	<1E32C484-99E3-4DDB-B996-2C85D07D79AB@linux.intel.com>
From: Ricardo Silva <rjpdasilva@gmail.com>
Message-ID: <959a3d8f-9d9e-bd45-083d-46a9605dab68@gmail.com>
Date: Thu, 4 Jan 2018 17:27:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1E32C484-99E3-4DDB-B996-2C85D07D79AB@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] pycrypto: Add recipe to have support on python3
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
X-List-Received-Date: Thu, 04 Jan 2018 17:27:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Tim,

On 01/04/2018 04:56 PM, Tim Orling wrote:
> 
>> On Jan 4, 2018, at 8:51 AM, Ricardo Silva <rjpdasilva@gmail.com> wrote:
>>
>>>
>>> Rather than duplicate the SRC_URI in both python2- and python3- recipes, we should add them to python-pycrypto.inc and add the following to python-pycrypto.inc
>>>
>>> FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:”
>>>
>>
>> Agree.
>> Shall I send a v2 with your suggested changes?
>>
> 
> Yes, please. If you don’t mind (it will need to remove the extra SRC_URI lines from python2 recipe, add the SRC_URI lines and FILESEXTRAPATHS to .inc and then add the python3 recipe).

Glad to. You mean the changes should be split over a patch series, or OK
to have a single patch with all the changes?

Also note that the .inc file already had :
	FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
so I would just change that to:
	FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"

Regards,

Ricardo Silva


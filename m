Return-Path: <rjpdasilva@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9857847B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 16:51:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g75so4670896wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 08:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=O2ejh6uytV8Nz2YUDoFq5cqvyMGgaPf6xpvE+sK5kVU=;
	b=B890XAD2dqBy/0VxedueXJts9z0Yzit9OqeGIQRrWosmdXPp9DNdfWe9jjoieEkRMV
	sxq6+CEyq1QIBMWy9o7Fp4jEHm0YzaXOuSln3ekreVEN77Fd9ZlJHQQ0Jsyi8Sme2grU
	v+HiEVQXHY6QwSkMhPYFSXLh0WSBGOCcuHM38RYk1b3TId3Vo5+ANL3FcvbkqCCqOcO8
	LTAIppxjAfuRg907cNw6UqsZlXN+Dcq6IFoavQOyAMmH7dY/xXnRq8NdbJuqGGU/cJ5s
	lmrFHntRMVyuGs2JMpn6G+cJVTHSGUo39Ai9Dr1K/zLIbk+b9PQH6QDBCrRFTf409p4q
	p5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O2ejh6uytV8Nz2YUDoFq5cqvyMGgaPf6xpvE+sK5kVU=;
	b=Yuhj8604eEeolGF+6jvMP/FGFxzI54UI96Q7WaUI0bWAjrxd43L6Xd/gKLBds5u1S9
	YBpu7UsokP5m7dbKBojn5Syj6E7pf/5ltCFb3BhzlDrW0WZ0bRS3sbYxytZu7ke7PNIN
	lPm2S33AOSRePMu2j2eHlc31iLPc24lqF2u/N2crdOXrc6twkhBk+STzneJg788AGiqE
	ghb5k9XFmQY5oN2h11Y6+0AuB2nM+RbabSdJNFiEH2/I0ugWFK/ovgyJFmOo5BWM7qsO
	Oz4i54nTwkGzPadDz3TALHoNur5j58vVNvfxm3NSYpvl8CV/oF3w7waGThzquxt4CpZO
	IkJQ==
X-Gm-Message-State: AKGB3mLaw47b4TwbKZdvRr5p4Ap7Rs+Hax0XfvcFVye49zquJD93TNgu
	XatSGPtTLSjF73gvcDJC4LU9JA==
X-Google-Smtp-Source: ACJfBotPO4p4OjilNZ0EHhVZFxe6ZD5FLDYih69T8oETQ2NchVNfLxTBL2z92k5xOKXpjJHr0jow3Q==
X-Received: by 10.28.198.136 with SMTP id w130mr71487wmf.75.1515084685096;
	Thu, 04 Jan 2018 08:51:25 -0800 (PST)
Received: from ?IPv6:2001:8a0:6606:9100:7f03:4efc:e311:2e44?
	([2001:8a0:6606:9100:7f03:4efc:e311:2e44])
	by smtp.googlemail.com with ESMTPSA id
	a6sm2617971wme.46.2018.01.04.08.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 08:51:24 -0800 (PST)
To: Tim Orling <timothy.t.orling@linux.intel.com>
References: <20180104160623.23830-1-rjpdasilva@gmail.com>
	<C86C34FA-F934-44CA-8A2B-64478F87AD82@linux.intel.com>
From: Ricardo Silva <rjpdasilva@gmail.com>
Message-ID: <048780aa-783c-21f8-d54e-afca1545d943@gmail.com>
Date: Thu, 4 Jan 2018 16:51:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <C86C34FA-F934-44CA-8A2B-64478F87AD82@linux.intel.com>
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
X-List-Received-Date: Thu, 04 Jan 2018 16:51:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Tim,

Thanks for reviewing.

On 01/04/2018 04:44 PM, Tim Orling wrote:
> 
>> On Jan 4, 2018, at 8:06 AM, Ricardo Silva <rjpdasilva@gmail.com> wrote:
>>
>> The pycrypto module sources can be used for both python2 and python3,
>> but a recipe for python3 was missing, so add it.
>>
>> Recipe is basically the same as for python2 (python-pycrypto_2.6.1.bb),
>> but using distutils3 instead.
>>
>> Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
>> ---
>> .../recipes-devtools/python/python3-pycrypto_2.6.1.bb       | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>> create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
>> new file mode 100644
>> index 000000000..2878c8599
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
>> @@ -0,0 +1,13 @@
>> +inherit distutils3
>> +require python-pycrypto.inc
>> +
>> +SRC_URI += "file://cross-compiling.patch \
>> +            file://CVE-2013-7459.patch \
>> +
> 
> These will not be picked up as they are in "python-pycrypto" directory (not in “files” or “python3-pycrypto”, etc.). This will result in a fetcher failure.

You're right.
I had a leftover files that made my tests pass. Should have tested with a clean tree.

> 
> Rather than duplicate the SRC_URI in both python2- and python3- recipes, we should add them to python-pycrypto.inc and add the following to python-pycrypto.inc
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:”
> 

Agree.
Shall I send a v2 with your suggested changes?

Regards,

Ricardo Silva


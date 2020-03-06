Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 05EEE61086
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 17:48:48 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j14so3253255otq.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 09:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=NUAEO03oH7VjfxxlEhbMVaooNGp2r5D8gxWXjnDm5dU=;
	b=icyqctGoOoGCt3lxmHCHioIRTmHSvyHtDm8aKNuXGmSIcd0CIHOJtdGDEJHk2uHzk6
	m7hVLAO7zAYMWLe9hpmkhsWMG82jx+/YPh21F2KC5CGRgrsN2TTpGp0b3bekV6HnsTkc
	fNafbeclEzBFtZuExRJmXLYrJ+sYMvX3TC0l/x2cuZcCI4Gv0dUCi8pL/PVtkHJ3cF96
	8r1oZi1zNXQI13wveuNXcIPhgKzxx3deKXLdyrcUWPXy75HPXAkBLOG198qrT0D/r+XQ
	zgRj1xh7qLnIgVHFcTCawhC46Oa9EOWeIKtaBxynt3UXWqQkfXVhXDSKXjiKtH7QOeel
	tNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NUAEO03oH7VjfxxlEhbMVaooNGp2r5D8gxWXjnDm5dU=;
	b=U4ylpfGX695prP6vzITgYc6j9HzKVMDTlDlZb+DBgkRZo3LVJ2OY5FHQe23ZbNVUsi
	sL1rHxFH0ah3tehnG4SGSewDbSIct3YBqvQRGhKMSIs1Y/19TzpaLbhNYzVR3ECvQV3m
	HZ53H2qm715tSkE3oTkcI55oObWom1mEvbqGWyjJU5RmGcEhEsM1T0p+vcxzafgBujWG
	xXIzxpuzC/IeZxy2cdb/IkxTjoqFfLlyf/5rWK5buBgYK3YkC+EMxP9sIWOoFftpOsMs
	6E+Kd8coFvIp69GvypiMXgP9OoHgOLsI2oJmphnB12qNWtdckMjKWVsKQiUk6r4w4TbY
	iL5w==
X-Gm-Message-State: ANhLgQ3MPGZd54w5tvW6Z/iuEx/u7NBXWR5H9Wob/jQAe06zKX8cOTfV
	c7zeYyYIjaCkl2Je638qMw9HjLqo1SM=
X-Google-Smtp-Source: ADFU+vsfDxYgP4d5G+PaaqGvxUVABSQd+eM8J5jgoQKmY6mB0ej1/aGDqm/XTALytQJA4T3yG2fUMA==
X-Received: by 2002:a9d:748c:: with SMTP id t12mr3334995otk.38.1583516929407; 
	Fri, 06 Mar 2020 09:48:49 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3?
	([2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3])
	by smtp.gmail.com with ESMTPSA id y130sm33302oie.48.2020.03.06.09.48.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 09:48:48 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
	<CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <8fe016ad-faf5-32d7-bf5b-61758fcc2b66@mvista.com>
Date: Fri, 6 Mar 2020 09:48:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqK87OAVsNfumC0TZC+6U80NJ4aWzCx45pU+NK33ax=pw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Fri, 06 Mar 2020 17:48:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/6/2020 8:12 AM, Khem Raj wrote:
> On Thu, Mar 5, 2020 at 11:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>> Can we fix mozjs instead?
> perhaps thats better fix, maybe it can made optional via packageconfig ?
> or marked incompatible if meta-python is not included

So that would be the logical thing, but wont that fail the 
yocto-layer-check, which
was the original reason for the change request in the first place?

One of the checks is that the configuration of packages is the same 
before and
after you add the new layer. If configuration changes in mozjs when you 
add the
meta-networking layer, that should trigger a fail. In this instance the 
change
is instituted by the original mozjs recipe so it should be legal, but I 
don't think
the checker is able to validate that is it?

>> On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com> wrote:
>>
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> yocto-check-layer/test_world failed since error:
>>> ERROR: test_world (common.CommonCheckLayer)
>>> ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
>>> /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
>>> DEPENDS on or otherwise requires it). Close matches:
>>>    python3-numpy-native
>>>    python3-pycairo-native
>>>    python3-rpm-native
>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>> providers.
>>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>> 'mozjs', 'python3-pytoml-native']
>>>
>>> mozjs depend on recipe under meta-python, but meta-python
>>> isn't in LAYERDEPENDS, so error occurred. Fix by add
>>> it into LAYERDEPENDS.
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   meta-oe/conf/layer.conf | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>>> index c537736..0ce0ad2 100644
>>> --- a/meta-oe/conf/layer.conf
>>> +++ b/meta-oe/conf/layer.conf
>>> @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>>>   # cause compatibility issues with other layers
>>>   LAYERVERSION_openembedded-layer = "1"
>>>
>>> -LAYERDEPENDS_openembedded-layer = "core"
>>> +LAYERDEPENDS_openembedded-layer = " \
>>> +    core \
>>> +    meta-python \
>>> +"
>>>
>>>   LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com



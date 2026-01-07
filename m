Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D38D0D15F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:20:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12949.1767810005966068161
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fq5GE7Em;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so19721385e9.2
        for <Openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810004; x=1768414804; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlYVAXGCQQmb6i2mjaDXoTAdKBQ1hs2Q4TcsB8mW6Yc=;
        b=Fq5GE7Em40/U9yf7a/XPNld5htxiv1mbVamQBptlIDM02ZGeBPrQbgeH/Q6vUbd4MC
         JOmd2kYcMI5NPzgrGZcaIIYqE/Z6UXUfBEM+TKBC0UxRh+s0mHqjk97+baDMmKSd2kH3
         ue0ZnRRLB6pxgxMrOyLwkqqLIGhjU+kcpGYpSv1Zgyf94kxk5bYZvYqC1MDRDjpN5CVe
         tm+rZX4YOFsWdtkFGUou+si13hBfAOtS0pTSb+n/EO9kYNxomZl0N7pkhilfSxadvytY
         BLfKJE4RKyrABq7A1czJC33qfK8ttRzceHYHyya3+tLkArFb+wsmfnEoAhUACOXced2G
         7RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810004; x=1768414804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlYVAXGCQQmb6i2mjaDXoTAdKBQ1hs2Q4TcsB8mW6Yc=;
        b=bcW3SwZweP4x8NWRJPJmiWnnrVAaQE4sYb7p4YykkGbSfOx3SLMzcvDYhFsF2PkN5a
         mxK8ENJTZynuFt7lVIr9cP8FHJ3zuPFwEA7fzP0WaUA2dYlexvYD8Ck0lOmNRjjwt+eX
         QyEvFPJgnQBVpEAwXWiWAiSdMeJSZimMzpH1YV8iQSoji3rsmtmr1dmltZh1zJhuSW/p
         0uHBqs244dInESonXhjAt/Daq0IV5lGlrz8rRQedrlALwq6e4B0deDL+WAipxYfRnJlf
         1CvS/ebijQ4OqkhftgrMhp8xdseRPoeIfF/1WUDRhcslKD+nb9V03ueitPI7XWmGl2H/
         uS6w==
X-Forwarded-Encrypted: i=1; AJvYcCX6BLlhMQg7lNX/WAKeBW4HuZyMTHJL9I8Z0vh0WJRIekI+8nU90Y4haQoz9NVv3hnkwgHuhL9uMUU4WZKGa8IhC5o=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3z/Ml6+aozBtBrwtJMMeNEvVpK0J0R6NrLRPxdTQ0UuE+Vwu6
	mxdAwTe0fX7yyxGb4gvdIIa22bKNwWngYXR7taTJeGzhcRVUZLiT4w16
X-Gm-Gg: AY/fxX7PCsv7eWfyTJhhzwZJ9LRTe9FCQb9sdOOZjbHzVlggFpVG/KISvU9HONIguBx
	kZDv545PbWarUL0LHgqwB29Ctd2o2tOQbItPws114vXEEagJQXuTyzKwtzYAWpCQwxklh8qvIJj
	w53mDUYIGn26Q+yZfj99FTwfaTFb97gqZY1iud7NaEpzseblGhSDXco6zmwYbpPthpabjxGmv1u
	UPStwG3fwtSvydYj5WJ9Vu416+8irPgaBBRZrfFlpOgs07PxMzwCD8UCb2Yw41yCnKOq5SdodEj
	01e4GROIjTIBiV7KnHOPfdc5pX4TVCT6iYor2eB5FOPR7jBO1+pSBiGULinPZq6SkMXF2u0K0v3
	V5cwd9og3hRsIG8Yc0K8hZUNQDYj97RAVno4PzZJnakdVNUWV3oSaWeqZYN4762kfCPaFQlCGA7
	Yqv5aSQfwEv2hI17/W6eY=
X-Google-Smtp-Source: AGHT+IERNZNn8x833AhqEXbjS7rrcYJK6VI0s2gE5jPW3U6O0ZSfGsbMhavh559oCwMInhbD8Uhd9g==
X-Received: by 2002:a05:600c:4fc3:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47d84b3b9e6mr50311125e9.23.1767810004023;
        Wed, 07 Jan 2026 10:20:04 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm18915765e9.0.2026.01.07.10.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 10:20:02 -0800 (PST)
Message-ID: <64e23f8e-420d-4735-81f2-ae6f995b2c90@gmail.com>
Date: Wed, 7 Jan 2026 19:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: python3-h2 ptest timeouts
To: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <Openembedded-devel@lists.openembedded.org>
References: <CAMKF1srHzaW_tz3+JshMYrEve6KbxVk9N3PBC05vx3hcqx+TFA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1srHzaW_tz3+JshMYrEve6KbxVk9N3PBC05vx3hcqx+TFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123232

On 1/7/26 18:48, Khem Raj wrote:
> Hi Gyorgy
>
> When running on slower emalations ( without kvm ) e.g. qemuriscv64 one
> test
> fails like below, I think the timeout should be laxed a bit to ensure
> that these
> are considered.
>

Alright, will take a look at that.

> + Exception Group Traceback (most recent call last):
>   |   File "/usr/lib/python3-h2/ptest/tests/test_basic_logic.py", line
> 824, in test_changing_max_frame_size
>   |    
> @settings(suppress_health_check=[HealthCheck.function_scoped_fixture])
>   |                ^^^^^^^^^^^^^^^^^^^^^^
>   |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 2234, in wrapped_test
>   |     raise the_error_hypothesis_found
>   | hypothesis.errors.FlakyFailure: Hypothesis
> test_changing_max_frame_size(self=<tests.test_basic_logic.TestBasicClient
> object at 0x3f9769e580>, frame_factory=<tests.helpers.FrameFactory
> object at 0x3f9696e7b0>, frame_size=3623515) produces unreliable
> results: Falsified on the first call but did not on a subsequent one
> (1 sub-exception)
>   | Falsifying example: test_changing_max_frame_size(
>   |     self=<tests.test_basic_logic.TestBasicClient object at
> 0x3f9769e580>,
>   |     frame_factory=<tests.helpers.FrameFactory object at 0x3f9696e7b0>,
>   |     frame_size=3623515,
>   | )
>   | Unreliable test timings! On an initial run, this test took
> 638.89ms, which exceeded the deadline of 200.00ms, but on a subsequent
> run it took 153.78 ms, which did not. If you expect this sort of
> variability in your test timings, consider turning deadlines off for
> this test by setting deadline=None.
>   +-+---------------- 1 ----------------
>     | Traceback (most recent call last):
>     |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 1200, in _execute_once_for_engine
>     |     result = self.execute_once(data)
>     |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 1140, in execute_once
>     |     result = self.test_runner(data, run)
>     |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 824, in default_executor
>     |     return function(data)
>     |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 1097, in run
>     |     return test(*args, **kwargs)
>     |   File "/usr/lib/python3-h2/ptest/tests/test_basic_logic.py",
> line 824, in test_changing_max_frame_size
>     |    
> @settings(suppress_health_check=[HealthCheck.function_scoped_fixture])
>     |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py",
> line 1031, in test
>     |     raise DeadlineExceeded(
>     |         datetime.timedelta(seconds=runtime), self.settings.deadline
>     |     )
>     | hypothesis.errors.DeadlineExceeded: Test took 638.89ms, which
> exceeds the deadline of 200.00ms. If you expect test cases to take
> this long, you can use @settings(deadline=...) to either set a higher
> deadline, or to disable it with deadline=None.
>     +------------------------------------



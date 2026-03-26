Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD358109E549
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 04:41:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40675.1774500083886332341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 21:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VQ7Cmw23;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so3759295e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774500082; x=1775104882; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3AOmqw7dFF5H9rJCCqqZUs5pjVbqLpcDf1DlHZkHi1Q=;
        b=VQ7Cmw23zP/LLdJ2o5FJmGFtBvSSbtLAXHFDZKdfAj777Bla1Hpt0R22cP8E1xV072
         w6yHpIB3IDWrVE675hAypco9pBp1WSPmeBCnsWnp3Y/Rdx8WzdyOreFW+yNgWv8koKuR
         WnvA+/W8c8HG7Ts19a/++5ARzkoJjrSgyH7ochMGemhc5KmqJzhq241+PagqQVfuGQeP
         XV24whgFAUAatkBwQk+skWtz8awVRYRso7G1Qatkm5mGovsc3bLamPOtkBjw+OaVHzcl
         6QNHw7T2GBnYPONBCilc7Q0hpkxlXZrTSWhi6RlazMR/00kjCjosF3o5ZbaCB6FdA6se
         aJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774500082; x=1775104882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AOmqw7dFF5H9rJCCqqZUs5pjVbqLpcDf1DlHZkHi1Q=;
        b=Go/TnBB8dgnbd0tsEUEab0cQUNmiXW8S2zkbqvJ/bpbx4zJz76lwW2jlKJDHmXJ6X4
         cFCkPJSkFrM5TzeAogwt/Mw2owHen44Ux7BK1F+vOD0XTFMFy5y0b/3jLLsA5QR+d1Q/
         isnIahTAq9fCcCbroirRY5Kz+Fgd8DPv23T1B0GyUwTHCnl82XnbjyGJ6qiuO55LWql1
         xsC1hekVznLcwwYBdnS7yrcpWpgIuC6K2PQ5CqUyYYGivoXj0Q9/WPrVki2+M2/yDqvu
         YCOTeYagqTk6zhvQyL/L5I/nlhwMeYYQpzCepxoGdoFh4gALeBkKxJkcCclYmuxaID30
         pVWA==
X-Gm-Message-State: AOJu0Yz0NblRlzgQccI9DgxvBCft3MtbnDguRMkbADmr3wf30cjMS4PY
	+IKyH97kynuB3PYlrLdfCMjHOXmrG7i4CI2nnKoR9k2awcUsatS66NQd
X-Gm-Gg: ATEYQzxMK/qa4QSH9Fil9lmUsYoqeTCYWkWcb3RGbHMVsIe0Q46JZ7kpJ/zoO5zcr3U
	i/Aa0IE+cT05OJWBbyyqi5WbLXU7k8mWeQuUYQEBPjD14pNhpula/NfSWOYHjz1pFG8DfaJZBDw
	j9ttDKrPIJHWlL5DcoiQAOONCTjrscus8DH3Gq7+jUYaRGQo+2zumgKkOuSxFxv+7K5IUwm+f1s
	og+2HRM+YAfNUp4qF7wlL7vWVM2x1lH4E1HBvYyYeAXQ11xENCO7GfQ2k6djcMQv1qB6b1LuXxY
	GE5sW36CZtp3hVs+gs1NieFdWgpwRxHapGxNYpRYojrhBJEajsXW19iun+wAluyq9KhmEOWB0Mb
	HZDBZdp41XN5l0EmgVaKBUqoR2OGJTz7y2yZEPsYgzlGM23u0jdxENaQT3gEXYFu6Lx0L+s7RX2
	Q5+FFgmqTKS7N98XZyO5QJlW830u9NoR0Cg2KV1UrMjbQ/WRsjyXBP51Q=
X-Received: by 2002:a05:600c:4e87:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-48715fcc068mr88945015e9.10.1774500081923;
        Wed, 25 Mar 2026 21:41:21 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fbe6045sm10372705e9.4.2026.03.25.21.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 21:41:21 -0700 (PDT)
Message-ID: <23651aa8-235d-45d1-a6ee-41bb104899d0@gmail.com>
Date: Thu, 26 Mar 2026 05:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH 03/15] ntpsec: Support Python
 freethreading
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
 <20260325122046.1211090-4-zboszor@gmail.com>
 <CAMKF1sqHJVMypXDWmi0=of8V8iy=U287rB23hE5x-8vCYvoBXg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1sqHJVMypXDWmi0=of8V8iy=U287rB23hE5x-8vCYvoBXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125635

2026. 03. 25. 17:35 keltezéssel, Khem Raj írta:
> You forgot to mark this series as RFC since it is dependent upon another patch series 
> meant for OE-core. Please ping here once the oe-core one is merged.

The cover letter was marked as RFC.
I hand-edited every patch in this series to add the sublayer name,
since it touches 3 of them. A single --subject-prefix wouldn't do any good.
I just forgot the RFC for the patches.

> On Wed, Mar 25, 2026 at 5:21 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>     Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION because
>     the former includes PYTHON_ABI. This makes the python module
>     to be installed into the correct location.
>
>     Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>     ---
>      meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb <http://ntpsec_1.2.4.bb> | 4
>     ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
>     <http://ntpsec_1.2.4.bb> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
>     <http://ntpsec_1.2.4.bb>
>     index 9704e2d15e..acde62a493 100644
>     --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb <http://ntpsec_1.2.4.bb>
>     +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb <http://ntpsec_1.2.4.bb>
>     @@ -50,8 +50,8 @@ CC[unexport] = "1"
>      CFLAGS[unexport] = "1"
>      LDFLAGS[unexport] = "1"
>
>     -export PYTHON_VERSION = "${PYTHON_BASEVERSION}"
>     -export PYTAG = "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.', '')}"
>     +export PYTHON_VERSION = "${PYTHON_MAINVERSION}"
>     +export PYTAG = "cpython${@ d.getVar('PYTHON_MAINVERSION').replace('.', '')}"
>      export pyext_PATTERN = "%s.so"
>      export PYTHON_LDFLAGS = "-lpthread -ldl"
>
>     -- 
>     2.53.0
>



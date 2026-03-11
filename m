Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE8B1062866
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:13:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18867.1773227609492266583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W4ptqQr+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b9b190easo7256925f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773227608; x=1773832408; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWEB8zPEjdZCnKf5w9RmTYwoTCerhd7BLY1cai0/yzQ=;
        b=W4ptqQr+JQFcAim422xQzlRpp8SFcJ6hDozOdBYB+PlFP+2ty80IVKHUq353zY97Qr
         /jw43DUrU6gxaJku6dUbLfMflalYOI6usbni2ZE+KsDm3MpjEuXSiSbSv5ymCiJKim/y
         GZTbkJfioxY+mjjXjyoBgN0jy5+Jre12kieNLmrIoCwMYidgmTXw58HCZiUT9Qktwraz
         rxsdgctYZaV2XQ8tKvJcu4LwqZrIx/yY1WnLOqMR5TGTLx5x50yBNwQdHeLoLjmhb9mu
         BumUXE0OMKLm4Eb3TBFiMH4/sLG1XBPNUtu1VQNSeZKdhQphVedUjoY3oT+9V9Tw+qR3
         /XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773227608; x=1773832408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWEB8zPEjdZCnKf5w9RmTYwoTCerhd7BLY1cai0/yzQ=;
        b=u6gSzYF9Tc/gMkKfNKUcFwL7Z1DOoL2QUtZhA0BbOTTUXGs3doFRo1bD5rHhUARjd0
         6AW30fq6SbnpvfGBUmgfabxw+AvQVS/U6dmNMcDFDyxFi9NU3+dcf/vDfUVtna6LUPZh
         zmy2LOndujPxAvBd9gXYOxZX1ZsDiIHx52HfKYtcSjdzajAaGa4lZyzuZcR9K8isl32J
         orpOdevpDRjE2BYWh8K0JLtTwlWnffo5Q+IAyYbjGZP6vTlYF8gPOzcDiBli7gPoDqL0
         fCZZqjJPYBwr1ARbaMVbYaSI7sCdCnvpJ2kx+nEaOJkPRV9yi+6ErTR0kqLGkPh3/LPU
         +Tpg==
X-Gm-Message-State: AOJu0YxdSWNG+auTxKxPlFWefuFh5Efv7MH+iM/v1tMmwadQttCiu5cv
	InQprBzD4UdL3QWQU7RM2xYhZkx0tZ2QMlSwX85VqOTyIrvovDdxJTMVUPocyw==
X-Gm-Gg: ATEYQzxrc4zjyScmFPN32I+V86UoKme0J/EM2UHZiQQiIWfQA8wb2Nm0spifh1xe4eO
	5TUiZgHaEpJbzzZ+kLWsuv8+zVtOjhFhr6pBHvb9NpgV34gR+2Q0loFHBCsa66X8/EFLJR1RLCD
	QTeIhpjSzikjX4zLgO3h/mo0YUUOKeVt0Uy8I8GAf1HqLrgdpTuGZseVkPz+E3YS9mbyWpV9n/3
	eYySSNTbwJyuob0JB4cop8SIaU8e2aS0Jge8CXA/hTT0SwVeIo6cuvnTX3Yoq7hKWmMnntE2xWZ
	dQ9H/rvZ2bIjLzkE792IIbm8mPOkH45kKcfMmqFN/zhklyawAFsQcUOXob3djJXOpZakn/ifIyj
	GRdkMXhuV5b2cmn7fOWTTe7lOscLngMVbiJQhWh2yJ1xs+1NedZWx4D6r9HxQhXfKB+yrZJ9Nai
	4iJjw54cL1yrv2uF0cZlZ2xN77ub1f5SAcWZahjjaosA==
X-Received: by 2002:a05:6000:26d2:b0:439:ba75:7db0 with SMTP id ffacd0b85a97d-439f81f130cmr4172838f8f.1.1773227607699;
        Wed, 11 Mar 2026 04:13:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f8200606sm4885416f8f.27.2026.03.11.04.13.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:13:27 -0700 (PDT)
Message-ID: <53250fbc-9ab2-4933-bef3-d6219b241f6a@gmail.com>
Date: Wed, 11 Mar 2026 12:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/2] exiv2: patch CVE-2026-25884
To: openembedded-devel@lists.openembedded.org
References: <189BC508519C4FFA.2412760@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189BC508519C4FFA.2412760@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125084

On 3/11/26 12:11, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25884
>
> Backport the commits referenced by the NVD advisory.
>
> Note that the regression tests are not included in this test. The
> patch contains binary data, which cannot be applied with any of
> the PATCHTOOLs in do_patch task.
>
Though I couldn't add the test to this patch, I have added it to my test
layer, and executed it successfully before sending this out.


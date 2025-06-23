Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2FFC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.15816.1750671445549727077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REXRBQU3;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-609c6afade7so9204594a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750671444; x=1751276244; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+cDu40cES/96E2aZug2Wr1Agl13XyGDUQdU4XZ0+5o=;
        b=REXRBQU3g7gtuyTQN78wt6cL771zPGPdLrh6F4xcsDfrQrCFrX7tusEJNOxNOhxRFB
         uhTHlovfZlGsAng+LSVWkffSXp0PwPfIUA65nPylV6XHPqPM+UbvvLCXcg9wn7llLQ8+
         LBvEeCMm6/L2bB3z8R47cuoFZ/kDOjCQavkytYDUYC4ildux3UKVu0JULPQI4/v2B+Ck
         YlJaf04g4zgqKV+qg4w9Btzg6pnN9sTHJ25UcAsFpJHQNS1EsrPP57XAFnnZAuf+5IEy
         SwhATVOUWvwPuuPffdsvLm9ZKl3lQyBB3Al8Lp+sWbzmR+1ve9+K/qWXyA5cCaFHJPx3
         PHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671444; x=1751276244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+cDu40cES/96E2aZug2Wr1Agl13XyGDUQdU4XZ0+5o=;
        b=O1fzvRvTI/A8tmKmEShpyXphYroRx5adKAsTQISJO+VfS2KjMytq6/qANCvtR6xxX0
         Yv4933mWkurPwW3O2kKEhv49Qz+0GaN78qKApyf2uqBYnWGHAdLMpms0jy4Q6vKor1T7
         9x3z+2uBHRc8yBHGo6XV4p0r1KJw7eF+McKmzGEaUwiH1sLBzyr7/YCFN93omK+0cr7Q
         G5fjlxIyKjiYYoPNMnnSVr9H+Gxq/dYWZsyrk75V6DVbtxNboKM3wp7TXKyjf0lEy69r
         83fhuhjwgYsglYb/4D5VnX15Zh+B7M8p6S+WgOmEq6mFbNRlxghwi6R+/KwFtMdE2sQg
         hWkA==
X-Forwarded-Encrypted: i=1; AJvYcCWPrR32mbh2UMbM4ivcHHAiOnjcNnZr1XaFk/i8ZtlEJPlSB7olH0mFoGYIHx9I26OV6Yj2jlYDB+lMUNcsSC3jwnQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxNCCtIOjroAC66pp4PCOlPw+lT3DkjsWL+ZWWaOajmwQVtyZl
	Gm6/Agy9e8sG35ZFU1IpzwD8hkfFFVCDQiMZy7s7B3W5IH43yvgL1XUx
X-Gm-Gg: ASbGncsK9zNYK5NaCNz9x3GOEuO2ebMN/ItNgZqeeZ7o19vsTNSug7HosQBYkZrCk3M
	gRh/DzP39gI4IhwATLpLHisUgjjsMVDeZKDAJKBIZG0UeQWydqArBOAtN2T0XMLsEmgCB3pm5eY
	b/FXY/vyslf5cNyMdIL2K+O9+/BtQAs0S/W/E47xM75Z2KG0AufBFSvuQ4kWCVuhWfC3A/8ynfX
	m29qZSrD1lKTPn9xL6bd7oiu7x2ubakboMuZx3bngRCKXUaayMOw1o+qOahkW8uZ0kXpThK1fBE
	vr85b0Cf/9BdPnPFD8RwYPVcRJ/9MoEaUK0jLDVo0ClEvaKFjHXyXNxf2UkW99Sfi48VQA==
X-Google-Smtp-Source: AGHT+IEH06Fd7AF8m+MH7zREQS1oQ3hteUQphIvpj7SKMzIeHPP0ekN5mbLtzNBcc+KKUP/H+3pLyQ==
X-Received: by 2002:a05:6402:510a:b0:605:390d:6445 with SMTP id 4fb4d7f45d1cf-60a20a963d0mr9747808a12.6.1750671443653;
        Mon, 23 Jun 2025 02:37:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbd8easm5737552a12.67.2025.06.23.02.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:37:23 -0700 (PDT)
Message-ID: <4a01efbf-5b84-4e36-a830-180d43ea720a@gmail.com>
Date: Mon, 23 Jun 2025 11:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] influxdb: Use GO_SRCURI_DESTSUFFIX in SRC_URI
To: christian.lindeberg@axis.com, openembedded-devel@lists.openembedded.org
References: <20250623091243.2256836-1-christli@axis.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250623091243.2256836-1-christli@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118069

On 6/23/25 11:12, Christian Lindeberg via lists.openembedded.org wrote:
> Use the GO_SRCURI_DESTSUFFIX convenience variable for the Go main module
> in the SRC_URI variable.
>
> Change-Id: Id7a1f476c880b92b6e1eab057a9fc22875f0114c
>
Signoff seems to be missing


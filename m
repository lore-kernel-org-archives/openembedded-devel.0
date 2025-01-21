Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF54C02181
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 00:37:09 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.5565.1737419828481829103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 16:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3X1VAG0;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so7814299276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 16:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737419827; x=1738024627; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SPt7ZHhPjDZkmuXPRFmTOenuP4ikF1Y9nIPf1E3vYgM=;
        b=R3X1VAG0diAif/ymJucPs6jV3r4pGp2BZjEDx2MAXxuGgN546B3/yCFts03aDK2L51
         x9RkZC6/YcCOPCEl1MgoK3wUMa0zRz1hGZ0/jkDXd+ioPscSewaEA7tNatWpPsOPSyWy
         JY11n0q+FKGX33HymxG+GHuxGHu+Su+yZQuOCa6vSv7J+K9dP6q21T0IPkANZJ9DsmNk
         Jq2g1OjTyTyKwayn6wzgqjLabRUdKBUscLwVoeS1CWyFy1WqLDatvnjw8vzrAEKuUrR/
         d3u3YZ6SopWPVMkNriGXcivgYg4OHt6stesDGpgP9/Ratv+oBrCbeTI6+i4bkPwRbKQR
         K5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737419827; x=1738024627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPt7ZHhPjDZkmuXPRFmTOenuP4ikF1Y9nIPf1E3vYgM=;
        b=vy65yZ1gMWcS7yixOQ74poqTCzWnLLmhST8WpMaSDSYs9+TQhaTdVn3Me6nvGiAxGF
         o9RxFGDYLHDlc0iDDKGuuDl9XDGlD8kYi0EpcLzFGFUEu43o0erBbTL+Ysk8mLgzwj+8
         vManwXSyBDPww8ysXCiB1vcsqf8gh6pbu7CPUYqqENxPOUo9jqyGzB4j+j2avqrKc1U5
         YmSnCBcswa/BQ3o/UX29CUakghB+5kK8sKSoLTwG5qzeEHxxriPq38JphkDHO9URK24y
         1ZtH9M62SgiMWBk3oZhiTSwCQQpUMpifVuouruaqG3/KqPIVpnvHe81Hu6z1V+crOh94
         SjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRoqBJeM++YqZPiM0JDUPLEr0HILDRP2uPvYD3ZuMvf4PbsWQJQmCQa+isJiGiZYRVjLtBYj4Vx0Ug9D61M3wuSG0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNsGmwLRqVdYJ/ORbl7AU96lbDyAhtL4aoLDG3VXrbBIPWI8qV
	Tsa2h2FOxoRj3gvUBoJctiyMP2btgBoRb5QVzBssK43T94fsZNHls/1qAmP5
X-Gm-Gg: ASbGnctFik3vbzAhAiEHg5n+tPpUtDi6VpphoGV6lL7VXbh5iysoOodWjPxAM9+Qulc
	kjA23NbjxmiIAKZZilNyWrjI3nQu8qWEpzWcsfNlZaWyWUHxtT7ZZwZFyYyEGEtMslNqqLFQbC5
	OyZMHOE/RLMlHe2vnV2s80f0HMW+L6FoIO5Q2N115mEuoIqHsbM9obxmH48b9NT+03DM53ulex1
	gJoX/Db0HzyYrsmPESBW16CSj/P4XPe8fjLr6JdKELHpMLnG7CASAi9MdvD3OTujoT5AMidZrPj
	fvBDdM+SanmCmir2YUOdRpusPI+dr385cmKn58rbAUbf+w==
X-Google-Smtp-Source: AGHT+IGwYAEpPmUAzC5H1+BO5dU3P6qze+N0BovuG/vcLZ9wxi7d8J+C1BxJTD2j7tCFRMmI/TZPng==
X-Received: by 2002:a05:690c:45c8:b0:6ef:6601:14b4 with SMTP id 00721157ae682-6f6eb904bbfmr116842777b3.26.1737419827617;
        Mon, 20 Jan 2025 16:37:07 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:77b0:6fb4:f583:48be? ([2600:1700:45dd:7000:77b0:6fb4:f583:48be])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e63a8a07sm15893167b3.2.2025.01.20.16.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 16:37:07 -0800 (PST)
Message-ID: <dafa6bb4-dff9-434b-8608-d6f70ef6bf63@gmail.com>
Date: Mon, 20 Jan 2025 19:37:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python][scarthgap][PATCH v1] pytesseract: add recipe to
 scarthgap
To: a-christidis@ti.com, openembedded-devel@lists.openembedded.org
References: <20250107161121.2046968-1-a-christidis@ti.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20250107161121.2046968-1-a-christidis@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 00:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115000




On 1/7/25 11:11 AM, a-christidis@ti.com wrote:
> From: Antonios Christidis <christidis-a@ti.com>
>
> Recipe builds the python module pytessereact, version 0.3.13.
>
> The module is a wrapper for Google's Tesseract-OCR engine.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>

Adding new packages is not allowed per LTS process.

- armin
> ---
>   .../python-pytesseract/pytesseract_0.3.13.bb       | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
>
> diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
> new file mode 100644
> index 000000000..ff2814f8c
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."
> +
> +HOMEPAGE = "https://github.com/madmaze/pytesseract"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"
> +
> +PYPI_PACKAGE = "pytesseract"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"



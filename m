Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3527177216
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:22:43 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so81445307wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding:thread-index
	:content-language;
	bh=3BVLB7zIFfryhUroza1Bd+didVkuzwIdM2yoT/N9CCg=;
	b=foqC8YKfbYqMExEWfw8pJ6qmBszT2DNq8+AI2ML9Fc10ScwqG8VKZVZ3jk/g4+egm8
	Rc3QI+epC8X9q9M8rkAwDx1inZgDJiIMQ4nOaMjPXdJrnEZsEMUot2nYhoP3aHyEyZ7P
	I8EstDYfSY2OV+zdOKbSjgUTo4tk11wtcWA0rU920LU+Lgcw9Tgn18sNOH4D+pXYo26o
	hEyD+09Z2SifOh0GBOtWXce01R8lVW4GdgkyDvejzB+r61puH2cutennUcjFlhLb3YSi
	etaS1p9Xj9VyhJ7VE0TjKyn6JX9f0a8tOxLalTgmCPjKS775r5daMaRmrZL7Mcj+zUMw
	vW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
	:message-id:mime-version:content-type:content-transfer-encoding
	:thread-index:content-language;
	bh=3BVLB7zIFfryhUroza1Bd+didVkuzwIdM2yoT/N9CCg=;
	b=hD3TqUrS9G4/V1NWyn25C9FZRTss8GVC9jL38Jtk5IIwXi2H8Kul7w++HssNF2nify
	RbDgmu9IfhrTzEj+0YupeRF+OI6P2iT6dwFxTmqYxLtaLOpMkpYnygPSPeq1UOSlMpUY
	0TgljP0o8yIwHxh6SZs6DA1qzAIVlnBZiogNEMZB/AlUTKLUVEE/StfKXv3HqcPi9suI
	e/ZEFyBk6RP13B0M7dwfLo5k7VKvBuS0tr3X6RZSyP0mB8DVAXViMRQHHO/8lOKD1Uwd
	ilaoRTQA4dnYLnoy+qCLAmiDs5FqXUUxrH/r2z36xQnE12bm/NEVWzgMZaO+nIUua3x3
	xtMg==
X-Gm-Message-State: AG10YOTN2n3q7F8q2aFC93m/WSRADCwirr2fgX3RcouIc6pQ62ejwrT6dBM/rdG58eAhqA==
X-Received: by 10.28.184.78 with SMTP id i75mr10214666wmf.22.1455895364367;
	Fri, 19 Feb 2016 07:22:44 -0800 (PST)
Received: from svenpc ([2001:470:1f0a:1031:5888:9e15:628f:21ea])
	by smtp.gmail.com with ESMTPSA id
	cb2sm11712057wjc.16.2016.02.19.07.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 07:22:43 -0800 (PST)
From: "Sven Ebenfeld" <sven.ebenfeld@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <00e901d16b08$cbe296b0$63a7c410$@gmail.com>
	<CAP9ODKqEBBAfmYR67JRFRyuUQ5VhB7-1pR__tMbB8pdWun815A@mail.gmail.com>
In-Reply-To: <CAP9ODKqEBBAfmYR67JRFRyuUQ5VhB7-1pR__tMbB8pdWun815A@mail.gmail.com>
Date: Fri, 19 Feb 2016 16:23:18 +0100
Message-ID: <017001d16b29$76267cc0$62737640$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIsMuN4yF6V7mhHNNvimtHXYUonVwGr7s3onnCNgJA=
Cc: fabio.berton@ossystems.com.br
Subject: Re: [meta-python] Python Flask recipes + cve-searching during package creation
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
X-List-Received-Date: Fri, 19 Feb 2016 15:22:44 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: de

> 
> Could you try:
> 
> git clone http://code.ossystems.com.br/meta-python-flask
> 
> It should just work ;-)

Thx, that works  :)

Cheers,
Sven



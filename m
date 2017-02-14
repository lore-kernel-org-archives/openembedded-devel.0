Return-Path: <max.oss.09@gmail.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id E110F731D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 12:22:24 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id 73so90590693otj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 04:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FVMQq6714Z/LAwOUs/t8OLpJMLJL6MVP78zL5QcYQSI=;
	b=KS+PFtDT2eHVxJVHpa+0UzEDXVo0262FJU3n2vl6zgL3ApEExpm1ujw2LD8rqOWqsw
	eS6Go2c4bfOONROw2sVFes6Rm4ut0yCOE70SnmkxoPSls+fwZH8xYKxpnWUjl3aByUh0
	Uw7ZcdLBQ/mmvgdVnyu31BRWJJLifnDk1rvLk1aVLlpmYEICH0tosdamoRpxUTgkZcx3
	EdWyHieVAA9RXpFIbB4hA3aRUlTs2mSqw4ea9boj6Wcy9i2dq5i1KyKyZeP7N1yCitC7
	r+Dw4gj8VoiCNiAJ0dH1Dp5t7dPUr2s9Oak4rQyVWYJkk80WWSHobbxIQFB86GKh/34z
	qGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FVMQq6714Z/LAwOUs/t8OLpJMLJL6MVP78zL5QcYQSI=;
	b=b5v497X3PahP7B2riZxymOVLCPQSenWTIVCzGNjeVewcZZqQ/umuu7k/BRmlVq0bCO
	HuzPtp7FeQCiPSfWn+8gm2P5CQaCP6S1bLz/YYpl+pRX6kVUxiYgTmgajYaPH7YeYXUZ
	tDbmM8TFDu2HgjlwNeg9k3dv+epQXsCRiBGiGs0uvdjdDSPpGn1GxTHmdx4H6/AqJ28H
	VhREE1ZQgRN9LY6SzYKujgIWUqjw6wK9SyN+Gpe9rHPZO3r+xjv2xUe1X/ZFYzhpeO77
	3U5rX8CY+NiIJbQEZ+HR3CoUzn5pwjL094PTeNvAN8FU6pUuw52Ach6CfDf43W5jdRxT
	NxoQ==
X-Gm-Message-State: AMke39li4ZiBs2V0ONs+isFYMNtcHO+f/7ulcLcxF50Oog4hIC04y/x+w3dB8ucSkrw3anlvC+FJuQqXs9jG1w==
X-Received: by 10.157.42.19 with SMTP id t19mr14807661ota.257.1487074945010;
	Tue, 14 Feb 2017 04:22:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Tue, 14 Feb 2017 04:22:24 -0800 (PST)
In-Reply-To: <CA+chaQfPjR2wNPeAqsU1rLkoaPms81hgZd28+4hALm5M9nJKnQ@mail.gmail.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
	<CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
	<CA+chaQdeBHucjgvjgff=kudTnTX1+cxxGv6yMnGb39UjuOxSaA@mail.gmail.com>
	<1487023500.2100.15.camel@gmail.com>
	<CA+chaQfPjR2wNPeAqsU1rLkoaPms81hgZd28+4hALm5M9nJKnQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 14 Feb 2017 13:22:24 +0100
Message-ID: <CAEHkU3XmNHaiyUno-wTA0dMh9zCeoVFWJi0kC9NaP_rZKT-gEg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Tue, 14 Feb 2017 12:22:25 -0000
Content-Type: text/plain; charset=UTF-8

2017-02-13 23:58 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> Yes, I guessed that Richard answer was the motivation for what you did, but
> the original issue reported by Andreas was about "many recipes depending on
> kdoctool".
>
> Here I see only 2 cases of such dependency, so I think we can live without
> the bbclass - unless someone says that he has many recipes in internal
> layers which depend on python-m2crypto-native.
>
> Just my 2c (I'm not familiar with python-m2crypto so I cannot say how
> common this use-case is).

I don't know either.

I rework the patches to only use DEPENDS and send a v2.

Max


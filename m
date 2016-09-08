Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFF160111
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 18:56:20 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id 95so24562460uaz.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 11:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=+Zlr5vOt03OmHIPv2bomMFOQrimR62Sd7U0OsXuP3Hc=;
	b=1XsrYLO2ejZNVr9imusN1UMujzHif2Mdgsd87atvwPTR4whNASp+iTtgdpZpBL9Q5K
	dkqmNY6wURdesqPkBKuFYMxfMA8W/ArfQTp9ph1Vp6IIKbIwAKTnfsuwG1vu/eqdpVs8
	HCbZ7F0deRMpeGOypk3TayDsMypeFVRH6rVenl0PtDR8HP97EZXwInAIKNjhixrJWgQG
	G2kDdaph0vTtkXnj0A27hpyYcQ6fFtERY371L6y96bCxvWKICKN/PZFfesjpsfcgxUQc
	Huz83wk8c3OrjcTv4Khm4/mwdWCeM4HmSy8M9jyH9AFGpjOB0f0SP4tRxKgk7gpbkPnO
	kuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=+Zlr5vOt03OmHIPv2bomMFOQrimR62Sd7U0OsXuP3Hc=;
	b=fGfYy1h6b46KuZBlGOQhZTxuYKZy38RbeRF7jHmaDjEwpOU3e2Mvpi0nqkGUjS7z5n
	VYo/uOlt5gfqz5ysuzPrUyLeDmoueVapMfbm+wHIuJdwOPE5EiScHNyIn5iao8mSqC64
	I8VLIKx5D2jtxzHOf0ShLqy5BJ1OdyavhfgC9myKT9+TGkSFFFuRSsMgyODeKHPS/P8v
	cIvuY+eSLTGIUj48Rwpt4mAcpD1KkjyhrENwWRu4SfDZKZFXU8XT5HuTOkSB9uBiKyGK
	q6bMqH3TNFiTW55YOsYb9fqDPNGEjccCi7cxMIktKwzha1mCBrTJ52tIBM1QQU8s6/2Y
	vVAA==
X-Gm-Message-State: AE9vXwPmEvc2R0/O0tghzwytoMQO2a8+4kF7X7XDoTlEMVX8mxeHJHLbL23LJwCdIgSarA==
X-Received: by 10.176.69.231 with SMTP id u94mr1011967uau.84.1473360980433;
	Thu, 08 Sep 2016 11:56:20 -0700 (PDT)
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com.
	[209.85.217.175])
	by smtp.gmail.com with ESMTPSA id 73sm7157821uav.0.2016.09.08.11.56.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 11:56:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f175.google.com with SMTP id u68so48962344uau.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 11:56:17 -0700 (PDT)
X-Received: by 10.176.64.161 with SMTP id i30mr879829uad.107.1473360977353;
	Thu, 08 Sep 2016 11:56:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Thu, 8 Sep 2016 11:56:16 -0700 (PDT)
In-Reply-To: <20160907095847.32480-1-fathi.boudra@linaro.org>
References: <20160907095847.32480-1-fathi.boudra@linaro.org>
Date: Thu, 8 Sep 2016 15:56:16 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpxOryWFMRskktXRwG4Evo-B0RN0DznZ+Lo-7ZparNYcQ@mail.gmail.com>
Message-ID: <CAP9ODKpxOryWFMRskktXRwG4Evo-B0RN0DznZ+Lo-7ZparNYcQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] android-tools: add recipe from AOSP tag android-5.1.1_r37
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
X-List-Received-Date: Thu, 08 Sep 2016 18:56:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 7, 2016 at 6:58 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Android tools offer filsystem tools for creating sparse images,
> so package them in package of its own.
>
> This recipe is re-worked and not a straight import from meta-shr.
>
> It's built from AOSP source. I've dropped the ubuntu-ism which will
> never be upstreamed.
>
> The intent is to be closer to the upstream AOSP source code and be able
> to update the recipe regularly.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Please add nativesdk support; one commit improvement would be a small
example of usage or an external link documenting its usage.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


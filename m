Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7D56FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:25:11 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id g66so1573116vki.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AiGFTAyiKvCep72rLpkfUnYIfFOxkavfmcFX7Db2LtM=;
	b=XAFLcmQih+NVEhwnrPw0RxMFLaus1oK50D3BzbJBj0kzxViYJ2uGX4OTPdG+UFdDiK
	wdrFAZBeEAMDFkzz5vGK8chIT917VCI87yB3+dbmcjUCWb5FGCP6tpk4ZjglSgyx6ymL
	Mha9CYPiQdWCqfLVzR7co8T8B9dKvL3RdBxsVR0xsHTwW0e+A25MAOPe0gdppLrBuLzU
	y61cnv5SUZ+Ff1lhzA2pBy50+wh/sd7YLn6n9TpqScdIhfPrCQIDvH+xh7jKR30YNzgF
	zzmKU2Jr42dyMMKEitAvMSnrP1DUeMGwfMfETL8gIAF6VgvTPZGL2g97O5F6QicHTqHC
	jtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AiGFTAyiKvCep72rLpkfUnYIfFOxkavfmcFX7Db2LtM=;
	b=QkAiWFGdot8rDz7F76YvR5xXiIHdMbc7WGXmZ9cPI5d6XvjotPWNBLi4uIyugoYF0h
	ipyGosNEpR14SV08FiduXpd1hymYSTGyOKwV3+JtrQj+acIexjmJykUF2mEXgCatT5SY
	4wJpJIeBiOU+AaHBtAcWe/Wk6XX4MEiQwo0vFo7ZDHUmczQqU881j6zuD8ItS83bzgRt
	fDr3wCqs8ng6nf6UxVwNp/iK8KOOCY76PjwPKv291YWqdHiWSZv0Ei/DEdyvak/RYfA/
	it/8IxyWN9I8yue3BGtKPfBGAd5GDaVbQwaIw+KrGK/KAIakVy8f+iNBUe/whD9GQR2l
	8GVQ==
X-Gm-Message-State: AKS2vOzVlU3qyri0HtZ+cbXsjNB5Ov0M5dSqBsQrha6DaA2bDKFNKcNx
	XeSnnfGOwPMtzWTy2ysLfgfWAi/P3yjBMqY=
X-Received: by 10.31.92.9 with SMTP id q9mr1685465vkb.19.1497504312939; Wed,
	14 Jun 2017 22:25:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.48.86 with HTTP; Wed, 14 Jun 2017 22:25:12 -0700 (PDT)
In-Reply-To: <CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
References: <1496925018-5300-1-git-send-email-samuli.piippo@qt.io>
	<91dc3ff5-ad3a-ff4c-163a-4b82bb721422@gmail.com>
	<CA+chaQe9JFMTrZ8HcOPyVqj7VDvg4N_8VKGRf3X3vDuwC37f8w@mail.gmail.com>
	<CA+chaQe=8hRDdymjoqn0wRo03XUF0cTdvNiLQTUuvqzLsL2Q2w@mail.gmail.com>
	<CABXoSoWZBLfn4K2DcHED90U3Bvcj8GRLX9Qa5XL844hZB0+Tzg@mail.gmail.com>
	<CA+chaQc8V+tVZ4g+B7CAeR49wbDgs4+Uo+B++8ieKgG8HA4Zig@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 15 Jun 2017 01:25:12 -0400
Message-ID: <CAHUNapTL=U_t4EwTKkQ8B8A7j+=WKCU64u_MFeioB0yv_VfACA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 15 Jun 2017 05:25:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 9, 2017 at 4:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Then why does it work for chromium which used to have the same issue?

https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium/chromium/m32.patch


Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id CC89C760A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:34:53 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id o3so13851312ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9te+OTo4D3eM2VEvlbxLuK+mXpvJMM/HAy762jaTzRM=;
	b=nqg9ndp9Ia+v24AwXLPWchkBDt+xO+Kf7/XuNM/t/6kvl+qhd3T0rI7poxU88yTXp5
	b+ljnF/PUcBGE9sWb30x5Ab2ZB563i4kOBCbR/Q7zxcBY/OZ8oo43XIc/69IFnkTcm2M
	uDn9NUzelVIlleRVY0mDgNgTBBGdo3BM4EwbxqZq471/aoDnP0hTzwrIibuJbOW6tvJ5
	9Q3BgJOj4KgeeOrTzc98XwirzgZkzHVITYMTEU5vYGokUnwMgP40O6P+JvVTda8MvpOf
	GS9YGNwO3vp2pp4DWF3uLFyGeFE5SQO/vbwynS/+frUO903lm6dALjc1keVVVPhjFEAR
	sJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9te+OTo4D3eM2VEvlbxLuK+mXpvJMM/HAy762jaTzRM=;
	b=GR+wMAnEqHv7zQ6P4gEZQfP+prNvUa2Yq88Xv2wSmQ67TKXO2/RpRsFV1QYCqHsqaq
	tRNAHsWqPZxFJZy2uKHHfkEGcYz4CxkIpWMoOkQfK/zYddVxsFIewgRJeRHemq1mbtgX
	xpHAH/ZTJnoIvY4yes+jRgWQfYpaYnMTDTacvU9h0H92hEiJ9n21TuOXHytm/1aVGXyF
	zlKONfvyiix/vkLV1EngOTirQA5FhbxN6HOL6FEelBlDqb6oKVWCDz3qTqSQU8gLQ+v8
	eia2/qUvvCkJWUvVoowQwhPkTMcQvJkx32qN2AtXIi+H6lhJpp5CQ9R05T9swI1RnnW8
	ee6Q==
X-Gm-Message-State: AE9vXwNWX/twq5WMam9za2RU811f2tFspGLYYePodw7acJjmxXnaAUxlQCpfGceLXoxYbe3PnCx6qo002qqCz48c
X-Received: by 10.157.17.203 with SMTP id y11mr21209429oty.188.1473694493707; 
	Mon, 12 Sep 2016 08:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 08:34:33 -0700 (PDT)
In-Reply-To: <57D6C026.1050701@ti.com>
References: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
	<57D6C026.1050701@ti.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 16:34:33 +0100
Message-ID: <CAJTo0LZv=DxdJOUUb3t0Wr4_gcD8mqL_-hu=bVsjUZh=n-mcLA@mail.gmail.com>
To: William Mills <wmills@ti.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Subjects for YP Developer Day at ELCE
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
X-List-Received-Date: Mon, 12 Sep 2016 15:34:54 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2016 at 15:48, William Mills <wmills@ti.com> wrote:

> 5) Can Yocto [cross-]build snaps or flatpaks?
>

Just because it's interesting, note that the standard freedesktop.org
flatpak runtime is in fact bootstrapped through a custom OE distro.

Ross


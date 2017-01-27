Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE2771C0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:47:12 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so23686055pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=rtXKZLaV+eHD1QcnyHHQ/BJWonaG+lgvCHNaxtiJ8dE=;
	b=lqfCRWcvuPR6+jP8VkIZMs7Xm0XffHQhjK/adfLo3M+NBX6Jh58WZtuyGOWsaIuKDB
	8PZuQbxB/t0D7nOd9wAgL4EWjGI2GBoLFbLeiTHsHSpK/6TmeX8PtfhDFGIvFt88YaMh
	Rf23debfsvcytxPqPshyl2olYCsHw2euGc9ufS/zUcRFDN67CT8h9y6igUnysCk8mV/h
	ZmtWOriSZGgaCSy9rj1sV2AO71DzOsw2aOLbulqmusc6z+HI02x4alBLYSw7rQaGebgG
	GOvw8RgZDqMxvWnO0/Qs49tCtomDku9BTonS4JJSpKlsFGekMmPoFdEVlRShO0EYNJW+
	vzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=rtXKZLaV+eHD1QcnyHHQ/BJWonaG+lgvCHNaxtiJ8dE=;
	b=Ekx3DtaPeEjFZtnEK2fRSqAqttl0cNkVkivgiOhpdO5Y2pZPbt3KuOSp/zZuYZiAoC
	eM7r3mvqZmNm2RQVtse1zX0N4SMrlOUe0pFYa9BVgdk1X/1V/Lypa3zYiQKm5CrjvcBY
	+NvrmABLiHw2NNxyWsvqTQYEa4nR7AoNGN93H4rAd9rTsIaEtgRtq/h2mdO+g5dao0J0
	5Qb9/AG5Fm8lU/qAnlWHZHwOLsMReq8xZqnZ/e0lYpCi17352o2r+cvTM7v0IpAuSmmJ
	ZR2zX3nwZC6psvyoq+EOzaNic7GIIkbUjDApreqcK50qLW4axV9ya2AasxZfyrcUb1Ta
	bz/A==
X-Gm-Message-State: AIkVDXKp+i3AvpSjFN0avxmdSSUUd17OlLdhgzwLnAoDoE3KI4rutyvV9xC8AmeOmbqb8Q==
X-Received: by 10.84.140.1 with SMTP id 1mr8504486pls.38.1485481632732;
	Thu, 26 Jan 2017 17:47:12 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6524:a1c0:a396:fda9])
	by smtp.gmail.com with ESMTPSA id v4sm6216983pfb.36.2017.01.26.17.47.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 17:47:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
Date: Thu, 26 Jan 2017 17:47:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <008601d27798$272e3640$758aa2c0$@neuf.fr>
Subject: Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Fri, 27 Jan 2017 01:47:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 1/25/17 9:50 PM, Herve Jourdain wrote:
> Hi Jacob,
> 
> I've been able to compile chromium-wayland 53.0.2785.14 on RaspberryPi, with Wayland only (no X11), BUT I had to add an additional patch for it to work, or else I get an error in ui/events/keycodes/keyboard_code_conversion_xkb.cc.
> I'm using VC4, which has a DRM/KMS interface (it seems that DRM interface is required by ozone-wayland), but this patch seems to not be related to RaspberryPi itself.
> Basically, it seems that USE_XKBCOMMON is not defined when compiling keycodes.
> 
> Is it something that you saw as well? Or do you have a different setting/experience?
> 
> Just for reference, here is the patch I need (right now, I'm triggering it from meta-raspberrypi, but I believe it may be needed in meta-browser).
> 
> --- a/ui/events/keycodes/events_keycodes.gyp	2017-01-23 19:12:01.767271256 +0800
> +++ b/ui/events/keycodes/events_keycodes.gyp	2017-01-23 19:12:11.503048216 +0800
> @@ -21,6 +21,9 @@
>          'scoped_xkb.h',
>          'xkb_keysym.h',
>        ],
> +      'defines': [
> +        'USE_XKBCOMMON',

This seems fine to me. It should also be proposed upstream as well I think.



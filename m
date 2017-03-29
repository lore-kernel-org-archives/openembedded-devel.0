Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 137C371ABB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 19:35:22 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id z204so30354917vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 12:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dbt2wAEwnarqSuql9E7SL7OkKp5QontPTT0S4GMia6Q=;
	b=IAc3TiNeEX/pqa3k2RbTPKKaXjQk1VHUG0ctXSnf32oEPAvwbVjZ8kIRP8MBXobxQz
	wBa7k19zgm9bvelZEy9dm/ZEGpspak+DP5qLt2gYFUiikARcTSOeq+DtEHmwMFZ7gDv4
	oNcvh2UwyufER77a4RaKEym4nm/xqfHCBTkv/l5CktU5ICxhtWSJWUPtwebQ8HKOPE5m
	9rjfKFTZfDUBVVwOGPJf6s8FdC5F0q2ued0OzGnLoHTCvA2S913PDoyfEzIjqJAq9Gsz
	t4jxE2nSGL3a8CMpbmGHGjKyQoRcv2/RuBei+wEshp+j7IAOeucW6fjV6CZxSFDRje0w
	kgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dbt2wAEwnarqSuql9E7SL7OkKp5QontPTT0S4GMia6Q=;
	b=Orz5ZkerkxYOJRGph8/FWVV9iLCHEZe7hUg0qQ0zlQTQFaWoiZuyd66PDsAXoUMCx4
	2uthvr1IbspGHtIEsaD2/axGfs8JF10uxcFW0L0lGNJnjUhuyTx3JXEAAw6HxNonKVXV
	UwIUbqbvY/TGtygFKFhTdTHXShnNz4pXOjQOLAkroIuBoX1pdzz6ZAeuiKnHdPNqMYtD
	EnGbxn4fjh3EkXH+aaImR2dM8yutiqKZqTZHZ/TvnA7lk6NnazZ1KqllUtaLQMa3hxVY
	VTqBmiSwga69UCMKLxWYGwND5nGR5A3+LZg7wbH5+Ns1iAX9dQOvMFYwL215YPI6umWW
	FF+g==
X-Gm-Message-State: AFeK/H2L7YCRM1ul16eNy88vX7VyHl/uFEgGkc2OmOtumoLrCam18Whuq9LQ4L2lTrfMEG7F4Zw7CE6lmG9/+A==
X-Received: by 10.176.84.209 with SMTP id q17mr1193862uaa.129.1490816123356;
	Wed, 29 Mar 2017 12:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Wed, 29 Mar 2017 12:35:22 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 29 Mar 2017 15:35:22 -0400
Message-ID: <CAHUNapSj77gK_kExofCWaeREZOqwQoHQei4YZbqE1F5Uh=2CFA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-browser] calling all chromium recipe users
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
X-List-Received-Date: Wed, 29 Mar 2017 19:35:23 -0000
Content-Type: text/plain; charset=UTF-8

When testing changes to the chromium[-wayland] recipes, it would be
great to know the layers, configurations, and MACHINEs with which
people are building.

For example I care about chromium running on X11 for minnow
(meta-intel) and raspberry pi (meta-raspberrypi). How are other people
running chromium?

Also, are you able to run with accelerated graphics? If so, what
configuration are you using?

Specifically, I assume the trick is the correct configuration of various

    PREFERRED_PROVIDER_virtual/X = Y

where X is one of {mesa|gl|egl|gles1|gles2} and Y is probably
something BSP-specific. Is anything else needed to get accelerated
graphics working with chromium?


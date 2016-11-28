Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 85E936059F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 17:48:40 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 50so11105607uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ikd5aIIjahRwO2mYwiswoVUhZBel5a6ZzR76Rs51NYU=;
	b=kwRAcjHRrlTQooEI+IMz5ben2ypdM9LAV8KTAaxM7JZxIxQK9IwvgXNwYALfs8z+4B
	RKKIhytEaTHx4V+0oijc/BoNpSlJaa4RdbWK/MgSckZkZCuyQV4/hgxy4sK6L5ridHdp
	9YKwE9ZhZ03wptngg9spE3B5a0r3jSqUVLq5Txv/GMbBbNGXQT6c13qO1w/mG7o6iZmT
	GO2yiNtrjuFHgYMbrGDv3Ufcy5iQGH3R537SxrgIBUFvOej7i+G3GJbjI3e39OKaLBAJ
	DAP4jugyD1gM5BJ1qFealf4ZaRoTTUTr9SOGKtFQju0I+ZQaesjhwUp6tJ8QULJBMwmM
	elZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ikd5aIIjahRwO2mYwiswoVUhZBel5a6ZzR76Rs51NYU=;
	b=eUBLqwkiUYJyPc2b1/l+S14A+EqmqOiend27gTeu9LW+iVE7RaML4LAC+vHrpYOjpr
	ZJMbqGo6/1Xmj8Yps4Li0AyhGfvJ2fiDc8pzn08I1HC0Ax3ssJ0DbaWyGv88uszqUMRK
	EdfHYSC+Bs0TX4JVyzEvGzQi144oCywk+fnvl2rFbdKD/imaQyHoz3wsAJ7DlGhjofa7
	Sy+eCyLvvSnoDRhhJ26YTwofUTDRimLrHu6V8OajX6kQME3trN+/surco/tUV0q3ne9/
	g0VWnmTxRJrnnVtkILcsNGx7FpZSDYNJUoVhbNHZEKvQ0aFKCeTTuEnPpITR2HSOuN+q
	jb/A==
X-Gm-Message-State: AKaTC03+F7ANDYHYyEJ3zynSbk2SVmlIReN237+o3cgMva9ItWY4gO5gXSWjLNHtD1AKEqbj9V+ZYnpxyd99DA==
X-Received: by 10.176.82.181 with SMTP id v50mr14260937uav.31.1480355321544;
	Mon, 28 Nov 2016 09:48:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 28 Nov 2016 09:48:11 -0800 (PST)
In-Reply-To: <A6D1B2BE-C658-4114-AF39-FAC0249D4F98@dominion.thruhere.net>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-8-raj.khem@gmail.com>
	<20161126001515.GB8369@jama>
	<A6D1B2BE-C658-4114-AF39-FAC0249D4F98@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2016 09:48:11 -0800
Message-ID: <CAMKF1spOfHv6Rs1rssraDFLfqLh-i0upcHFjgYCV0Af02FFr+w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 08/49] kodi: Add krypton/17.x Jarvis/16.x recipes
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
X-List-Received-Date: Mon, 28 Nov 2016 17:48:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 25, 2016 at 11:42 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>> Op 26 nov. 2016, om 01:15 heeft Martin Jansa <martin.jansa@gmail.com> het volgende geschreven:
>>
>> On Wed, Nov 23, 2016 at 01:21:28AM -0800, Khem Raj wrote:
>>> 16.x is the default since its the latest released version
>>>
>>> remove obsoleted xbmc recipes
>>> rename to recipes-mediacenter
>>> +S = "${WORKDIR}/git"
>>> +
>>> +# breaks compilation
>>> +ASNEEDED = ""
>>> +
>>> +ACCEL ?= ""
>>> +ACCEL_x86 = "vaapi vdpau"
>>> +ACCEL_x86-64 = "vaapi vdpau"
>>> +
>>> +PACKAGECONFIG ??= "${ACCEL}"
>>> +PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
>>> +PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' opengl', ' openglesv2', d)}"
>>> +
>>> +PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
>>> +PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
>>> +PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
>>> +PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
>>> +PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
>>> +PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
>>> +PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>>
>> Did I overlook libva recipe somewhere?
>>
>> It doesn't even start building for qemux86* because of this libva and
>> for qemuarm it fails to configure:
>> http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/110050.html
>
> libva is in meta-intel, meta-amd and meta-kodi. I guess we should consider moving it to OE-core or meta-oe.

I think meta-oe is a good destination for this.

>
> regards,
>
> Koen
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0A860667
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:48:53 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 191so86095144wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=F/0A08xDSEOjRH0ODjUivaG1crpt6nX5EHooDBDmGVA=;
	b=anWJL+oR5QB0/1xSKjnA2qmkWqqvDIYVySLwruj6NFG0nRRYmLM9j7jBmZs0r6NrAE
	Mmu5eBmWW8OA6Ga6m1VXB0e8I34qRkPQbjPuI2vplqjUPZMcFxME+7jNEkCA811zpRbp
	F9VIWSkPEOpsHndvjcAMoNQQIWekU9NstdlxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=F/0A08xDSEOjRH0ODjUivaG1crpt6nX5EHooDBDmGVA=;
	b=gS/qZDxtzN1m35JPnaBZnHA98j23gUY3EMGj0qMlJhVc5C5fpwiyy2Al9e+gJ2jGeP
	5vzvUtH8SPsmB9kukO+6OhZFfdxQbWK2JKzFo0UFgq0HeoOMACQO7plCD1f2cITXVKyC
	Cm74dBUedvTgV2iETFeRgxl0LfmjiaIfEpfs+13iw1+6kWDOv1aVX3I4SzfgZtTkgAlC
	eL111z6yKNjkwLQHuGdekW6kCKeautSZKPrRcD1gKukje1wCBNtwhhKvBETFz4aoFzrp
	ZG2xsa330R8T2ib9T++ioEF+JOwFAHhBTRLAn2trNIslgcy/CdrVVmXBqp8Qeoqm+ADS
	H7tw==
X-Gm-Message-State: AD7BkJLF8+KpYAroYAlze+0Daeb/Rx0xkUV+5IDRQdaGga+0OGius5GZvviKw0b7kW5ku5p2IyMxkx01ZoHjOWKG
X-Received: by 10.194.90.3 with SMTP id bs3mr9028597wjb.105.1459338534202;
	Wed, 30 Mar 2016 04:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Wed, 30 Mar 2016 04:48:34 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 30 Mar 2016 13:48:34 +0200
Message-ID: <CAP71WjzNNeYY2pA5-YxtXFZJ01iPR=dgORMoYfCgWDPAA7_RsA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: openbox themes
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
X-List-Received-Date: Wed, 30 Mar 2016 11:48:54 -0000
Content-Type: text/plain; charset=UTF-8

hi,

i am not sure if this is something new or not.. and I believe it used
to work for me in the past (but I am not 100% sure..).

If I only add openbox in my image, it would fail to start with
something like this:

dragonboard-410c:/home/linaro# openbox &
ObRender-Message: Unable to load the theme 'Clearlooks'
ObRender-Message: Falling back to the default theme 'Clearlooks'
ObRender-Message: Unable to load the theme 'Clearlooks'
Openbox-Message: Unable to load a theme.

After I add openbox-theme-clearlooks in my image, openbox would start normally.

As I said, I am fairly sure I had tried that before, and I don't
remember adding a theme myself but it might have come as a dependency
of some sort..

Anyways, can someone confirm if openbox is expected to fail when no
theme is installed? If so, should we gracefully handle this in openbox
recipe and add a default theme as RDEPENDS?

thank!

nico


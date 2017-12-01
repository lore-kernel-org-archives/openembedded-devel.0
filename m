Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 21FAF78697
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:24 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n138so2828524wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vnWmBhmgF/mK2PSFhIjWCpxU07f/yssxL9RSt3Swplo=;
	b=CfsNrswZnRkGu60GLPeOLMJxwL/qx2qUV21UmPiBC/v6/DI0e+XH8sMM1Og03vbL+p
	uqwZde3q76LFFOvu92+nDWoCli1fvsu56HTg5KzTkgg1Ig/2uF1F0VXv9fLnd0UBw0QC
	7GTwETnJFxhut3Aob8Fszr3io0yK0G7h5f0R2mScbZreW0n4H74tx9rV+kTieR1D7n/m
	p+IV2N98QCIRnRluesBNmZZGjz5hR5qm0IbxkgBzLuYrOV95NNw21Y3CEiUMPAiTKgj4
	1zS2od1GvVA5QdL/JAzdwkEUJnPaKuX1/JLJWEpAdiHo0XZVayS7rYswUIL0mBORLL4p
	maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vnWmBhmgF/mK2PSFhIjWCpxU07f/yssxL9RSt3Swplo=;
	b=bzZjgy4Cygq4MKFlJi4ethAwyZfIGfRZaBX0gyHy5TJ+2ZMSKwnCTvbaTbrF41Objk
	k4KVaBa2vtwUNXn02mQYiT4BA3jFGU+v23+/u6ag6V+UASrjm4MPp2Ryp/EEGWxJGOXc
	648d15t7RSWxNCts/gLbun4xReSjT866MRWeui2AOYjmW7YLz2Bdaezqv4N4j6x4NGI6
	AwzekB70O0X+EJWG66bHyg5ZGFmGjoqXLh2e2m30P99VxJihl/X+ItAXouR8eVOEYjSx
	RECZ3vwnACW5Ob92sz4G1I/gCsMD6y9nHPqvQknYpWru/UCxS0Fnpixe9wJ6z0irkdPS
	iEVg==
X-Gm-Message-State: AKGB3mIBTHFf/Q+TzT+yYecUDtKylGO5SfGJvS2E1l0bJiVLkHCHcydL
	cUcsLUZUgTh7a+e3toovqf+kBA==
X-Google-Smtp-Source: AGs4zMafcQAQSV3c9iG9McYC3v6uNef5kNrCmLLHcfRhZAc5g7mmsRxci0ZCFgRTmx/yiyzPJTXDvQ==
X-Received: by 10.28.225.197 with SMTP id y188mr876662wmg.12.1512126505426;
	Fri, 01 Dec 2017 03:08:25 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:06 +0100
Message-Id: <20171201110816.13519-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH 00/10] recipe updates
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001-tumbler-ensure-thumbnails-work-properly.patch is a resend

The following changes since commit 34aa4c3202b427f59f843dc43a4e1afda4f81d13:

  usb-modeswitch: add usb-modeswitch@.service (2017-11-19 13:45:38 -0800)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to c00a5c365f5a0215fbec2a056c2b3e292a38e4ac:

  fftw: Let dev-packages depend on libraries created (2017-12-01 12:01:19 +0100)

----------------------------------------------------------------
Andreas Müller (10):
      tumbler: ensure thumbnails work properly
      poppler-data: update 0.4.7 -> 0.4.8
      xfce4-whiskermenu-plugin: update 2.1.3 -> 2.1.4
      fluidsynth: performance improvements
      glibmm: update 2.50.1 -> 2.54.1
      thunar: update 1.6.12 -> thunar_1.6.13
      xfce4-pulseaudio-plugin: update 0.3.2 -> 0.3.3
      glm: update 0.9.8.4 -> 0.9.8.5
      fftw: update 3.3.6-p1 -> 3.3.7
      fftw: Let dev-packages depend on libraries created

 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch      | 32 ++++++++++++++++++++++++++++++++
 meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch  | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb                                                    |  8 ++++++--
 meta-oe/recipes-core/glib-2.0/{glibmm_2.50.1.bb => glibmm_2.54.1.bb}                                                 |  6 +++---
 meta-oe/recipes-graphics/glm/{glm_0.9.8.4.bb => glm_0.9.8.5.bb}                                                      |  8 ++++----
 meta-oe/recipes-support/fftw/{fftw_3.3.6.bb => fftw_3.3.7.bb}                                                        | 11 +++++------
 meta-oe/recipes-support/poppler/{poppler-data_0.4.7.bb => poppler-data_0.4.8.bb}                                     |  4 ++--
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.2.bb => xfce4-pulseaudio-plugin_0.3.3.bb}    |  4 ++--
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.3.bb => xfce4-whiskermenu-plugin_2.1.4.bb} |  4 ++--
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.12.bb => thunar_1.6.13.bb}                                                 |  4 ++--
 meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb                                                                      |  6 ++++++
 11 files changed, 140 insertions(+), 23 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0001-avoid-buffer-overrun-in-fluid_synth_nwrite_float.patch
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0002-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.50.1.bb => glibmm_2.54.1.bb} (84%)
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.4.bb => glm_0.9.8.5.bb} (79%)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.6.bb => fftw_3.3.7.bb} (87%)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.7.bb => poppler-data_0.4.8.bb} (90%)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.2.bb => xfce4-pulseaudio-plugin_0.3.3.bb} (73%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.3.bb => xfce4-whiskermenu-plugin_2.1.4.bb} (66%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.12.bb => thunar_1.6.13.bb} (88%)

-- 
2.9.5



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F59FC72D2
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 23:49:23 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8785.1774309759143037502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 16:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o+DDKNmn;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0c482e069so2654344eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309758; x=1774914558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq/8naK4GayVZ3yNS+CHOb/HE1r7OTRrJbnMrc18Diw=;
        b=o+DDKNmnufHUbdgTPf2aq30Bk7odFmOj+XuyMjPukZxs2VPQHFUGPRHNH2OYSZ7Pob
         PyH8pE6R9SyGcRVIoyGJDtRRRPdzQCFeE8ZfK2d4m8DtYJxOfpYaApPLOnCfAbYWzunR
         82kUMqdqi18aw5x4fIGxJ1TIiFwmXGwtWe3KaK5HdzKw+XNSarwMSBPbZkJEIjypa7GC
         6AyMR4LreqR49mtcsBjkmyimInUvJi1ELTs/esLT0iCwf5eJ9UTJEhOtvvtsg7H0WTBu
         cADWh7Tk6aF77EoSzhXGtaBz9Thw+hrvq7Y4r/teroCCK9ilckUtiVqOXeLbq085ONC2
         eIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309758; x=1774914558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq/8naK4GayVZ3yNS+CHOb/HE1r7OTRrJbnMrc18Diw=;
        b=cYJg/Qmdk3m0qFKuFQixE9t7A32tTpJICIqBau0BLcW7a85uGdZoYdcqKUhrHXfpif
         cp9mSkOnjKoIEJedCHBgzH4uqYTP6ZA2goiF912MaoUzAShEmZRYU/qSFEKGk5aUEEFA
         UZbkJm9CF4Wi0+2VKfjrgbHtWGk1dWmfg3hGW23wIy8ZltoMQMC3U5cD4bZJm4+DynyP
         D80sWSfmMfp33sTDaUuiMuFJWGBv/k20esZ7DzICWmuGj+q1RuJ1Vb+1OAF9W1knUTa6
         rJwJGjqAb3nyc6hGvYXxeLZRXncQp80JOtdmcTCixJIELZ5Klq3cKut15YDi6yQ/fZkK
         6nCg==
X-Gm-Message-State: AOJu0YwVp7coc8VZ7pymqyyw9FweBcbMaUccriPCpvQ26Xur3vq5Lbcu
	KKKsu+XHEGGN54NhYExf2a1xKhSPH0qJqUd7zMMzqml3rlLDbzGNfMmc8K1hvvpV
X-Gm-Gg: ATEYQzzpy4EXX32BTsq0v+yPQANmCJnHQtyPELAOdriVGNP5pg9p3VLXeOJ+swPjX3Z
	qsiKa5Buqhg/UJMdkBXKXGMHCSaXDpI3mdGgsaGab+0ineFYhzM1hhVEpPiEYPEbV+xWKxOU3Df
	QnFGRCsyUxbBltxXoNiSFZDufpKNGjHFn8FVWSWP3hhNEOLqEBBwqSmcw5Ev1rDSQ0lbFhVqBIq
	/di+bsD3W+eX+T6dt7Qaank/3OPOjvMurqpDf5RuSwZNPSAoKk7vBwnLIdnIf3c8yxHc4zumTb/
	hkgXRF4/C5so5kSM2NvnyUSO7VRV3DZHim7HebblYsVrtV75luu5SDLIz76t9Fs/kZ7raz4GlYA
	XQSZCQ6puWUe2zkqF3oZ4yZ5SQ2x38TVwZ9NakiZ7qQmskfLj6jkepPKlBhgSVtz9X+xMldSkLw
	UlMM7lYkrO76lh0EZtborjPO7LXyB4h7/4Y1T7raiBfUjuwiWzPnmN5CIiferCESidW+aXvqZLL
	0SNxezWad47ODnEVGWw1R04ewVEgy9CinyDqi+/MRNDnpFAoKd58Pt/GZOk
X-Received: by 2002:a05:7301:6794:b0:2be:d6e:6ba3 with SMTP id 5a478bee46e88-2c109724823mr6410934eec.24.1774309758079;
        Mon, 23 Mar 2026 16:49:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm18478008eec.5.2026.03.23.16.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:49:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libsdl3-mixer: Keep opus support off by default
Date: Mon, 23 Mar 2026 16:49:14 -0700
Message-ID: <20260323234914.4161119-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 23:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125534

opusfile comes from meta-multimedia and meta-oe does
not depend on it, for keeping layer compatible, it
must be kept disabled

Fixes YP Compatible checks

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
index 8540ec55fc..c5af2f038f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
@@ -9,7 +9,7 @@ SRCREV = "cedfeef30e93db35eee6b25759117da63f8e5a4f"

 inherit cmake pkgconfig

-PACKAGECONFIG ?= "flac opus wave vorbis"
+PACKAGECONFIG ?= "flac wave vorbis"
 PACKAGECONFIG[opus] = "-DSDLMIXER_OPUS=ON -DSDLMIXER_OPUS_SHARED=ON, -DSDLMIXER_OPUS=OFF,opusfile"
 PACKAGECONFIG[vorbis] = "-DSDLMIXER_VORBIS_VORBISFILE=ON -DSDLMIXER_VORBIS_STB=OFF -DSDLMIXER_VORBIS_TREMOR=OFF, -DSDLMIXER_VORBIS_VORBISFILE=OFF -DSDLMIXER_VORBIS_STB=OFF -DSDLMIXER_VORBIS_TREMOR=OFF,libvorbis"
 PACKAGECONFIG[flac] = "-DSDLMIXER_FLAC_LIBFLAC=ON -DSDLMIXER_FLAC_LIBFLAC_SHARED=ON, -DSDLMIXER_FLAC_LIBFLAC=OFF,flac"


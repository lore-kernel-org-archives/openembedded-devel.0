Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id E195C7E3E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 20:18:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id h195so16675440pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g/3NPfLrBktPOOTDo6AzAbHmU/8Ecl++h4go7SUt4dU=;
	b=ABmCDuFjHR6ojMYCOIBcDrzlhbfD4krR93vh/UthKhQLjLARw+3t+AiI1mojnA5ZTn
	BQIMPRko2VPJ8vtwXg3EeNHO3X/IDVPgwQxUvNn5lB3DZ7pnDOi9UTYGVJmznlziZ3zw
	/SRDzcDVdFGweSd0AKU+d13Nk82GZUZp9+N7C68OP1Z8ycpVE/CzX7h5dXl3f9+6n9BY
	5EvRl19PUShdQDaE+iJKo8PW2gceW1ggobz8OSX26v4z5BcjbvmmQEPnDMR6lFbtiuO6
	dBjlkwX4ayr38slcyMX5yv/Qar3BMAThjYm8pxXOi8mobT8VwN2TNcFwwyBGv4QPSMwK
	fFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g/3NPfLrBktPOOTDo6AzAbHmU/8Ecl++h4go7SUt4dU=;
	b=Vm6pMtBJkkTKXSuFVoTJWVYZhrByjtL/i3AvJhPIo5svelx0AqIGbI2bwid/1Si8uo
	QnyY26VW3db+j8Rl+z1is668mVN87yKEorfRSwxEYWuwQCEFMNEt5kicCrKb5AhydS/K
	BwLP4AxrGvjalv1zZefPTywigviBVrzxIkR1ir8I/e2k/HcCO1Rb8/wCwEzFmFZsM3hi
	KFiXpUqTBIRAgfG7oHNGLz9ie16iOSuROCb4IZ6VgnV6T5qIROCPVOua0zhScE9Agu5T
	0N4n080342xwWVIcy7fuNMzCBLAPjD7Nd1Jn3XmEe5/hgyObYyoXdGU8kTZGfiBsv95A
	E2Cg==
X-Gm-Message-State: APjAAAXzcNslAcSkVLRvTJKLXCWHukLOMYr1rWhRn7tTmO0ddBPgICY6
	eJnlzbeR6IEQgLNwtialMo7oH5jd3sU=
X-Google-Smtp-Source: APXvYqyhfV6cfxuaCgys6OMAo3ornkYCH7Usa3IXG7yMjCkrNI7e1jq9cEf7BYokwZZRvXoRNPaZTg==
X-Received: by 2002:aa7:8dc9:: with SMTP id j9mr53417297pfr.233.1568319519423; 
	Thu, 12 Sep 2019 13:18:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c2sm27091883pfd.66.2019.09.12.13.18.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 13:18:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 13:18:31 -0700
Message-Id: <20190912201831.51848-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] mycroft: Make rdep on alsa-oss conditional on glibc
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
X-List-Received-Date: Thu, 12 Sep 2019 20:18:39 -0000
Content-Transfer-Encoding: 8bit

alsa-oss does not build for musl so its marked incompatible for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
index becd0bf790..8d1c9179be 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
@@ -64,7 +64,8 @@ RDEPENDS_${PN} += "python3-pip \
                  "
 
 # Mycroft uses Alsa, PulseAudio and Flac
-RDEPENDS_${PN} += "alsa-oss alsa-utils alsa-plugins alsa-tools"
+RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
+RDEPENDS_${PN}_append_libc-glibc = " alsa-oss"
 RDEPENDS_${PN} += "pulseaudio pulseaudio-misc pulseaudio-server"
 RDEPENDS_${PN} += "flac"
 
-- 
2.23.0



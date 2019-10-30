Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 287347F6CF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 08:05:34 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id c7so1009463pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D0K0Ecvh36wQZhIWyl2GuOQjap9i8zCuHkSU6JtyiR8=;
	b=EmoLHVacEbKnbz4+vUDCM5K2r8NP9+Wn2plnpdCxkZivYS2ZoqNj/4ZA9aAGQx5G8y
	W3ap15G2TJq/zDMFNAdWLqv/L3uMVBibz1t8iU7BYmVSksJS4HwqlZFZ18z6wqCUTSB1
	H4zw4J3B3EFTpg+pZdz8Qta8KUgyhl3fGd5BlE4PUxSEkglvyGEaMz3Lzi/Nvbns0DlN
	e3PhbUUlCpjVcv9z/Zh5ZxnhoNB9bQqi8pugmFtdxlmncR9F5OdClR+k6gR3e+7sHNNk
	9bzwqD69qw4o7+IMCWJMOwINLuTs8a3ajMHlnJf4x7aRdJqyny3L6XnJ5qNygUqszMEh
	k5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D0K0Ecvh36wQZhIWyl2GuOQjap9i8zCuHkSU6JtyiR8=;
	b=cMmnT6AOSD3sSKcWHUfMYT9X6aeUqa3hixkuXmS2N2ciNo3OypxHdCUDehgaD8/sl1
	APahdxXHM0AaQTmCBq9FnX1Su3OottFQJGUg0HOPF9cDD8vvuyetsvM1N4CKKSHBqvlV
	md2ENBIZ9OYhjvS8/Ao0piEu+wYGSQCP/kwoWofO3nW8xukWkXQeWgqXW1IVO/eiucsw
	JdL+z39zEsDQN/0BEDzDDDQnhfm7f1+3XQZkL37AwwK5JWvXNjvmF1Lm3E01F16TDQqX
	z4KcFnZV++7qDDOMqgLhPerngVfscxKm7eZ9H3mLEBdvtVp/YKLGAgFAshqONYx3xOF/
	JgDQ==
X-Gm-Message-State: APjAAAUcyWsi3wAZDvbzi4auvDIIOv02rYwBsfU7Dfclk+mS1qQrXIFx
	bXESF8ywCq9vX0av51H8oGcpBGMC
X-Google-Smtp-Source: APXvYqw2jg/lojzoxv3cAQJWNg5NdMM1O3eKUnQD+kpWYowm6aYtmQKBqx/VS1dTYdPv4hfs0z2WRQ==
X-Received: by 2002:a17:90a:b118:: with SMTP id
	z24mr11956342pjq.84.1572422734942; 
	Wed, 30 Oct 2019 01:05:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	g24sm1629137pfi.81.2019.10.30.01.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Oct 2019 01:05:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 09:05:30 +0100
Message-Id: <1572422730-16094-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] packagegroup-meta-multimedia: Remove libsquish from rdeps
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
X-List-Received-Date: Wed, 30 Oct 2019 08:05:35 -0000

From: Khem Raj <raj.khem@gmail.com>

libsquish builds a static library alone which is primarily used during
build only. There is no runtime component to it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 365618d..cef45f9 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -27,7 +27,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
     opusfile gerbera libdvdcss webrtc-audio-processing \
     rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
-    ncmpc libmpd libsquish dcadec libiec61883 \
+    ncmpc libmpd dcadec libiec61883 \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
-- 
2.7.4



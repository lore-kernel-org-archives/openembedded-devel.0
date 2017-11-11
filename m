Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71D60785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:05 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u40so10746423wrf.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hm4cgSsKWLXwSFiSKKjcQzjCEUUKQFA/HdSTwPkbaf4=;
	b=SzTbZi5/xWZoxTtCmyx665S/Nxbk3zQPa6t1rarUBuN34MdFw0KMdEGPfpgo8TQH32
	I2vJWTl6LYqyIPz1OSI7ryeSOfEivURqoaRZMEzzltFhPF/q1ps+G93ACy1qNa7bIRNr
	5UNxcKZrjPiUuC3VJY2MOXQC/QNHBNkhXsECTPmpp1v2t2D4/OmHD4H0PI9ON/K0LYMZ
	vM5eQ55EaasxAPQdddWnw7teVAOLwl7kUoltitwQmoXKks1ItdOQFMia5PYrkiqf6ZpF
	einPUIRF5O8LMUKSB1LAOrQLavvVQVXji/5pJbxETqgqcfKyspR+RdYGUYOfsjggegMj
	cXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hm4cgSsKWLXwSFiSKKjcQzjCEUUKQFA/HdSTwPkbaf4=;
	b=dGBT3a9saSYBHKIlJP2caq2zVpTSsWTOlgQ1q1qfR1jlH59A+YrOlyMb2Oy/v5oHy3
	QulfnxnrSgoTxG8xjK67fAP7MiITJ/VV+vtKUdGlPfBbFfeoDN6YPxyYa7tURalS7s/K
	1k4dj63AnPEzYb7bs+aAwSLvmeL8KlAgInTHp77hxodkUix0BKhC3I0T445+71uR0PFq
	eWNde8X9qteb03k6cvzPTXwproqioI8xR+r6aeCp7u5PxJ6Nfx32foCZZ4AJpeDSxaap
	Jzi44XturWt/4ON5ehiF9HjhkuZ4epU9cJBI0wEYgHCNA45G0Fu7YlYJS41dxVWueo2Z
	C7gw==
X-Gm-Message-State: AJaThX4JhBE0++zO2twCUdrt53+wfIgt68522VTNWNNOkXfKfqPYTXl0
	JPpt68MPgaqYDWbeaPMy68C07w==
X-Google-Smtp-Source: AGs4zMa+3hRKxx95Av7ORvDcOW916l2DA6a1oYgpsG7TR4aXSiupZKPWVLwLfvK/MAlKB1bi0tnKAA==
X-Received: by 10.223.195.203 with SMTP id d11mr3181235wrg.39.1510407006838;
	Sat, 11 Nov 2017 05:30:06 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:42 +0100
Message-Id: <20171111132950.12570-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 05/13] xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
index 4c7ca70..ad0b54a 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.2.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "e0ffde419fa030f1f9bd0b56e3264a1c"
-SRC_URI[sha256sum] = "8d9330ddf1d44a864a36d566cce4b76d4f859c5984bba7653d7dc39aa24d5c3e"
+SRC_URI[md5sum] = "da70bb47755cccf8898dc5cfbe31a6f2"
+SRC_URI[sha256sum] = "fd4ae178912dc17ffb16ce887db24545624c7f423a02bd2eab47d52758fa99d8"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.9.5



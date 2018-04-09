Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8C77484B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r191so22033414wmg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aMq19rYRpRoy50GSdhisAPsA/q5LWHILLz9PvuVfgRU=;
	b=oMqJ78AWDWcdjUReytUhjnFeOdFMbXX0acbXgTROD21wrDfpUZCPqtfVPMCuowfttC
	qkjioSi083dq1jn4w5kvMCfbdDcUdeXx2zAGSdvWtwoig9Nq1yDCFqeCwYaYI+BFBeQq
	qOrfgn9TT4d0B/fEGEF9RolG01GbcAruOI0mS5/tsna1BWFArtNlsdzh5GuRH39ioxlf
	lt0Ay767PUNMZfkigtwZTOJJTTtDxk9QS6pDTMloHXYACMsMLae2U6XJe39y+QzjK9ph
	ByBHlSnbwXuCH2RPL/ytNlDjHQSIDCPVGUwd16ZCrfj8IJdB1kdqYF5GeE/vVDJD00JP
	Hfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aMq19rYRpRoy50GSdhisAPsA/q5LWHILLz9PvuVfgRU=;
	b=tjzPAaV0BWYbBjnkujyEiBsUax2pqOjkp8I0GF9MKWUZCNgHL+gsHmyz2s/tCXSBpL
	UcX+0SRVM9HMtWS6R9t1QYwaA+Rtwur3j5kqWqTc+HdA0Ze67cmFXU/+BD86BI6F0x4l
	YjujfnPvPiTsNPmG7YdEb9FR2LtM0Pavtc9rax9CnAeR9d3s38csriTCQvPko+I6b6nU
	RYKLbJZ4duRYJ94I+lkZj5cKdousbNJiPDyCEKg3jeXo5Lic5dIgFAqL7v/WjkHfrwcE
	Nu6ORrxkhb33rZBguLQTdIjM58UkQg+uRjE2XimYrrCYwB8mUZKbIn9K9h0Utn9zE4wb
	yowg==
X-Gm-Message-State: ALQs6tBiDacM7pjwKFMKelIp1dy8pRJPoiz/YZdTmqbycFogrIZKyy0G
	tnYDiGNcLrJndxhYbh9epAvvzw==
X-Google-Smtp-Source: AIpwx49Th4U5PIgVas5KGTz4+7eiuaC90XUh9LEwCzaxZnVxIZH2EDEKL9lrCLS/9dKv4FJu2J3jjA==
X-Received: by 10.28.194.8 with SMTP id s8mr1023220wmf.134.1523311402912;
	Mon, 09 Apr 2018 15:03:22 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:49 +0200
Message-Id: <20180409220249.11796-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] thunar: update 1.6.14 -> 1.6.15
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb
index 585a46d82..170e25070 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb
@@ -9,8 +9,8 @@ inherit xfce distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "22ba809c5b146738a3531c9abca78522"
-SRC_URI[sha256sum] = "d6112133a1c43494e3b1cb75e775e1d05988805a06fd1e11253e9a29b8ebe59a"
+SRC_URI[md5sum] = "8fea2af69c3acbb273fd1a177d3d8e47"
+SRC_URI[sha256sum] = "e81291a8519f495e0a059ff1f2d29608bc6d37c0be83b1f38f3c9aa25f8d252d"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.14.3



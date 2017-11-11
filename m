Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 875527863B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r68so7450759wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=meocHJLMj/PZzwMH0REvRI/UX3hujrwVPh1jxAxWaCo=;
	b=f1T0XRf/EW8afwsVYbfku2P/PnwqWtSynwdGObOHV6fCTeSsu/wpmK+vpgeMWZ8OGp
	06VN/B0QguFw6MJssruierwNUZS3WlnBM75VdwNH2OgnfhiXB0tnXd/RcM4+slqikBQ9
	Sy54GG/LdUq//1PuoYfo+9KOat10670/1tWZYxhQcnMJQVrkOJMLITIdyb6mehM0iu+v
	yuyKevA+2ek1IhLAcYUGpV35k5ffX6yhqstmL6qbHzb/oiT0x1gqH5GRsXisYLy6SXDM
	MXZl04CFb99cyMw8p7euHcGLyxDS7vDhyurgQ4IPyNTXrLdQX8kaVxhve96axoty3HVo
	/dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=meocHJLMj/PZzwMH0REvRI/UX3hujrwVPh1jxAxWaCo=;
	b=mfaDvDYcG1NydjA8I7WuA75oPGkPbESbSrelf61BKiHwP1KUSHsJMDh8LJxqN50nMX
	32/jm8r4nlMcCD+hkrfxMORb2WbxURt22JZQhJfOGxo4ARPXU2rIEVge7bbF/DTK5aA5
	dpWrbkRt5kMC2ihm5JFLy9fyBjf8P1K8zOOTnw9te9/aljJ3Q23sMKb8YjZoCjWmOjox
	8V7yWSkrzeq+2hJ2wsVirLmQvFSI/6UAnF4xSO35bSXihrCkRO6pP4S+MuJn/aKYAumb
	xh+sukQQHPv8ij/0cgcsR8vr1l9krwVtR2g7RxoJ8Gb5lV9shB/+HAl8b67YjyiRXGsb
	qrlQ==
X-Gm-Message-State: AJaThX7DnDCfLxyRrz1FeC7brp3HlpG4MOZ4MNIYLENLmssdCmFZKwS7
	Pyf1v0O3s0O0bBOa5QCRHAVBIA==
X-Google-Smtp-Source: AGs4zMY85D8apGQqOCnrT1cgSgHcUUFMcem2Nirf8LAjhJM1SyPh03pf+yPjrCDwJoD6upqFCbFjQw==
X-Received: by 10.28.227.139 with SMTP id a133mr2718720wmh.104.1510407013799; 
	Sat, 11 Nov 2017 05:30:13 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:48 +0100
Message-Id: <20171111132950.12570-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 11/13] tumbler: update 0.1.31 to 0.2.0
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/tumbler/{tumbler_0.1.31.bb => tumbler_0.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.31.bb => tumbler_0.2.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
index 1786eff..7e0c555 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib dbus-glib-native freetype gdk-pixbuf poppler curl xfce4-dev
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "0067054e6f1f90a13f90faadfca1e89e"
-SRC_URI[sha256sum] = "d0fd329273ff6ac98885eade4c3d8c87a4dd0816f713646130808bfa90b87173"
+SRC_URI[md5sum] = "dd5f9bae6a2470eb5fff0dc9edd3ea09"
+SRC_URI[sha256sum] = "4e27a59694b0a5cc69ebccbdb00c724e670b5b7c30bc4dc0b461aac93f234fac"
 SRC_URI += "file://0001-configure-use-pkg-config-for-freetype2.patch"
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.9.5



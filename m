Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C64F9747CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Apr 2018 03:25:22 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g14so2067461pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 20:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ZvjOw5KB58DIdcT/uNb5K9PFgqL/TVRgVZEGbSb6vWo=;
	b=S/r9AfAnfFqio3eqfQAPfkM4AzbVxjWjAj4MchafvlSelD2BxgSsDdDS5CQxHzbyfJ
	eKJO4kOMukFd0XqFAtm3DTgTD8z8YxJsA0j4BJuO9JilXHZpFMOQby/nGoMO9smXguvE
	OMEGBQWIl1L5IPpL2sl4OTHlQqqXvkVfSTQwdZPmdfg4/IhT7AmGicxf8jPykBvv5aYh
	wNlZpuqxIEXrhmpdyVaZCEfq9zzKOt1FtRpEB9M8LYS2GnhozYLbkiy+2LY6S5qNcKhY
	2ZiPRAJdxsK1mhzihgo0ltc0kIsthCbPr7wBnbQNN14/qQvDFUUmgiMAmMuhXbMYTcHB
	SoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZvjOw5KB58DIdcT/uNb5K9PFgqL/TVRgVZEGbSb6vWo=;
	b=WtgmPfaVnwYcCGM7LyTJkRG7nGvrRPhFsNMTnmCutBKQ2KPDK1dxQBqqG084ncuZpk
	QXYm7g+tuSbrVHOWg9wFzldLYd6XvuBvP9TUtwNNdImXyIJHCn4/S3n1PsPZsyhHYxHY
	BmHLf/UVuPIbmOXffhbhZ0Bqthr7BZx8r+x/JYsggpldJe1eCsZIOVLdt3OBoKrttuki
	zcgRZwYEOxerIsFeQpudoh9x3+KAvWViYLJRyHVZeR+f1d5tv7nhBJqsVJSw7Fif0HKF
	NRgDuqYuHjTPS0iTIuEz81x59n2Vr/vorkqhfAyx6HDgBqoD3NaE3wwyAtKgiQdur6wZ
	IJTQ==
X-Gm-Message-State: AElRT7F9j1Ir3A0GLvw79DB+XPvv+WJrSe/l2IrSwXQruAknFYQxhqK9
	HUvCF/1o/o9v0+DJlou8JQ0=
X-Google-Smtp-Source: AIpwx48im2gFq5YxnO7MhFeGSNgnv5XMfQ30pFYisoP2QCtriN9BsFN4ZmEpK5tkrppgOySZh2+fBg==
X-Received: by 10.99.97.138 with SMTP id v132mr19240388pgb.138.1523071524142; 
	Fri, 06 Apr 2018 20:25:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:b522:b15e:6381:5fab])
	by smtp.gmail.com with ESMTPSA id
	b184sm14467267pfg.110.2018.04.06.20.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Apr 2018 20:25:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 20:25:22 -0700
Message-Id: <1523071522-30452-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][v2][PATCH] wireshark: update to 2.4.6 and add upstream check
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
X-List-Received-Date: Sat, 07 Apr 2018 03:25:23 -0000

[v2]
inherit upstream-version-is-even instead of creating my own regex

Security fixes:

   The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2018-15
       The MP4 dissector could crash. ([2]Bug 13777)
     * [3]wnpa-sec-2018-16
       The ADB dissector could crash. ([4]Bug 14460)
     * [5]wnpa-sec-2018-17
       The IEEE 802.15.4 dissector could crash. ([6]Bug 14468)
     * [7]wnpa-sec-2018-18
       The NBAP dissector could crash. ([8]Bug 14471)
     * [9]wnpa-sec-2018-19
       The VLAN dissector could crash. ([10]Bug 14469)
     * [11]wnpa-sec-2018-20
       The LWAPP dissector could crash. ([12]Bug 14467)
     * [13]wnpa-sec-2018-21
       The TCP dissector could crash. ([14]Bug 14472)
     * [15]wnpa-sec-2018-22
       The CQL dissector could to into an infinite loop. ([16]Bug 14530)
     * [17]wnpa-sec-2018-23
       The Kerberos dissector could crash. ([18]Bug 14576)
     * [19]wnpa-sec-2018-24
       Multiple dissectors and other modules could leak memory. The TN3270
       ([20]Bug 14480), ISUP ([21]Bug 14481), LAPD ([22]Bug 14482), SMB2
       ([23]Bug 14483), GIOP ([24]Bug 14484), ASN.1 ([25]Bug 14485), MIME
       multipart ([26]Bug 14486), H.223 ([27]Bug 14487), and PCP ([28]Bug
       14488) dissectors were susceptible along with Wireshark and TShark

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.4.5.bb => wireshark_2.4.6.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.4.5.bb => wireshark_2.4.6.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
index e330b99..3da0a7b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
@@ -9,12 +9,14 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error"
 SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
 SRC_URI += "file://libgcrypt.patch"
 
-SRC_URI[md5sum] = "2b6f1f37c72fa15a0a1863016a0abcc0"
-SRC_URI[sha256sum] = "b3b2ec29fba0f4a3a590438abe4054e56f19108d440fc2d61492db9d8ff16fd7"
+UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
+
+SRC_URI[md5sum] = "8cfb73e286dd6427ca4405e6e802d13e"
+SRC_URI[sha256sum] = "8e965fd282bc0c09e7c4eba5f08a555d0ccf40a7d1544b939e01b90bc893d5fe"
 
 PE = "1"
 
-inherit autotools pkgconfig perlnative
+inherit autotools pkgconfig perlnative upstream-version-is-even
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
2.7.4



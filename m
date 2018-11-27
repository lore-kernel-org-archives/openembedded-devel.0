Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id AFEB16BF43
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 06:13:20 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 70so7351693pgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 22:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TiEiEoHCuyK96F+2ME59x0/TYHcf1Akw4LZWBnzZTGY=;
	b=D7Iz+o5Y2+61fPFzxGmIC5vPUWIFelKfbgY+tOilu1/aUenxqTwKNLIe/ZfF3qAMxp
	JXE2bVP3Hk0snlsaJU4Kii4Shmq/AfbIdF89l2z7S+vZAXO6M0YRcPatKawcwGgW/hB/
	l28/iFrjL/t/3jOLRoXCrKKlwdRsyME+bIiWrQZwloWQPDiScZnrAuxVGYXP1TxSvUnl
	6k+te9Y65JdpRQdGllGMEAzj0wfjnfDCtIHMmVMnw6+1Gl284X01r79SStX+y6gl9mmZ
	5cnSJjDQtAGGWj1hQ7uXXW9TPX4XQz9mAELuMmE56qEXAvVAyPG/ffh3Ff2E3HAFeN0O
	z3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TiEiEoHCuyK96F+2ME59x0/TYHcf1Akw4LZWBnzZTGY=;
	b=lNSq721hnSSNH4GNBKjcH543gWUGJiWBnQrt8UAdQcYbfLImfMMnyRx6mmAEYOLv4C
	c7yFNC8FQ3Y5hjSo9yuoJeAg/4ppOxh26WxQZ3CVE+33d0jTdsjDSPw+uQFl/+6hWTNi
	44GDwhDb++IOLb2hme8RUtQcdkV6XsM1B91Zd3AIEiDvIwCoEdkPU2q4W78nBJHhn1JR
	Svx5QnUGuTLEQ90dX7IA9fgnmxFksCEDn69aJ/+G/8/oZNbtksGoRaI8alYYYMNaI/Rt
	HXzWckYjejv2TNnHxEVvCI/QvSRWtBzMGMUuV+xB2UHJdblSP3RdfFL0zFnQ7Hs8VXss
	AFpA==
X-Gm-Message-State: AGRZ1gIZ3jYkJJAkEJe0lYXZNab+SuZScBDChiYMPLRb7Op5rALTE9zw
	gZWERBVpMcGQkrDsDsK+y6qEXnIiA84=
X-Google-Smtp-Source: AJdET5dPxCD5T904p6SZX/HYsjpuf3DNB5JnIMuiBDANwHaTWNZ9zCnE41s76PndCfw4zuOkr0NqLQ==
X-Received: by 2002:a62:fc52:: with SMTP id e79mr31866194pfh.8.1543299201201; 
	Mon, 26 Nov 2018 22:13:21 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	19sm3340405pfs.108.2018.11.26.22.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 22:13:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 22:13:11 -0800
Message-Id: <20181127061311.18978-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xscreensaver: Define consistent app-defaults dir
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
X-List-Received-Date: Tue, 27 Nov 2018 06:13:20 -0000
Content-Transfer-Encoding: 8bit

This is otherwise detected based on host machines X11 install directory
and on builders where x11 may not be insalled this will default to
another directory /usr/lib/X11/.. instead of /usr/share/X11...

This patch makes it consistent and avoids poking at host machines
install

make clean does not work so enable CLEANBROKEN

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
index 6ebf3c798c..3a88f12ec8 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
@@ -19,6 +19,8 @@ RDEPENDS_${PN} += "xserver-nodm-init liberation-fonts"
 
 inherit systemd perlnative pkgconfig gettext autotools-brokensep distro_features_check
 
+EXTRA_OECONF += "--with-x-app-defaults=${datadir}/X11/app-defaults"
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install_append() {
@@ -27,3 +29,5 @@ do_install_append() {
 
 FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver"
 SYSTEMD_SERVICE_${PN} = "xscreensaver.service"
+
+CLEANBROKEN = "1"
-- 
2.19.2



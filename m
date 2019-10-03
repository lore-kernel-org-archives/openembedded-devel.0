Return-Path: <george.mccollister@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1510B7F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 18:08:38 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u8so7721572iom.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Oct 2019 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RH2WRFX+HFGF7Md43fBTkMkLmyEX3WNy/o+LblWxTks=;
	b=X2tqcF9+jQ0GyLWh3sZ1nrGD0JK3sjp7YQvWxXs19j3YC5ZfjE8j16Or840Q3HF8aD
	F26LTmuZudQD2ZYfVxYky59kA5eDC7KWE02IRrSVFXXeD3iFv9ppC8ZQ4RHG/sDesSQi
	5sjfA2ewAtadPIZ//dL54CP8EpszL2WeEL58IiNNq5PBDjaEbSuB5Iwxa7PXW0Q2f8GH
	hmXGu0iN9c6AlrBJr2c+3g6C6RO6+fhZMSt1zUdmv5bMrWZFjs5u9h/+St3oS6s2xMaN
	FNZ4nKqhQI4W8BmT4BYB1hJMGhYxRhiBt1gI5mw9/+CMJix76iP9Xg7TkdrPFgvJoqhX
	66Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RH2WRFX+HFGF7Md43fBTkMkLmyEX3WNy/o+LblWxTks=;
	b=pExwYp/mNGj13GPvOdRmVrC22OCdrM4f0JjWfzGvRhRpbFlCftiGeqM9BDv1XV9Wur
	Rwzp7Ecyp2ihZLAsy05OyJWnDNBsX/35mcsi0TvMThSwJdhjQ0Hr+uiGlb7/bOSFIRAs
	/WJhRc+tlSRpNSY2Gqo585hu/benCK4YsM1TP4LpPF9Sv40C3NQf0AezarZllsngFWWU
	XMXkn+ObeZG5FeqvGTfI5Rx4GkHtQlxk5Narw7jdMHvqhEvGMiGCliefjFXxN8qV4Pf/
	9AqPruZu6Ac46uma1mmF6QlZs4Cq84IoYe9Brwe9vGfOHEB6XLfP9uWsf8BNNKFAihg5
	cmNA==
X-Gm-Message-State: APjAAAW4R2hK04AcZlkg3hfVvkeU5UNXkTsukRDv84RFapjDPoYHyyvT
	7Ye5kB2YTWtqaHW6BLvYekuUOEg=
X-Google-Smtp-Source: APXvYqy4/5qYXPShI1BciNi4CCh/+BhGIQBqlahgxLZinCSBvYF71VscA0ZHk2JoiATkc4av1lf0fQ==
X-Received: by 2002:a6b:4416:: with SMTP id r22mr9136054ioa.297.1570126119201; 
	Thu, 03 Oct 2019 11:08:39 -0700 (PDT)
Received: from george-i7.novatech-llc.com ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id t4sm1980422ili.8.2019.10.03.11.08.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 11:08:38 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Oct 2019 13:08:31 -0500
Message-Id: <20191003180831.26315-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wireshark: fix qt5 build
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
X-List-Received-Date: Thu, 03 Oct 2019 18:08:40 -0000
Content-Transfer-Encoding: 8bit

Add qttools-native to PACKAGECONFIG[qt5] DEPENDS to resolve missing
Qt5LinguistTools build error.

Add qtmultimedia to PACKAGECONFIG[qt5] DEPENDS to resolve missing
Qt5Multimedia build error.

Add qtsvg to PACKAGECONFIG[qt5] DEPENDS to resolve missing Qt5Svg build
error.

Inherit cmake_qt5 when qt5 is in PACKAGECONFIG to resolve
get_target_property() called with non-existent target "Qt5::qmake"
build error.

Automatically add qt5 to PACKAGECONFIG when meta-qt5 is in the build
since adding qt5 via a .bbappend won't satisfy the conditional inherit
cmake_qt5. The poppler recipe does exactly this.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../recipes-support/wireshark/wireshark_3.0.3.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
index 6de188da2..a3c0b4998 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
@@ -19,7 +19,7 @@ PE = "1"
 
 inherit cmake pkgconfig python3native perlnative upstream-version-is-even
 
-PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 
 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
 
@@ -41,7 +41,9 @@ PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qtbase"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.22.0



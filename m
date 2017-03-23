Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8CF779C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 09:46:32 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id a6so79255888lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Mar 2017 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5TQCxwkDNi8HPg7KYX2fnkoYAZmTJAOlAuOCPGkqtRo=;
	b=kZ8HLnJDrXEQrjZ012zgGu8CVxBFtEHcxUG2W+JmmJtkjpj4AvcIKAone0a/LhtuCC
	lkmlcmlQBDgG3tR1choCzmvlILRlXzzujORXNmFyXBT6sLddWCoof2ynRiIUcAigidoX
	wZGR11t2FFKKcaPYEIfaT7rcwI9CAb2706OCpFzr1KYEy/Pn/ABkfRHrySbgldHAbG2y
	7l46tGIzYHlI/+K23ciJHHfEN93BnKDGY5WfiDIGpTZlQd4YbpQrttnWqr0YOTlP4hrJ
	SOKiIEaCmZKCa+QyNvnSvKGEwPdzGLiQMPdGiUTo+ipPXCMp5G94pZDu6Iph2PvDJjv5
	AGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5TQCxwkDNi8HPg7KYX2fnkoYAZmTJAOlAuOCPGkqtRo=;
	b=MKf7JAMmZu9U0yIN5wG/awDePFsYGQ1s+hweV5coh5gP92MFZAIUPh35pPlB+l5+aU
	HzAXXZ7401H7B9ayrkIRjBtXJvVrvu2wGfa9oYfkXJJXzQLyD0k55JqqnkOfXL453RiI
	4B29ew+ub8NvhvPKpv8EZo3TafunnecKDYQV8HsFFCKrXbBMgBcGSLUkXPpzB+/cfa0X
	lwsKaoLdGoQ5yfcBE3KOEnZoVWbxXVRepG3kaEpbrCiBpQi8ntRMNaXQiUW3tgPF6oGh
	Eid64Aj6mhKcYpKrL1kYR0umcbg4oxMp4G5SHSqQ46/ExelS7SRUCOJgtijcqvoj8lh6
	1wdw==
X-Gm-Message-State: AFeK/H3/292H74NeVnZL/TrfSu+IVxJEkZYSDDZWwcbxjmRc17EP9GZP6Kqpm0dvdCBAXKc7
X-Received: by 10.25.72.145 with SMTP id v139mr926499lfa.74.1490262393372;
	Thu, 23 Mar 2017 02:46:33 -0700 (PDT)
Received: from gordanmarkus-XPS13.IHU.local
	(static-212-247-53-108.cust.tele2.se. [212.247.53.108])
	by smtp.gmail.com with ESMTPSA id h7sm437193lji.10.2017.03.23.02.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 02:46:32 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Mar 2017 10:46:26 +0100
Message-Id: <20170323094626.6310-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtbase-native: create empty oe-device-extra.pri
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
X-List-Received-Date: Thu, 23 Mar 2017 09:46:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Suppress multiple occurrences of the same warning while configuring
and compiling qtbase-native and nativesdk-qtbase.

WARNING: Unable to find file git/mkspecs/linux-oe-g++/../oe-device-extra.pri
Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index c013029..d40a751 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -83,6 +83,9 @@ PACKAGECONFIG_CONFARGS = " \
 export OE_QMAKE_QTCONF_PATH = "foodummy"
 
 do_configure_prepend() {
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
+    touch ${S}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
+    
     MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
-- 
2.9.3



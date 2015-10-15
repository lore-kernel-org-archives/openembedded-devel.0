Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4505770EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 18:21:33 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so40766676lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6ttI5FK1UkQBxK6AaUe4zEw3NsPX8r7yKQQYcN54SZY=;
	b=mXBiVlf9JnRO0YBN3EpxPH7kCwYpyWafxWIlN+hRGCwdMQRU7UExXbMkXtwz1kE3DP
	t17OZYmvCEzcQesZDyMMAPv5aaJw2ypvI7rAl7rEC33o0/xFerTh7pwjnJ+J+SsHPPrP
	Q7n0KChRxH8ZncrYKODbax5x8Li90vnO7zPv+iXk9ku+FzJha3VPHk4NW+jr1RCfStQb
	LzSlqtwDodBksOOGo2DWJK5VxCUtAZSzLWbZX0aCqBBkMDe8XcWbWd+KOEneQXw/E/tR
	A67Q8JhtsAiEelVODd5lS7We30riHCIrPHRFUB+G2kBKEPgKmv7f3AXHLNZSHoA/bkmn
	PPvg==
X-Gm-Message-State: ALoCoQkLeKNw0JSaYqRu1aW+6u6gvUqrWvTBOb8UnFXCbra3k5BJSyYmT+diTFCtCccIACNyX6Uk
X-Received: by 10.25.15.42 with SMTP id e42mr2187803lfi.49.1444933292750;
	Thu, 15 Oct 2015 11:21:32 -0700 (PDT)
Received: from localhost (scandic817.host.songnetworks.se. [212.214.188.138])
	by smtp.gmail.com with ESMTPSA id
	um10sm2219932lbc.15.2015.10.15.11.21.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 11:21:31 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Oct 2015 20:21:27 +0200
Message-Id: <1444933287-26444-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.6.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH] qtbase: fix QA warning of host uid leakage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 18:21:36 -0000

Two files in /usr/lib, were own by the uid of the build process.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 39d02a9..99ac208 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -232,6 +232,8 @@ do_install_append() {
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
     cp -a ${B}/lib/libqt* ${D}${libdir}
+    chown root:root ${D}${libdir}/libqtpcre.prl
+    chown root:root ${D}${libdir}/libqtpcre.a
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
2.6.1



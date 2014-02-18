Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id B40826EFC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 22:30:43 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so17301134pbc.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qfXGx9InwqQXh6SSPv4IVIVPpDp54pSQ5+NAnqvPEhw=;
	b=gFUaeTHPAQI0E/ED5U6Zr3sdJuS6VLAjmyK9rXZXSvsKCakc6lxH6LebE5UskcDzus
	OBTmlY4bbG02yHAvkSya9Io/X3M1fKZHbgT8/P4rH7dgPjhxMxtnUqm4U6Dn3NSEapX9
	lruRBEl8jR6O2H32WDltnEJICRqdKw8BzYZnH2tG73tMwYh5mLkEZHnsVwyifWQ4QOB7
	lEn12XQEKW7KOv8GlbXgUIwBDqmgPsrmsIK5dAAcEt5ya8Q471OK8GdcgjtX3tz8IOtc
	zCZLiFRXJ87pLE0CBnuN7cAX+B01/CeCA32glhYyPG5H4sG7ebYD8ZSJsIStU+CZY0m/
	iTkw==
X-Received: by 10.66.221.103 with SMTP id qd7mr35440102pac.44.1392762644488;
	Tue, 18 Feb 2014 14:30:44 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id c7sm59449408pbt.0.2014.02.18.14.30.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 14:30:43 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 09:34:53 +1100
Message-Id: <1392762893-28488-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [meta-qt5][PATCH] qtbase-native: explicitly disable ICU
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
X-List-Received-Date: Tue, 18 Feb 2014 22:30:44 -0000

This prevents configure from detecting and trying to use the host ICU.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index b9193e4..902b9ed 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -63,6 +63,7 @@ EXTRA_OECONF = " \
     -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
     -no-glib \
     -no-iconv \
+    -no-icu \
     -silent \
     -nomake examples \
     -nomake tests \
-- 
1.8.5.4



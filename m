Return-Path: <s.sonski@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1362778213
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:56:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f4so6140149wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O0krMsi6QECbygq65jGI3lGVJ4bpldt78xn2nAff75s=;
	b=lVwFUXHYp7WlT1K8AvHGCg8/ej7TiSZtAKFNxkyMIFWHqGQR2xvztuOV+5sWyWYMVf
	XVj42ipixsitq3uihkcSIr/BJKlNbnAx46Kh3+/28/U5JrewOyAWtCjeNVdHlzIBtynx
	o+Gj1glRfTNVepL+fDaozYNpQvUZCTpZpVeGzK5m9X1wV1LHyB1TtBWAlBznyWoptNwj
	8I7gvuz9UGzg7/vGxrE7CcUUv6raikYGO04kERN+drr4lio5Le+42eMrOXSvRB59UXdT
	hNiokH2mg/f2elFwUV/KkYNYMm4D12S9VuVN/dRlJh/U3rTsLgc3JjHu0gWR5IkVGVAt
	+uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O0krMsi6QECbygq65jGI3lGVJ4bpldt78xn2nAff75s=;
	b=ll02s+vLmtrpqcf/KcyMn5Lmg1XBHygZrcBNAY8A3yMPWTS2zPcYzhNKI7yyRnABs5
	q3F0t/x0awYNItIO4a6t2dW3BqxvhuwVnxSo/Tk/tPJNNKc/3FhEkjvOaBYB5LtVUzAO
	7tQyDdeAegj2PSTNWQofgV92JY+Xl7iGLE7n0W2bkwUVehGGvroRSpnR2alONjeOweFB
	uXRF3S7dkaykbtIitlS5jabGmxPWv7myjwt99IjXaRXDNkQdnbtnIN40fStmbn9M4m3U
	HzqPzESnpJFMfy8JcKgOJxhvTlm3oP8AWjIU/mZExKFd9WKkf+PXCqPptCsliCeFrDw9
	PP0Q==
X-Gm-Message-State: AMCzsaVNHhTTwjaKZKaQSMEwfavMjj3oqtt+8s8Ew5nxTRWgS2YEDuyd
	dle8CT/zij+uPMmnyhVJiR7FHr3N
X-Google-Smtp-Source: ABhQp+Rh9aKweKtFd5ZVeMieytKkcS2nSkLQANP5JSsVX/xo0zCEi3urvt5DaHD2XazNDGZxYKEo3A==
X-Received: by 10.28.134.66 with SMTP id i63mr4187100wmd.107.1508270212509;
	Tue, 17 Oct 2017 12:56:52 -0700 (PDT)
Received: from sonski-desktop.home
	(p200300C803DCFA0066E575A1101A0295.dip0.t-ipconnect.de.
	[2003:c8:3dc:fa00:66e5:75a1:101a:295])
	by smtp.gmail.com with ESMTPSA id
	z192sm8328100wmz.28.2017.10.17.12.56.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 12:56:52 -0700 (PDT)
From: Stefan Sonski <s.sonski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 21:56:48 +0200
Message-Id: <20171017195649.8657-1-s.sonski@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-qt5][PATCH 1/2] nativesdk-qtbase Enable objcopy for qmake
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
X-List-Received-Date: Tue, 17 Oct 2017 19:56:52 -0000

Enable objcopy for qmake to support separate_debug_info flag for cross-compiled
applications in nativesdk-qtbase.

Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                   | 1 +
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 87bd501..a650550 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -179,6 +179,7 @@ fakeroot do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_CXX=$CXX' >> $script
     echo 'export OE_QMAKE_LINK=$CXX' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export OE_QMAKE_OBJCOPY=$OBJCOPY' >> $script
     echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
     echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
     echo 'export OE_QMAKE_INCDIR_QT=`qmake -query QT_INSTALL_HEADERS`' >> $script
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a8fe433..3d1958f 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -94,6 +94,7 @@ index 0000000000..c1837e6d55
 +
 +# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
 +QMAKE_AR              = $$(OE_QMAKE_AR) cqs
++QMAKE_OBJCOPY         = $$(OE_QMAKE_OBJCOPY)
 +QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
 +QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
 +
-- 
2.14.2



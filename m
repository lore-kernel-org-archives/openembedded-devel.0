Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D520072F63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 23:28:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l37so5941094wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 15:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tTnWEHSPS05vakUTD56IIUoDPTjAedjhXR0/EgoJ+Us=;
	b=GyYFyinIVicvvY/TG65cd088zIsRR3tuXwTbCy/gVx09VeZ7IS5w6EJbpRcwI/ogrj
	nVbSbjQ9XX+DaIRG3aF5cY+qjnN6Qku9d32TWzQHTZOHHjY19zyPHFa+2f0/0WLeaVPX
	TK6iO2EZAODkzP6YQKuwgjtWZQjsL9TOTnPe4kWc/JjD9J+215pH8/PLDva+qNoERQWi
	nIfFvIiURnz0z0C07l6PshYQgGeWUjbEYN344QqjHDuVe2B6e7s8JH61KubNeifrKgfF
	lAGASOJO/uShpO2dKWvBlpO+qQwq9MSqqnElYFjigQHk2kW62WmZz5cU5rH6iCtqAeUg
	bb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tTnWEHSPS05vakUTD56IIUoDPTjAedjhXR0/EgoJ+Us=;
	b=NGaOg6YuduMr4l8pWxxSitZ+b82h50wI5noAZ3rB63HzpHwAjGBO5CNT1DPAyzKIRC
	akaOBKyrl6S09czHJFC+sk6I2Oa0iPhHOpbJ6KMNtaHe+kLBB3ecF1t+mXBPQHMaT636
	mhymllrF+HM31x25SOqXi6m77DB4U0thBg6Yz5TxFLCcNGD2V2gLvRarcnA3/5aOQEu1
	nCXNgB45+rrYFBs6yfjsokGCSCzArvPW3ZS/14Zz9iC6PlafcmklRPR2dLQoeJFLR0GP
	5pTdWUd4GoGvGRTHP/o+2OhvSrYvotFdpTRdu89Selr2AORV2tIt7AVc+3cGJR6n6Z8r
	9i7Q==
X-Gm-Message-State: AMke39mr8KvqxIaESgvtYjyRZqw1F9v6Jwyo6HkbSVNqZI57K91cAGq1EEvubYyme/RnuA==
X-Received: by 10.223.163.7 with SMTP id c7mr7584783wrb.17.1489015714233;
	Wed, 08 Mar 2017 15:28:34 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91BAF561E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e91b:af56:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	m139sm4514615wma.2.2017.03.08.15.28.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 15:28:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Mar 2017 00:28:16 +0100
Message-Id: <20170308232816.4303-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtwebengine: show progress for do_compile
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
X-List-Received-Date: Wed, 08 Mar 2017 23:28:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was stolen from meta-oe / meson.bbclass - qtwebengine uses ninja for
build too.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8e60d72..b945363 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -87,6 +87,8 @@ do_configure() {
         -after ${EXTRA_QMAKEVARS_POST}
 }
 
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
+
 do_install_append() {
     rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
     sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
-- 
2.9.3



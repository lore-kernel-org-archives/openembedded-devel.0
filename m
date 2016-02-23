Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D49C97732B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 22:25:52 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so245036087wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SoOBX1KzBkN455Z+3xUR6/t7IjAuQQsEWvCSmTpO/5c=;
	b=LPCsL4fve4Z3JYn1rsB0SkmRNGfxc3eDRrbb0FWPPPN1iPdQnIzpQMevRUXLRSs36R
	5LkGYFcrkDqRIIlUtkJWmjgU871H48CtcZim9i4sCbRCdXQFCcW1/dn+xjtNvCL67G6y
	VzrBULsLu3IAwdqIe+RSaMgnIcVsmos/GxuGtQ6E4fzg9KsX7u8bxbdoK9fxuIETwSts
	Dr/6ipvL7F/pA+GSlblJNLGBifgHloua4mRYmYohl7YK7mRoemH3yNLAiVxGPzBbYuGb
	8MLgwJlneTOFSTEP+b/lTM+dGpcN8AXZS2i1h9YnEcgPFIHtV8U2vUQIHnfxeXL+SI9w
	8H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SoOBX1KzBkN455Z+3xUR6/t7IjAuQQsEWvCSmTpO/5c=;
	b=gy3UJO/oD0pCQItSrL9HrCcPkXRWqyQVKmJFMWnyzr67OYo6UKrO2szRKpL9XlRfvn
	vQ6RiOby/m0rGT+N7X6g0GSu8ioOujZX4yTNM/cNCTs58oRWeeTEZl1mDRZDdpbh0nXW
	UXJ4pBo5h5CYDHpHvMuvsN2UOSzKKin314zQ0ITqIVdZDDiJokKt1Km/BuOGYJayvOB/
	QKbKwZrNZPCepcWg16jzUVrsR5/X15+BandhlIrVLRx+x1hkh+xT7MSbxxVZ+iOQFXQ4
	m1lBEe+rCWwE0fKSGNJItGtnU7kwDbPCPlxt078LHcOKxoXKyNfigntuSlAQrG+V7Pqh
	Zbjg==
X-Gm-Message-State: AG10YOQ0EdiNbMvyoTGnpzpom7v6+zHpGEppkcy7tRursqInkFaD0sRbIzgvJXgxFXDXLw==
X-Received: by 10.28.54.159 with SMTP id y31mr21609264wmh.89.1456266352901;
	Tue, 23 Feb 2016 14:25:52 -0800 (PST)
Received: from localhost.localdomain (p4FDF1808.dip0.t-ipconnect.de.
	[79.223.24.8]) by smtp.googlemail.com with ESMTPSA id
	k124sm410468wmb.11.2016.02.23.14.25.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 14:25:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 23:25:40 +0100
Message-Id: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [meta-browser][PATCH] firefox: fix install for oe-core master and cleanup packaging
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
X-List-Received-Date: Tue, 23 Feb 2016 22:25:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Could build test only due to lack of building image

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-mozilla/firefox/firefox_38.6.1esr.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_38.6.1esr.bb b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
index 8356532..4e4a7aa 100644
--- a/recipes-mozilla/firefox/firefox_38.6.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
@@ -68,7 +68,7 @@ do_install_append() {
 
     install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
     install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
-    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/defaults/pref/
+    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
 
     # Fix ownership of files
     chown root:root -R ${D}${datadir}
@@ -78,19 +78,9 @@ do_install_append() {
 FILES_${PN} = "${bindir}/${PN} \
                ${datadir}/applications/ \
                ${datadir}/pixmaps/ \
-               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/* \
-               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.autoreg \
+               ${libdir}/${PN}/* \
                ${bindir}/defaults"
-FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
-FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
-FILES_${PN}-dbg += "${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.debug \
-                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/.debug \
-                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/.debug \
-                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
-                    ${bindir}/.debug"
+FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config"
 
 # We don't build XUL as system shared lib, so we can mark all libs as private
 PRIVATE_LIBS = "libmozjs.so \
-- 
2.5.0



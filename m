Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D53276FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 14:57:14 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so29368129wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 06:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jqdqkNmUAxa4rm4vUxEf60ytKCCxPr5atUJGdPoo3B0=;
	b=rLUdkkn4+8JRH3wqpXEOTRmCenHi8RJAexYHen4X2R22oHAptFg18fXQb4OseQLttR
	AeBEXcflLmjpuur6ExqSR8Sa0Xtqg6bcnqEItBPnOQbXEdKEDVjofKJOD7bAuLAnoExM
	FQT2waY4o+l4jend2wujniroKa/PMgtwyKyIPN1i5IbQsxFBJERNjTpNnM6CEiXP0BVd
	NbX7r8VMp7DJYkpb4rJAxIuFmcob3GPXEMEbBeMmT+25eLKk0/z708bGOcPC9B8kBj1O
	onEHYMNhJFsPDPT7myMaybibnukTPpMnO2RyCO4QyZmjdu1zsSAGSvV789teIR5JhJOA
	LRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jqdqkNmUAxa4rm4vUxEf60ytKCCxPr5atUJGdPoo3B0=;
	b=coRhZEBGvARRdMzWTd2C8RwG0+H7pXwNM45DXTA8FNyAxqUzGk4Fk8SmQHO8KheGzM
	a0zXmofTtpWy+FQ6TAmspy3BLjkjy94pvF5ouyPb9C5fLRf0rrPHqxLI0SDsUlPeD1se
	XmbEux4se27q/racnQBNoNcIyX7eqq33tQdzJrMg7bO60zS50o2Sub/TJbaIs67FDbs+
	nWEfVebft3gT+Bf89WQcCWjWq9iLl4UKuhMnqnIOlnxKzZ3BJIZhC9SMn5cfsgsY89d+
	ghiFTDWt/NWYiGGoPEHk1cruz7zsk6LYGqQKPppf6ey70SqU8o5TYyMO2rzBYWs9HtW2
	ef6A==
X-Gm-Message-State: AG10YOQ7Rt2Rsl4yb31/R2NK6oWz/rlE1C6AWkygSYd0MwpLuU6ifZpyleWZCgL17Sv6Ww==
X-Received: by 10.28.64.131 with SMTP id n125mr3577507wma.65.1455807434789;
	Thu, 18 Feb 2016 06:57:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id q75sm3397191wmd.6.2016.02.18.06.57.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 06:57:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 15:57:34 +0100
Message-Id: <1455807454-10869-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] qtwebkit: Fix QA Warning
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
X-List-Received-Date: Thu, 18 Feb 2016 14:57:15 -0000

* there are multiple -L paths to workdir, causing QA warning like this:
  ERROR: qtwebkit-5.5.99+5.6.0-rc+gitAUTOINC+d2ff5a0855-r0 do_populate_sysroot: QA Issue: Qt5WebKit.pc failed sanity test
  (tmpdir) in path qtwebkit/5.5.99+5.6.0-rc+gitAUTOINC+d2ff5a0855-r0/sysroot-destdir//usr/lib/pkgconfig [pkgconfig]
* qtwebkit is dead, so hack it with simple sed, feel free to fix it in
  mkspecs if you want

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 559efac..9044d4f 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -56,6 +56,12 @@ do_configure_prepend() {
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
 EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
 
+do_install_append() {
+    # Remove paths to workdir, qtwebkit is dead now, so I won't spend extra time trying to prevent this
+    # from some .prl or .prf file like for other modules
+    sed -i 's@-Wl,-no-whole-archive -L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebKit.pc
+}
+
 # remove default ${PN}-examples* set in qt5.inc, because they conflicts with ${PN} from separate webkit-examples recipe
 PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples"
 
-- 
2.7.1



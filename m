Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88B3562133
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Oct 2017 08:04:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i124so6263913wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Oct 2017 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=l9NM7iaElyPWOoVjaZR6xBVzBh4Pa47RaSjxZRXYuso=;
	b=KIW9D+2ITyEUW/JtOYoNP/5LNrROMONX2RzA9/eesoUlhrChCQGCoDTA94e6lGVenf
	9pYVoNoDDPD1Nr0za5XcWMRj5GCzHk7MU7MCrO3UAJoh+U5mQO6hA705+GpYgxGEoM3m
	4kyMWXCzkE+HRzyswuSRdV5pnvgSx2pMG2GQFSRryakYrnGfRn1J56P2kwDPHlWDrLl7
	WyvcRSUCaFAsHwd9ye87wfU/gxUxQjguc8bF+R59rLX+6RBf+CQiKamWucatAjktD6HY
	Eah5AhhAkDzBENqC1NzpcvrevnYPpzfx8D4MJ4IQf3hMJm85cTzOAsxs+hM/xEguztfe
	moKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l9NM7iaElyPWOoVjaZR6xBVzBh4Pa47RaSjxZRXYuso=;
	b=Y6pNRTcW0nL+iDR1MeXwgZRPnKlIZFOiGZdK30wEcgxEQCJZXjYhNtxXI7hGKLA1uY
	dSNPUXlXIBmwy4+0wRUbSc+B13CBz/x+xXj3n3v/Ada4I6XBtPgAzZm2rd45H28GXlWO
	ZJ6AWkEKkk1gdzJyuLQYyFgpTPnIBg6X4y38ZeLoKT0FueXtnSTKnfd7vhaRUUWp0A6n
	RkQxfT5aCtuaVlUYyiB2L59g5o/nFWO7ve6P8VoN8GmVCgTRnisWBLHj1eEf2nNkX+Vr
	zfLZqEfFfoUePFL9oWRmQwDNQebOeB3AqWa9YeiKiR3iBsBW7IV08udjoU+viemvLk3x
	wV3A==
X-Gm-Message-State: AMCzsaUqOGj15HWz3jDg6AQS55fIYPakTNPZRoRoxmYdeUaHzMriKSm7
	zx7zjiK2/oeCtN6an0Gm3VVNg+vo
X-Google-Smtp-Source: AOwi7QA45nqfcy6s9Qqm/xwnwv1ZJ9aLCjmsZlDchn+Y0+QeXSGTQHf5ylVNfCXbdkVt4mwukqdCoA==
X-Received: by 10.28.196.79 with SMTP id u76mr977282wmf.95.1507277099400;
	Fri, 06 Oct 2017 01:04:59 -0700 (PDT)
Received: from localhost.localdomain
	(host57-224-static.7-79-b.business.telecomitalia.it. [79.7.224.57])
	by smtp.gmail.com with ESMTPSA id
	k126sm2599284wmd.1.2017.10.06.01.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Oct 2017 01:04:58 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Oct 2017 10:04:31 +0200
Message-Id: <1507277071-7685-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 1.9.1
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-python][PATCH] python-twisted: remove empty lore subpackage
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
X-List-Received-Date: Fri, 06 Oct 2017 08:04:59 -0000

Currently installing python-twisted fails because it cannot find a
python-twisted-lore package. lore package isn't created because as of twisted
15.3.x lore has been removed, thus no file belongs to it.
Removal reference:
"twisted.lore has now been removed, in preference to Sphinx. (#7892)"
https://github.com/twisted/twisted/blob/trunk/NEWS.rst#twisted-core-1530-2015-08-04

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index fed629c..4bd4788 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -23,7 +23,6 @@ PACKAGES += "\
     ${PN}-test \
     ${PN}-protocols \
     ${PN}-conch \
-    ${PN}-lore \
     ${PN}-mail \
     ${PN}-names \
     ${PN}-news \
@@ -43,7 +42,6 @@ PACKAGES =+ "\
 RDEPENDS_${PN} = "\
     ${PN}-bin \
     ${PN}-conch \
-    ${PN}-lore \
     ${PN}-mail \
     ${PN}-names \
     ${PN}-news \
@@ -55,7 +53,6 @@ RDEPENDS_${PN} = "\
 RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-lore = "${PN}-core"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-names = "${PN}-core"
 RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
@@ -187,13 +184,6 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
 "
 
-FILES_${PN}-lore = " \
-${bindir}/bookify \
-${bindir}/lore \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_lore.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/lore \
-"
-
 FILES_${PN}-mail = " \
 ${bindir}/mailmail \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
-- 
1.9.1



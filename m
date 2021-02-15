Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.28785.1613377808943634741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 00:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lBZGd-0000O4-3w; Mon, 15 Feb 2021 10:30:04 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1lBZGc-0004ZY-VD; Mon, 15 Feb 2021 10:30:02 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [meta-python2][dunfell][master][PATCH] python: Avoid installing test data into recipe-sysroot
Date: Mon, 15 Feb 2021 10:29:50 +0200
Message-Id: <20210215082950.16241-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: TO_DN_SOME(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210215082950.16241-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several thousand files in the test directory which we don't need.
Adding these for the native and target sysroots is a crazy amount of files
to be throwing around needlessly. Delete the files from the sysroot side
of things to tidy up the sysroots and improve performance.

(From OE-Core rev: f73ac290617e89b80e10dc700c0e90efddc8e1b2)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6bced03011ad1663d68b0322a2f8aeb4d836646)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 recipes-devtools/python/python_2.7.18.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/python/python_2.7.18.bb
index bca2910d..6cbcffe8 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -258,3 +258,9 @@ addtask do_create_manifest
 # Make sure we have native python ready when we create a new manifest
 do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
 do_create_manifest[depends] += "${PN}:do_patch"
+
+# Python's tests contain large numbers of files we don't need in the recipe sysroots
+SYSROOT_PREPROCESS_FUNCS += " py_sysroot_cleanup"
+py_sysroot_cleanup () {
+       rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+}
-- 
2.20.1


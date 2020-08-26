Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.8564.1598433325201462188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 02:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kArWa-0001mF-Pc; Wed, 26 Aug 2020 12:15:21 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kArWa-000AK0-Nh; Wed, 26 Aug 2020 12:15:20 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][PATCH] nss: fix postinst script for nativesdk build
Date: Wed, 26 Aug 2020 12:15:03 +0300
Message-Id: <20200826091503.35364-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20200826091503.35364-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

It's better to refer to binaries in postinst script with
full path which also works on SDK when
/opt/nativesysroot/usr/bin is not in PATH.

Fixes install of nativesdk-nss:

Configuring nativesdk-nss.
/var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not found

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-oe/recipes-support/nss/nss_3.54.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
index 4923f6868..dc5cafbf1 100644
--- a/meta-oe/recipes-support/nss/nss_3.54.bb
+++ b/meta-oe/recipes-support/nss/nss_3.54.bb
@@ -244,13 +244,13 @@ pkg_postinst_${PN} () {
             DN=`dirname $I`
             BN=`basename $I .chk`
             FN=$DN/$BN.so
-            shlibsign -i $FN
+            ${bindir}/shlibsign -i $FN
             if [ $? -ne 0 ]; then
                 exit 1
             fi
         done
     else
-        signlibs.sh
+        ${bindir}/signlibs.sh
     fi
 }
 
-- 
2.20.1


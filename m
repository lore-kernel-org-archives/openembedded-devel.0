Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.5030.1610731948040177787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0SxV-0004Vw-9S; Fri, 15 Jan 2021 19:32:26 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0SxV-00091V-80; Fri, 15 Jan 2021 19:32:25 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH v2][dunfell] flatbuffers: whitelist CVE-2020-35864
Date: Fri, 15 Jan 2021 19:32:23 +0200
Message-Id: <20210115173223.34464-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Message-ID: 20210115173223.34464-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

CVE-2020-35864 is for the rust crate for flatbuffers, not
flatbuffers itself.

https://security-tracker.debian.org/tracker/CVE-2020-35864

"NOT-FOR-US: flatbuffers rust crate"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 3 +++
 1 file changed, 3 insertions(+)

v2: added comment to recipe too

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index c31cef63c..7b8d47d8d 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -14,6 +14,9 @@ SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
+# affects only flatbuffers rust crate
+CVE_CHECK_WHITELIST += "CVE-2020-35864"
+
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11 -fPIC"
 BUILD_CXXFLAGS += "-std=c++11 -fPIC"
-- 
2.20.1


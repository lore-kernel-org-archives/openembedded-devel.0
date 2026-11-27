Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11757.1795762847234531983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Vml8HDCU;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso52379135ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762846; x=1796367646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1LQqyTxGIoBVnQwSsA5lhIhJaz10ir0xplXg8htEtg=;
        b=Vml8HDCUF72laRjVBV082LlhdGIs66fkfC6enoRIGmU63RY4l0vhOHTRxE2q4/uPvq
         G7Pc74mN02ZIZba5FA9d6U0+FEuF02DLMGrOeupuTHaX7dFtHLVtX5Bqjsefson61Usm
         rOSIg8xi9ROZcU0Gs3xHAmNwkm6GpQJpZw1kavNQiVolcSkmN2dMUHZCkxCSe0aMOYPo
         7rfoxMKNhACBy2aKycLxgz/+dW2G8ikw4kNQZTJGTcj/4Lyp8U8HOKsd4eapggUz/eCF
         2iDG2TTV6FcLCsFojSTsxttVcjmOnsEvC8qoWSQBWABND694sdHwuAZzhsVHlZdk0Fih
         81Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762846; x=1796367646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1LQqyTxGIoBVnQwSsA5lhIhJaz10ir0xplXg8htEtg=;
        b=MfjoZXbMwOSEmOIHIsCxbbDr4wiLyJwnL60yyP14Hzm1M8c+R/jD7W0kZj0dABY2e+
         9yMIPGM7lZgGMBuSo1dmxbQH7yonJwuQhBxJrCrOC12Sc/RPCP9lUGYFUp1i4/bW1O3K
         7tASns3bXvPNvhozAWaoLuwvFNCkaCV1WYB2nRVbY65DEzbrZnFE+ssmN+Y4CBNC4eK5
         QOVbjv7pn+0E2DiP6XzMb4d/GCU3zM5s0k1StL7vIZnKRAhI1gqRfc8u2tRQTDHOgL4l
         hEEgVlZz0DlR+qxTXhN3DoSDGHlhh0+u2QhPjK1/KVrFBL+fs9MA2j+u2TEmgN0Tgvsw
         fH7A==
X-Gm-Message-State: APuU4Z+EliuA0zzHFxtB6zasQuKoPm+J5U/KAnVbwe2JgMRrvMXrQZvj
	wn1B78tDEY6akMPo0RT/Ry34kr9C92QzHd6cSDc8cXMg9SA39drCOXngbSAqMQ==
X-Gm-Gg: AZFdTZfKHzYeFqRJOFjXtRUxYTCAmSAKFt15uVqmU051LG0cNnyUGFOoA/DhvyAaO20
	6HRVrrYfndgpuOsTrskqnH6cjN9tjt0F31UKHFc1QG5AMIYIRewpCUU/EQqeqaUss2L7uKxVsX7
	4CCyyvWULGVQXmuUDanN9sgmL1g2/0yoOtHKN/zYJtbFdtFyxkQ7kXcHXAmaSKIH4I996DrTyqt
	LgzKyuTvp095+2IWXscut6KDR6F2uJliaaun+cwNaCvt2XWXgxWo06m8P5/MeYOY0KI756P933g
	fMKB/1v6QAAVnJcF40cl6twvS7EG6C9YPqm1hOESIDwF0wvVASTAEKyvoGfU6JDo83B85bxV3Cr
	v8mbowxqTIP+VWxIUQKXrYeQMvNgVtYMZ272S1kLPvQ90b3oMmnBMttxiOcId9LyDfsQQRPdiB6
	ClKNIMzqu8mZvP+adk4Wm861TfwkjDph5BNEEJAYyexWlYtFrmhUZkotCE/wBJaiLoycjZVPPtk
	gIZdl1N00AkZaFP6cYMkSBuX9xJXHaoP1pzTDoZCfc0mCU1JR80+HznDBPynAsh6zTEgwlaV6Ss
	ZAYkWEx2ogR4WEjLG2hpB3gjCWF/MSxPcttkEwzF1G9y8W2nUwNIsCZHMbK9D8XKc96wz2qVzZH
	q7kAIDNN1QZ4cj9oqFwKExV+nVBotjEJB0BmMpHc1NrXqMFAkGqUmZEUMiI9bOnTficK7HstVHY
	5NqcIKoq/vz0b4jAyYqCfFkrc4uXrGiPFy5icXarDbiNEt57ovLUesJxT6PZqaO3a6O6MAoKmLP
	MCOLTbqMj+rrz6dz1UJmvKRinnuR/Mx2zoGnwJ/qO55NPDTI7Wkg1C+E54bJ6G11MWINUhBvRy9
	q+R5rTz5avleVpJBUHLDZXPmSw==
X-Received: by 2002:a17:902:e5c5:b0:2e9:528c:b9ea with SMTP id d9443c01a7336-2f03f18ed69mr178090765ad.11.1795762846283;
        Thu, 26 Nov 2026 23:00:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 14/15] snort3: upgrade 3.12.2.0 -> 3.13.2.0
Date: Thu, 26 Nov 2026 23:00:37 -0800
Message-ID: <20261127070038.2221538-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
References: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133303
Content-Type: text/plain; charset="utf-8"

- 3.13.0.0: per-flow memory tracking and reporting, JSON format for
  dynamic stats, const-correct public APIs
- 3.12.5.0: control channel authentication and sandbox mode
- 3.13.x: many hardening fixes in dce_rpc/smb, http_inspect, stream,
  decompress (OLE2 VBA), mms, sip and dns inspectors, new header and
  request alerts in http_inspect, bare LF handling in imap/pop/smtp
- 3.13.2.0: build with OpenSSL 4.0

Drop 0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch, upstream now
const-qualifies the X509 name and entry pointers in ssl.cc. The
remaining patches apply without fuzz. libdaq 3.0.29 satisfies the
libdaq >= 3.0.29 requirement of FindDAQ.cmake.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 53 -------------------
 ...{snort3_3.12.2.0.bb => snort3_3.13.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.12.2.0.bb => snort3_3.13.2.0.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
deleted file mode 100644
index 21085d1037..0000000000
--- a/meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 799739f51e8bc40c55f58a8dcbcb00ddb7ff679e Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 26 Aug 2026 16:39:34 +0000
-Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
-
-OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
-X509_get_issuer_name(), X509_NAME_get_entry(), and
-X509_NAME_ENTRY_get_data(). Update local variables to match.
-
-Upstream-Status: Submitted [https://github.com/snort3/snort3/pull/477]
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/protocols/ssl.cc | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
-index 733d19adf..4afac05dd 100644
---- a/src/protocols/ssl.cc
-+++ b/src/protocols/ssl.cc
-@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
-     while (len > 2 and !(common_name and org_unit))
-     {
-         X509* cert = nullptr;
--        X509_NAME* cert_subject = nullptr;
--        X509_NAME* cert_issuer = nullptr;
-+        const X509_NAME* cert_subject = nullptr;
-+        const X509_NAME* cert_issuer = nullptr;
- 
-         int cert_len = ntoh3(data);
-         data += 3;
-@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
-             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
-             if (lastpos != -1)
-             {
--                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
--                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
-+                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
-+                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
-                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
-                 int length = ASN1_STRING_length(asn1_str);
-                 
-@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
-             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
-             if (lastpos != -1)
-             {
--                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
--                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
-+                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
-+                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
-                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
-                 org_unit_len = ASN1_STRING_length(asn1_str);
-                 
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.13.2.0.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.13.2.0.bb
index a364ed1371..d2102908ba 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.13.2.0.bb
@@ -10,10 +10,9 @@ DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind l
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master;tag=${PV} \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch \
-           file://0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch \
 		  "
 
-SRCREV = "14aeb09f5a0856812dbe08ead3c21f99e8860aa0"
+SRCREV = "fe29cbe7403acc0dd428065a69d8f29cc311c18e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+){3})$"
 

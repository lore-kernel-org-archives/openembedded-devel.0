Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEED9CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3533.1791763879795984761
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xi5Y65gH;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso621976a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763879; x=1792368679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXbyCa13wnvjKK6vtk0O76lvNis4Bh3iBUF4NLnhi2Q=;
        b=Xi5Y65gH++EjNCdxZ5OXj1L0u3jxwNSYuB7gxv8vuNTvNqLStMW3+5g+7FpJktxl82
         VTqNKz0NWXsoExV7DKhH7gwnx9H18kBv2UhoscHJErxKEuTsLf+yy2fvVU69lbPFxeig
         /0fBssZEfb3wWgXXV3kJL8kSKYJvu/Ty+HzkQ0BSu1Hhz17K9TVrZ3/6GPaRxc5elabP
         m54J6BibduhyfyFJTEgMDe1jeBEGaw3IOR/eIt0qYg4bP6Sf7ZUAHEzoQM3i7hsRmrcY
         abtBwyG0IoutxO13ptdZyA53vexIs0O80WkN+XtYpQ7mnMDycPu1o7FS1Vb3KL98NBfO
         z1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763879; x=1792368679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXbyCa13wnvjKK6vtk0O76lvNis4Bh3iBUF4NLnhi2Q=;
        b=S66VkmlmlGocx/j94uAiGHqk5xRhJFSp1g/BV5u6V7omjWchCmxPrIh6LbbRDR+aWb
         m/eW4radWYB9oaThBhUYHSRheHvboMVrcXUCmZK6IAqEN6E9S33m7Rxg6u7LSNjGh6Vo
         A5gCQka7Ml4Rs37+KC4KMurusltK3uN6Pta4CwRUrmgZmgMuGRvHRZxlXTaGtrk1jDac
         xiJnCh2WzFP/y7T9nVMR9TgnTfTGBafpYkU0pG+ZnfpFcFuT3C9Sl6FMIWMSPcbU69XF
         XXb6qhpq7O/qbKdm4az2hKRbdRVLzS3JfrUGhtQNl9kXW43hmjjOW7sjN+7ObmuN0hc8
         Apnw==
X-Gm-Message-State: AFq9FYLhiEv64XEmuVnY9NOv3gBazvR5F9kuYBPysculHPCP7RBUcPgD
	/N6wlrz0mouZFJS28StRvKWpQ4b8RXWKysakwGNR5uXSvUKR2Qx20Mc9StfIOhav8e0=
X-Gm-Gg: AYBFou11jW0SHonN3gBYU1e7Vqgt+Fuc407fhX5WTPDlFv+gxcUsGQvawYY0OdIjqEJ
	n2tB7Q3Vd9VE+bHhfT2oDNEZVyPY9mTSDpKDB59H85lHVI3+nge9xJcpRO4gQtA8aex4N1/sGf+
	XWXlUsdUQwpDyN/XoynDSv5C5NhGyvXoIqf+VZ+seqGu60vGeLoFdla4MoRXFXVJctEMBBh499a
	fh4JYvD3Bhh2a437zTQuREe4JN/K8LVt8iDoR6rn4o28/6/IVcKHt3ML5w1VT5mss/FC34ckCEc
	rPK5sPhcvnT5iKS1SLs9H5NrlAqbo8HIfr8B1F+TQescm/zNBmH0SP7iw45Q48/tXLiw0v7EgoJ
	blQ8v2Q1OEN4FzrBoDpm+lxelO31RZb1/6jpAw8m0uTF5DUo+ulNit1Gpj9LSewz/WxXBoE9XYY
	LPxyjZRXU33X7EElWtpTDeGwOaUrTjfDlcApUaLe2JJOlosFX5PC/AYPxQfKk31JsGqLYW7boIr
	+oLRaAy7aKSJjDgkQIhMXtjVWZxYVrgB65XspQ=
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr7474786a91.56.1791763879003;
        Sun, 11 Oct 2026 17:11:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 24/28] miniupnpd: patch CVE-2026-107159
Date: Mon, 12 Oct 2026 13:10:02 +1300
Message-ID: <20261012001007.2541673-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130749

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-107159

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../miniupnpd/files/CVE-2026-107159.patch     | 78 +++++++++++++++++++
 .../miniupnpd/miniupnpd_2.3.11.bb             |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch
new file mode 100644
index 00000000000..fa2401e0391
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-107159.patch
@@ -0,0 +1,78 @@
+From 8a3e282b22b16fc90740d62fe213c51696e8dc01 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sat, 3 Oct 2026 23:42:55 +0200
+Subject: [PATCH] minissdp.c: MX: 0 is invalid as well. 1 is the minimum
+ accepted
+
+(cherry picked from commit 8f13b7a5843f5270db684099c0a083f98869636a)
+
+CVE: CVE-2026-107159
+Upstream-Status: Backport [https://github.com/miniupnp/miniupnp/commit/8f13b7a5843f5270db684099c0a083f98869636a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ minissdp.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/minissdp.c b/minissdp.c
+index afb11ec..d825bf6 100644
+--- a/minissdp.c
++++ b/minissdp.c
+@@ -2,7 +2,7 @@
+ /* vim: tabstop=4 shiftwidth=4 noexpandtab
+  * MiniUPnP project
+  * http://miniupnp.free.fr/ or https://miniupnp.tuxfamily.org/
+- * (c) 2006-2025 Thomas Bernard
++ * (c) 2006-2026 Thomas Bernard
+  * This software is subject to the conditions detailed
+  * in the LICENCE file provided within the distribution */
+ 
+@@ -1015,7 +1015,7 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ #endif
+ #endif
+ #if defined(UPNP_STRICT) || defined(DELAY_MSEARCH_RESPONSE)
+-	int mx_value = -1;
++	int mx_value = -1;	/* -1 => not set, -2 => invalid value (0 or negative) */
+ #endif
+ 	unsigned int delay = 50; /* Non-zero default delay to prevent flooding */
+ 	/* UPnP Device Architecture v1.1.  1.3.3 Search response :
+@@ -1113,7 +1113,16 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 				memset(atoi_buffer, 0, sizeof(atoi_buffer));
+ 				memcpy(atoi_buffer, mx, MIN((int)(sizeof(atoi_buffer) - 1), mx_len));
+ 				mx_value = atoi(atoi_buffer);
+-				syslog(LOG_DEBUG, "MX: %.*s (value=%d)", mx_len, mx, mx_value);
++				/* UPnP Device Architechture v2.0 :
++				 * MX
++				 * Required. Field value contains maximum wait time in seconds.
++				 * shall be greater than or equal to 1 and should be less than
++				 * 5 inclusive. */
++				if (mx_value <= 0) {
++					syslog(LOG_WARNING, "MX: %.*s (value=%d) INVALID (must be between 1 and 5 incl.)", mx_len, mx, mx_value);
++				} else {
++					syslog(LOG_DEBUG, "MX: %.*s (value=%d)", mx_len, mx, mx_value);
++				}
+ 			}
+ #endif /* defined(UPNP_STRICT) || defined(DELAY_MSEARCH_RESPONSE) */
+ #if defined(UPNP_STRICT)
+@@ -1140,9 +1149,12 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 		/* For multicast M-SEARCH requests, if the search request does
+ 		 * not contain an MX header field, the device MUST silently
+ 		 * discard and ignore the search request. */
+-		if(mx_value < 0) {
++		if(mx_value == -1) {
+ 			syslog(LOG_INFO, "ignoring SSDP packet missing MX: header");
+ 			return;
++		} else if(mx_value <= 0) {
++			syslog(LOG_WARNING, "ignoring SSDP packet with invalid value for MX: header");
++			return;
+ 		} else if(mx_value > 5) {
+ 			/* If the MX header field specifies a field value greater
+ 			 * than 5, the device SHOULD assume that it contained the
+@@ -1150,7 +1162,7 @@ ProcessSSDPData(int s, const char *bufr, int n,
+ 			mx_value = 5;
+ 		}
+ #elif defined(DELAY_MSEARCH_RESPONSE)
+-		if(mx_value < 0) {
++		if(mx_value <= 0) {
+ 			mx_value = 1;
+ 		} else if(mx_value > 5) {
+ 			/* If the MX header field specifies a field value greater
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
index 42a654e3278..920d33da94c 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
@@ -13,6 +13,7 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
+           file://CVE-2026-107159.patch \
            "
 SRC_URI[sha256sum] = "91994b127da735b2c97f19992e34420648c0e8c4ace8a4bcb0596e7685c48678"
 


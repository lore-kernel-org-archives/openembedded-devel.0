Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D91FF788B6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:02 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v24-v6so4281579plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gdZvURf4hOPkS66z1eqZXZyy4Hppd0pMsfGSdjloI84=;
	b=IDTn9Gr/DnSyaCMrHvbJ0HqdLfwI9lCIS4lLqwUZawE58QyStrq9S5OcT+7vS5+UJv
	/VTNi9qr0VWiPOq6qgkuTZXSCVG/VLUNbwOg4A1RBPVV2haObYrlYiY/o3s3ccCxgQ3Y
	kvNPFIWaLsxm5PKP4jNofL74BR7B02creQsprd7O2DToQtsw0BM3h4FjYsOv0lKCXu16
	Ho84/XczyXAF7kWOr4QdEImhXFnJlEZhXxUuZ4+2A3uKD0PTxTCEGaBKRgbhuL1monE4
	DgdVD9wIUSKPpj2g9uDZlr+OCa7/AY7ydfVBryuy2SgsUMJkkGc3pRRnwpZny/4UWU4l
	23Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gdZvURf4hOPkS66z1eqZXZyy4Hppd0pMsfGSdjloI84=;
	b=RtX/vnr0uvmbxDLsSVTpq4yUxb+qs1rTkPFWln5uIBZ3tyPCcbkhJ/J08pGPZTRWl3
	D/M1oxRGvGNFTzGgIhhJ5RRU8bPGl+6EG7u2bkyqel3xAObhjvYfZcMBxLQSWC1yRyEq
	M1//WhaaBuIQtaYAsO3TL6ie9zCLVLjp0L90wf+Hk1CqPjBmpGklCqObnX/1h+WkYiv6
	ILiqWUSU2I69vvlRi2v5wRBGfo1wAfCNUskJP4kNE/pWJbyl+8yvJ9pe7oycFoebyqBX
	jN0x9rLO+/qI0THoU9GE3oNlc9d0c89uyvgbCk+baNpgDCmLqYdZtEYXk/k8BSjQWcZZ
	vZzA==
X-Gm-Message-State: ALKqPwdfrSySevB7yu5eK2eD/kDWNOR+YlsQ1X9OfglO1y3cZ6xVCkBO
	dxcuq793Myd+XZ2F5QGBjcRgIg==
X-Google-Smtp-Source: AB8JxZo0RjFm/AVBmEMPr0WBUxVuNU2i/1FAA0X7BGWoFjYO7UOvoNJf2z0nTZZIh67UDh33sUxL4g==
X-Received: by 2002:a17:902:a70b:: with SMTP id
	w11-v6mr715237plq.342.1526094483300; 
	Fri, 11 May 2018 20:08:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:53 -0700
Message-Id: <20180512030758.31409-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/8] ipsec-tools: Disable gcc8 warnings
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
X-List-Received-Date: Sat, 12 May 2018 03:08:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Disable-gcc8-specific-warnings.patch | 86 +++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb          |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Disable-gcc8-specific-warnings.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Disable-gcc8-specific-warnings.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Disable-gcc8-specific-warnings.patch
new file mode 100644
index 0000000000..11a9103935
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Disable-gcc8-specific-warnings.patch
@@ -0,0 +1,86 @@
+From 282d492e4cab7b4d9c7321f4c0c55b615948e280 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 May 2018 14:09:17 -0700
+Subject: [PATCH] Disable gcc8 specific warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libipsec/ipsec_dump_policy.c |  5 +++++
+ src/libipsec/pfkey_dump.c        |  5 +++++
+ src/racoon/isakmp.c              | 11 ++++++++++-
+ 3 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/src/libipsec/ipsec_dump_policy.c b/src/libipsec/ipsec_dump_policy.c
+index 4d0eb77..c3fc842 100644
+--- a/src/libipsec/ipsec_dump_policy.c
++++ b/src/libipsec/ipsec_dump_policy.c
+@@ -275,6 +275,10 @@ ipsec_dump_policy1(policy, delimiter, withports)
+ 	return buf;
+ }
+ 
++#pragma GCC diagnostic push
++#if defined(__GNUC__) && (__GNUC__ >= 8)
++#pragma GCC diagnostic ignored "-Wformat-truncation"
++#endif
+ static char *
+ ipsec_dump_ipsecrequest(buf, len, xisr, bound, withports)
+ 	char *buf;
+@@ -419,3 +423,4 @@ set_address(buf, len, sa, withports)
+ 
+ 	return buf;
+ }
++#pragma GCC diagnostic pop
+diff --git a/src/libipsec/pfkey_dump.c b/src/libipsec/pfkey_dump.c
+index 4627ebc..451e535 100644
+--- a/src/libipsec/pfkey_dump.c
++++ b/src/libipsec/pfkey_dump.c
+@@ -691,6 +691,10 @@ str_ipport(sa)
+ /*
+  * set "/prefix[port number]" to buffer.
+  */
++#pragma GCC diagnostic push
++#if defined(__GNUC__) && (__GNUC__ >= 8)
++#pragma GCC diagnostic ignored "-Wformat-truncation"
++#endif
+ static char *
+ str_prefport(family, pref, port, ulp)
+ 	u_int family, pref, port, ulp;
+@@ -735,6 +739,7 @@ str_prefport(family, pref, port, ulp)
+ 
+ 	return buf;
+ }
++#pragma GCC diagnostic pop
+ 
+ static void
+ str_upperspec(ulp, p1, p2)
+diff --git a/src/racoon/isakmp.c b/src/racoon/isakmp.c
+index 7ff53a3..4addf24 100644
+--- a/src/racoon/isakmp.c
++++ b/src/racoon/isakmp.c
+@@ -3124,7 +3124,12 @@ script_hook(iph1, script)
+ #endif
+ 
+ 	/* local address */
++#pragma GCC diagnostic push
++#if defined(__GNUC__) && (__GNUC__ >= 8)
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
+ 	GETNAMEINFO(iph1->local, addrstr, portstr);
++#pragma GCC diagnostic pop
+ 
+ 	if (script_env_append(&envp, &envc, "LOCAL_ADDR", addrstr) != 0) {
+ 		plog(LLV_ERROR, LOCATION, NULL, "Cannot set LOCAL_ADDR\n");
+@@ -3138,8 +3143,12 @@ script_hook(iph1, script)
+ 
+ 	/* Peer address */
+ 	if (iph1->remote != NULL) {
++#pragma GCC diagnostic push
++#if defined(__GNUC__) && (__GNUC__ >= 8)
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
+ 		GETNAMEINFO(iph1->remote, addrstr, portstr);
+-
++#pragma GCC diagnostic pop
+ 		if (script_env_append(&envp, &envc, 
+ 		    "REMOTE_ADDR", addrstr) != 0) {
+ 			plog(LLV_ERROR, LOCATION, NULL, 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 5cbeb15ad5..020903d82f 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${P
            file://0001-Fix-header-issues-found-with-musl-libc.patch \
            file://0002-cfparse-clear-memory-equal-to-size-of-array.patch \
            file://fix-CVE-2016-10396.patch \
+           file://0001-Disable-gcc8-specific-warnings.patch \
            "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
2.17.0



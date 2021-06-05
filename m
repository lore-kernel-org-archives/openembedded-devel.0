Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.7421.1622856612886941862
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q7KavoWf;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id h16so6486780pjv.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n7PcnZC8+l9cEljqeq2cxi6I5x5lWmSaeggTdr3wfss=;
        b=q7KavoWfYWL3pZaNenUHuR4pd4QE7Z2D3sLRRLv9xsieNNO/I3e7YvTUygbdd8TIuY
         AkVbvFViI4MkHluybOwmevz73zSDvc9QOmENJdygDLWuKW2f5YbbE7Ghjl4DKay2XPAZ
         vzRtuUzeuwgg38aqEg53qFDPjM+NB0Kwn1L7C3kBLE3TFjlGtDN8Y00vRyTdAfQbu26h
         aG6AZ4doVUEAMGpq20FFfkKIDEBQIz1T2ynLV1BRcb0rMbgKj1GQ/goZ+jJvtoYgihSJ
         Tj91dHw/h7yE+c5jYuK7PskCiXS6mhoVWK6AbTMjP1RE0m++SMFndN8Cgi0mAYwp83kX
         OOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7PcnZC8+l9cEljqeq2cxi6I5x5lWmSaeggTdr3wfss=;
        b=orrGD5Jl1BmXR0Z3dhdFXF9zoSqtsV8yeO9SH3hCiKSca56Kg5eKhxXp4I++F0Qnfq
         aVcAgZiN8JBLdk4X7vVsNeabMdUzmye5+BQrzJ7Q3yxXakvCuVqoJAHG8NOyvG8GWAy3
         5g2VVEOUVpkG5sqIFZ/SYMLv53UDGEZ3BBz8efciGYy23TsRYBWS3dnOMXMZzQ2nA4Sv
         EUl4OjwO4XgvEkiGI02os4NhASEU+CQFUFR3POR3a62Yja2q2FbhziVC9YkDMQpKB7Tr
         Dfe6xA5EWoX2K8HwcKomk0vsEs+ZhmrseUN24hzvkwXhHTKGUTNs6qcDKyWUsAammSzy
         7Miw==
X-Gm-Message-State: AOAM530ugo58Q2InuxrbcRcERpOvM3gLsjKd26z3gZY2T2Bnl+rq6x5H
	oj+gvd8H1rh912Y4Xg684ZGzHMRDeh1s2g==
X-Google-Smtp-Source: ABdhPJzw0be7m2NdycacyT1y4b6BEFt3rME3t2EyPhhpwZTPtjK8Gb0HllQUJQf82Zk0HBzEDKcKLw==
X-Received: by 2002:a17:90a:ea10:: with SMTP id w16mr7455160pjy.46.1622856612194;
        Fri, 04 Jun 2021 18:30:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q68sm5767188pjq.45.2021.06.04.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:30:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] libwebsockets: Update to latest on v4.2-stable
Date: Fri,  4 Jun 2021 18:30:05 -0700
Message-Id: <20210605013005.976154-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605013005.976154-1-raj.khem@gmail.com>
References: <20210605013005.976154-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable which is flagged by clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-core-net-Remove-unused-variable.patch | 54 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.2.0.bb      |  6 ++-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
new file mode 100644
index 0000000000..d648c284b5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
@@ -0,0 +1,54 @@
+From cfa40cc1c2df6c64fb53bb4a2a56eb09e3e1309c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jun 2021 18:21:58 -0700
+Subject: [PATCH] core-net: Remove unused variable
+
+variable 'n' is being set but it is not used anywhere, latest clang is
+able to detect this and flags it
+
+Fixes
+
+lib/core-net/route.c:41:6: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
+|         int n = 0;
+|             ^
+
+Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/2320]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/core-net/route.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/lib/core-net/route.c b/lib/core-net/route.c
+index efe08ba1..6be93d62 100644
+--- a/lib/core-net/route.c
++++ b/lib/core-net/route.c
+@@ -38,23 +38,22 @@ void
+ _lws_routing_entry_dump(lws_route_t *rou)
+ {
+ 	char sa[48], fin[192], *end = &fin[sizeof(fin)];
+-	int n = 0;
+ 
+ 	if (rou->dest.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->dest, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "dst: %s/%d, ", sa, rou->dest_len);
+ 	}
+ 
+ 	if (rou->src.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->src, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "src: %s/%d, ", sa, rou->src_len);
+ 	}
+ 
+ 	if (rou->gateway.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->gateway, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "gw: %s, ", sa);
+ 	}
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
index 89c98fec02..479106acb0 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "1367c11e1ee44d9e19daa50e1d015365bae17354"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
+SRCREV = "4b6a7982b6833c8ccac1f35caaf9e8ccc605ff9a"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable \
+           file://0001-core-net-Remove-unused-variable.patch \
+          "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1


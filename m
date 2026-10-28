Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36059.1793161507087070862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r/vl/xCv;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so291656a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161506; x=1793766306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRVxfBMG66IYvt9v2GYY2u5REaEBF5l7eO4Re6W7hGg=;
        b=r/vl/xCvT7KTFSasC3VYYiBQHsq73+h+U0bD+jnR68uysGVT/z/pCFzu32eHI9rtJb
         q3++f2lU1/2tQR6eMCyMZsfXQ2VTg2KdRoQVkenuYltzcDZaZMkPxqXeFg5N8cS/JJns
         LmdGn+Q16XfmTPF0Huci7irv5xT4FNv6Pc7gfg5rBnRVGO815OLvjEtK9dxHLOIy3BY4
         FMiQSC2LH6VvGIHn3EgUw/1TXxbOkn1tDb7HDpPZRtbBtdcYcgW9zDIgQDXgUr9H3LUw
         P+Pvx18vJ1CWmOqmoUotxXpvQ7kcSqEqQdlJenovJgKmhQA8vtzGzNLOh70StLCtpsS3
         YBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161506; x=1793766306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRVxfBMG66IYvt9v2GYY2u5REaEBF5l7eO4Re6W7hGg=;
        b=vxkso5kJCs/554qqrURSLTMVnLVYSkeexdlM7umi+e1uxJdHR6phEkkZk2HXHgFbrd
         LG/OyZgE+fDrnutGaGPF5TnurW/ByYZLCpzXWUmMY53a2+CCpPCIfn0EyVJeuYDFBYbl
         Aig6CAIO1qGcNVJn/uqK0g0eArZtaQPJWhRMT0VEQ0+jM9MV3a1uPdqnGKGt13/PJwj+
         blbh22MN6tYUu3AR38sc7ntibYJQPfJFItI2iqFAb5Ire4Wy+gkBy8ndSLmLOSVVWXxW
         qIM58S+0gI3K7kt2vYD51i8hnGJdGFA/Uv9EqvpOas7JwXulwwnx9YPk6+a7tqUTwIpc
         Y1rQ==
X-Gm-Message-State: AFq9FYJc7MitTcIUPy1IePJr5D4xwD5l+/ihTxkwfCuZMhFArWBfXf3b
	CejepzXQ9lSgh+H6R6z3bO3110ubRCpjdPnXflYQzG7tfBgJQMEcRwf261Dt1A==
X-Gm-Gg: AYBFou3LjWohHp42jYOJRUmR7AqULEUe7Y5CL8jNbPUJoWBcr3YH9lbocwRk/tpi/mV
	c4L0TueSQmtHSarx+VGYIdyHsjLzDcZ6jxXetvcRINJFBkMqu1DpEow+I7bqHQZG4LJUlepRYDR
	zunHLEbSYNzQG9tp/hTye6eYzAYTbrnBlhzejwc6blcbL/3KzPZJsYe9zHh3u00TCOQdWpQbxtI
	e3EkxiXEcqGZZYUZ+12pBuRqdsUqodGPYIlu6u+PaK1lwshJD2O6ApxTusPU5R1xCxKM0k/xMWH
	u4xlC9O+5+JszXtbiXXFQeFW2kyMWZh90Di4XJFDIFOu7Gpqm4Ji1xmodOqyk6WIvk4aIbpHx5m
	JLLK6P8cj1kdDkK7+PEN2PU9TqPlXTW6vw59gPhx10Eoe/bxd/MdZDTQ0U7/ADppTjEsONpRhra
	bYXuUgWILPiaTlmHd+pRIGLj4ODOb+RTV6yN2f4znhF1vwz471BzQInX/pm5uEH8LfwnkEREoC1
	fM/jQSqVT/qOxb+v3XqAh8RYfdIrRbWWkkvx/eEVKQeFhNvGo43LafitRoODob5G86syALJdYrL
	rc0uyHMDoUSfEvnUUTT/PdBhXgyziMHxA1li8UUkLumyrZ/oOxHXXZ2YmFb3Hg==
X-Received: by 2002:a17:90b:270d:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ae581568d2mr777456a91.42.1793161506402;
        Tue, 27 Oct 2026 21:25:06 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 26/60] pjproject: patch CVE-2026-57162
Date: Wed, 28 Oct 2026 17:23:24 +1300
Message-ID: <f7758a033eec4754fdb957a0fb2c6d2d5cb31ea6.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131578
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57162

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57162.patch  | 43 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
new file mode 100644
index 0000000000..85a9394e25
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
@@ -0,0 +1,43 @@
+From 1b64bfb240731bbf0fc194dec68bb9d9b08a20b2 Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:45:33 +0700
+Subject: [PATCH] Merge commit from fork
+
+sdes_encode_sdp() in transport_srtp_sdes.c wrote each parsed crypto tag
+into the fixed int tags[64] array without bounding the count, while the
+SDP parser allows up to PJMEDIA_MAX_SDP_ATTR (68) attributes. Reject
+the SDP with PJMEDIA_SRTP_ESDPINCRYPTO once the array capacity is
+reached, before the out-of-bounds write.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit a1b707c0c9b0506faf2a8a438b60f11ffd6a6fd9)
+
+CVE: CVE-2026-57162
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/a1b707c0c9b0506faf2a8a438b60f11ffd6a6fd9]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjmedia/src/pjmedia/transport_srtp_sdes.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/pjmedia/src/pjmedia/transport_srtp_sdes.c b/pjmedia/src/pjmedia/transport_srtp_sdes.c
+index 8f98292ba..45038e585 100644
+--- a/pjmedia/src/pjmedia/transport_srtp_sdes.c
++++ b/pjmedia/src/pjmedia/transport_srtp_sdes.c
+@@ -478,6 +478,15 @@ static pj_status_t sdes_encode_sdp( pjmedia_transport *tp,
+ 
+                 has_crypto_attr = PJ_TRUE;
+ 
++                /* Bound writes to tags[] by its capacity. m_rem->attr_count
++                 * is capped by the SDP parser at PJMEDIA_MAX_SDP_ATTR, which
++                 * can exceed PJ_ARRAY_SIZE(tags); without this guard a remote
++                 * peer can overflow the stack array by sending more than
++                 * PJ_ARRAY_SIZE(tags) a=crypto attributes.
++                 */
++                if (cr_attr_count >= PJ_ARRAY_SIZE(tags))
++                    return PJMEDIA_SRTP_ESDPINCRYPTO;
++
+                 status = parse_attr_crypto(srtp->pool, m_rem->attr[i],
+                                            &tmp_rx_crypto,
+                                            &tags[cr_attr_count]);
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 4c00c4215c..f47d661400 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
            file://CVE-2026-57160.patch \
            file://CVE-2026-57161.patch \
+           file://CVE-2026-57162.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 

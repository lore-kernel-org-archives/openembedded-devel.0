Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1742.1792434864308305829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=obw9qLQ8;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06c60065fso865072b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434864; x=1793039664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrkwsQRtvq9U0d12+no9kNatND8nP9mgbSSfNuxFQ0I=;
        b=obw9qLQ8PFnVOGLcX6RTx2yvVnOQJCHO1hZ9UWGU6/0bTWT2KNbE8zwpcp3bx0Q73j
         LmnWOL+lxabvzhtLcvz3oFE9UGWo6wZylZKythbBW7qDfsygAMmu2yYSahQfYKoQb+F8
         N8xYW22NC5/4WthG8hPrFZCoyYuzhcUdyV2G3lTY3BZxejBq3rmUyypbP9JFGQCBSxg0
         OdMfj2lc8FoRfpP6siVsS4PYY0fcmZv4pwhHK6aEZLHCbTA7ek2+YUlbObMHhLY1DOS6
         qj2CRq92Ndu1G9S2Asi2L3lLSlfjKQrNXDepSqazZ/KcSbmElnQKH2CLmONicCnRx4y5
         Nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434864; x=1793039664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrkwsQRtvq9U0d12+no9kNatND8nP9mgbSSfNuxFQ0I=;
        b=MmTWT2e+bACgP6YrIQ0Y7dBq16l5kwy5aVw5CE1bI1dpoPzf4ESwmS7IDCk2NcFJAB
         vlhTvUhFI/TK0HUiI0729v8uLHwLSKU48IGAw4jW2/o8eUTYo8El8MegQnEqAkFxuur1
         U5dJfFe99yMQcJ85k5rfP6AVLR6t67et4TCCMp5g0eTemWh889ae8kXuLYQ83s/Yd7w7
         7Tt2jPu3kHgPvJJKVPe79X/IJpiPocJqCsItiK5yj2c9ge8U7NNs7et76o5FXXAWmUP2
         BcpzkocF9RI2YyeLKhPrGsTmzmU0YLmg/wNJWZ2zS61mHAUWsETSIfpeeFEDTlO4SswD
         2pRQ==
X-Gm-Message-State: AFq9FYJ17rjHe9NOU46rRhVXJtnm88HDtSRIg0DE2cCXyNxvWuwisBe7
	6Dh5Hse6VNaFRMKc3kuhvFSAytXwuWSJtni+iszxJw1BKm92LGvcF48UTB8iuw==
X-Gm-Gg: AYBFou21bv4Cyz5NhItk9hjokujq+fBsQSvWOYrLKDkWG9f+yszXgReO0U2Zj+zz6rJ
	ExpkJeBZbVrd3qLOkplwMGEuEhNNOdBl0vneGM4o/BHNX+7UIaGF0l/wWV2gVpixoSU2S5dfxkz
	AebvpUDrKRzAKMzRprWu+XlqFs8gxYHiIBIk5kZdMvOosz/Nv/u4uuenaLop2sosgdXqSqsldg6
	EmWK5+UnOCvshDQfTq2MwklS2bxJvwkOPyEP2tbCHaCVhtE2k2zxezx4ROKALP8V/rGAzspS0R4
	6Z/wrDBsH2Hmtfif7SPpXiSvHfF3AlacOV21AUVO+qQ+7Y8LyeX69gyzFCwxg2h/ycVcKC1K0MW
	KkGitf+z4SmRA/WedTEpQyp5WPkNl4UdqdX4p/WG4HBjOf+b2s3mxC/iIc3zDj8ECqeWvd5m9A8
	p4wbJvJ69XW7pEE0KdwkF2jyUprZIHDVafjea5yJCo5wq8VymQctCQ7xb5nHRkI1oPDRqJ5TxLn
	81dXr1icpyP640L71F+SUpEUscP/T9JT2zoUFoO2Owyf61D4A==
X-Received: by 2002:a05:6a21:498a:b0:3e2:2b76:bf20 with SMTP id adf61e73a8af0-3e22b76ccd7mr6224346637.51.1792434863543;
        Mon, 19 Oct 2026 11:34:23 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/20] pjproject: patch CVE-2026-57162
Date: Tue, 20 Oct 2026 07:33:51 +1300
Message-ID: <20261019183407.1037972-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131131
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57162

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit f7758a033eec4754fdb957a0fb2c6d2d5cb31ea6)
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
 

Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7517.1792575003856577297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oWe/Z5rA;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-157fe9d771bso660494c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575003; x=1793179803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRVxfBMG66IYvt9v2GYY2u5REaEBF5l7eO4Re6W7hGg=;
        b=oWe/Z5rA+X5HdYh1jHe3b1fX9ec9zV2VKOlSGgNEUDZam+HUzr/FfBttM3tEOd5AEw
         o8LMR7svVHO+c+wLoVlb9mkNR1mJIfPcUTlZFrij+WqZG/izU1GA4Riza8oHvVgOON6G
         ogFdlcbqmGyI14gpgFLoTT1YZeU349MqUq1rRd/zVe6dbVBk9t4zVZSVJqWRICSovpH3
         WuD84s9Lo7DL2SlJ+UAYsBPHHnKoy+wRz1QqeOxZ4WjAuuRMdwdQhgDck2EGeqJ9dhqw
         b6jRzrRN2bQzvsVD13IMAFF/cbPVIyOKIEoDqPH1quEw1/UFHNBZ2Rp9wpSxbpdHnX5H
         bz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575003; x=1793179803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRVxfBMG66IYvt9v2GYY2u5REaEBF5l7eO4Re6W7hGg=;
        b=XQzUs91Rjx5tA8rbW9ELCOgafUBgsjJJKu4kwZHbkD+NlKebS9U22JBfl1D6x+yU+1
         VCLOgGkAj4+UgwT1wdo+f4yPz2M8g/dluU+hvO4mllttBF0cgvclOIyYGKV+cFsaEocs
         O8FziTIYxfeNRZUEwEoMP1/TYHSHyz8IaPyF6c0grlYG40BdVI1RrLZq4AAbo2dMIj6+
         WrEFaw6HuE9GXR7pcBlFwI2KobicQv6ZlJZZueKqf/IMMl3bz34yi4AKQfNrB+b9u3L3
         38aCGel8YsGpseTpmIaSS7pwtCdMH55eDAAlve2szRdQekWRC+jiCXg9kvLfkSoUZxS5
         u7mQ==
X-Gm-Message-State: AFq9FYL+KaEW9Kkg9LuqsYc9S/hnE1anua9chBbS9g2RUQOPfE2a2APi
	+dZXXqaM1rng5Syndk1ylw3yh0EdstN6wGUvInJnPlUD3bYvgDGJsOynmvC/Hw==
X-Gm-Gg: AYBFou29rYJKouuiRwoioNYF+ZKwPBd3k7AlVyhVwhe7GRYVUd5MtVKh/a8fqyvdJX8
	2hcxinKLwLW9XiSDHPhRZ58oXb8IMuNh4yYxjww8XQHnWl0DxqqtJsOf5VbEpWRz6/XLj9v8K82
	UOPbIc1hhOS1tM9RomiMLLwrsLKCsGhww56Z+1e2IrjCvy/gn+aKZsf1LxL/z3E9piIfbZnZdG+
	3WNtMji+ud0Friohrgkvk6i1BXtE60E7o9lwABUfshX3hNaZYu02XaGP7sN/vBVxBq7e8aRxmLK
	DeA/Bkuv56YrE3NJW1O345+WTrMAwgAlXeYzAE5ig2Z6e7PVxY8jHEWJP9nEHc0//2ZUUFeDdtf
	1UU2zOVlc7mNe3ZJxGwUKKOuKz6v5OiOn0aAxCafNxg9KoMwP/KVIpBMQmc1PfsbWlFCivPglHD
	NaJ8HIEcIZRK+N32eNsh9UIRAbF3+FwoGBbqmMIPtnlPgnVCZDVZ9K5vk8iQDrMU+Q4AbUfjhqD
	BSK6X+fugx+tUU5yWbklfYA1BnpdL6BLCS+R1IagYrNMlHe9X1b8+S8UkWU3Srb3gQBoQ8DDNad
	po40cJCnwKbLpOtF3fz7ULO7n6f9Z/CbrA==
X-Received: by 2002:a05:701a:ca0a:b0:144:e246:a0b2 with SMTP id a92af1059eb24-190a7756b98mr2399037c88.44.1792575003096;
        Wed, 21 Oct 2026 02:30:03 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 26/44] pjproject: patch CVE-2026-57162
Date: Wed, 21 Oct 2026 22:28:39 +1300
Message-ID: <20261021092857.3585453-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131213
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
 

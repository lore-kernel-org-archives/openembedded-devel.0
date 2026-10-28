Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36057.1793161504812298108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OsXQW4vg;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso365217a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161504; x=1793766304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6tK7E0d6qLxyz1B3ijBarfv9H7o6faRfpNwR0O3znA=;
        b=OsXQW4vgttCJL7KF+NS55uKx17V2tHtxH37ddvkn8jiPkMDfBx8IyBoI/ZtbxBDgLz
         uCMPG+hmmWSe/mFe4ySAePKj9mMwuF/W1aVImFIBPOBka2wTE6e2YzNS3NTV6FrP90fl
         iD4tJbiSQRzwJ7mq4oA5o63KqKlgI5iIWvmIGUUjr2MAs3Wx+i68bqRCGcw0EsESo3Kk
         gWG0X+KNWUcSPX4jO6pFSI4Wu9doqFLL8YaBtJMB5d0Pa9jsEWNj8+6M7MEHd//RzVLB
         yCod3oDnubGPq6y6jSJ3NqFhucm0zTdSsJOWAJ3J+8yvlZa6SyQM/z01IkYJpgKBR6tQ
         rNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161504; x=1793766304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6tK7E0d6qLxyz1B3ijBarfv9H7o6faRfpNwR0O3znA=;
        b=pENlgQ6GtmHL4bOE2AHqNnqbvpviTqUC//GTG41xDrLB3JVUzkI4Lep9iqultfJKML
         ZFriu6XPhmhEGDe45dd5k6Pzk328COt13YPkebBDy8UffpWxpLsksPfbK/HTjDPLAgxM
         rty268pPUYmXaB6+FUnyr1A7/X8jrla6926utaQqsviz/OCcjlcnyrx4nDZyZYg4Y3dP
         qrKDXl7+Zl4QaU7v3LEY8ltN46+EErMLB4zaleTG/sY9zWdZ//wMK7zUqZsnZ+PeDo1W
         jGALhydbJK80Bupk2r9TMNTBZCEJ89Vy6VJ4Dmf9La/ia6QQQ9dQkwqMKDsqC/dGWO09
         tzoA==
X-Gm-Message-State: AFq9FYLS8AQNyIHjZ241Fg2TxWfGPoS7r5+HpmMtNcoKZ49a0gYGWfo/
	Q0w3Gpgoxiprt4ySMUTH15LQqs1Oy6BExzvlDnl93zbxLaMGSM9lcaF49hyzZQ==
X-Gm-Gg: AYBFou2DkqBSYmqBuEsl4eU0/HgDPwsvDHvVw/ZVxgV+8cE0iu+IIRhg5FyL25+jTXv
	QUI/YKoy8LqVPtSMJJUtzAbvVQE0QplYDswrXeNydYFTLE5xJDDKbDoncxiXku63JkjqCTEoM+N
	r6qx0aDfY9/NxX2W/iA7Zk24I2DyegJQwuul30PaawMmKBX5Mbo0QeugdjmyM2ygdRjBr+zfg4W
	ArLRHAKFne9Y0S9laAOQ0t9dHGRK2nTVB6MCKx53SSYjgni3VSJV42bElAw92i0U/+VDP1rjAH+
	vCaNloJ0eyYfnKw60M+41kRog+xJaCVfJYG4VmY7tJ3wJz3kvhFh6bbkWuFtD/PovEDR/n1smJo
	rK+FZUQC3GA1y1s2JcOE6UdUWMFjwqi0+t3ij3yMP4QLIq6KwtTBePhcXFrc1FhsuVnXT29vmnA
	TI5Y0sG7a2S8fvrOVUqnOu+JkC6G+B2uoucYrfrBgHRuIcdrUBg6nBox+0hHM1D3hu7vWfJH8Ae
	17QjwJINEF1HW1hw9ALqshlg8o6/5P8KbAr6dcynDE2Nl7y3cYwbJd1LwT1VmMZPksuq7U/N5tH
	b/SlbG3O0behaWUpMCJ2Z/Xryv8I+WsOUNIZJM3uGimBA8XqIboBPQRkqQFfXw==
X-Received: by 2002:a17:90b:1647:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3ae5822b42bmr948644a91.35.1793161504168;
        Tue, 27 Oct 2026 21:25:04 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 25/60] pjproject: patch CVE-2026-57161
Date: Wed, 28 Oct 2026 17:23:23 +1300
Message-ID: <371f20419d88f75dd45508451ec014d1a0c94b70.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131577
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57161

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57161.patch  | 49 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
new file mode 100644
index 0000000000..3296013efd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
@@ -0,0 +1,49 @@
+From 656cd5ec76f0178448053a9ca44ce075cd7a27f9 Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:44:40 +0700
+Subject: [PATCH] Merge commit from fork
+
+Bound the number of Service-Route URIs stored in the fixed-size uri[]
+array by checking uri_cnt against PJ_ARRAY_SIZE(uri) before each write.
+Previously the count was only checked as the do/while continuation
+condition, which does not catch accumulation across multiple
+single-URI Service-Route headers, allowing a registrar response with
+more than PJSUA_ACC_MAX_PROXIES headers to write past the array.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit acc03b57cef7a7d31b8e1f5b9117437d7e87c591)
+
+CVE: CVE-2026-57161
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/acc03b57cef7a7d31b8e1f5b9117437d7e87c591]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjsip/src/pjsua-lib/pjsua_acc.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/pjsip/src/pjsua-lib/pjsua_acc.c b/pjsip/src/pjsua-lib/pjsua_acc.c
+index f52518a2a..08c5efced 100644
+--- a/pjsip/src/pjsua-lib/pjsua_acc.c
++++ b/pjsip/src/pjsua-lib/pjsua_acc.c
+@@ -2278,14 +2278,14 @@ static void update_service_route(pjsua_acc *acc, pjsip_rx_data *rdata)
+                 return;
+             }
+ 
++            if (uri_cnt >= PJ_ARRAY_SIZE(uri)) {
++                PJ_LOG(1,(THIS_FILE, "Error: too many Service-Route headers"));
++                return;
++            }
++
+             uri[uri_cnt++] = h->name_addr.uri;
+             h = h->next;
+-        } while (h != hr && uri_cnt != PJ_ARRAY_SIZE(uri));
+-
+-        if (h != hr) {
+-            PJ_LOG(1,(THIS_FILE, "Error: too many Service-Route headers"));
+-            return;
+-        }
++        } while (h != hr);
+ 
+         /* Prepare to find next Service-Route header */
+         hsr = hsr->next;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 254a2952a2..4c00c4215c 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
            file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
            file://CVE-2026-57160.patch \
+           file://CVE-2026-57161.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 

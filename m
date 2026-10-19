Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1755.1792434862093085553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NMta0at1;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06454116eso713219b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434861; x=1793039661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkpBBti9CSlaujiTJameXahnDPUFd6YJELouBzb8HW4=;
        b=NMta0at1vDisLrcrLPYvHQjXw/Ef3lRMFWr+FqxTqg6YfECQiU1XHRsyuEaPfEiPeD
         O6jQVlKlqANfO1ew6XTywHDVgde6ir2O20y+f3+Tk/hAAzKltGGhT4Rx/lYfZ+B95IGA
         zi1cKKb0KQR62lrPXTneCmAgHRMOfDMj9fO64HVD2vecYi8RqWWyfnKnVHpd6+O2J4GQ
         NXPR0hQNKHGUA9HLojrasSnB9JYvV4BRPYf/crDeLWXog256BUd9dNtbLWmLhke/DcAQ
         cvjK/xlEWZWYWfsL/JFOjxCgzUm1dTXlXP/Am8NsLaGmWjN1Bq4gswBk6FriZsbaXBwr
         chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434861; x=1793039661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkpBBti9CSlaujiTJameXahnDPUFd6YJELouBzb8HW4=;
        b=RZaGGxqIL/f5CKsDx3I/l2h4e7fRYDHHDqojsgkv8jGaaypqu9h02oRNHRYjIGV+nr
         xL3qNbVc7ITYr6aRzHLH2EXGr4fLCdxu6oR686moU4m9AYTkp99eywzG0hpqrWTVI7aT
         BRAggjAWlnUEPYktiBOGO0CuR4yXG/Hps5/cvSkRKgjEA8cX88GiE/66tanjWAHDMBwJ
         W+NgKZsQHOItJz4RMuiBjkyoLMyRS3ycgCHwhHGl50/55MMSUeWS1FNZB32XvjAKrwo8
         oHKXzZw8HBVuc5mtwUJztipSX6Uk23v4/nDtY1hrqs7GeZj5IOWn2m6fyW/AnN+6ml9Q
         cvtw==
X-Gm-Message-State: AFq9FYKL+HtgsCQQfpY7z/GLup7WCocgD3l6xR4xfu0gY3Jbk0fZ1Es+
	jRAxauAhZ3z1lH49+M1eAOv38lAznCUtrSh9X9VhwZxgKpxQWQk6zp+MRQtxAg==
X-Gm-Gg: AYBFou1DLbe5WGwslCkSkPK+7C2zwOMApzEHtdOsyMwbgAIQxyzqburwrlrrgMTb6Os
	YPQst8/6E5uEsHDelt7DsKKUddF2FKXTlATuTihtjJPMRJmeESC/DUgmGuN3WPhH6eyNsaQJRkE
	tpX+eetscZgNc72cUVjT6QoCW8bgza7qKpvswp4E0H99rtybO+GMTHc6JZZeEbI2ZzdU8hPKBFq
	DHy+6Mp9x2qHfD2L2qss1iukaR82k607DVSgLSpsfQfF9/jJMegfaKYw9lN/wZon1artsgYI6S0
	SDqQSePA4yqAzRsx5hSCx6YMgutmFrO8xTLLGuxmaTbsvJnf0XnwqhlkYSuzYUNE/mVfeEDgvGs
	N5y7aNghsPwYefvyOENgP6gFi9VyK5Ry2PWh/dJ8iZ9uJtxJ0DQk9mqxdhWhz4dyxZYORTHKFLc
	eD/XP3VNkBSXpiDenbQClhQUs8viCqY4XMQqU1ahsgg2SFfcXE65mZtOXa203uSg6MB9EIOGvYG
	G7ygCHvSebD7WuPm7YViVit9IemMvQ2Nir/bkY=
X-Received: by 2002:a05:6a20:d48d:b0:3de:20c:e57 with SMTP id adf61e73a8af0-3e225fe8fa2mr7058345637.11.1792434861222;
        Mon, 19 Oct 2026 11:34:21 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/20] pjproject: patch CVE-2026-57161
Date: Tue, 20 Oct 2026 07:33:50 +1300
Message-ID: <20261019183407.1037972-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131130
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57161

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 371f20419d88f75dd45508451ec014d1a0c94b70)
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
 

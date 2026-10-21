Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7516.1792575001586195287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lReex3H0;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so946743c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575001; x=1793179801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6tK7E0d6qLxyz1B3ijBarfv9H7o6faRfpNwR0O3znA=;
        b=lReex3H0sC9Za6kXakcbzqfmOevbmPNQ3JECNrzShXiJHwSqwPNQJp8PS6N1supJMZ
         eNiWCgfqZGhtY3RanHGuVZ7xth3CSDfjHCu0BA+lFtQthC3JY6RzQobpQnD2bUBnTIPP
         duxUu4ls1CtlNYEKvl6gK2kP0+zNfNnkkDlOW97OucFJbHU79Pg17V5qOULxxvJruYZ4
         WehaSEyyUoA7UtnZ3EiAdL0yaoKopSJedJgqdtX3b6EgzuqLZr67DbwoHtWCrs1vjQuF
         JiYDbbnftd9WrmdGvj0X13tFWjMnJFxYbs+ZymHy+EYwnK0ciM6FNrEQpZuDb1+i3WEP
         I0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575001; x=1793179801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6tK7E0d6qLxyz1B3ijBarfv9H7o6faRfpNwR0O3znA=;
        b=Pr1xBL1yUXVbYLbf9TPpJngd08tjdKzesVseHMsujflxZ+aQiMJxeJrokIgIP7nLnw
         HEXA+1iPriOgDJB3BZ/Ch14V5CENAv1L84gK8szmtCkElOf7LAA+n/CR5xb9oM9wZA2h
         i3axMarmOAssfnlttgJUlYivxX3UqhK3NgAfOBOu4wiOoSECjDT9YiJWkFnro6levg8c
         CF6K2fuRUFvWU7lCcO7dnc8Ec/Hhr5XPK+FFq1hPfT9IeMDy70MlucxkZBOYpRe9fKOW
         WiovEc7srlY3Gea0u0djkAVfn2YpcxMt/iOXb1r4AgCvynbij7Jb0aGhW6SbdwPdXPir
         Buug==
X-Gm-Message-State: AFq9FYI5p7vFFpPGfP2NyO/Vitd6e9lETmbTLk4e90majVyiXQuQK3kY
	ykMgixDAX0qB8FifWl47Kq9/fTqO+1IWddc0V1AciaKgAcdD9L26dhMWDs8lOA==
X-Gm-Gg: AYBFou3WyTzDdDEMC9WNIUacbg6wc4qVsY52bJS2B2zUW53M/rMjRIW13ObpL6AT73W
	l/vR91/9m18ACQV4yuITYZmKkXuB8EbaGJ2gwTORlNpCS6o8WuYeS7ysqqKspH8i4hXb5uP2erv
	NR71Ypm293HYYSMcHGiYGrq4RlbC5SKRb0xYMPAb7nqfJgw3Jq9JPiOjWRV9KybYpIhuhYEP/D6
	85Y5uyPJf2skUUrNRRzZEqE+pPZx1xCa3HtoHKtgrwijqozCeSjHWvt0vKA8TaGbithbeZusPEi
	MEXI7+k0fk1MAJ5v1caOEhpiNK6pEHx3VyipYvQIbBXM+moSoIMZUjkKQZOsRjpLJ+Cu4E9JvYG
	+bb+CN7/nfYtnUSGmGYvhj49BJ4kX/4ziY83hSNb0petLrkel+sg8qLOEfvum9D4+PEEdUJRxTn
	MU0pVgnGzX3c5g4XRWfUGPoXN2sqFpyhDJxMLJTMhHtYVyLlXziLP0B042sdvDxtGc/9vSwpEx1
	fUqVfnZj4s5dEJdgMe6/XHn1FFPlAEPso2ozJW0wGWtN4p0az49VdjjIBlEK57CKfN+MjpwIm+O
	rIQ7mgaiRs1vdfbcRS2/VMFpHnOycac=
X-Received: by 2002:a05:7022:298:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1909f5c8466mr1829342c88.3.1792575000794;
        Wed, 21 Oct 2026 02:30:00 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 25/44] pjproject: patch CVE-2026-57161
Date: Wed, 21 Oct 2026 22:28:38 +1300
Message-ID: <20261021092857.3585453-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131212
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
 

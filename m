Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1903.1795113397403433922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Dt2/g8b/;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so107729b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113397; x=1795718197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=Dt2/g8b/TsKQHvJQga7QQJAXpYVlUz5YzT3jzeroX/IJfZyK4XJYXhnHYIHqHr7Zma
         /WKCJXSo2Az2rWVtZCHTBjdzBmwzIOzBVgV6RMwqiI5b0LCI8ND/Nlr1FUNuAfYS5LEk
         XPi+yPtgc5+JnNKpaWgoErIrRyXUvz0668IPqqwlEQ12seYxCT9i7fp2K5DeWCjS6loi
         UihYMvpH5lPl37K2SqB7+M3iTUhwuIBP2O6Hk1/2iKlEmLs8a7EMzK8qcI7lHYoh18M3
         YTJPo8P1jSHX1FQibitjNrrv/Ef0CksmUkx8Rwrw7VJWjsoYttJ/Osi/5xBEGBuCkMYy
         E2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113397; x=1795718197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=kJcJ6rOyXNKrOGOhbRIfaFkocP3qz876smquECHvr01bWnRuTKCj141iKEByM6s/nk
         EWZWFMWg4C3M5ly//f8VI8RELeyut09XUDegCGzjDSei+IhtYI7wQd5+jGkgqSj56JJa
         YoVMRECSPEHTxK1skMNnlqcX8PA+C4q2Zin1huVaODAVcEPrtpKhMsxpt9jiSODOZQlM
         b/48je4CXIhMbgt7QcFM1YNwoOL0a6LG2QXdTh5/TG+LehrZ+PHVoxnplGl0oOGN5XvJ
         JLJLCwDYeGp9l3W9J09JPSPA97kLQNG2dFBYJHt2lJc7qpHuZCL+5rToMBH1Svcc9Pou
         4l3A==
X-Gm-Message-State: APuU4Z/WD9MyMKjTJlSe9UTAory9uhcxXOWhakr0O24uJXNt5j5NRr9z
	lSttAMztYieQX9plzS4vn0hKDsshCCbnTPI/kZPe+Z00l1HFmeD0VPFo9seC6A==
X-Gm-Gg: AYBFou12+7M7aRXkBDa67R24PbSmQSBj6HkJCnFBRL2utAS/c6MkLOywXPBlfqa7/Ap
	hGAt/ys0FnUZM3OJzCzjXDl36EOgsROt7DeuIo89fnXP9QeeKAIwCfmEHXZAqR9robygJQexVJl
	WWILxhay7D/2LJzVh60kJyPVqRbMrRb2IN1LWUgkZW8OK8IC7B+PxcthVXIYL3ANJhXlfyDV28q
	BJZ/X3CDgucpXNPxjIbSRSkGZAcwCZRN8qMiNjETeHKb7WBeL8d40b61e2ij+kZGys0AZFQkpGA
	IuTY6hbS5PWWo09DmJjDkI3E/G/B44AvSanIiF2o5d69sWTShJKXxoMGKjMG1YINzQ/T23kWt5p
	HIIo06JNOLvKjBlTXfg7lqD5Mm1m0uS69cPVLbLQg4qeOco1g0Gwgs/mVRDD0aQ1JSipAaLodRC
	fGL8vT5FNGg48sVyjn8p4FFF5SamEgTodt2NrAFpzjGkAbwnxnYIvOCRMrCfDBRyir6ZSwvZyDf
	eQKeIkg7occn9OzdFsoggC0+iiaS8aEJN7flRTlQuPH6K4wcuqt2BaZ5IvQ2VgemiR7vCw245cn
	bU2WGb9LMmKUkstukc7l2o88XhOKK9HINbPxkgIdusuCYgDabUgFmD6fDe7BGA==
X-Received: by 2002:a05:6a00:3ccf:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-8c87c864e9dmr423983b3a.36.1795113396550;
        Thu, 19 Nov 2026 10:36:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 16/64] ndpi: patch CVE-2026-116744
Date: Fri, 20 Nov 2026 07:32:44 +1300
Message-ID: <ef69812b35770090af9793c725e9f366e1a65cad.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132706
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116744

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ntopng/files/CVE-2026-116744.patch        | 33 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_5.0.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
new file mode 100644
index 0000000000..5794963ada
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
@@ -0,0 +1,33 @@
+From 00706d4da0b7a1f9eff61e5835a0a1cc22c9c7e1 Mon Sep 17 00:00:00 2001
+From: Ivan Nardi <12729895+IvanNardi@users.noreply.github.com>
+Date: Mon, 26 Oct 2026 17:35:39 +0100
+Subject: [PATCH] softEther: fix out-of-bounds read (#3298)
+
+Close: #3291
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication
+Institute of Technology, github.com/Haind03
+
+(cherry picked from commit ca9d819151606377ac53305583fe819748c69be2)
+
+CVE: CVE-2026-116744
+Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/ca9d819151606377ac53305583fe819748c69be2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/protocols/softether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/protocols/softether.c b/src/lib/protocols/softether.c
+index 379e743f7..c6f5d131e 100644
+--- a/src/lib/protocols/softether.c
++++ b/src/lib/protocols/softether.c
+@@ -200,7 +200,8 @@ static int dissect_softether_host_fqdn(struct ndpi_flow_struct *flow,
+   payload += value_siz;
+   payload_len -= value_siz;
+ 
+-  if(strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
++  if(val1.value_size > 0 &&
++     strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
+     got_hostname = 1;
+ 
+   for (; tuple_count > 0; --tuple_count) {
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index 6eadf8ba62..80890b1f27 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
            file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+           file://CVE-2026-116744.patch \
           "
 
 inherit autotools pkgconfig

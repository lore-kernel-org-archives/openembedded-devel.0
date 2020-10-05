Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.26881.1601867969022565176
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pSpn/gNq;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id q123so5884025pfb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QR3X+kin0ZeBdJ877sMMr3u+WU4OCAjDFheQvNF305M=;
        b=pSpn/gNqEni4UFatgHQrkIG1hNaZRwLdOapdrKIGP9GL2rADggID2l4Fz9bCz5WEFU
         A8xuVCLDHLUHdPrpYnA748630Uh3laXTLfOhnKkr+LhfNZY+DOtixstnXO8NgNQFBxVC
         HyVwGQvg4NH7WAPzL5JKkSa5s/aLr5jxlWWk25asLQnitj0q4F6nhN3Q+z0HfQVUZJ/d
         prE/Mlrnk7j2Lq/44Ysjd7jSbbmaxSVhz/ol8f/6HHU8dZPIQD0tKa3C7brPivdrNuqC
         O7K2Va1qzdtkBVRfWVSnDgSee1N5EYHXyYAHfoaGX/mhqCutlLEGI/4zzFZsX8Xyjh21
         5ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QR3X+kin0ZeBdJ877sMMr3u+WU4OCAjDFheQvNF305M=;
        b=bKkIc0wLXf5KjJ+FtzLSar0j1MAzhwx+h49A0py9zOVnrxCGazVFzK49dXJHLx16hR
         +WyphxtipfQu5+aSZUySE/eU/rhIoMdFimocchC1hLf+fYzBWiqGxJG2u8WboaBjXuwI
         TBiLP/YZ64V+P/iyRvmq/Q9eYcAwjem3r5UMRyusYaBTYD4wQFetorXhJR+tFsYGHeBW
         c3rCq3NZnDWE1nS/Qr+hJXHAGPTJMaM4Ax2ht7fGnHwyL7y2pm7B6GIFqhjN0tLD0D3M
         3wast4cNXOjqeGu4ym03D33tcrZYcaRNiMySyuBneNB9nwNdtLfczqyBkN7EwqDbtQDT
         CJxA==
X-Gm-Message-State: AOAM5325i1mRy6G2N3e8XGMH5E1f7irrUiCyWDW1KXFlcLTFeoJS8WyN
	8PVhQH8WJ1mYr0lExLb2GlkFwzgYLZU=
X-Google-Smtp-Source: ABdhPJzjXuSgg8ZVSNVMKTi+RGljWj4ddbe6KDEPD+lT0SwSM4AV/Q/FIACjhgATWW073s0OB1JGAw==
X-Received: by 2002:a65:44cd:: with SMTP id g13mr5519623pgs.259.1601867968264;
        Sun, 04 Oct 2020 20:19:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 7/9] strongswan: Remove obsolete setting regarding the Standard Output
Date: Sun,  4 Oct 2020 20:19:17 -0700
Message-Id: <d01033c79d90e64b18c0e2d8412d4fe517b2350d.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

The Standard output type "syslog" is obsolete, causing a warning since systemd
version 246 [1].

Please consider using "journal" or "journal+console"

[1] https://github.com/systemd/systemd/blob/master/NEWS#L202

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e61b73e6d388006375c6fe84cc194299c094a526)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...setting-regarding-the-Standard-Outpu.patch | 34 +++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch

diff --git a/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
new file mode 100644
index 0000000000..78adcf8130
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
@@ -0,0 +1,34 @@
+From 7b1e376d7d22244feab466e9889ba77561117357 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 23 Sep 2020 16:20:22 +0800
+Subject: [PATCH] Remove obsolete setting regarding the Standard Output
+
+The Standard output type "syslog" is obsolete, causing a warning since systemd
+version 246 [1].
+
+Please consider using "journal" or "journal+console"
+
+[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
+
+Upstream-Status: Submitted [https://github.com/strongswan/strongswan/pull/181]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ init/systemd-starter/strongswan-starter.service.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/init/systemd-starter/strongswan-starter.service.in b/init/systemd-starter/strongswan-starter.service.in
+index 474284a19..6a0672352 100644
+--- a/init/systemd-starter/strongswan-starter.service.in
++++ b/init/systemd-starter/strongswan-starter.service.in
+@@ -4,7 +4,6 @@ After=syslog.target network-online.target
+ 
+ [Service]
+ ExecStart=@SBINDIR@/@IPSEC_SCRIPT@ start --nofork
+-StandardOutput=syslog
+ Restart=on-abnormal
+ 
+ [Install]
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 0a2733195b..8a8809243a 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -10,6 +10,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
+           file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.17.1


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E492CCD3424
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 07:59:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2688.1777708774376898369
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 00:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m3HM6zpi;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so1838311a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777708774; x=1778313574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXDGxYtCm0a9eoAxF+uzQP4mLvS7pfOSm1Q919NsAZo=;
        b=m3HM6zpifq/QnRPnrhVus9mqAAcdrEsbrMfkywSpr0uQIHNeaHff8hGlwLegvoMsRv
         G55+fJGWs88ufyeH1WvoOv6IArbioBF3qxu01rxt5mMhKoIXKNHkvWDZ3EEOYf/wU3cn
         +ijl5KOSSWPrPB0cSIyyDncq9bQPyoUFvRVxPYw5VKdiqSSdZsHdAthp+gH50LVOPSnF
         ZDBHKWhtBgIKz3TD73RBpNxh2vQWuJAo7UJKvFZy/PZBP93yUlKjKU6zGh7aPKjfRrLK
         if0mav+018diR59Qk4YWq7CJs9vWC9/NDgPhveSh/Uz6jvDhx4uy6UMqE6h456cnED+O
         jpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708774; x=1778313574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXDGxYtCm0a9eoAxF+uzQP4mLvS7pfOSm1Q919NsAZo=;
        b=GHiCJAUVY/FEC5VME3NrGcd3iYbRbwlrQ9vUDaIMe8DWnJN5fUS5Ebl/CM4G0s57rp
         KIE0mxIcVS5C843y0O/A7Dl35902kKMAb3b9GzCF4FIIkxB98fW6h1+NmLG0v2LxZgWx
         IsvM7AGS14HPjFtq1+RspNOLTMP/6r4quPkkOAuOB3i4boE/m8MUijPzCCMcs1PJ9Z5K
         HGmPE31PMziVJoqt84072o95U/MfS1qQgfSmUucOf2iJVXPE8+5oZN7i4IhC2LuonnID
         3llu/toBWwRdpN7E9wwBaVqNjNbmYdywaCe0W5ulU9j2scVKO9Qwz9S71zxjZkFNYxtu
         OGPw==
X-Gm-Message-State: AOJu0Yym4DhACH7BVlFMOQIoDMrIh6wj5f78qbqcSuQtJUwC7E73GILK
	A9IA2lGGGrSQ5KIglREQhQomaaj1BH4C4H0RfWwGURfbz+9QWajLO9cr8thGl0w8
X-Gm-Gg: AeBDievr36jijV2VYVCtF56eRnWf4Xc5OQ8LiGJdRL6Iyx6n6qZTVnPJcnYeww0IXbi
	/S7mQSG1R1YJh6+inqrh+0jD6HnoGCYZauke/PxP7wnwZ1huxX+LoJoswy+Ki5h5YIZ5pWNIFng
	ziQEVLBUO62Fjs59U+tlo33nVABy60IICLkJj2VqfbQzrHVVyWd47kAmooRLvBZPBAwZehzkWH6
	cS/xXLQjiaeWaA5XxsrWy9tojMa5YvZCN7sHp8yv7DTQN4iF3lV02rJXoo/gftWC6dIgnF127Vo
	0DOf9B0TtLi5mPHqocDrB/fVBTsww7asiHkBwuaybGfpag2XGHBinvTgJ039qEZ7MH/KSZ9fXYu
	89P70tjazvGN4QsskaOjOyVLkfZNRzVYkwyaMNAS5EdAcaPQcXljXxs2WElR+GfhtzekUjeLeAr
	xop+gu4+LzVWHIFdMgghQHSDG6iB2CeJS9E/CxOqOSb/WnV1k=
X-Received: by 2002:a17:90b:3901:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-3650ce4cb11mr2394715a91.16.1777708773543;
        Sat, 02 May 2026 00:59:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b168sm7831480a91.12.2026.05.02.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 00:59:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/1] nginx: upgrade 1.29.7 -> 1.30.0
Date: Sat,  2 May 2026 19:59:25 +1200
Message-ID: <20260502075925.1861299-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 07:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126762

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

1.30.0 stable version has been released, incorporating new features and bug
fixes from the 1.29.x mainline branch (https://nginx.org/en/CHANGES-1.30)

Set v1.30.0 branch as default preference.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  5 +++++
 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++
 3 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 9872a6de3b..f2b10a5c69 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -5,3 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
+
+# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is built by
+# default. To build the 1.28.x branch,
+# PREFERRED_VERSION_nginx = "1.28.%" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
deleted file mode 100644
index 4d884fcbb3..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.28.x branch is the current stable branch, the recommended default
-# 1.29.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
-
-SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
new file mode 100644
index 0000000000..139fe24dcd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
+
+SRC_URI[sha256sum] = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
+


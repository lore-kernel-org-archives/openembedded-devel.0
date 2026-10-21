Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7563.1792575032372762147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JfSgcRvG;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so697943c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575032; x=1793179832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nab7hp2MfuEOqUCd8iJKBayve2v8cbnTvBQLkdrZj0=;
        b=JfSgcRvGMszFN5THQnP4JfXRrxGJvFF6mVFpgKe1TE/VznxD0B3ATajlMpuZezGl56
         xV2Y0C0VTfbOy0k6ct3Bt0igpKy2uMNiPVaoBtD3la3LBOd8mvXe8ImQ46WI/icx49sL
         icJ5sMmL9EmfGZv2GJKkvJJZE0EKWhM+IYEpqx2d544rdIzh/SuR1nMIxdJu/ndf1tPs
         YJ+6fbiY3upSBnNd0mLQ0fFs0ZXnZIvnwv7oOYObdXlC6rwR/1f/3M1g23DYM1fiX4t7
         1L7eEzxF5lDgNRkA9SD46wX910z841VGj34QssNDywUabxoLXOg9Ysa4Hxyd5GRWTYL+
         p6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575032; x=1793179832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nab7hp2MfuEOqUCd8iJKBayve2v8cbnTvBQLkdrZj0=;
        b=ipKxl5ZILrLPWnJenELlbQ75JMdTDzl3YlbtJPgiS+QIGQFfp80dOZzBsZMjxwxU5u
         dhl9AWl5d+7l2SmMOLoS8KIEzMq1Li3wjrmqpXoUVe+FGM623f1pdZTxn8Lh5ccdu4MH
         Y4f2iI85cECcPsP4krLBp2G49dKjfyCyjXO3AibhSwcj/ZxexmXojPW5CFyuR9rBVhuT
         aVlZV2PUaDyWWGX1abaF/iqKVTXJ/kXy6hCJO7U8HlfnHcWJJ9w8KX+KTjP7q4H6PczS
         4yBnR32TK1GSY1puEjogCB924tFrzfv+xRIsq4fapcGlEtP9N+r0TDy+iit1Hbp/orX3
         Wj2w==
X-Gm-Message-State: AFq9FYKVPTYSU2sYuiy7MCzYnluSQ0np7c28NHdB15u71hyD+MDB9GuH
	sCcRVl99yoLKGvOizYyMFF7kzRRV9DLCKaibnEa+kSCkATQtWBTs4VOGUvSXKg==
X-Gm-Gg: AYBFou2nDZtW6x+PzyzparWvQzcT7KJ3dGukoGYnwu2FgyrA3dGa0whL2pHp1daKInK
	5KToKVoPVmwTcAwDApbaT1iktLd/v3NqAg9F6vzhUypAdG6pNlVF/PipMGl0zbQL2MmavqsRDKK
	leIhMzYDeLcs+HBDLHLHaIEdv6pIyOdhKOxiLP4yoYLC2pwl9yfKCmylA8EKPkAzrSlJIWidslh
	6BxMXyJziASv3GePkPHS92M7KQ0mGwL7IuqVSWKYo/btbFHrF8XO4eSQfkSBuE1g4iJdN8EPNx2
	pO4lbx65PDBAD3Sg0IJ3at3iTRoAZY3/1OPXERp5P6xPS4RUC3TQ1ky9tym9ApwEnPDYQU2LL2h
	ON5lAAYo8TWjhVCNFMNSI2FtHGFvXd94mnxyMKmd057XJjdsjK3BKrLxp/ozgLKUG7/snf1YmrP
	++laRIljIqn6i3kZl+W2XI2Mqzq1hhhFE+Z6afNLLd3c8FyqKSEVCterLYHswPAqZ4oCUeXMeFt
	t38kNYmVBYsrvdWq3gzRhP7k7JXfC3FPD4N8zmnxhPdr+2OaQ/FEklTK3qTp301SWn90V6rdlu3
	n6XofQoQ/z++gLF7FdW4zHIUyzhzKOc=
X-Received: by 2002:a05:701a:c90a:b0:143:5cb4:30 with SMTP id a92af1059eb24-1909f5c7ec5mr2101219c88.3.1792575031547;
        Wed, 21 Oct 2026 02:30:31 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 37/44] nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
Date: Wed, 21 Oct 2026 22:28:50 +1300
Message-ID: <20261021092857.3585453-37-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131224
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

These CVEs are fixed in latest release however still show-up in open
CVE reports. Reason is that the DB contains entries:
  {
    "lessThan": "*",
    "status": "affected",
    "version": "1.23.3",
    "versionType": "custom"
  }

Which should mean that the first affected release is 1.23.3, however
without the upper limit it will match all higher releases.
The entry with >= 1.30.0 && < 1.30.6 cannot change the result as it
works by flagging CVEs where at least one version match is present.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 959f4c8f098a90c24a818831a5e3dd8090cee641)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 5d699e63ce..73204da558 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -6,6 +6,9 @@ SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9
 
 inherit upstream-version-is-even
 
+CVE_STATUS[CVE-2026-95101] = "fixed-version: Fixed since 1.30.6"
+CVE_STATUS[CVE-2026-97629] = "fixed-version: Fixed since 1.30.6"
+
 # Remove following entries when upgrading recipe to 1.32
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"

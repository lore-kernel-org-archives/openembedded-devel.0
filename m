Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C118C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24392.1786747618482427838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VUC8kaHB;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1611751a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747618; x=1787352418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wDTXGjd9W2S1Xw44bt3DaPfZ5l12YxjaOT8MPIzprE=;
        b=VUC8kaHBd70MnQXVoARL58ICLGtfiL611/NkN8Hq+Yp80CRRs4h8yBeI2mXgYg3qdn
         zwIMl3p9P/YYZiCSOLZbRu/BYgS7/0g1yUY6nbTHV1NlJ7UG6jfHv8W7nhpdEoNVaGcp
         LUDebrR8B03lGaBkl3ydPG4/lGI8rwtFceebpkBP/biTh1EyHieelwtoOUlqY+p/7aeD
         jXxV5PktPxnvT+HVwxIUh7HR/M7XkvmfjdezRy14asDzVvALRttCZTZWNL1tqnj+zHHy
         FPbTMb6Pzfq6hDyvnasIxFwfBfIqzIHou89Va3N9erNBMiN10AsEC4VX/qR5r/ciZTOq
         bKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747618; x=1787352418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wDTXGjd9W2S1Xw44bt3DaPfZ5l12YxjaOT8MPIzprE=;
        b=fMcxuRXtc06x6erqXtKPdOkK1DcydnhwsOoBNNmrmnuKsHFvj/oIxgvaYFJ0YAiSr8
         UxUc+6HTOd2ZdYXBaxwpp8IG8I/OkPgioY8uLHa+W6p5CMwzywkniXabY0hfJkejbUnS
         GGLK8IrkCzK8+8NsIaKbVcq0GeIZkW73+1RNVl2UlXWD1iqMJDTAJS4WgQvMrKU5/R6m
         l2uTodWBM9BvSzJRM5w1UbulstnZsGIMlX5liJbymrn0/RqctzSOGxtUGjI3+UJ4cgTQ
         x6RG1kcyAwq8JjszWQQ2VzmMai8AK+5YHRRDiyzq84qUUaMnrSrpjNcnF1CuW5BNGBwM
         y+rg==
X-Gm-Message-State: AOJu0YzRt6g5chXu5ak6RuEW1atToO1QVqjUMUNy5wdWKeFF2JjfDVFj
	74IWHVFqdEaIGpFJ+7O6KoDVKiuEAzsy3xf1KXNufmez+7Kjb5LQfUEz5NuvbWTu
X-Gm-Gg: AR+sD10OXj+7wA3w1RMxenb3cbd5NBTdSUtMzPIl1pl1IgZ6Z89Gh15e5y/G9R/qdsu
	AJCIjR56Q5xEKx6P/5xUbouJEnZwCsJ6ZYlqVAJhREJWxBge0JU99PuITxWh+9XKGLdV+eJOg/L
	9PW60id6HTtXOTWp6G0Y7IaQXe6ZKeZOktKSD49747+12d/E6FqV72c8e301i9gc8ZlsQ9VwnyX
	uA7T2ijxAlF+cCMHyOPffGFMK7LeRjAsLzjnM4YhhukyA1JXQV60jg59BW3NMnMzG+y7HzLtSNp
	1jgjSjzXz6+MA32VYCQb+kah+h+H715OUwY1ZnYwyVRGVHnC4O8+/kxLUVy32QiNjmgsfVVt9JA
	VZLnfa9Cw5WQAWaOEcXJe/euZ8h1O2BX8AEIQtD+S+VS4J952lEBMwEnB8wwCWfYSnvJ6N78+q1
	vrvOs6gxfx3YBPHSCZqzRprslu6nGLe1+7Thy5UabCRCGhVYlYtI1TQ6mJzh+q122Ka7h2zqYb5
	J3c42+sGTn+2cwCZx+VU6kbkQWtNNjCdBfrvndFQ7sj480xFS09dVy+q1RPHVcFSc33QDHxVvzl
	G2QmQLk9EoxeRotW80WuauqsoaGQPfD4qPPK2HiN7GTgY4EWMyhwlhQWp3cVy47NTTYk/8LyG/h
	UuK2BAcSrA3yuWM8/qtvFoAoSWeRtCvDZX5YdA5PeuM0FGA==
X-Received: by 2002:a17:90b:1d51:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-3931f617051mr13052632a91.19.1786747617842;
        Fri, 14 Aug 2026 15:46:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 068/109] gst-editing-services: upgrade 1.28.4 -> 1.28.5
Date: Fri, 14 Aug 2026 15:44:54 -0700
Message-ID: <20260814224539.1523174-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129132

Point release from oe-core gstreamer1.0 1.28.x. SRC_URI[sha256sum] filled in for the new tarball.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...diting-services_1.28.4.bb => gst-editing-services_1.28.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.28.4.bb => gst-editing-services_1.28.5.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb
index 505bc739d9..ba2e6dda00 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.4.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.28.5.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f7eb55e58718dde5b5869f619ed90ebf3b0cfa0376c169c1b83fc773811914a"
+SRC_URI[sha256sum] = "d02f9df7dd74f2a50243a6fa5e327cfbbd5c12129ce7b6e73d70c08532491a88"
 
 PACKAGES += "gst-validate-launcher libges"
 


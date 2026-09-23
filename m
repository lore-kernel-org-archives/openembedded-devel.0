Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE747C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4173.1790160102276610302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F9FxrZFK;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so435085b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160102; x=1790764902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJUj2vV21/fjwzeOa5mXf3YH5LEV4qKJrM/0/46oLZE=;
        b=F9FxrZFKVixfEqJlqpO1OGrfV9RzJFIX0Q83+8IGvcPTutVMCu63HqVe8poynawRH+
         5l4g+POSjDf1IVH2T0Zu01jI+M0MBOzIrss9mNzsv+VY4m12OEE/Zda2xiGSQWY6Y/81
         xBfoulny0qO+uO8jPZumfnUvBvIEohZO45OV2q52cpd/A/Hc+vezZ0WEldhuYtdSr2pJ
         IDftpGC9ZdQmJLPFkH7xlYEWiwsQvWKBVU5lb3IkdU+iV+1h4im82KpkKyn+SltTgGJQ
         15OM+U+eAIkmVBsXdQLoDyJajdth0sa94s1yYJw9O91vpxAUrDc8fiSAnW0G+ojU83Gx
         +2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160102; x=1790764902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJUj2vV21/fjwzeOa5mXf3YH5LEV4qKJrM/0/46oLZE=;
        b=K4vVweFkWwSz4AevwqWDNvR663H8aQKAAuYEbwVI6l6DTo5jquB8Y8dLRm8abiQUjZ
         EJRLxUKrA23WLAlulF47N/t69H2tAOsz5N4QhdmYC7nAIe/2DM1fVEm51oz44DAmB2KA
         3eHPM2urji4w9aLoCgdiDHvD8PxHhRKWEJKGM8h3+26LsDgA3fG8uzVlwqqBxfbaHFgA
         neG9KlRU8HS8lKbtFur/Y4CEbcfGOUQG3ngRlKzxpZBEkkQVG85Y+U6AufiCt/+5jE/q
         ERBV1NSos2axk5CTqiLzPDIF0V6/tQiDmGq6+0CLUPa2mpE4wuuS3+ECYJXE4V+o3Nvl
         0pyg==
X-Gm-Message-State: AFuF++lg0K97xLiz7Bi10dIsxPsuvXVylN7q0OxJ7AtZXtUn0JDIoF1i
	To+LjjJUfFGAZU34QHnoAuXtlbJvFnPEYMKBx+I0B9ka0jW8e2dZ0N3FeVPUCA==
X-Gm-Gg: AYBFou2XiCIXR5VbHsvQ38qm2VqFKYy3zIBIkpN+LWEpVxVFD+hDvSps1qVQbumsIWD
	FS9+8hW+89VjXr8jwDc50pcjHGErAncNnTrMAFMeLUzqkYH9btHc5kRasN3A+zAZfECVadYlTST
	2CKU1Lat/Fo1p5REv9tqm3fMfgjQi+arFfeDSZtmSsDb5BwLbF5TFwlUPuXpUw7fXpKKLSiG7S+
	4IR3lYNIExpDkq0B+uw/yv2t40kYHoyo+r1jPEmxOdbvmwmr/muVLd0O8uFvIiVgOswNdzDgBB6
	66sCEMXVqNtiYMK0JqNR2Zjy+CzQjoIKSIaJiNJ/a0eVh0aobcvIBEHrow9pSfnC/Q9eobbFkvn
	hD4dm2/Ei4EKiCWNMG/nCQ2Cj/Do7mKTUIDEAleK65O5+AdoBYjfzxUSOQct+QCwFw1VhlOfj9v
	mdPzaefjK5dj/T9G1TCKmgRomJHS3nZN19Nqx2dKEuV04hSal48HkO8427Q8ON9p/0wj/uhG5t3
	JBtQrajsOIEfRrHJ6djxf8=
X-Received: by 2002:a05:6a00:408a:b0:874:705d:f653 with SMTP id d2e1a72fcca58-87d1b3b33ecmr1808154b3a.33.1790160101609;
        Wed, 23 Sep 2026 03:41:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 20/42] nanomsg: upgrade 1.2.4 -> 1.2.5
Date: Wed, 23 Sep 2026 22:40:34 +1200
Message-ID: <20260923104056.457360-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130207

From: Nate Kent <nate@nkent.net>

Minor security fix for people using IPC transport.

Changelogs:
* https://github.com/nanomsg/nanomsg/releases/tag/1.2.5

Signed-off-by: Nate Kent <nate@nkent.net>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 510601e79436e2120c0596dc6a53a0f503dde5b6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nanomsg/{nanomsg_1.2.4.bb => nanomsg_1.2.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.4.bb => nanomsg_1.2.5.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
index 95b81869b5..cfd79487e9 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master;tag
            file://run-ptest \
           "
 
-SRCREV = "e6d0b8ddfc780eb89f8f6ef305e92c19e76bed6b"
+SRCREV = "85856cb785ba6dd38c5e9757298a54d1bca55580"
 
 inherit cmake pkgconfig ptest
 


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE75E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 04:27:20 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.123143.1734582435727807535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Dec 2024 20:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGuUmWLr;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216281bc30fso4580375ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 20:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734582435; x=1735187235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lK4orh67fwdbnM7ksXEwyqldkfrtU405DGk4Bv47hM=;
        b=LGuUmWLrDoK2mbbSac+Eke3fCJ/C/nGB4rE1KR8HzFGawCdSkVgq1BgCf4F9Lrv3Jq
         vDUdcbzwQMfwAJOwZ+k9CRhEkAoZTbJCHbO/JnHgrl94XUNgfCByS0+pA9U1YB/01UKO
         k8dKphf40dAhU9Qkm0OIlrJnXmLZUGU4mOw7q7DbuGF2KaxS0a+4OuirMIyLubUfmD9I
         6bYLa9gYJ5bM7U6h9rzcaLPDJErXOlPgjzvpA9dtFvn664T6SbjE7hjzZnp5b3NilBqA
         xQnoLizxltKSecBk7GVGxJAFQD+18A2vsNOcq+Fz1/s5tUC7miaf5eLxKEPf03IkHSnV
         vqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734582435; x=1735187235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lK4orh67fwdbnM7ksXEwyqldkfrtU405DGk4Bv47hM=;
        b=hzbQQcVhRLBTv/yWy8SJ1Y7jfP+CZ2/tFnUumK5zhlqQjM7rdnvGrvfiRglE8YZ+Xk
         N2MPToEfldZsvm8VkBiLyJItSmxiLi0v6IeP0FhJuqmM1VFc0gQBO42uK4Xeepe7pach
         mLU4YzfCRgkYwAAuIsx4ThE/5aSQSjFq93z4FAiwGN2e3b3ElOhYknad95HYE94jkrLc
         KAXdAgO0GOpLVDsATj3aAm8G6hLGuMUaYtanoGoM7SU0X26Eiu3evw60dd78pf++fY1w
         8d8f6/9OTjoLxhnsc3zPoar3nPK58lulRb2TZMlDTRdcIbAp41tOSUi2edouE+HaFeAX
         veTw==
X-Gm-Message-State: AOJu0Yw69f9WWvkwFkgIp9JRy0xUJTeDfsnQWVRQ4YR/OrMvyt+6HX21
	GkYWJzIghHYphxQC0DtHQJ8Gn5zCm/nAIMpNIb0g5D4o6gHmEG1Qd4jALokI
X-Gm-Gg: ASbGncueQVqed6E3QVjbXQjxM05g04iz849BuhtDcD2LZhBpVVyoQKTXTiTfTs0o8Oh
	v9gqF7PilFIdv1Od7aM2XWH8AOL9WAi9k0LDekUr6H1PAquKdIKJm6anMw9+EQi5eIzKmkecnuh
	oiIcAdhZnSEkqbL2mOmH61/ufPqDoXzsy7s0VLOFKh9K+XJn4Q57XDQnvN1zS8c40ua13Kko+hU
	NWfU6X0sJG7MTNLzdssjd3J4HuyWRWwErH632f0WiX/+bEe7jqF3gRe+w==
X-Google-Smtp-Source: AGHT+IGlmPc8GITwYaXbrYrNK5L+/gWkMxdN5SjZ3rj95D4P3ulhTWIp+Bveoao43jvndZmuHGZxqA==
X-Received: by 2002:a17:902:da8b:b0:216:32c4:f807 with SMTP id d9443c01a7336-218d7261d12mr66345305ad.45.1734582434640;
        Wed, 18 Dec 2024 20:27:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::d5a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5152sm3340905ad.192.2024.12.18.20.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 20:27:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libnfs: Add gnutls build time dependency
Date: Wed, 18 Dec 2024 20:27:12 -0800
Message-ID: <20241219042712.27876-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 04:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114378

It does not build without it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index bec7279a06..0d21a7e596 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 S = "${WORKDIR}/git"
 
+DEPENDS += "gnutls"
+
 inherit cmake
 
 do_install:append() {


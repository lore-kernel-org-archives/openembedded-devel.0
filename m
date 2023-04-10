Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C3FC77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.52986.1681153119836012052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=UgtGYfWT;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gb34so14797839ejc.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153118; x=1683745118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghz35UFcABDSNTkCDiR+8LDvBvR49aLkfVPq+4doTWg=;
        b=UgtGYfWTVrJ9Cx0jD0nR0GGa0FNr8ncQuJHAvsR/GAfWYUEfnndGrrlcbZYVFDiOg9
         iAEPRx7KMJg4UMFfa51gs5F5gYkswXX/slsOQ9PqlYbZIE+7LAzm/0TKnnD9Bw5GWSc/
         nzvxNsz9fUhT6k/p4429MKunUJSWK24igLzl1keJfgo+R1rfPH8XyVtqvtrpjVxDyU/1
         7957tnSqPgrSKU+/LWBaODAEZG9aUqMa2rLwIvBYDT73CzdM4hR4DPt91uTFjcvxOevk
         SBro4PkoAUJnVxqWbQ07Du7xGJCT9lGIkWK8urDZWtdrVZ1F7QfHYU8dao4iPRT1OjAK
         eI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153118; x=1683745118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghz35UFcABDSNTkCDiR+8LDvBvR49aLkfVPq+4doTWg=;
        b=j7pnUrOdxWdbFAlNdkrqp7/VFlqELdCb60G2yTLBrPTNVQbsR74SeNATQEyPjLeFst
         twKdPR7NVWfwUprRybfkTG9Q9T2mJx/jGmzpfE+OfMlEJEIB2k8bJ9eOLwZ6laUQe5Cc
         0RQgw5/HLZDC4VmM5gbeNfOsXX1G/Xwk7JRbENjUWMvm8Mr1WjPd10aJckCoyyo2iLzm
         z+4DY8apehV2HeuoulcZl1BCdGhFkJge1xJgzeX9VoX6lsaWtY7GTdqzk9XNsDa9KS4d
         3yyvqJlo9bXZ+A4A1rObdV7qqmB9TP9Q5llgDVagCMnqXXZjaczt/4sQaWXsBrcbgGVb
         08HQ==
X-Gm-Message-State: AAQBX9dNILJdS3R7rSFaf4Ac6hjvNLH97CeOSpac12Fj2FV/R0ZENs9Q
	CCEQ2omEbsX6bb+YCk3QQwHsJRTHhRw=
X-Google-Smtp-Source: AKy350aLlykpOAlBDkxr37FtXppOoCL2btv2pLtYOEKOzwgBd6r2WguG7LPsPux7wLIqllyh93g2Ng==
X-Received: by 2002:a17:907:c21:b0:94d:de69:287b with SMTP id ga33-20020a1709070c2100b0094dde69287bmr1533584ejc.22.1681153118307;
        Mon, 10 Apr 2023 11:58:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kq9-20020a170906abc900b0094a5edc82b3sm2083007ejb.162.2023.04.10.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 4/9] mongodb: fix chown user for multilib builds
Date: Mon, 10 Apr 2023 20:58:14 +0200
Message-Id: <20230410185819.2416704-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102046

From: Martin Jansa <martin.jansa@gmail.com>

* the user is named mongodb (BPN) and in multilib builds this fails with:
  chown: invalid user: 'lib32-mongodb:lib32-mongodb'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index ff4a16e9f2..0969fb6ce2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -117,7 +117,7 @@ scons_do_install() {
 
     # install mongo data folder
     install -m 755 -d ${D}${localstatedir}/lib/${BPN}
-    chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
+    chown ${BPN}:${BPN} ${D}${localstatedir}/lib/${BPN}
 
     # Create /var/log/mongodb in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
-- 
2.40.0



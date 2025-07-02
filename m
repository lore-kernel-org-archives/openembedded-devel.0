Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AF2C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 17:29:08 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.2088.1751477341941182145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 10:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqVIOk2t;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-708d90aa8f9so73322317b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751477341; x=1752082141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1eZOXA6hv0rRjDouAU2kBqGullGUlob5mMt4z33WG0=;
        b=KqVIOk2tUrC7jQEJqIjLPKUntmiEJzHRu+wtcgnY37VEQft13IVdrsiDonL6+bUFwG
         N26M3Zb1Zxz8xYMVqP/MxMMo20V70eEG7K0+V0kFsMSsYRT33kcyFuYiGMs0vLVmTvKK
         14EfVUiRUEd+hPQDBwomUafwJX8Je/3OK4OZZvuC1mWLdLc1OGPEXrSpexowXDwk6h+Q
         mWUMwRMugYiz1ABvtNfk2pQqC6pf77WbQlqaKJ3bMmaYHmWHP5HB3BFBgJLv0HKbei8g
         NgDDyJcXplffnm79YZpKbJQY76FSCJBiaWzuQ8wrdfGmZn8jxYYFJq3CBKWtHO4ct1QG
         C9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477341; x=1752082141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1eZOXA6hv0rRjDouAU2kBqGullGUlob5mMt4z33WG0=;
        b=b6C8230g1TLWabS+Bbk5Z5enNDvq9w3b70J+8sm4Xn8EbBgS7dmVE063cgR0YtFY3O
         444iYGMjDL/f/K6Ar095KbJ9LgcnHhiO+lC519sqCwYa2l2trZmqkcMlz2xz7BfKwA4N
         jZC3LNb+7YS1dXidjHjR/aQvmGqeVpORYDL3tnjEXIA3HmmZJPkmHtm+5zOCXK1dz73+
         R8UFOcoXUkrCv3o6s+o3yD66CqfqfTXJ8z5GjU2hP3UaQkvMv0izNDrC369CrRgsOt2N
         qKmsNoR7q+73oOKQuhFK8OVuJk8jsBnkfqUgpucivSNhsvcUXxg+IUjUf5witGOuSTLK
         9ZHw==
X-Gm-Message-State: AOJu0YxQ+qmMNaZM0BtpOw5v5pHI/3/wrdPOiV15sc3G7RVjPMyzLbok
	pRcss0FUWmBxVK9I0qEH6PofK+Xqy1cNo1YfUWCaT7c9ONI8SK5vyIqR9a1cl031
X-Gm-Gg: ASbGncuP/MolEHRP0LBebPLjdTG7+DPwaIQkYTV3snLznuxNExSScp3pg1VG03wVdop
	KhVHRM12GBeq/elOBNdBDxUGU//XUEodD5FaafF0yR523dCshgXD1jF63xOxIB+med6d0MU+T5D
	f+3tKm2MPiVZ2M6qf5jGGSHvZc2sLc7aMijuDiYpMO5lXE95ICcFGjbHchTmeKynJG93OoaC1ck
	2bSJzCWP7WI/NpNgJh1lV2K7p+gZ1BnuqqOwyfdrpfhI42HyIAh73J5I2gIuhxfIgrydxk0fHBa
	kDWOh/RV+lHYdp3bbNq1XSipSFKgiVJbwVtSaYP8PHd9K/Zvtx6ApO9v8aHtXI1xlR5OtIXyOy6
	yuIO/TqgQUo2cnLlPHJf6
X-Google-Smtp-Source: AGHT+IHSEMVUjbSItNCI1e0cOlnKKkzB4zig+20t6JI5fwH/dLc4xSjH8tuKnNG8wKVK5SrBofQvOg==
X-Received: by 2002:a05:690c:3607:b0:70c:b882:2e5 with SMTP id 00721157ae682-7164d305e4amr55653327b3.2.1751477340345;
        Wed, 02 Jul 2025 10:29:00 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c94bd4sm25550547b3.63.2025.07.02.10.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:29:00 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] pgpool2: upgrade 4.5.3 -> 4.5.4
Date: Wed,  2 Jul 2025 13:27:27 -0400
Message-ID: <20250702172727.28311-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 17:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118201

This version brings a fix for CVE-2024-45624

Changlog: https://www.pgpool.net/docs/latest/en/html/release-4-5-4.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.3.bb => pgpool2_4.5.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.3.bb => pgpool2_4.5.4.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
index bdd715aacf..706e7360a2 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af313a1351cafdd778"
+SRC_URI[sha256sum] = "d1392e74ce2807f8ae628872cb1ab7914249921180dc99df40a1d602647a10fd"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 
-- 
2.43.0



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CFAFD4F33
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 20:21:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4826.1773174102042353589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 13:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCyLq07C;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485392de558so16094105e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174100; x=1773778900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7yeCeqFy0mmCJ4pgGD5Tm+4nf6P376gzv6WZWldtu0=;
        b=aCyLq07Czzf5NBHBDD7oeDyTmDZX4J0InTfm4J1lbkw7EsuQ0bun5VfdBvSYk2V2RN
         +fgmX64WUIieljHZyfdXP3d7xFqUeY1VHE05lKtlL0VliMLkmiSrRrrMjeZIStHioxFl
         ffCCiFhNxqUZoIIic735Y8avE3SHWySAZNFoiw2eu6u4VXgtGlvk3+xGaEw84BlvxBhF
         fTV3IVpEyhsdKVNUPVXXAcC/3cQLjOVYo4OgpIrtLath2WmaCZqctWp/QWZFs2wtvV5k
         2DkwcHLGpQd5aDMURSIswfQ1UAVIlq+RnEv2I4HbnqhZZd+YtLX1uoLNd7iVsqUQuCsS
         7J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174100; x=1773778900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7yeCeqFy0mmCJ4pgGD5Tm+4nf6P376gzv6WZWldtu0=;
        b=fbWjZloazr+ycSQxLr7WVeNKBOmxQB16/mQt0aF1EcGUp1iRnKKUvl5xGsbO5caEVC
         0MHX0uG8h+/okpRC9Wy5N4qaHZTuhnUv0zmjqsojUX7kodDbuTLJXPJmKibtT+TUpTvC
         lhdTd+yqtWGLsRMn3/J5618pUEEWu8vrZ/02gNytLMDB4ukFNRSB0aXJhe5mI1GlkRdw
         5uVkfDU8t8AO9si5iMrWMMK/udZwcQOGv6+lQzdVNiXQu8ZsNpwNcgQ/5KvH6GDKNMMw
         Z1I6OcP+tw0KChnKWgA7KOkL2bVJmFaRqPzz6YB28+7OfCWgKunYI9P8oK+8+YpAUfa+
         tdKw==
X-Gm-Message-State: AOJu0Yz+5q+aTHe1VSCDeP2uZgIq7zB0jYAVrO7S6wOkK+RAoPVvWHaq
	/f7Q/KDmN3yRvkqexh1lyEizL2POG77T0KBc57McSVUVFNRp1FMEPIspioNQ1g==
X-Gm-Gg: ATEYQzzaVJBFksmi5gZ7WocmwoesmZCMBrD253ufS8n3sDaMSqSgNBdFRgIkuL8Cyr1
	5Lw18nvx8nKIrhAxVONsR6G3cEpNh7fIqj4/Ww64UMyfA9OhxGMGoeeKEn7ckYtKQ5UGzpEwne5
	mGECm8lZAJxcLGGr5S43zIyyJPZY8gnwRlCrCBZPnENUdcrlpID69Eub1pEwrLh3Pkd+liTsevB
	teyZ1SNx82ifHeYAV5XkOLkQGRYO5JiICRODSRs+8pyI/vMz4MSbqiAT0gc2K3NtkKiipE8iGT6
	rGpXjqUwdc+jnwC9VbtQFfeHWsf6TSrZyHhjG9hGdyCtG+T9iReEZ5qr5unBSu3rlk4Wi6lIg+B
	V0uFPKf4PE9j0Owbgnvpxrc54QDw3XxY7zcb21cmjHCILECqyLfoB7pu7OxpnScbhxC/JchTdSZ
	1+s24WJ4y26AQs2gxyarRo
X-Received: by 2002:a05:600c:64cc:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-4854b0b97fdmr1722195e9.8.1773174099993;
        Tue, 10 Mar 2026 13:21:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm252301345e9.2.2026.03.10.13.21.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:21:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH v2] python3-django: upgrade 4.2.28 -> 4.2.29
Date: Tue, 10 Mar 2026 21:21:38 +0100
Message-ID: <20260310202138.1447473-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 20:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125039

Contains fixes for CVE-2026-25673 and CVE-2026-25674.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fixed typo in commit message.

 .../{python3-django_4.2.28.bb => python3-django_4.2.29.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb => python3-django_4.2.29.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.28.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.29.bb
index 2c6d33991c..ded9e6fc1f 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
+SRC_URI[sha256sum] = "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7d5659d4709542014"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \


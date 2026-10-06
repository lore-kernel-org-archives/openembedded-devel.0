Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6643BCA5FFF
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 08:36:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40822.1791275763199583551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 01:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DKFteyMu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2103242f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275761; x=1791880561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPBBva8d2rM7G4EEepVlE4uZ4JQqY8qypSuvAfikikM=;
        b=DKFteyMuY1SUNAF1ZDNDMm7EAeg8l2YSq8rn+JYbTCScK1ogvOPOKlBDGQlYAI5nr6
         uoaczLJgKTqy7gcgMKMqf4YGoRhGBwFvvrhmUDGDPaFkdFEDmJXTEIGZSveLqCnjXqL0
         6LoBbjN5R1DFEHRs7eQnstSudOn1+1RCdHVWOvNUtq+uYRJH3YyAG86L/y6aDtBt4E10
         3ysCXVO0tw4EEvTXatHnxV62rmn+oJF8qFTR38z7ojKy5Zxukqr2s/GEaTG+SB+eOtEz
         TjgNqBf8ezeLhbkf5zMYe7SCN6MObLqR5Xs1q2DerO3ABemW0jkvlnGC6No90GF9h1Lp
         0gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275761; x=1791880561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPBBva8d2rM7G4EEepVlE4uZ4JQqY8qypSuvAfikikM=;
        b=nkpO18cwxM0J9hyVS/TMDEPl2nnpkYQNxb8CZbbORXIFgat/tb6fsNQmooipZ13PEo
         aD4hhXo36XzjzhYkNwu0ayFa+6kOIzoQMso3Y0xbj3WELpkIIzJkxFyJHL+Z4C9b5gs6
         5Zk5zo2zuf89bFpvJntGVXM6uvZmcYboa8Yo6lKXZfbZRvUJ+2EZobfWqu10U8XQ5gnG
         hjvyaORgKsvhCQ1GBfDxFRYF0R0F45MO01WDsqs88xIdAACV03aySKTM6b30TVczvp4U
         q2XYkChOXsBQVyBpi/1L8DZWijZoeCJi7bPK3ngRqZqlOJLMnQAAMEga+PYKO8snbQdK
         PUiA==
X-Gm-Message-State: AFq9FYKUS2GC0g7QxWThMLTnOyzmV9b8iS+y8dM1FpRJQiKAq0n3iMcg
	OZBXfYWlkJmx0SxuDtfwf3EfhZFJxYFCeUHL8lw3dm4obVL7vFcdO7YpETMLuDGr
X-Gm-Gg: AYBFou0csLDtimZhHidnox+j/TjCPdH0nYbkvdNUCl9k+om3/Qg/Jt4t1kd2Ha7LOK5
	fsxZnNCQqVmMwq1k2iXhVypA0pwJtSG+anFwrMsv4VyzHmgJOsp46H1RHYG3y0iv01o95GjLNDh
	9GiUUQkmNPeLb1LmlULERmO5aDQ0s3sfEEvJSBeCgi+qXI8jT7okp2ji7poVYgEi8q3TGkwJMqy
	Vrp8mDnL/dnep2aU64tfe0hs1kbVbl1GA3g4qLO13pDButiZ3cKJLzQSFNFhWIVJZxcYljus7E0
	eKleyygafRoXPmum0A56VqfDnApZZwWh+mjSGgyBh8MOKLE0KqvWWiJ3y+E+Fg4GWzmbXH25nOK
	hRhXEZ9VPRsRQfBdHYLv44FJoOA0rkesBAEEUiyPcu8QOL+xOLRWitq+1mn9LmGWklcUmN7W4OD
	9S4d49VdxVpRLx+Jlg6o/cwjUb5Sxj12FDrylOy5mBRYK/s8/mOzZ9xeXJ6oJCCEd3LTOSWdboE
	aU3u9oMh0wUzSNLbXnVSkSaSekJRMaFwdZWd8lqnBR1w7EGGYAhjGMk
X-Received: by 2002:a5d:5f95:0:b0:48b:a4b:5a27 with SMTP id ffacd0b85a97d-48c6d1b3184mr1228553f8f.49.1791275761119;
        Tue, 06 Oct 2026 01:36:01 -0700 (PDT)
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c69be6b12sm3514552f8f.45.2026.10.06.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:36:00 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python3-google-api-core, python3-googleapis-common-protos: set PYPI_PACKAGE_SDIST
Date: Tue,  6 Oct 2026 10:35:54 +0200
Message-ID: <20261006083554.2712998-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 08:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130630

From: Martin Jansa <martin.jansa@gmail.com>

Avoid replace("-", "_") from:
https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952

Otherwise do_fetch will fail due to different source archive and expected WORKDIR won't match.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/python/python3-google-api-core_2.19.1.bb | 4 ++++
 .../python/python3-googleapis-common-protos_1.63.2.bb         | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
index 84b384e8ca..d4e0a8e5ad 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
@@ -7,6 +7,10 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "f4695f1e3650b316a795108a76a1c416e6afb036199d1c1f1f110916df479ffd"
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} += "\
     python3-asyncio \
     python3-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
index 5539d19f68..5ab24440f9 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
@@ -7,6 +7,10 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "27c5abdffc4911f28101e635de1533fb4cfd2c37fbaa9174587c799fac90aa87"
 
+# Avoid replace("-", "_") from:
+# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
+PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
+
 RDEPENDS:${PN} += "\
     python3-grpcio \
     python3-protobuf \


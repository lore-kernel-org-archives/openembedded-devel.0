Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150BFC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:45:51 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.26322.1683618343655754686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P2qjDw8I;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ad714536cfso30868571fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618341; x=1686210341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otnBxYiHyCSflOvg4yhb9o+AnufGQms9Dr+v00jQeZM=;
        b=P2qjDw8Itp+Sdrpy8P0c33Q5AknGQ0U/vGm0MCTYhErP5HTKclK94dQGrJ/xKAu3tI
         58TsKZanIH1oa5qSzXJ6VdHFvy0RJ2thQxHiBo2VefkaQwl2mGKIwQ+z0rKHpMR+QHV/
         d0T1F0jufLr2t0gEVsifk4KGIAJg4wKrvw07z/0VqqvDBHjCHk2heOMVBttocnKrkFxe
         MUkzD2W02cKE7ctpvdsqXlbAOMTkVk690OcwyiWiomv/zVpTOZ+RshLFVIKB8sgo5yu/
         PqvapDtOa5QvtXRLSrxh2X0HzvojdMwIytOL7BEJbVjlamnGHRgGqPpf0SNq0ngoEemW
         KWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618341; x=1686210341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otnBxYiHyCSflOvg4yhb9o+AnufGQms9Dr+v00jQeZM=;
        b=TN2OOKQfq02iFZGVUy8dJCWJnkxZy0uZXYS8ZnnZQuafcaAyPx3+ATK67TYTVPf0Es
         FfgrOXljHza2h0DFY9tdcBDwzo/DItuKS8G4VwgU5kNcYHBCcTZ28zDYGCvUTroDf4FU
         KY1owl9h/+xWkHFmDsIBLkaRRebZlKVKu3CUNle4WS2Yj2PJOlC6qMbUh5f/vpiLM3vw
         P2X/V6oBROFZose2anUpFMAmhRq/hXCiK9CyGlgLGVJK4kS+z29bAbbg1HOD6vUo90+J
         1AOAkJA6X/tYhQrmUlWUQIuJ/VDEtry9Qr7mGLu9vne+4MGfNwuPLLeC4GcZdnfsT1+Q
         f2Qw==
X-Gm-Message-State: AC+VfDxgh7xsUjN0TiKVF6hu8oS0hsw11Ri+XPqyojykJCFU5MU/04JO
	Tik8j+H10sNXG7LHpLC9AD0CuGV+Oy8=
X-Google-Smtp-Source: ACHHUZ69cNDc6oFG2e3YRHV8Gn/bMfk+grorFhbhbCx8RLputmdmwNKXUp4HkYviy7Ng4mnA0q/ezQ==
X-Received: by 2002:a2e:3c13:0:b0:2a9:ebf0:d95a with SMTP id j19-20020a2e3c13000000b002a9ebf0d95amr616281lja.34.1683618341597;
        Tue, 09 May 2023 00:45:41 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id x13-20020a2e9c8d000000b002ac833114besm1458623lji.47.2023.05.09.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:45:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [kirkstone] [PATCH 1/1] lmdb: Don't inherit base
Date: Tue,  9 May 2023 09:45:08 +0200
Message-Id: <20230509074509.7362-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509074509.7362-1-liu.ming50@gmail.com>
References: <20230509074509.7362-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102487

From: Richard Purdie <richard.purdie@linuxfoundation.org>

base is always inherited so remove this code which will soon cause an error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index f23960f40..a76d388d7 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
 
-inherit base ptest
+inherit ptest
 
 S = "${WORKDIR}/git/libraries/liblmdb"
 
-- 
2.25.1



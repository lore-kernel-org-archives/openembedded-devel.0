Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B1DC98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:38 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4307.1790160154100859863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k8e6MftF;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so487476b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160153; x=1790764953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4dJk3pgpSyPa5IIgpnm6ukA0Iw2kx8nb0J697Cjo8o=;
        b=k8e6MftFvIioVoH0XBmKnrWjuP6OPRdCvKQGqmhMnVdUeGyzfnZy303Cn5JCO16TwT
         GXLR5beHiv22q7ACjvL+SPsivQXzUyx02Tt2epA8cLpvD/li7rS+1heM4JWY92rx1nel
         l3M0bs6eetjQsfMapQU1DU/L3RI1/JR/4AiGBUh/8dMA2PuCuxdQl5wCH25XUgPJI874
         pj1LwDjMx7OhK6i5ne1i8eZWoqCzEk3CVeLCJN1rxe2b2GDd7SgU2tDpLzJu3GP4rFIv
         7XlhZ8G8Z6jUXymep5VxZzrsNSnIBY30WwLQpMmePh0ENb7xC/FH8HP73OKzbT5+jyms
         57Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160153; x=1790764953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4dJk3pgpSyPa5IIgpnm6ukA0Iw2kx8nb0J697Cjo8o=;
        b=j/ueYcI2tuHiVX28G9J1+Hw8Bi+oSEasulyZwBjf0+nhS4eHLfMSdQjcBqW9f+8OeJ
         S4F+5vunNS7S+ELGDT0RykwFde/LHAlCWmQ0ZWnQoVDq7tVIhK+KweL2yzfJQnK3Rhpw
         nD9SMAouRkipaTuxG0xIck8RJ71uUoPkhhDoHAGMXS0wLJIhDjpYp0grlpmhys/3iS2K
         5Aa89KQPd3SvCqdEptsEhGXiS8V0rvCQWsY1qZTvfZtcvKK4HJpa+P6e24p+dTEVpv5G
         Gr3lWWtNqPEz9sMaykxcBZg1dMnA0k+V5tU7ZW/Skvm8i/Zezgg2p6D/SIM4enrD1wR1
         NLNg==
X-Gm-Message-State: AFuF++npaVO5Z+7rKFGZASXx1mZXF4LfPLNCqpaFT2qp6YIk4R7STXlu
	41I3Tm0awNnh4pd5grjsjU/X//EgO3TCXSgoCsidTNl8AGANHChEp6NG/lhgug==
X-Gm-Gg: AYBFou1t0z2ahqh3k1Z/oV9sF0uRCJMRVfMdIXcaH3uooTBg3D4FIMn+RLgQfoyun6P
	97rKlWccdh6IGX1B/W92ITIC+DbE+OjrbRRekSGGAath6KiAoNQVEVWZ+2i/vdEb9CyyJFUTln9
	iVVng9KH9sptwgR1ALl081V7Bwo6nJXGdl+keKv3XN+7XwFO0dqY1DlHEktqJBGJlzec3dq1AYn
	/RScZen/tzs8C9FsJPmTYaobScIwIxtT7BMfVEQO4IqMecHSa7frePlIFkvf/Wiurve0zmTir+D
	3gM2xdlXeIKUR98JawCzkMNpuP830FTyC3YGwF18nXHmHcohIygiH3YIMK+WDei36wt9liQL5Ab
	jPgnwNCN800D+4TbMHI0USX+b2vKyWAhox6uXFJ0KuPvli5Lm5LgHoh0Gp/mpuJHYFyutnPQHX/
	I2mI0g06nVhbyzHtvz7QK+jkPTWL1rWZCr+1W8CrR07LMBIkpHPJ19u7/CUhOrQuaoEhWqOPy9g
	NQXr8lEGmMszFOJqVqd47x0YU2RJ41IKw==
X-Received: by 2002:a05:6a20:734b:b0:3dd:a197:cf36 with SMTP id adf61e73a8af0-3ddf82e3484mr1985496637.90.1790160153478;
        Wed, 23 Sep 2026 03:42:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 42/42] python3-waitress: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:56 +1200
Message-ID: <20260923104056.457360-42-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130229

From: Devansh Patel <devanshp@cisco.com>

The current product-only "waitress" mapping emits a wildcard-vendor identity instead of the exact identities assigned to the packaged Pylons source.

Use "pylons:waitress" for the CNA affected-data identity and "agendaless:waitress" for the NVD dictionary CPE and configuration identity. This changes the generated product identity, but sbom-cve-check 1.3.3 with the pinned databases leaves the current CVE report unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ae093476ee04288893bec6d37bb15802210ded2e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index cc705f4efe..1a30e3a058 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-CVE_PRODUCT = "waitress"
+CVE_PRODUCT = "pylons:waitress agendaless:waitress"
 
 RDEPENDS:${PN} += " \
         python3-logging \


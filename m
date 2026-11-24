Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21157.1795536498660273683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ACUuNjtn;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so46460095e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 08:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795536497; x=1796141297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqFjnPaSA7JR8Iz7pKRIbem3601VRbUW4MxVk3NUgJk=;
        b=ACUuNjtnl/+5QBXOGOQns/kwnKlflTqLnbe5xa84pjY3BJyMX7aiGnegNmoIr1pKzQ
         f+NOzPtKsa9+1yPRnmK6ohn+QsSmEF453JAdssKKeq85PsBlAVhZVBxl8oqEah6Iim+i
         nXGBtCy6XxUNylq7M5MK1E81hLy31S3LO0jL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536497; x=1796141297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqFjnPaSA7JR8Iz7pKRIbem3601VRbUW4MxVk3NUgJk=;
        b=bHDcS2LmmHTnrK+lFUXeOJCN8rv+09qHexft6atdaAluchYbgCj9LAeZ/WkjAjMGXJ
         KLqYBdVzE44An74ekZbx4lKIkL9bRTCk2Z7Wj/mAkVeWSl3n7ODX2Zv3lsAsvDc870DJ
         rW92ipgHLq+mhet840i7XGBNsEn0ti64ZkhTs088vWAZPi3pmmEydu0++pDUgSDhP6dZ
         OZBEG0ePU1D+qVANKZgPUS0pzH+daJWe4ZF8BopMvrfv34duX1nZxva5TvU1GWRvTzZM
         mp68Uo6zTgIU5PfF70AzXS/E7S6UDWcKAToCLNFJeYB87FyUBhS5f1Uj0GkL03yHCnQB
         LkYg==
X-Gm-Message-State: APuU4Z87thYvW0A4dO+DHzcGqY+s4Eo6FYoVsJdQF6TI54B4bOhIt3SU
	ST/MEgSN1lx8RJG+vqFAPekYPecS5gi6wT+gtllSlPwkFWuT3IEMawMChQu1Iwbr0MifcGZ6M9L
	BfCNk
X-Gm-Gg: AZFdTZdjyXqr/DWYDsTZN1eY2HB2THFENOTSUZqdRUqGQaCfXQ5xX1uPhNx4Cw8vSxo
	07asbQCNv9IGwEjcj0sNBLgZiILj31aQyzY1AdmcYQtHBUmZYv18q1A4TBQATRYGm5QaG3iH4Pc
	tp8htptoPvzhvJ9WqRY46VL7L1JuK3bAm1/NHz/P08LOQh5Hs2O9zYB5f7iEbzB5gFWliSIFWZU
	fOCoXr7b6XNjrfsclcnSRwHlKv4nnTUozW61w9qWGAOUirRGZo5TEYWL8ppe2aIfueHyQOpsHcj
	ivIuJadbHPqyoxkwfBtYzfGGj1rW89KG9le1+fjI9Q1SiLF/RByiDeJe+GKXDpX8ys9mRM/AG78
	/7Wm2Wbwooo6q5lex3vR7YN7zjN0qRNYWsz1emL3PEWzchXswxCCB9PHiCWtVAwVNrTmN2B027y
	eS+frmxpznj5DmUy0oIZLkenPdkDs3+FRZElBpy16eCr7gRLKLBz06YF2F99Kc16qA0KQVnDHbM
	PNS42poPUSmiLMLHwliJmt9RiKQZoclNQarAmSM1btLAKHr94K8TU6af2vnMgRixyRVR54lQNwa
	jmG1QZC9xlPg/YO1gWf+/YmRtaADVs8ifqOBWzS0JkZVl6vTExOS7ky4c14bNR6t4tieFtBywJk
	bvkEyWFdUnPGLdA0ITGNarYbEytn+Xu3+cCsExEu1Qb4g43/YIsSXRQ==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr302026735e9.31.1795536496933;
        Tue, 24 Nov 2026 08:08:16 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm175096705e9.0.2026.11.24.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:08:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-passlib: Upgrade 1.7.4 -> 1.9.5
Date: Tue, 24 Nov 2026 18:08:13 +0200
Message-ID: <20261124160813.1698824-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132950
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.9.5:

- Fixes regression in backend logic for argon2 and bcrypt

Fixes:

WARNING: python3-passlib-1.9.5-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
hatchling.build, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-passlib_1.7.4.bb => python3-passlib_1.9.5.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.7.4.bb => python3-passlib_1.9.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb b/meta-python/recipes-devtools/python/python3-passlib_1.9.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.9.5.bb
index d83c37e850..c8c176de98 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.9.5.bb
@@ -9,9 +9,9 @@ HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8449c5e10474d113ab787ed2753bafe"
 
-SRC_URI[sha256sum] = "defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04"
+SRC_URI[sha256sum] = "15d39a9b2044a86f341a2e443170e4e9a6d71fe0266fe28b91032a8ca723f8aa"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta python_hatchling
 
 RDEPENDS:${PN} += "\
     python3-misc \
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += "\
     python3-netclient \
 "
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
2.47.3


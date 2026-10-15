Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1027FCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33272.1792043106886544385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cvfQhzxx;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e86dce4510so24894895ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043106; x=1792647906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/spFjGBu+l/0TF0RD9LUyxEsSeNwPyZCTqz2qpNpq9g=;
        b=cvfQhzxxnXRW9YsOgl75P57IHO4xJOK7nolKADBF2ittgARufgb3ao21WZtYODjy4z
         aC2SQaob4EmLymClNqRunX+yZENrZERvkVUv6wCs7/NMya3h2z8F19bScEO8tjy6x46b
         U08VtQZWyFEyRLm6IFZ4RrIpFzApb6qm+6wx+iLJ3nAHO6g4UByZFnJd2aM94v94LUWj
         JdOcojWvUdlBHimItFOM5pCEC2ypddRX7O8EoCtMFkCEDCP4SymwRnbwZJOySGqrVNDt
         3KJJygdzzpdW9NDveKfoxpiWy24jyK3OitBiOYCsJ4i6+hySkI6SnAskr6TsApPjOhkK
         zYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043106; x=1792647906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/spFjGBu+l/0TF0RD9LUyxEsSeNwPyZCTqz2qpNpq9g=;
        b=zoDV4QN1fCHMw7jzNVmJ90dDscQXyQdkmhG/icPJtVV3HAY/5ZwtYlnjQpTioT4IP0
         DCw5l+TNsiHcy9MUgfiqFfVBuT248LW0dLN+eChkPHW6mdIx0W+zaqsbG75TUpYhI1pA
         5fIIs98v7U3x8UIxaftQSRwt2F5dgIIUy/9PqIwo+JOz1Az1wwamrxAzhJ4FqMCLZT+o
         jj/0DIYlgy3K9lNJezW4IlFqRrYT2Z0/DjeY5y8xK4lLH+e0qBicYSwROTrF+73/xRJU
         6UknQhSxO4LYh9o8aKB0yJaJqNJYjgXIqpS36Z8K22epDwq5NwOah0zWLv2d5OMz7iRR
         9ggA==
X-Gm-Message-State: AFq9FYL3E6bZXvfqln/U0Lh7fHOZsDWdxdMN4In0Q/SecVGWZu8CHfWq
	M7Iish3MQTH5ElkMVZV/p1hBwKlNWQQpsK8xz35Pju4tarpzR5Pm0g5kPlkHBg==
X-Gm-Gg: AYBFou0mk2MLX79uNh8tfNe4zfSQy5QHhsXg1/0QqlwS6ftMPRLfzxFSaOZ/WUz66e/
	vK/hBGB95N5Ras2kDBfrbpfkXW2Me4VwSvQoDbfANQuIYoqreRgunmxL1EMBNn+K7BwU4aLTiwU
	JCmAA/ZVTxprUFVqccjGdHQibRqncxWADxKAd3la8Yv96uuB7hWxQyZzPvK0ewnedK8PVCdvsP9
	1HX1BtIW57he2t+s2i72QeuZiH/chwxCjgAGwdrbLG+aNj59jA2cgEMIvESPgZN8yJzQz7kUkbL
	c2oodFls1lg/hGDZyjrYUi88NDLyAWF0N3JXUxYwEFQj8pxxCzzlrR/SW7/yZtQC9B8CxF9k2xE
	ZEDc2/boQ+oG/wgnC4Px0yVrkM6NMdhTSyXbajc20RcAWFYQqFog+GgtLWuXuBOHhBaA0YIBSKQ
	mvvAdlu/9xAIq9R2VF1qpmD/M3IFPIeV34UtAjhXGJFTCXI8j2ugQSJKS5fzU70cVag3t6Pf4A5
	L92QkTSAb5yaMdrkwXYuAE=
X-Received: by 2002:a17:902:e748:b0:2e8:1c90:f4c2 with SMTP id d9443c01a7336-2e842ce7fbfmr149651005ad.50.1792043106115;
        Wed, 14 Oct 2026 22:45:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 64/82] strongswan: patch CVE-2026-78126
Date: Thu, 15 Oct 2026 18:41:52 +1300
Message-ID: <9b00eaf6ee3e99fd2d6eb7c9dbccb06d32c91d2c.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130984

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78126

[1]https://download.strongswan.org/security/CVE-2026-78126/strongswan-4.4.0-6.0.7_eap_aka_sync_fail.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78126).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e228e7711e49349b1342ae2be83530ab34883f98)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78126.patch           | 37 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
new file mode 100644
index 0000000000..307d1a9834
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
@@ -0,0 +1,37 @@
+From 13aa926cad7ec7f668249b6513c938b8c2e95af4 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 4 Jun 2026 10:00:02 +0200
+Subject: [PATCH] eap-aka: Only accept AKA-Synchronization-Failure if expected
+
+This fixes a NULL-pointer dereference if the client sends such an error
+before the server issued a challenge and allocated this->rand.
+
+Fixes: 26e246769224 ("ported EAP-AKA branch into trunk")
+Fixes: 4735965fc048 ("EAP servers check if the received EAP message was expected")
+Fixes: CVE-2026-78126
+
+CVE: CVE-2026-78126
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/7bedb451346261370256d390a8c155b86e4b455d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/plugins/eap_aka/eap_aka_server.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/libcharon/plugins/eap_aka/eap_aka_server.c b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+index 0712ccc..95d4b03 100644
+--- a/src/libcharon/plugins/eap_aka/eap_aka_server.c
++++ b/src/libcharon/plugins/eap_aka/eap_aka_server.c
+@@ -505,6 +505,12 @@ static status_t process_synchronize(private_eap_aka_server_t *this,
+ 	simaka_attribute_t type;
+ 	chunk_t data, auts = chunk_empty;
+ 
++	if (this->pending != AKA_CHALLENGE)
++	{
++		DBG1(DBG_IKE, "received %N, but not expected",
++			 simaka_subtype_names, AKA_SYNCHRONIZATION_FAILURE);
++		return FAILED;
++	}
+ 	if (this->synchronized)
+ 	{
+ 		DBG1(DBG_IKE, "received %N, but peer did already resynchronize",
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 82cd4738fb..2abc616c37 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
+           file://CVE-2026-78126.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"


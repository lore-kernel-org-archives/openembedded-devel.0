Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D201DCFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 17:43:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19118.1763919792210201186
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 09:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UHAthl6T;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so18132095e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 09:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763919790; x=1764524590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TEpoHmaYQxjlTC9qeVs15x9ks9gJM5DXcPyVNcIqX8=;
        b=UHAthl6Tom9XDnmyRQZHSY7SB/DuVN5b0YAOnMqXuZWZAcfyHAESCCdqj5fG2uKFRx
         zWRXbQxS2pxKq2lASLvfNldXH4VxbA2JNlkrMQA0bxRlbGDk+5fzM/Tm/Q+1jktpTeco
         DPUn3zWuPYBmgTl5u0qCGt4+Y190jlIiOkSmUsDJVEIUWthgydvI06991sToDq4409XO
         j63NYKkPYm+4dV1xgJyvZOU6ILdiZmAv7NmyDOyR7p2G4O8zenzzb2u0OIHH59NARNVc
         S6qNFWffeNx1wCAsuZzcbpnI05+AsoVkxk2QzBJHm+NBhPP6BzJyMkUQQclQ9vbF+W9J
         PV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763919790; x=1764524590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TEpoHmaYQxjlTC9qeVs15x9ks9gJM5DXcPyVNcIqX8=;
        b=bLST6RjIZqh5AGJD3r5wrcdUVc7dOh9j42mjgq1XUeLf6Dm7iFEDDpZ0lxfxfph6Gh
         lXLDk7xaHp9zxv+7LooARdCAokv1gQe9cbSDe/i6yiEIsV8Q7raWysTr5oOHY7bhaSK0
         TqGiZ31N1QboBFjgMI+f7T4DjHrjo2jY4bGsTCJOaKW+FYGfBT6dZs65LSeQLzcZzT3m
         hO6cSwasTBOvxmFTNOH7N2IEdWwqC5l3IqD7sbks/nxJaLHSAFb/eGwEhroQhlBwcUjg
         CMx9+T0mQvqB02VVOYCxcp4b76Za4bzVLDu+Z8ttl4ArPWl0wQOz6eC+7yXnZYullKrT
         yY5Q==
X-Gm-Message-State: AOJu0Yx863fkE/SB7piieG7JoSTDmcABtZYEWs3cJAulWFxJ2ILc9Iqc
	f2oKmojLsX/jDrNJNZhsvAc4BV4GB8c0ZPSmt94HWc7BxjFIZITYEqENlucTe3Z5
X-Gm-Gg: ASbGncuH+Zr0W++ul015MBg+bru9HL/JVuD+DCLi/ZFXUV2/ptX3tX6qhRUUO9xOOuh
	a2EFjK3ZqWDSOXRl1oKO4iEkC1TugC3fnfHbxx3CdYdFUKlA51tJYUUkVXzAMN18+ON8OyqMmwt
	pBaB9PbK2n3VVlpqXYVAefmD/yv/iVb/2G3k9hEfHbuKy/PmtcHQ39uJCUGSuZacD3atnd8YjYo
	zlhpeFr8Zr24J/ELqFLhbkxY8Cyhr9qJwfBcXKun9EXn+WRAt+fGwzLbxRk2vvNnvLHYyZCJvAD
	yrw3Wf9rbeGUz/V2plVaHNzu3yJOCRo1V3Rjk+67lXbXDDHUT6f4zS49DsHOl6dwklJ/odzZITp
	9Co1B35Nw0fa/VmsD36gt8Dji4/ahpMfhZfj3NMFslewIFvtSxSkbAcXgIdu5P0Y1e98XZvoH+N
	8o5hOhlDIQ40FpUVbzueg=
X-Google-Smtp-Source: AGHT+IGKsw1GjLbRR25tc5f3sNXtErroZD1NP0jpdU3biLEruBL2SMCzXchsSVTM4DRqbb3GePSJ8w==
X-Received: by 2002:a05:600c:1f8f:b0:477:5c45:8100 with SMTP id 5b1f17b1804b1-477c01df155mr106132135e9.24.1763919790244;
        Sun, 23 Nov 2025 09:43:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1f3e63sm156733795e9.7.2025.11.23.09.43.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:43:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/4] jasper: patch CVE-2023-51257
Date: Sun, 23 Nov 2025 18:43:06 +0100
Message-ID: <20251123174309.2625557-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 17:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121998

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-51257

Pick the patch that's marked to solve the issue linked in the
nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/CVE-2023-51257.patch        | 40 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_2.0.33.bb  |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch b/meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch
new file mode 100644
index 0000000000..96c23698b9
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/CVE-2023-51257.patch
@@ -0,0 +1,40 @@
+From b19a51001e681d6c4bbc32b43bd425dee7f2caff Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Thu, 14 Dec 2023 19:04:19 -0800
+Subject: [PATCH] Fixes #367.
+
+Fixed an integer-overflow bug in the ICC profile parsing code.
+Added another invalid image to the test set.
+
+CVE: CVE-2023-51257
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/base/jas_icc.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
+index 905b823..7e69bd4 100644
+--- a/src/libjasper/base/jas_icc.c
++++ b/src/libjasper/base/jas_icc.c
+@@ -1295,10 +1295,20 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
+ {
+ 	jas_icctxt_t *txt = &attrval->data.txt;
+ 	txt->string = 0;
++	/* The string must at least contain a single null character. */
++	if (cnt < 1) {
++		goto error;
++	}
+ 	if (!(txt->string = jas_malloc(cnt)))
+ 		goto error;
+ 	if (jas_stream_read(in, txt->string, cnt) != cnt)
+ 		goto error;
++	/* Ensure that the string is null terminated. */
++	if (txt->string[cnt - 1] != '\0') {
++		goto error;
++	}
++	/* The following line is redundant, unless we do not enforce that
++	the last character must be null. */
+ 	txt->string[cnt - 1] = '\0';
+ 	if (strlen(txt->string) + 1 != cnt)
+ 		goto error;
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index 27dff82df5..522adba93d 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://jasper-software.github.io/jasper/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
+           file://CVE-2023-51257.patch \
+           "
 SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
 
 CVE_CHECK_IGNORE += "\


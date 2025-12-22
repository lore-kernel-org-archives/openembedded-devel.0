Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B643E69164
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:50:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87329.1766433003579156812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Reh3aMzz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso37271745e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766433002; x=1767037802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgx3AVDaefpFYjIv1h2YIVjB9bIC+0nPVM9os9LTrZs=;
        b=Reh3aMzzdN7cA4j+jsAl/5zN9e5jCPlYMrZWAA04CLqjHpQMomuLt/v8Zja4MUrDad
         DbIbjqTmXbsMh9rmjq2TAUMPjQ0BqjZg62rQd9Qc4WdQSK37kMRiAv4O2QD86VDQQDdS
         zlA4TMomZLUIbPtjthixDeX7gt32eQ6SaJd94CaVOqTiUOCDgSOvgYTVJivs3xc2gYX/
         86mHqBGddSd+Ym7fyBHcCJ71UH4pcloOf/lWZWjFCPl5NsCW+fhQeiaCm5qR1bUUWVkg
         MiuCPW+N6CApwWq1m3xNeTZC+leAVWlID6WgGr7/SV6BZx1s5rR2Y892CEPluMmYu+OE
         wtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433002; x=1767037802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgx3AVDaefpFYjIv1h2YIVjB9bIC+0nPVM9os9LTrZs=;
        b=Ug44EwdWETJjcSxur9EAdelj8SE42iLKuKsNOiqD/OfKVcYigN8PJKP8WhWZj9zTQC
         leNi/Ju0vDUsJB2Nf1SuEFEiJ7rVlng0+WVySDSFFAAeFmpyiHLSnYv9DLMoWcSeg9pp
         3RYpH8X2s1RZqnYW1iuNHS5vv8mZkClvaK5/c6dIlaYbjOWmmuvG8uvH/LLTerzRe3Ag
         0TVLA8QY6vSXdScMU5krl/d8D8d5azYsVUdFynIckSy5EhxGklRoY4SRbmrmwS38gGU1
         CDUPcL4yExWRy4hhWAwJ8rc8WBC26gd3+gWop6fNJihxZSVWNqc2bOppztvY5icIlvLT
         XrmQ==
X-Gm-Message-State: AOJu0YwvcuoCJQdamAEEtc6RVa4/U42CTdRfGg8qaSRB6qP1xWH5Ldi4
	S4hEx7+1V1mo6bDCsrxLm8ic+uv4WKwIu+vhm0dXzrHuRlEQw/fP+FBn/YdvFA==
X-Gm-Gg: AY/fxX5bnLIALVZWwE4RFHNxYl1D6YBHVNNmVJP/wyFhtkjTDmiCk3VNOzMSys2S2K9
	QsandJ5aGKLUhqmofdz0A48N4U9ssk3OQVTHbI6s2UM4CjWFyLuuzG0sTdMXLS90cnBaM5z7N2H
	1GU4AfRyhfzAEB1OAeo7pnr6kAlf+f5FGN+YGj3IRqkrPCNqQenJ4B4LSg4rBrwGmRo8kA/77sb
	tTu5tgVvwUeePcUGE7+x6duroShvC+a4hteYZBTR4HP9AfPbbxecP6m+6XmN22UZTLWPl268MiV
	piVFlbTk5AxqbEwrVD2eMfvB8lxNVTV7fk/5qLw586uo9DZjFF3so5l4XMi8QDzqJUxL76bVCsT
	Nb+M+Tv4DnhmYyx0BHsMJ6o+wTXVQkSEfgOsBhzWNcb9Zi3LUyzwAaR2SfBRX2WlzpoZ2T6m+8U
	Nw9764pJYUSdQshpPT3X4=
X-Google-Smtp-Source: AGHT+IFL04CIMYckt0JBONyOzI/x5jWJ8JIz47K+YySHRbdOXNqD3jCqP7wfJYSV5DxKvQJqh0Ks3A==
X-Received: by 2002:a05:600c:3b94:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47d19566b00mr144137705e9.12.1766433001872;
        Mon, 22 Dec 2025 11:50:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c9d4sm104078035e9.3.2025.12.22.11.50.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:50:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] minio: ignore irrelevant CVEs
Date: Mon, 22 Dec 2025 20:49:59 +0100
Message-ID: <20251222194959.1725672-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222194959.1725672-1-skandigraun@gmail.com>
References: <20251222194959.1725672-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122806

The minio umbrella covers multiple projects. The recipe itself builds
"minio client", which is a set of basic tools to query data from
"minio server" - like ls, mv, find...

The CVEs were files against minio server. Looking at the go mod list,
this recipe doesn't use minio server even as a build dependency - so ignore
the CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df462075be855c60117af661dbce1836c652fc16)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index f278a728fd..511dd4d869 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -164,3 +164,9 @@ do_install() {
     install -d ${D}/${sbindir}
     install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
 }
+
+CVE_STATUS_GROUPS += "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: The vulnerability is in minio server, not in minio client-tools"
+CVE_STATUS_WRONG_CPE = "CVE-2018-1000538 CVE-2020-11012 CVE-2021-21287 CVE-2021-21362 \
+                        CVE-2021-21390 CVE-2021-43858 CVE-2022-35919 CVE-2023-28433 \
+                        CVE-2023-28434 CVE-2024-36107"


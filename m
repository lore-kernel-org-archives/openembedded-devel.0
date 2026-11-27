Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10280.1795753058884651059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LrU7aotQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so1416939c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753058; x=1796357858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwWjtLbNvFuNd/zfQ8o9usylbfTBWqoCn65bRpMA4RQ=;
        b=LrU7aotQmym3waNVo3HnXUZpmBYY8dtEAoz8Z+sRDihNoJHTgKoeT3L5vCF73/CkJZ
         o3EmsnOHU31blFhwAEpRb3zhF4uYHEO+ZzdK9i3xU0mK30mDnHusH5fZV8HabAnAllJP
         MGeqtiueD12nU/cqmFAMrGQTmYejFCL5+6vdteLn/W+4W3LP8dXdA+clSoi9/oMRFhte
         dpHP5d5ZbFyeeY94Qki4arEGYk4KEULGM0Y27SPekVQY+NvkSwi0iP2hrnikvMRr1epK
         aMkmmmc3O7VJCuY5QRuebRtZizb7FUG2eugsgLIfHOLwnkZM7LpWGWhFB+dAuEnIz6dP
         7fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753058; x=1796357858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwWjtLbNvFuNd/zfQ8o9usylbfTBWqoCn65bRpMA4RQ=;
        b=cA4WjanCHUNKNo9Gvpgk8gTUFl/dm3mrkapkCp3GOAraMu1oH7wIW2fkfhn6L+4Ibk
         2szkzLrJUjlvlWXQmVEOV+fO5iFTmfE5PVkPzB5nFmZDegsqAwnbNyl5eZknT1Gt3SNm
         61q2k+T6QRHa5DwvIe1LhqYB8/91mYujsf80Q6Uhlbh7ecLQh+tm3f64xwdQAVl8hGQg
         yCK2p9WYCujSMMpcH8qIRjx0aYLX9qfXtBT+ItvVX5RV1A/VfpX3tAGayWcgAlkdpTLh
         zWCIITMp2vwz0oDhi/2mG2LJZvXYV4oHw9E8zjDtAQroYQwI6o44WxzlDR5dQ0BBOO8e
         07Vg==
X-Gm-Message-State: APuU4Z/f8wVAx3hS/KRBpSWgmWH+4frRmAHpjJ9pE1X6u017IWVKZcxx
	ooFg+DglZEkU9qt6zIwdLDL5qlnD5cdN4kseqI4B9C75cIgflsiolqYu66GcIEhb
X-Gm-Gg: AZFdTZclTChdT+9ZouDdXHApHWZjVr+Nlp8RBw0ZAsUTuddkZBec82oFSt3jDTfQkXB
	X5AIFmsg5R4km6iQNz/Z1xdcuRTq0Xux4S5UasHztERUIhEQExDKm+YDLhl7741TQsViZrYwy/o
	oGbUOA36OQ/h8tG44AXxaMB3TQjlQW4thhVUMtiR4s6ZcnRb3aV9KqXWZciLmnLKtC/yTnxtYE1
	FxKY5qgPXaZ1nepzT67JWKx58+qyPVqPsgaK2LY393nRIYggRPJZWpu2ZFZyhdyVYOw6drNXcRB
	OdcaEeHqpY0J1/KCTYsyzDhJ9NxpTTkHTnW3vg7l2aOZ8zyJG+tYQPg+M2xCo9l6qrWceYBs57T
	U7CAaQ/CHaERjIuR71tbIUaqdM16grh2VmuAyzj5W/q4fe9Dj85A395Dw6FG+jWpopF/EQxg8Av
	TMDRF+8Ay0FQG5NEq7rHOcKMUmFEo1D+ATvW+OYX247ZWfLLMkcloZ0rFto2QjftN6hDVGYMtij
	XDNaTPvZYzqIhfMD9Ptc9OrOkJn44iQl1xT2nEACnTyrZXYefFn5twAZyRV4mFraNToz1++pgxm
	5aT5UCRqR7jVa60KZy25tWLPSUxHbv+acDCUlq/1UGntEu+SWztCnalDWG8Fw5VTeaqAKVx8ZKn
	+XgG5esHd4iVwd47r7oL3jYbWDTHZRIvO2F5ho4JsDlQVTTRUBws837qvNYXHXp6bTyh5Xfh+wl
	ZXWW/UrWhtHNDRHMTXZUgMmY3dq8/0NVbzIYBaOgYUIs+zsmw0wLsqsNB+BAZiMOMouqCrrGmNP
	f9ukNyd0oxTVE4esRMjKFPGyZy6vDX3gCAkq1siGhb0R1RXo+wVNQDVH6KtRlsWmG0sqKM2VN3O
	fjb0
X-Received: by 2002:a05:7022:7f14:b0:1b5:39fb:c6ba with SMTP id a92af1059eb24-1b5568fe968mr21307462c88.35.1795753057974;
        Thu, 26 Nov 2026 20:17:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 18/35] openflow: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:58 -0800
Message-ID: <20261127041715.1776485-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133270
Content-Type: text/plain; charset="utf-8"

Upstream has no tags, so the tag-based check found nothing. The recipe
tracks master; check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/openflow/openflow_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index d506dd4d01..5e09720f2e 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -23,6 +23,9 @@ SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master \
            file://0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch \
            file://0001-Link-in-libexecinfo-if-it-has-backtrace-API.patch \
 "
+
+UPSTREAM_CHECK_COMMITS = "1"
+
 CVE_STATUS[CVE-2015-1611] = "not-applicable-config: Not referred to our implementation of openflow"
 CVE_STATUS[CVE-2015-1612] = "not-applicable-config: Not referred to our implementation of openflow"
 CVE_STATUS[CVE-2018-1078] = "cpe-incorrect: This CVE is not for this product but cve-check assumes it is \

Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A09CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3528.1791763876659358359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z3jkMto7;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so644554a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763876; x=1792368676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aX58d3wxyfWAj/pKjRcwECLPPmGI4L6iIb86qlI2+8o=;
        b=Z3jkMto7JJ36QraTWU+wUBqxyDjvgyj+8XrkdP58jEk2DzJRwC8rfYJU2/QltateMa
         xxcevAtcBzdwZIfyoIqQN55eqAT3Anq7BTYHJ+J6+2AkI4jDM9DS3vzTpDIcpTRmT5L5
         rHRGL6kOCsvHqTyWCvO/Ngjfto+OBTGXczILU3pjHFV0KZ5khjk4DvQnOgAuU1QGIQMM
         PvkGp6adfTFRY+VBFz6RCe9Wj/WclHEqyEcCzi/2CaWBhrMtXxTTz6elgVLix5GqTSyG
         HjIDm481hJAAeugGAhNpXxgKu10porm5eYPI5Rq8JOqse1ImzlJPpv20sGROFqQ0xKoW
         hEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763876; x=1792368676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aX58d3wxyfWAj/pKjRcwECLPPmGI4L6iIb86qlI2+8o=;
        b=A8ucrk7UXgedesaBkTBBAPOBAszvPo6wd38wLcy4mHrTxQW7GEiy0LU3GFaxdqYAKx
         XdyFeW0I4ayI46NTFhwcR4nergLvhazVsGLmVsm9UYFPS0SFtmteG/Qh/cT8PH/GqEfE
         IapXUxokUGk/knTQY4iAm1E9PgbxC19LvRoR9r52iztsUgU2iWwrAnFcAQhWTHZy3kW0
         vG+84pSuRzAAi3ku7RsMQakxDBQqzU3ZdQeXpVfzmCNO7MeiHAMkywkC2zB0YqZRDC1m
         ddPHc6s5gmmPlzrocrsNmlPZ0uGmV6UtSryOSiYAhRwFqqBfVbAuo6bLUnxg3Cy9vJA4
         30HQ==
X-Gm-Message-State: AFq9FYJiiyJ0gnVFaTC9TmQZYqq9o+lCFpJbpvqyf4UsZR2ko6x2tdUv
	anwTV51Zgq8p5wvf8ekjE5i1zgl+76hw8Zxth6PgWd/ArXMKHKz/69E4KEYU+TpG/js=
X-Gm-Gg: AYBFou1AXF/oVB2oM0NBXe+3k1+1adXsRoK78L/RG6/Slw+oMSwOioV4OJ7x1zZkd9k
	EKP7w8IHkJdrQry/5bs7nIj15AfkQw8OjZRz4zGBV+qrbOvU6ArixCzsChTfbDAbfca7d51drK0
	yFW5DMvk0Aadocsz7osK5nP3/dyQ0JGsPx8msFZv62Lv4lX4zTiLKhZd4SGpZm/h46wFZdc/OW+
	WAdXAewt1WLfkDVC/GBwvJLOW1wnnVAw8hCjpDUq0LJ6sKnk1Z9JSdnqVR69bFlTe/SmH8HYIKd
	7ztVDvLyfDRdCii8/PPgEV10NC3nU838KMJAcqjBWP7O73byJayW3wf4nYiWy21rviMJh3kHIhO
	nL2HDZ415xO015Nv7oBelb9cc3v5t605/Fk7JjeQC26m0Qmnb+l8QDEld0J2IxEWdxLQ4pUEzJs
	Cy3lv7ytKWfRuXION2MVzBQ/Fo1uOOADsDOo9vIHJ3KnruWZ0a6JSzev/f5b6g2EkNLT6IFTr1F
	mkT39czsozydWEJbo2mz3B7KBY+qmGbeIjylY8=
X-Received: by 2002:a17:90b:384a:b0:3a7:250:3853 with SMTP id 98e67ed59e1d1-3ab3a90d555mr6806015a91.23.1791763875989;
        Sun, 11 Oct 2026 17:11:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 23/28] libiec61850: mark CVE-2024-45969 patched
Date: Mon, 12 Oct 2026 13:10:01 +1300
Message-ID: <20261012001007.2541673-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130748

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

NVD[1] mentions commit[2] for v1.5 but is also present in v1.6[3]

[1] https://nvd.nist.gov/vuln/detail/cve-2024-45969
[2] https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33
[3] https://github.com/mz-automation/libiec61850/commit/d1ab50298fcba3f87b1e58dabff92f8615b14ee7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit a7088b0fda5d269721e5d3f16ae410062b9b2c8e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
index d2fbbc53fb6..51ceb5cf02f 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
@@ -35,3 +35,5 @@ FILES:${PN} += " \
     ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
     ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
 "
+
+CVE_STATUS[CVE-2024-45969] = "fixed-version: fixed since v1.6.0"


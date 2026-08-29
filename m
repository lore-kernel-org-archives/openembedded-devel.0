Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1370EC61DDC
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:34 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.280.1787962290719119525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cYaSBQPu;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso1430055a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962290; x=1788567090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3EgdpKhHVm6oVcKxhfzOncTuXxvuN4p67qlaETfy0k=;
        b=cYaSBQPuGk86wzDAHPXjzxrz7N4Nn7ur2BD9rbhtr/+xVh71BlrnQSfvz865rHuHKI
         3C/DFAJJXBmfwV20pQ3fcxqoD/wohQD3H4trlPCaEdy5f4gZyuEv77PTh4y63xqXnUCG
         XM+hWrEMMYrhiEI0jDeEEz3kyx4AJmgG8mSInf30a+KA8LbeGph2ua40bbSEO2NsjgNN
         C/gWIry6Tmv9/RkM7B6yp8x1MjeYf+nIvGQd/4PszEZndFfBc6Rv74NpylW0DhgpHhHd
         C4Cp5AkWHO3JlrytJsAqzNWam82eZg/O5v7dP4cNqtuGPXtVC3x6C4LiMSMjJ8xMIqJc
         aWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962290; x=1788567090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3EgdpKhHVm6oVcKxhfzOncTuXxvuN4p67qlaETfy0k=;
        b=fk4I5cV3MbZ2Kvz9wDDpp4NqT3HGYPicJFpzQcpNK1eXtjGGaf/esdKFO5QQZ22pxj
         IZvJvw/Vhuy5Dnx2Nn8ZJkEQlSKRRC+6PWKNy6rjpuvLI5TzFy5VCYwIqozqk+FFKYZV
         93XxXmAbCaLYgOiw0q40M4f5H8AiVUs/6/jchfSCSHzOuT54GmaySdxqS6aaDPhv0oPV
         FEEcm5CFBJZbA4pZwyJ28qCATbGnJemr3KrPe9ML5qan2p88mNQbttktVQ/oNoZNPot0
         UvSWwO8FCDJy/TWkCuUjF+P9RC2VSNrVVVhyQm/DWIkbyRnr31KWyHfrT7lsEsMHMyEX
         9MKQ==
X-Gm-Message-State: AFuF++kbxTFOGqCWwTAT0pA1CMyEop6RgW8903uj8chIsRhI7SZJcuS+
	4Zv/Rht4YM+sFp8jH3XsjYZ5OD6j/Y2jF6eXbWMkPuwoZJvn7W16VthXoIKC3ueQ
X-Gm-Gg: AR+sD12GY3i+Qr+FjlqmgonX7Zm8E2uPQw7R0gI/OCV4AAanlJ4uOHo8dvFVBEfaLZu
	M6QSmeltMufc48QnT/P1Q5+Fmy2J/BUlHDnOHzyua0iXV7TSh6qBEb5z8E45OupbAtUzz+J7oe6
	YjF+5T+wGFCX0L0I2NxSdz1otq+OmONibE34feudebSU2iJjb2Olrjd9T7//IQajYzN9g4YQgCP
	juqnC4il/NaAqHMwB59CZ/MWr/Cbe12+ChLvym4ladvVkpXwL4k4sXXSqbNxEaO3CYYgXKgfmMz
	Mx8DIQU/FfcCzpYvkgS2HnelCnm4WuioksTUtmdpOmU4+A12qaTXDaVom+JWehdfMBkZG36e6SV
	OHbbwY/5r+1AnujmLz/BcbfV2J5ow+9cH5GyOyh93YF7tn98RyBF+Vh9yYBkpKfJIAKGdrfWbAK
	dxsqUs6JLG6HUkxdG+P2L6S6jIK7bRmUhJ+33wvtC1kuwMVCHUUcgmoxhREsY0wPeuuctqvm4MO
	nzWX9uMaDx10LPxHWFf4d7RjJAQkTm4kkQ3HsL/6YwqDaxCxneuv8PmRqdvZ0LUC5mc/11/U8HY
	dx3Og6tIagRVRTVUj/KJahB/MlS7ICAj/gT661iHgpHMRadVSualVysfQiTH0qBIMyjt6sYzwTz
	LcE3Pu5tdXBgk4+g8fRiG5A9g+gObBZqvBDAM446PghOMnA==
X-Received: by 2002:a05:6a20:918f:b0:3d3:ae1f:d7f7 with SMTP id adf61e73a8af0-3d3ae201380mr3743209637.23.1787962289955;
        Fri, 28 Aug 2026 17:11:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 16/16] python3-pytest-sugar: deselect test broken by pytest hook-signature skew
Date: Fri, 28 Aug 2026 17:11:07 -0700
Message-ID: <20260829001108.559544-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129575

From: Khem Raj <raj.khem@gmail.com>

test_report_header defines an inline conftest.py using the
pytest_report_header(startdir) hook signature; newer pytest pluggy
hook-signature validation rejects "startdir" (renamed to start_path
long ago), so the nested pytest subprocess it spawns exits with
PluginValidationError/INTERNAL_ERROR, and the outer assert
result.ret == 0 fails. Version-skew in pytest-sugars own test suite,
not a runtime bug.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pytest-sugar/run-ptest                 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
index b4bf4b65d8..e08f9e32fd 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
@@ -1,3 +1,9 @@
 #!/bin/sh
 
-pytest -vv | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+# test_report_header defines an inline conftest.py using the pytest_report_header(startdir)
+# hook signature; newer pytest's pluggy hook-signature validation rejects "startdir"
+# (renamed to start_path long ago), so the nested pytest subprocess it spawns exits with
+# PluginValidationError/INTERNAL_ERROR, and the outer assert result.ret == 0 fails. This is
+# a pytest-version-skew bug in pytest-sugar's own test suite (stale hook signature), not a
+# pytest-sugar runtime bug.
+pytest -vv --deselect tests/test_sugar.py::TestTerminalReporter::test_report_header | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'


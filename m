Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDB3C61DDE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.276.1787962274407848388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rYxA1Akw;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2509762a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962274; x=1788567074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtlZUjwORSod+OTOZNhzrMC6/JzdHTjrWSmwuX/P+As=;
        b=rYxA1AkwTn5sOahk27xqwRV+8SaUkBjvottbA5c6YBh49y66oMJyOL9uQANt4hxmGX
         NXhEXrvqT16FhGWr6c6y1J7g6PGmYfH3Zas+rDEUlC6v/tVUvJD2ef6vstJ/yGvdHecW
         V5P+QytFP+xpBDs/2VoTfdzxRmArxjLedJmJA29CSVDa/pULvXeRsoeGc1ynj/0BMk4V
         gGTAsDS7H/Xj+VQ48lmxZ6EJDHJVmiy4VIAgFQa2AvpfT60PK4gtD1I6mosUbBjPonJh
         gX0iA27oouSGUbcoGb+bd6HaJmJJR5IBhC3y4gk4EoSjBoTqYSWd3Udgru+TAk587XsY
         06KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962274; x=1788567074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtlZUjwORSod+OTOZNhzrMC6/JzdHTjrWSmwuX/P+As=;
        b=BsHrRAFVQ/m2Kze/b7lLYhD/qbDVumz6gIEq2nmslKPlVk2Ytnx4MPD5WJWXZAylNF
         ZDr259YS0k5v6aM8X2BIuk79BlqwpEHg+lrBR3uHb0or2z3p6G3OTTYOu+tplskk/fER
         Uh/+W7YrHXjhPzMZTKwdNQjwHxWTU+ogHKo3ZsTbNRAEAqmKBhNO48kG8BkQrqIS9xub
         WR81n3feO4V3/dUfrnF/ReA+PWXZqvJEsrPtOe5JPJn8e/jZeYVqgWLN91IQRhzflQ7m
         O5gWmhqkfBaf4eEDI7HWSssKcM/2BP40Y4ZTjeC82ouQGi9V8KNK9AGc5hC8LW2rwLVp
         fCmg==
X-Gm-Message-State: AFuF++km/JfvE7R61oFQcihRhI+DnFp+DidR3/Np5vR9YsgV4mRHGyi+
	wG4w4NgGv901YHnXUaP5+lY2hYlpkVTVjfl8a7kddJVLYw0pMC7HbhwZLMhObA==
X-Gm-Gg: AYBFou1TpTtDSzGLDZn2iEZWkTDiuhL5USVWQhrxjEl2i0I5KJ+ViFqdFPdBJxoePCm
	EsvlVu44KUKgFF6wh/lNzK23RR80dqbNDyRj/ne0c7brI0dVttZY6F/etg3Grmq2TMjwPSNmwMj
	TtrdOhAOHfxB7Xx2UMQk3RD0pRnT6KgUtwVvKQpyxeGCYBZGqSlvP6he/BhMkiSniU5Zz4W7gSO
	bDVhTE3AfTdCwGiG9StGGeY7gsmtDRdHQHWD+J/d9rK0lgjszNpVWGCFXU8SPaCbx/fFCciHUCg
	VlbDoJSWIuRHa0k9QZXzSVij0VHY9/WswjDn9Uh+biqkcAUqluUEKI7ov+VRaqCmEMVPr2HBokn
	ObQuHXsOlJhsMRKyHh1oA41KrNrU9OvcVVVHvm06g0okALIXVoSN/jw3JtdxLsdrjiTSvJXQLFR
	49p8EYK4WmcCPTVqZPKjjuL939MaACJ7jhnxpWB29tEskF3Q3DJm8iBtj/INV2EgzSt9FUc8eHn
	aMs5LUGhPmqPcTTy89NfZdpPo3zt81bv7xLl6OIeWVlqZblBF9yD6IN7K3MnfMrhGLJ1Fk1Dzq1
	T24IKJ8TRbl87p2gYmY4DYa8dzfXxwL5/OQFoPFkJo3y3DvtpBgA6vKPfl4FzPYRdaEpNlxnftp
	2yoK0ilV7NlRnMhcXELahNSBXHTeXOGDMbgVMtFxQfTakrA==
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d16 with SMTP id 98e67ed59e1d1-3989bd40d8dmr4077617a91.21.1787962273775;
        Fri, 28 Aug 2026 17:11:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 02/16] python3-filelock: fix ptest cache-dir permissions and missing tasks/pythonpath
Date: Fri, 28 Aug 2026 17:10:53 -0700
Message-ID: <20260829001108.559544-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129561

From: Khem Raj <raj.khem@gmail.com>

tests/ imports itself as "tests.*" and pulls in "capabilities" from
the sibling tasks/ dir; upstream's pyproject.toml sets
[tool.pytest] pythonpath = [".", "tasks"] to make both resolve, so
ship tasks/ and pyproject.toml into the ptest install too.

Also disable pytest's cache plugin: the non-root "tester" user ptest
runs as can't write a cache dir under the read-only-to-them
/usr/lib/python3-filelock/ptest install path.

Add python3-pytest-timeout, used by the test suite.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-filelock/run-ptest   | 4 +++-
 .../recipes-devtools/python/python3-filelock_3.32.4.bb   | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-filelock/run-ptest b/meta-python/recipes-devtools/python/python3-filelock/run-ptest
index 88654deb70..fd1ddc5896 100644
--- a/meta-python/recipes-devtools/python/python3-filelock/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-filelock/run-ptest
@@ -3,4 +3,6 @@
 # Some tests require non-root
 useradd tester || echo test user exists already
 
-su tester -c "pytest --automake"
+# tester can't write pytest's cache dir under the read-only-to-them
+# /usr/lib/python3-filelock/ptest install path; disable it, it's not needed
+su tester -c "pytest --automake -p no:cacheprovider"
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
index 63ebb08b6e..e3642b2087 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
@@ -28,6 +28,15 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest-asyncio \
     python3-pytest-mock \
+    python3-pytest-timeout \
     python3-virtualenv \
     python3-discovery \
 "
+
+# tests/ imports itself as "tests.*" and pulls in "capabilities" from the
+# sibling tasks/ dir; pyproject.toml's [tool.pytest] pythonpath=[".", "tasks"]
+# is what upstream relies on to make both resolve.
+do_install_ptest:append() {
+    cp -rf ${S}/tasks ${D}${PTEST_PATH}/
+    cp -f ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}


Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10265.1795753011187049381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c6llbdf7;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so1416304c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753010; x=1796357810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zjaDYHaeyR31MhkqoKhb55dmQTEcaTAUBa/aaMVjGo=;
        b=c6llbdf7IgMKIRF1anw9O4YzzDlnxtC64GrrM97cMeZK7yfvXOuj6kU1C4f5DkHqfR
         U0LYjLiAwM6kYiDiaiJGU/RhA7P9L8erk2Elvzf98pCXyJRoM5nZuevEZGDHOjF9ACdI
         5A+jEt/TSjIjWLlOROIiGmomMkpQE+VPTGU5qCSaq/ROJyeq7uwJybVmOjyhhl5R3Gj0
         GvAB7pa1aHE/Dg5/Fz5qPyq9audZ7uYMTSBM0ZgSbIDBpWpxQpPMKB7yKaR9Sit1H07S
         ny5940AY2fHHi/52JRSWzk33mhrfGVk7YIleQiqQc7lrww/Y9KSCx9aizVylelPdLqDw
         q9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753010; x=1796357810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zjaDYHaeyR31MhkqoKhb55dmQTEcaTAUBa/aaMVjGo=;
        b=TrmjvxhfP613eXklAvKWrm6htEqA/cyh7yRcxLNWuVPyR8kU+7VufoeBdI1s6nWio6
         uYdW5ksKuoNBVgM1d5B+jbEfCbpEsLmwkZttLgp8u/zuGE9qiRZIJWXBtEr+TqMMAlAv
         iN1w4QFhAcSnQiwvh1QG9hD3669Kgkq9y0khB23EKSImofwVFE9zrT7HH8ja/nr5IfBx
         T91f5jIzfrQjYf0nTno8P9xCN89Tjd+6JQqktIuJhTRlGAG+JsU4bt22sKv66oZtxPzQ
         jYsL1Wt0rbIiAPbblRZpkch2dimI7jMokDsGCIsUXEJDTBXmt7xNzq6SGxNqLXiK+FCn
         Zc4A==
X-Gm-Message-State: APuU4Z/8loM7hSL51Zps1eNXr6ooJ3UuZe8OHjTzanXQaXnRACYdz9ws
	cBTfmYoXha/isqL39gK/ieEZEAQyLmggMlMuqZYoVT2ABKrcCxa9fp30A4ygaEKT
X-Gm-Gg: AZFdTZfj4obpMBaYG7LS4U530l/BCbWSMvkgAS9CGAsBZf3dhwUelh21qdiO6Y9TSHt
	ruYJ/sKlI140sDk5e9y9RtHVhb274bQjqIFQv4JsXo0RxfL8u/VMLLn9wA6iaP8UGgFCaCHemG6
	fBXHqi3tIc5PVDPZeyYkYTJd1lhgX88yqWK0EkJ9Z+e43hmSowrt9cP5el0OZJYJ5EVbsWVSxEj
	xCr4dG+xcEwOC/dMQ+znKpqHa8gDir6is5ao898cvnpFC2rghri0rJCHJcTXXPkWt9aB7LfJw0B
	NA6IgssLgw0IsLEdQ7KrkwcmsnCXz25MIDxbxw3Iiq3rNQ7OwFoM/5j8Muohr1biElCLrQMqtUh
	cKyzhmEOtQUnWzcuTk0Q6ZgB6/OHNotLMxC2LnHMzYpfP6WmKfSAghdsh/50v2BTwLziWjN3r8U
	aYVIJPKy55MMY6bh2bStTk4GroMIsiBoXQ8zM/2SVBE9RogOtz9+SpN8Y5H3mjagDXQeeCMPEQQ
	SGsOJWOJr/ZUhtHRjh37aUO92AVwDF6mcKBil6+OiQCKtXQhJn7QCIR/cJ8+faymzEVYVjmds2r
	6pQEABTgRL8dTbrPjmU7mn/kdwn5GckL3s0huPblsqj1xtB9CHX599Mj1HQeQ5y0VRJ0OARfzob
	QFJkk0UTLAgBLBkgkyZN8XO08h5FqryvI7g3CdhM61VDwTUDMR8u4owq3m3StoUFhQ8Os/2PQ7s
	tPaHM8MHKvIlwpRqHkAcENHQGPXUwQBuJ6NFfG8J4HIIFWmNnGWCVjYUGk/nfmEYDQosPvGmjpY
	GD8Qvsji8+YzGNLZgEvukUiXpTvEH4XfpdtqjT3JktnRtuLDnmo+pMhj7eW81yuWTjcJhOdoiai
	wrKy
X-Received: by 2002:a05:7022:6988:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b55689f5dbmr30029685c88.10.1795753010375;
        Thu, 26 Nov 2026 20:16:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 31/32] python3-watchdog: Build with python_setuptools_build_meta
Date: Thu, 26 Nov 2026 20:16:13 -0800
Message-ID: <20261127041614.1775064-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133250
Content-Type: text/plain; charset="utf-8"

pyproject.toml uses the setuptools.build_meta backend, so the
pep517-backend QA check warns about setuptools3:

  QA Issue: inherits setuptools3 but has pyproject.toml specifying
  backend setuptools.build_meta, use the correct class [pep517-backend]

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb b/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
index 23ab17ca7e..c9e31a8fbc 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "d7dc3bf0c3417c002ee976e958479c54d8ca18cbb3532fadbe69511fa389da15"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGECONFIG ??= "watchmedo"
 PACKAGECONFIG[watchmedo] = ",,,python3-pyyaml"

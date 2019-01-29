Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA5C26AC00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 17:46:14 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m1so9040991pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zy02ZM2Tnbx3ykUCflEySG/UzQMSam1mxWw5Y7gSYOs=;
	b=eB/y2y+T5Dsee/vxft7QJ2ALqdvnxZr27ldAEC9U8EKj3j6YyQCgQDqjwuZoufS2r0
	4Zsi0OTRxSL2IH2nVvGpnBoBShLo3308QId+stvCli2vvJFPj6qmV/A2n3MT5Z7oWkVe
	fgykt1M2/DXmhUDzvVpOnTLJaZ3XJm1qma8CLriEDY0cQ7sMvvduPFi0NGo4hpFdwNea
	/rl/zC7Ij6q9qKlXw9/NZZ8zi5junyiq0bh4rGjxYZOg2yvwnV9RuPXbfUC4rgjbbL5c
	qi5U9aU6TBzeXc6nYWuFoNfmV70h3P7ULe6fL0QKDrsGWcHBCK0siRreRb3YCKiOWfNR
	3Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zy02ZM2Tnbx3ykUCflEySG/UzQMSam1mxWw5Y7gSYOs=;
	b=MyEaGgbs0u0JFJMoqLxxT4u3RCxGvtVIIGGib8gYNdmLbd8VzHCBn1EiRfIR9yWOC9
	jtAZ/hqLcuHVmYhs0JG0KtrGf5EBb9hhA8pBmrV3jElWKAPn5O8UFfkwGZbuN2eqHwed
	NmcG1PotzUfcLNMDcUywt1SGjvFThtOiCvgrYOSzZnoT5h0NR3UxCbYg5SyoFXMbEzD/
	WpJCaFjrm4bUbBX8kcRgSF3Oyzev5r7gc0sSwWrHZgId60vcihjbdHEfyO61bxiRV/Nq
	1ONvLOomYvGOSKAKQDT4qm68xWmOXmYnO34F53/4SmLSF0pE5nSYmcuQ7z9mFuwwE/AQ
	V7LQ==
X-Gm-Message-State: AJcUukc+WGfieL7n8Ae9Jv9Pev2vw+pGU6QhdmArHmwR0a8atJlGo5hq
	ulff5b5gypCoQlV7OnCBdF5aqb4nQ2s=
X-Google-Smtp-Source: ALg8bN4RE0ZErAcMRkWBjTmFOPyn//s6CWPqorpqMWomZY14TSmwsYRVT4+v/tjzy1H5X0jjls30fg==
X-Received: by 2002:a62:59c9:: with SMTP id k70mr26996245pfj.243.1548783975219;
	Tue, 29 Jan 2019 09:46:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	l22sm60718017pfj.179.2019.01.29.09.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 09:46:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 09:46:04 -0800
Message-Id: <20190129174604.41978-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-twisted: Remove ${PN}-src
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 17:46:14 -0000
Content-Transfer-Encoding: 8bit

This fixes the QA errors about double defining this in PACKAGES
it seems to be removed in py3 version of recipe too so we just do it in
inc file so both recipes can use it

Fix a typo in specifying rdep

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc        | 4 ++--
 meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 01616b168b..456adf4c39 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -35,7 +35,6 @@ PACKAGES += "\
 "
 
 PACKAGES =+ "\
-    ${PN}-src \
     ${PN}-bin \
 "
 
@@ -242,9 +241,10 @@ FILES_${PN}-doc += " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
 "
 
-RDEPENDS_{PN}-src = "${PN}"
+RDEPENDS_${PN}-src = "${PN}"
 FILES_${PN}-src = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
 "
+
diff --git a/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb b/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
index 6bd8c52eb0..dfb9d4a4cc 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_18.4.0.bb
@@ -1,8 +1,6 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-PACKAGES_remove = "${PN}-src"
-
 FILES_${PN}-core_append += " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
-- 
2.20.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3454DC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 04:33:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6483.1753245221268780630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 21:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E7C3bkNN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-749068b9b63so4142227b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 21:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753245220; x=1753850020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfDLwWzuGqB8XtWOoqwIys9gdv9P4QlmO6MXO6ARg8Q=;
        b=E7C3bkNNqpdcJC+urz3/NhLhWHOk3aXivhiAtHabHPaqgfxKXZPnKB7jGdQFgEK7OE
         PDaQorTgnp+iL2bS2ujH5ghNkwJoceD2JFI3iFRIP0rlv8lujTeE9jUcXAXaEUtoDwtw
         OqfQf2qr7Pi8t84vU6kd0AvivEuJCHGa2E82U+9EmP86W/xyGWBsMHGPlYtktvPY4kiy
         oZiADIAxU+wFo3DiWKHzM6q28jaDxZzntwIgf+bZMfHwKcjPqrawTlHRjhm0b/Z8P4oX
         hpZqKNhyidTmyxo0aC9EAvNNdUV5sJwiEkxia+fFLmf5BIr9cr8uC+xr9rmPp4rq6Ui3
         vGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753245220; x=1753850020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfDLwWzuGqB8XtWOoqwIys9gdv9P4QlmO6MXO6ARg8Q=;
        b=V8P5+3+6w/Y71UtwIpwLbKBhfh57JLv1vtNinTn513m7ZOhw1euki9ThuCkmAMOrJ6
         fipKHc/FiHv1DCn3sIx/ANYXMSZdakr8/sx4eTGwUXITlxJEy+TvnzNh76kMJE0WFAWT
         WVl9BNZA9QIIguIRfS2yF4vsDKCdaX0hiFIK4tJlsqAoUiHVRr0HIvmnNV4Dga65Jnnj
         Fk/B6fdzQcBRAvJ4Hg61Lr4gAiDC//2DiLyMRwF5DJJSW6jK1LnDpNqut6UKH8rKH/nx
         nUz5ioFbbYZnxqQ6KcHy+zjHN+xlEVGurkht05AFCqi1QdIfgPJeMBrRM7JJ1YK5MYqs
         VCiA==
X-Gm-Message-State: AOJu0YyOYVXIHYOhhGJKcKQV5SoKmKiBdKMnIqxXFitqohSbE06F4aYc
	ssGBdaf0tM/bFP5qASCN0wnGfolkylGU7UWTt4OMNY37xYN86BWGV9GW0rptYwEXL2k=
X-Gm-Gg: ASbGncupa/2k33qBasYq1RCYukeI5XU9ShQi2nZQ/3QYt75KWD/7VfqUifXsAjbyxSp
	vKf65WfPSGIeAVD+XhlajxqsC+3lcFtRchBfM47DI8YYDsTvl7X8LNpGOw4pR4Q9GhTMj7Y134e
	SaObH58r5smq+v/PQnRktxf7oin3vXYyH0DSyBLpvWUIeE3gyw15kCGN6y7/CiOuyubmA987szj
	xkl+WIFSTL0YYsLtaWBqrDDzsZJUUp1NPkMSUTLOKZH2ttyUD8HTNxfJQluXXA7oLohJMblSXKv
	hoPaxcZ/YmJ9/48kYtmI009hUEwum01GGeBqmhWfbd1Akaw5qsxbZQUULnzjSJ2MZGBxptpVP17
	lMj6ycw69rZMIoA==
X-Google-Smtp-Source: AGHT+IFoqYE2yazXcY39gXpp1hszgZFvcLK4hFAr8sPFT8UYjCd3UyylahoNw6I3XZBO8iQf7Uxayw==
X-Received: by 2002:a05:6a20:3c8f:b0:238:3f54:78f2 with SMTP id adf61e73a8af0-23d4916e998mr2116477637.44.1753245220262;
        Tue, 22 Jul 2025 21:33:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6af5esm8056974b3a.156.2025.07.22.21.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 21:33:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-pydantic: Upgrade to 2.11.7
Date: Tue, 22 Jul 2025 21:33:35 -0700
Message-ID: <20250723043336.3445593-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723043336.3445593-1-raj.khem@gmail.com>
References: <20250723043336.3445593-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 04:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118711

Fix build with pydantic-core 2.35.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rojects-Bump-pydantic-core-to-2.35.2.patch | 36 +++++++++++++++++++
 ...c_2.11.3.bb => python3-pydantic_2.11.7.bb} |  5 ++-
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.11.3.bb => python3-pydantic_2.11.7.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch b/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch
new file mode 100644
index 0000000000..794ebdbbc7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic/0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch
@@ -0,0 +1,36 @@
+From 6558daf87f8ae156f913c0e76403cbffee40e3cc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Jul 2025 11:46:35 -0700
+Subject: [PATCH] pyprojects: Bump pydantic-core to 2.35.2
+
+This matches with recipe in meta-python
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -48,7 +48,7 @@ dependencies = [
+     'typing-extensions>=4.13.0',
+     'annotated-types>=0.6.0',
+     # Keep this in sync with the version in the `check_pydantic_core_version()` function:
+-    'pydantic-core==2.35.1',
++    'pydantic-core==2.35.2',
+     'typing-inspection>=0.4.0',
+ ]
+ dynamic = ['version', 'readme']
+--- a/pydantic/version.py
++++ b/pydantic/version.py
+@@ -66,7 +66,7 @@ def version_info() -> str:
+ def check_pydantic_core_version() -> bool:
+     """Check that the installed `pydantic-core` dependency is compatible."""
+     # Keep this in sync with the version constraint in the `pyproject.toml` dependencies:
+-    return __pydantic_core_version__ == '2.35.1'
++    return __pydantic_core_version__ == '2.35.2'
+ 
+ 
+ def parse_mypy_version(version: str) -> tuple[int, int, int]:
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
index 47c077853a..250a433726 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.7.bb
@@ -11,11 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "bce81efdeac1cbefd0196b478a32aa2586bd595a"
+SRCREV = "702aaa6354cc30ae815676c57a8bbb4557ccb295"
 PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
-
-
+SRC_URI += "file://0001-pyprojects-Bump-pydantic-core-to-2.35.2.patch"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."


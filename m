Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4139E9B250
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18695.1771933476805743696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FrdnZ+DF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4807068eacbso42386415e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933475; x=1772538275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KnrLER+p9FsMMpK7P/NoSA/emSgyHUmWq5eVgo5BHeU=;
        b=FrdnZ+DFQbkcSKmEPEaJGMKj8E68mUPE3TMLSM54G1gY+k91xBBWwBhJ5G2HQU1RKj
         wL9eDyLkDP1HMtfFJFSbL059sWAlYJRpv6V38O+JBt3Z3y9begSEt0L1KOUyRNbr+wZJ
         J3g3N2dJ5iK7/UfvreQ88vV+Nkos9pBX5hXcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933475; x=1772538275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnrLER+p9FsMMpK7P/NoSA/emSgyHUmWq5eVgo5BHeU=;
        b=Kfd32lL6dYk7qu13nkJa0z2Asn+4m0htOYjdJY5DAMs5yAt1lAumG86vpvVfef8EGn
         iNjmG9+7v/R3P0U3wHJOtXxXLzYNDGJbHRYNcHqtaJsvCK2xleKEh3I0LrOmBHlLUQfN
         VjnZPMFZo62gGo96pCEBR8YD2tXyGo6luC8MhucdEjCK9FD30vGfC3zd1grSFUPa9gMH
         Nz4aAApy0NHQALUIQGEQC1nU8C5ghKeRl0S6igL5Pcra+zT51OuqmcK0IWgP8KLfdC9q
         yKjzKO+Q9O/dCSnce02uCXNbNLDLUgEumzq6arSWbgMs4jTWd6zV3nuVg8cnep2VTdg0
         ei+Q==
X-Gm-Message-State: AOJu0Yzag3mBq2a6NLnG3e0Xptl6XEcS1/n945vulXGetqPyuV9ceXPG
	hiXypcGTLmCPFrURJWVsugd4SFscEbzJ09JrqY41SpT+1yyi4Lkgo03dNTcgZcpDk/v+69DEWdH
	l+Cg1
X-Gm-Gg: AZuq6aK9pyC0q9oKw41d+XT8BcBQNIq+IK2Lj7zF/9PyQEFx5kUtc29MxgQZH/qY4RC
	0L4B0LxgSAcQZ7yXqP14uEMTPcmUAeuPz8KPAD22fNzeWODfWMVhiT3koZSXoRta4AhYv7AJ7NC
	cowV2jFV3UQutsh/FE4YravhZ3Pw8SxKwkDv2AoIZwgXJI5Snk1h3KE2BdjjenRftv5uWNHOFhL
	DH5hUJ9Oca5Ch/kmfg5zT20YMsWWXN2z1cSYkcMYkjK6cJ27+AkExnYUmFvCMlboI6QiK6obnhf
	1W1WcTpIdKGg1gDLnPe/RlN5B1qEDIRXs9MNv98k1a82uVn6FGYFHpqSsMXVlRSQB2Ytk5nhGE+
	6/SH8UK8BXv0kNTGPRWZAPbVc4J8XcG0+1k5n781F44sm3oa7XCPm7PKxF6QJ+GwgQPCQBKCpHA
	n12j5vCzJw2HEqWVVm5nlByqyweuBsITcojech
X-Received: by 2002:a05:600c:3b18:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-483a95e6b80mr176806415e9.26.1771933474533;
        Tue, 24 Feb 2026 03:44:34 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/8] python3-flask-mail: Upgrade 0.9.1 -> 0.10.0
Date: Tue, 24 Feb 2026 13:43:41 +0200
Message-ID: <20260224114407.1760757-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124574

Upgrade to release 0.10.0:

- Drop support for Python < 3.8.
- Use pyproject.toml for packaging metadata.
- Use flit_core as build backend.
- Apply code formatting and linting tools.
- Add static type annotations.
- Deprecate the __version__ attribute. Use feature detection or
  importlib.metadata.version("flask-mail") instead.
- Indicate that the deprecated is_bad_headers will be removed in
  the next version.
- Fix the email_dispatched signal to pass the current app as the
  sender and message as an argument, rather than the other way around.
- Attachment.data may not be None.
- Attachment.content_type will be detected based on filename and
  data and will not be None.

License-Update: Use LICENSE.txt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-flask-mail_0.9.1.bb => python3-flask-mail_0.10.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-mail_0.9.1.bb => python3-flask-mail_0.10.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
index c5b839eb72..5d3f60cff0 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
@@ -2,14 +2,14 @@ SUMMARY = "Flask extension for sending email"
 DESCRIPTION = "A Flask extension for sending email"
 HOMEPAGE = " https://github.com/rduplain/flask-email"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=201f2b80112efa61b78515bd54e9f138"
 
-SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
+SRC_URI[sha256sum] = "44083e7b02bbcce792209c06252f8569dd5a325a7aaa76afe7330422bd97881d"
 
-PYPI_PACKAGE = "Flask-Mail"
+PYPI_PACKAGE = "flask_mail"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-blinker \
-- 
2.47.3



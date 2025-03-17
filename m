Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A6C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 23:43:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.5652.1742255006085855310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 16:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHaiW5h7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225a28a511eso83283065ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 16:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742255005; x=1742859805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tpaF7qXz9gwqYiBAuYKRYJRTC25GyDfIspTk8yZ+5I=;
        b=HHaiW5h77BfHvigZ+UoICQDcv4Z7SJP+iDzww6f+PnJUFkhHqFUUKZmjbVn3k3Z5Hq
         djuiJaF9WirXgPD1lvY6mbsCwJTOLh1NBx1wBuSM87tX3xC8qgoPUAhA2KA1szFyeVqA
         iEodZiKJuoO76sZHZ4y4/BcLf6ErH1J/RdfTlrrsfg10nHH7bRe1mdhrHUI13m+mJMXn
         1nUOcozjPzzcVCGlDQGdQFq8ZSSDsIwhjOSFQZtTNO/vnr9sszqEW8apTR3fFF+JbXYg
         s1DVknttvZWMzh0vdSDxvftWWNLlNR5pG2oG3LgJx6ZTiWjaMvVJhMKeB/WL8t8ChIG7
         4zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742255005; x=1742859805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tpaF7qXz9gwqYiBAuYKRYJRTC25GyDfIspTk8yZ+5I=;
        b=SZf3xn5yMDtgGOf0hYGC4bTAGXvyGxMByjcrwbCyhMH8Gg+JL+u/t4eNFniNeF4ZxL
         SWDgpmrm1m9BJ7JFZgm/1M+RcaEiX94yduy/QVMOMem/NZXyiHAa1D5VBEjacRuvOAJa
         +X2v2HYZyBgikFJWd93ENrzYlNC0YAv5eo923cQjrA3WPMfXapeHbCs0muuK8wsrBOy6
         xumh1jbyyfXtRKtsoWvKJ6ypcOVQJ82WBIBAj9bo/BH5rEIsvmfeNVHl8OCgG0xOF7O3
         8yOlmTzA+PSKaLcL5isqttnveC5ORwq5pSfx87HD3F4xy9hvW8d1+Csmv+K9ECWU24Uy
         l4rg==
X-Gm-Message-State: AOJu0Yw2pVgT2V0P4Ipch46Z0ETK0MymynTvTC2yxuv8L+dTk8RqLVDO
	HsGO5tivdT9VLQBJmRG60rfNBXjHnAqbf4eJkQiqHtUbV1Dsv7dycdCEhA4L
X-Gm-Gg: ASbGncvi1+iUk9D88IkIpJBH91vX81cP64DlrJawZKUNNN7cYQEo6B33dc8FhIEOKGS
	g1EuADYVQUjfAyvotS7FQ+tKRUBSyMMdYPAg0ga9dbOudHNnY9ZI+YNiK105AkC1U0nVCkRiJ6N
	eARrHgUx6QFXem72Xdav26aOKBW9qXLnuGyU/HG7LHgMYRiaXtetcYNQh8HFnCZW0IaEraLGLQK
	muX+FGWm7/sbFFr8HCd2PGAETG4gGUTSOocvjfUAeOoK0IEno70WrzxgSy9IPu8wPW2Evv2s1MB
	5WmMtzDl8JGJWeqblCxe0o19HoqrqTPBvjX54TuvQHwFvNM=
X-Google-Smtp-Source: AGHT+IEEKNYwcTlPudw/zX5YtGNkN5nIcfBAiWBodk6CAzBDNyvhOzHIBadjODYPvWdfi2MqgIps9g==
X-Received: by 2002:a17:902:f602:b0:224:e33:889b with SMTP id d9443c01a7336-225e0a3a5cbmr216572885ad.12.1742255005110;
        Mon, 17 Mar 2025 16:43:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4df4sm81136035ad.240.2025.03.17.16.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 16:43:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Lukas=20Wei=C3=9F?= <lukas.weiss@janitza.de>
Subject: [meta-oe][PATCH] cppzmq: Use ALLOW_EMPTY
Date: Mon, 17 Mar 2025 16:43:22 -0700
Message-ID: <20250317234322.2040029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 23:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116036

while ALLOW_EMPTY is frowned upon, this seems to be fitting to
solve the issue at hand here. When adding cppzmq to target SDK

This does not work resulting in

ERROR: Nothing RPROVIDES 'cppzmq' (but calc-server_latest.bb RDEPENDS on or otherwise requires it)

Adding cppzmq-dev dependency works for Target-SDK, but not for Target-Build:

ERROR: calc-server-latest-r0 do_package_qa: QA Issue: calc-server rdepends on cppzmq-dev [dev-deps]

Suggested-by: Lukas Weiß <lukas.weiss@janitza.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
index dcea339dfd..135121c5ba 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
@@ -14,7 +14,4 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
 
-PACKAGES = "${PN}-dev"
-
-RDEPENDS:${PN}-dev = "zeromq-dev zeromq-staticdev"
-DEV_PKG_DEPENDENCY = ""
+ALLOW_EMPTY:${PN} = "1"


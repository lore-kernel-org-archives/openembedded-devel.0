Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36461E91285
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15340.1770274799790235256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gapvhgmM;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso4330155e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 22:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274798; x=1770879598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evI2UGvh1ccG/fVi3PsyY7/5wJorfyGtl9dTvBhQefI=;
        b=gapvhgmMghQ3RLXK9IpfnHh/YU+qcsgd7M+7Hb6dZfBj25ph2/Jym1dnzetv3AwL2A
         FdsvaL0rgwCIw4ykI7+1VALRPzSc48yyrw5xiBTqdTNU++3R9hPyuidkRnwHRg5a3I4V
         IEU173cyxTqjP0hwQ4hDLIR3hK979U2m4F8d5c6qxxMDNKyN2dtkvzf4sABcK09GBSjT
         HA98GsXPGWOqsAuXIKPu2G51UM53Rsvv0FqsceOJ/eg8FadrzkTa2lM2aMXvyHZNGp59
         prcv0NSkciT4EhXVXYUSOfJ8eUHpficGpa/qqSO4zaqYdwcj3iEgBAbhzHChMtSJDJsG
         CD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274798; x=1770879598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evI2UGvh1ccG/fVi3PsyY7/5wJorfyGtl9dTvBhQefI=;
        b=l9pI5GAuzOt0VOBcDs91pu+wcOwplnbVlj5oC+f7igSW+3rCOtdO8AY7wmXRuGwHZ1
         VNZ7GgGOW7LRleC6+I3fTMKeQJEfEiIpHCQQXJtn42aDLVsp2AIKnlX+mIBHV/WVux2D
         L2iWOFdtp4kJW8sXNz2WEGSrz6I+/ccSWwbYP1it/PhnjUgrxcXzvWZR8c35XlcwlNOs
         KWWd4RF4TiymLKjGAxKK1ou7hFKKtBIQ1JUoBYRWlKdTpg209LG8aJzI2SSCSTlR7Tyn
         jw3g+dMc/0rnGvar/N8RdkEjIzt+SMRcweWzai0oFs2aTzkfxr9/pUwASeYpOE21zhHb
         ArcQ==
X-Gm-Message-State: AOJu0YxkQ/6f5hL2HVr+lRtATRkmfu6eFyMXQJaphvBv2oiTsUNs3Y1M
	0IdhgpvlqVpqTICV2QxcemRVfUYwozzWAB34Ig98WeHAmFfWziS32+IHwe6UmA==
X-Gm-Gg: AZuq6aL8Qr7oCCyyPwKWcdcvE3GmLv8t4udxhZFF5uls7L3E29RM0NdlcPuJc5ry7Sy
	jXEbQ2o6UZ7lzGgPuX/pjPBE3q2UWEtHlGz1MrGzE5MwEUtLNEKPhA18C6mpdA8HA8RT3AM2jwq
	VM3/2LFP6eQPRWwFDj1nk3mj+3Xj1+MWa2CmXLMumDvSQoEN8upgakxpsWx0OYB+00/PxoxDGo5
	AqEGHfUfH9ElGfzpM2cucz++8x1OMrx+5Esp5gT6VysdZZoPfzEGhDmOaOaFfS8kV3padkb72mQ
	U7COeJglNVl0xomiZS8sB1cMgV90itPkfYt3r5SFlezA4xsY8UvZHWve+TsMtJ7/H8H/vgiDqfE
	6HiP3bnk+8qz0ARd5c4ckZkmSSB4Xyc4VTLxGk4KWwD/vcteF06MRh8uhk9n8HxAQ5/dknMCdvK
	oedTDWrtvA
X-Received: by 2002:a05:600c:4513:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-4830e987c39mr73468705e9.36.1770274797796;
        Wed, 04 Feb 2026 22:59:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.22.59.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:59:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 03/20] python3-ldap: upgrade 3.4.4 -> 3.4.5
Date: Thu,  5 Feb 2026 07:59:38 +0100
Message-ID: <20260205065955.1267785-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124179

Contains fixes for CVE-2025-61911 and CVE-2025-61912

Changelog:
Security fixes:
- CVE-2025-61911 (GHSA-r7r6-cc7p-4v5m): Enforce str input in
  ldap.filter.escape_filter_chars with escape_mode=1; ensure proper
  escaping.
- CVE-2025-61912 (GHSA-p34h-wq7j-h5v6): Correct NUL escaping in
  ldap.dn.escape_dn_chars to \00 per RFC 4514.

Fixes:
- ReconnectLDAPObject now properly reconnects on UNAVAILABLE, CONNECT_ERROR
  and TIMEOUT exceptions (previously only SERVER_DOWN), fixing reconnection
  issues especially during server restarts
- Fixed syncrepl.py to use named constants instead of raw decimal values
  for result types
- Fixed error handling in SearchNoOpMixIn to prevent a undefined variable error

Tests:
- Added comprehensive reconnection test cases including concurrent operation
  handling and server restart scenarios

Doc:
- Updated installation docs and fixed various documentation typos
- Added ReadTheDocs configuration file

Infrastructure:
- Add testing and document support for Python 3.13

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9eabbca90565e4ae790bedeef9a91df1878c6f93)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} (76%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
similarity index 76%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
index aecffa9d7e..2ec49b58ec 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "https://www.python-ldap.org/"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 
-DEPENDS = "python3 openldap cyrus-sasl"
+DEPENDS = "python3 openldap cyrus-sasl python3-setuptools-scm-native"
 
-PYPI_PACKAGE = "python-ldap"
+PYPI_PACKAGE = "python_ldap"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7edb0accec4e037797705f3a05cbf36a9fde50d08c8f67f2aef99a2628fab828"
+SRC_URI[sha256sum] = "b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d45fcb711f3b270a5f79a"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10E4C79F80
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 11:54:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62427.1767614032304477823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 03:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5v+f+i8;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43246af170aso994658f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 03:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767614031; x=1768218831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o91z1X7u85tC5UPMBVEvHT1MbZxxdJSLSndCsCErY0=;
        b=I5v+f+i8GHLK7Ltfi+s6uBiyfSKXh6GUPwoDardYYvkM0UtTUpKWpdIDxfg1WNkfkT
         Ru5fX2ZBI6r7B/gUY3zuKsQIDAq4URZAWbjtDGMXIjHbLO888WhFg0YrlYWmARMLx7dq
         4XvTl9rC2eufLLFFEpJQeiypMYqTlZIkwiykuaSVtG7CVSNUWXqyAnpdj78jt7ZbHlNw
         erFUOMYTg7Yb/kcsaEQkEXZctSvnLGh75UkiaXz6xENOVWtoLVwLLH8Dk+ibJVbnrJOD
         q5YJVC5pKU6kQhkPCaaz/CfXTnEDDLnXxKbmhGilHEcaxyy99oxlqum/i+QV6IfosgPm
         6Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614031; x=1768218831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1o91z1X7u85tC5UPMBVEvHT1MbZxxdJSLSndCsCErY0=;
        b=RYkAG3LtbLViUV/1ZYIgY5+1dhBqdBp46/LU7c5UAlkaLtOVzaSw8DzWUklEF4QY3T
         lBViGXvb1hQuNJaEJrAfbXwKZ6rIdYWlNXo7NL1Xfq18TgalPM+fH+kTq88Qqm1bvuKI
         JzJyzXpkYLjryLWF5D0AyWcBaGu+9JdRulFg5u9+AXU0qz82HQoCDrPvlBbQH9aOyUXI
         aJNg2xTZcT/lKmz7ICLVCrFwM0/yOIwpg11WVAlycGRnVE2ZwKHszS5f9DFpZZIrrK9d
         xmBRCzy6raf79YW+Ubas+QgBcZiSHYP8JYuAOEvHNVsBPMm568h4Fqf4jfNEqi1mK78r
         8rKg==
X-Gm-Message-State: AOJu0Ywy6tnzOykKlBki0tl51CxzKpPht4Ddh/3b2PGZIeri9NTJpXyo
	a/a20Bx1zG/d5pW5pWyoexqVnv/c3lLLwBrJFGK1SyORMVsu1b4T9JyOqY6G1Q==
X-Gm-Gg: AY/fxX4YmDzM0Iu/hXLC4Dx+XVmjvviJtUpD8jUWuhNr8OQ3Ccj0koOeXiG8SjsjbLC
	4e/BFb3r+iioGZmIgpRIFSuJdLBrcKaPhJ8eWgxFWH9mZAenH12aV5F3O9aHDk4jeifP+hNTrfZ
	HXXbM5t3rOFOk3S4Sue2r29eYPwKl4LjmGecXSAmqjlo5baRtWhF3W9EXtw+Xp0g8nE1jybZdEO
	gzJhytOjP2rktKoww+bhag8Sze/Xt7emllWRWGjl7G5JIAvaOdBhdPPAOxA9OpPRTuCGSeVNIZG
	LvIKbuTHvvQVZs0GVWMjlbIDpd2TZGpoiICCacWoq0N2MTzBORUd6UW23u1N89JgtEb9sJY7tu+
	qr7B6SOdY+M4wERw1bs8eBOqmpKbg7p4uyMM2AWTuOR3x34WXltQcuh29eaQZoDdY/y/V3Mo73G
	8UbnJ9OunX
X-Google-Smtp-Source: AGHT+IEZEGpyE7XAgiqqTx3pjrHW49NkWH4S2Jc8/y4BSdIeeLDd+GKuZmBgQSmqRWayba1FHkZjnQ==
X-Received: by 2002:a5d:58da:0:b0:430:fcbc:dc52 with SMTP id ffacd0b85a97d-432aa409640mr8623580f8f.30.1767614030572;
        Mon, 05 Jan 2026 03:53:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm99300617f8f.40.2026.01.05.03.53.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:53:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/5] python3-ldap: upgrade 3.4.4 -> 3.4.5
Date: Mon,  5 Jan 2026 12:53:46 +0100
Message-ID: <20260105115346.3385811-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105115346.3385811-1-skandigraun@gmail.com>
References: <20260105115346.3385811-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123156

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


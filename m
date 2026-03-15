Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58084F30288
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:44:38 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36647.1773607477890896227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaDyMbL9;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2485294a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773607477; x=1774212277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4WlZE/21wK6+KXA6I5kEFsORCeerDb5DVOfbIGtEqk=;
        b=ZaDyMbL9DXEexOKABl9IOAeKfq6VoUF3CqUwnE6gY3qnDAXdlkJI2ZnoHlyXfn+8Vj
         J+oxmg+qm99qWc41XWEKBIRN9C+BYO5fw/U853VUzn598U3miDA28B97Yyl/VQU2FF/Z
         a4Xv5YrpHKqkzWYDoMWwYtSacjVGGXuwDoCaL/EiAQGp0mAoTybb9CQxxCTclwOt2p+f
         dSNS79RsI13M/qeBnBRjziToAxqyUbpZhzAd9bJakTKvr3LPs/26Sv2DwoEY4WwMyfEZ
         feRkkl8YsbKPPVZx1Nt9pcfPlZ+uWUtp5GIZqlphK0fPAm6yIo51OFQoGxO9wtzPsfr8
         oM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773607477; x=1774212277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4WlZE/21wK6+KXA6I5kEFsORCeerDb5DVOfbIGtEqk=;
        b=ZxMo6KOUmONc8OY4bjyVUlP6L1pRWuF2UcvAGUUPor7wFJertP7TRKtVawg7HwuzZ2
         DlsUy10ZAW1L9zRrhnYIk5M9vxwOebre6fjiwOWBET4rwkQgv9+/zKa1VGG6QDFI0C4+
         jqWYYl+0XbsC4QJ9j15ysS9NlSL8MzUTHIoOFcMFuu5sYRRVNpA5ljdpTUmgBTt2ixh0
         9zqMbX+eIaXrTgdoIboP0Qn3AJfIaGLHM7EyPdsPVQ+wlCwvhLG8b5GcIVEIp5XzGngK
         Znr2PWm2rXu4QLrQnndkH9fSZcdo+hVoyHBeaScflFT/batvXUsrGn5Y3Tj/gAKcCSXO
         RNxQ==
X-Gm-Message-State: AOJu0YxNgMGoU47/AES/WXz+NVqc5znxBOYAQM8u0Y+goVVStyhv1pGK
	nIF9haA37GS81A3FFHXhtrhQVTImyf5ntZea6VilN0WV8z7l1MggLZaB56Kq4w==
X-Gm-Gg: ATEYQzxSs7AKFqZkdMTy73SqQzooO7iwYZFxG3rzye7ndCpNDJsbIpdZdj3kVherTzr
	fNFqSBqbQbPCAgdDUKJ4rwRankmzcGu94MKDQ0h/bFoaTwRlg2/sERkqmp7Evano0UFHJDXh+RF
	hC9Mc3M8WSNW4HBYTnFqftrxlMYYiviSTJ4VQjO/4zijooDHLoMQZbn1J7GC/QJgJr7+lhOAQLL
	GumF6buz+B1u68s4sUSu2m+ln5FmPj1/N67pvXayrRATo+nZhLdadZhokCmF6njjFkD0u8z9dbV
	+mHKTQZ5qHRPBwxxP3Sx5NTCs9OwrEzvDVZ+Vx93OfokZrTFR0MmwPVretS/fvZkNxtkJ39yrha
	7eIjXLn7VdnLjz0hNkuaDEzV9GQuPrDw0jv6eWrgwP7iyek36UaoVLzj3NeOQ3+M1DhN1s9dE0m
	my5nKafUT2EQz16xyM4y8xOoIRHVjrH/snsI8=
X-Received: by 2002:a17:903:2306:b0:2ae:cf29:28b7 with SMTP id d9443c01a7336-2aecf292a9emr94216075ad.15.1773607476941;
        Sun, 15 Mar 2026 13:44:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3ecsm107873255ad.42.2026.03.15.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:44:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 2/3] nginx: upgrade 1.29.5 -> 1.29.6
Date: Mon, 16 Mar 2026 09:44:21 +1300
Message-ID: <20260315204422.29217-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315204422.29217-1-ankur.tyagi85@gmail.com>
References: <20260315204422.29217-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 20:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125248

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Feature: session affinity support; the "sticky" directive in the
"upstream" block of the "http" module; the "server" directive supports
the "route" and "drain" parameters.
* Change: now nginx limits the size and rate of QUIC stateless reset
packets.
* Bugfix: receiving a QUIC packet by a wrong worker process could cause the
connection to terminate.
* Bugfix: "[crit] cache file ... contains invalid header" messages might
appear in logs when sending a cached HTTP/2 response.
* Bugfix: proxying to scgi backends might not work when using chunked
transfer encoding and the "scgi_request_buffering" directive.
* Bugfix: in the ngx_http_mp4_module.
* Bugfix: nginx treated a comma as separator in the "Cookie" request header
line when evaluating "$cookie_..." variables.
* Bugfix: in IMAP command literal argument parsing.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.29.5.bb => nginx_1.29.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.5.bb => nginx_1.29.6.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb
index 4536dc018d..a1e39b6e36 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "6744768a4114880f37b13a0443244e731bcb3130c0a065d7e37d8fd589ade374"
+SRC_URI[sha256sum] = "316f298cd9f061d6d0679696152710285b72f75d88eb1f7e323f40c5c52fe0d7"
 


Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7CDEF99D0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:25:35 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80043.1771010726019198790
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 11:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mj8pdZNA;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7946a1f2430so13110577b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771010725; x=1771615525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IACxc04+FeWfirLERv1x7cm2g1l+Gx/78nqAeQOXuG4=;
        b=mj8pdZNAIeG8yt5j/VWKiRYGj46EXrQVv/KHLUJfKeuUjb7QRS4Qke0WWgvcqeMINJ
         fvEFB7XrwiD+1nK+4Ho8m1AnOLwKneex4NT8XOlneN86jK9MlLiD+qOVc+Lhmyw52WkO
         kAxT4WTHeShr7gsEylR55xFFyNzgTZSRJFY3B55aOtSBl6IvzmDTtiEYi63uTGaiZUZs
         i3L3aq6u2XbMfo4AClySR5+KfCq2FNwSZL+bosqkWKi6Ntc9SDW5dU9pEq3JAkISZG+3
         w7XVSUHflHZEiJoyqfPMksyyVVXoROQP13v2AOLlfOlW7n0/HqJOur231ewNIlhJRtZX
         zFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010725; x=1771615525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IACxc04+FeWfirLERv1x7cm2g1l+Gx/78nqAeQOXuG4=;
        b=pie7noXP48MqZHNnxExn1krm+/5X2Q6FLetwvScBrkTU3tFkeHoXCnV0VK8d8QWE/c
         AUasKErAx7HX8R/yQhTtd3a5s0UmPquvRi+K3PkRPu67Jd3Vx8pRvMbP2KvbMCgRNnlM
         I4Nwm4UWOpxc83Vn7YQ4oFetG7wBiMtFT7PlN+xK2f03lynL2kFU9Zu6etEQu9I9JvYF
         41GnoOBYxqllUQ6Gb0hZb1QSLpbdUOWGQLUl8GtolwkgEjFgfWD5q5eJ7onSn2HGWPko
         0lBuTQ9vGjNNpt2VKuFlznHIRWyc8mj9XDrLdUByKttLFiM2yVvKgZhzBaO6kO86wqxH
         ekEg==
X-Gm-Message-State: AOJu0YyLjpX3ov3TbjAssX9oEWuEWD03UT1hB3alflk6JwIHWijocjLZ
	7O9jt2wNNhteVQk3sspZF8lWS+CiU2I4mlA6KUIpKaGolakjSG95//91g3DsX9g2
X-Gm-Gg: AZuq6aKUpkQ2E3I6Boq8YsZjSJGTje5EZwLo8E0HfCyImM71bkBL0/JPU/aE14HRC2D
	sF1vYRAZl4pgckP+gdv7/G5m1SVzA5f7KqSI5TxySxnQg/TTbTSbxeRIZAbTAJpbr7gz3uDZXzt
	5vuFffh7Gb9cd9PXpn/JYcEPjqimQ+XsT+3cKaR+tKhGqFLg4pUcLBC6EjN5Dn4KOphfDTX8SLE
	IEbOh+3Ja3Uc0TIGVOHYS74yvuUoAczNRNGu1y4nzr2d7Ny5ERQYrFVypIOXhZZCZaC8xqs4/9j
	eB3qzMp0nICpatgHDxvV5UoP7SicSU1TURjnxikVh7vEk7CcKkEgFrM+M4ju49r0KWD8brZkrAk
	o0Fv8dbPGvIlrBmxeSUQjOHSkpObD/I20MTR5DfYo9zuLoY0JLwJcRWaZo5B1Jj8TNBXVs0W7zg
	hNgCdV0oN+C/msYsrY4W3cuWkVfW14JjQnwsIdL9yAT7RxVmuG5wXtdru7GwYDJQ3eLmv7pLqj0
	TWv985EbvmvU51ik3/z593pS8+n/3Ww4tgGHHElraICHBEpu1g=
X-Received: by 2002:a05:690c:10c:b0:794:8f0f:e8c7 with SMTP id 00721157ae682-797ac62ca57mr3613387b3.56.1771010724728;
        Fri, 13 Feb 2026 11:25:24 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18ffc5sm72316037b3.18.2026.02.13.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:25:24 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.2 -> 8.5.3
Date: Fri, 13 Feb 2026 14:25:20 -0500
Message-ID: <20260213192520.160110-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 19:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124396

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.2.bb => php_8.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.2.bb => php_8.5.3.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.2.bb b/meta-oe/recipes-devtools/php/php_8.5.3.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.2.bb
rename to meta-oe/recipes-devtools/php/php_8.5.3.bb
index 4200363fe3..f4d02dbf22 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.2.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.3.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "f7efdeccc3a810b18920692306536b99a3ba86610dbd0795a296cf77d3fb3a06"
+SRC_URI[sha256sum] = "fc5ecabc183ceb64d9fca3dcd387bd29b2b67448326af998fde003124916823b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0



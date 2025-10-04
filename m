Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8A3CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 18:18:58 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.14658.1759601932487296282
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 11:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9Unqst9;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b472842981fso478215566b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759601931; x=1760206731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnjrhhipycmEGbpwhNbxJKVXcln4oTkbP1GDEChCS5A=;
        b=T9Unqst9UcbXXmqGnnxLxwOAL6dssWXndCZqRafFzRaP324UiXI+W5gTY8joqRWS05
         H1RapqScIJMGeHunACwJDoFE9rIA3HJR1bATIJPB7L5gQFlFWUQNthhiyN74F9Em6pcu
         yoHjTOAk+cR74oSrbE98kJtUh0hmKMWvyJ2Rj+hT5ZS5lJwhcoh3yCarvSYgNBnSEx6G
         lEHIXp7WVCPVu7L6lKFk6sr0fsnRxfPbf5REwFy0sgpDVKCcLY1hFiR7wpcCR9HnChkq
         luP8XDjbw9uGpxT7xnK9Zwy1Q53SoXlwBzFd72mmf8Jab5qBnywVvHexCJPlaNNa3/6P
         t6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759601931; x=1760206731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnjrhhipycmEGbpwhNbxJKVXcln4oTkbP1GDEChCS5A=;
        b=QUWpl32dQYnyM+HD8sAVA2dXE6a9hjR5KOY+37vLTFphCorTPKLi9+SoB14j+3RzOL
         aThXtGIJR+S4L/8jJpiFQjgao+pScmyIVsvktQZbIa5jiby4Y7WPPHeuesTpY4gjSsHA
         JrkTnTnHq58qQ5qWi5Q+0DQLwnnPCPxFDWyKFl+YNiM2uSmvuF+w56VPCvSSMMFMGdCr
         tT99KcSsjUS3IfieoLQmRPCYD5W2ENm8lAYTC3lsr8gxHXB1hwRl0AJ/sFBxzHSDcgFM
         5RbL7Po5eJGUCKh1rKSZf3B3lWJguAXZhFYU0gLpmS2K8wc8I3f9WLIMzRPqmcjlK1mX
         IuNQ==
X-Gm-Message-State: AOJu0Yy+amaXqUV/wuOU0MvLubYDO2W8ZuYAAOFIevEUKoN/A8UfVSX/
	WgwUtnXYzWiYGNdZIMnBIZGI3hFqOTnosUwuhYdiTQcknNk9W/slhOBdRz+/Fg==
X-Gm-Gg: ASbGncskCJMWH4luTGBHSaQV193phdh4DajKzJzMWYKVmQ1tEpuS0oFtapjZPbGQyxo
	m/plxzPVtBwTHnoedgy4dLPuqGHm39OkewoW31mjvuzFpZyc4NcU/1mjIAGuew0a8SMt5Nk4DFt
	KZ+ve92KRc1yCWVZQYuD2/emwjxAf7huVD3e0YOdPg+kZMmBlxH7mUZAlS6Cxf1xHcA8431lsq1
	PlSQodHSgVdQ1lvHAwFtTI7hFiblHDUwp1g2j86MvS/0+GgSLs+C9RAM3zzzlDOO7hfn7yJDujW
	keTyhuw2KHkrvh3+4/IgdkpNHseuqc9EBroyhyQtXwWPi70ogJbhzssTBfSTKJNuXmsyW9t1LUt
	1Xc4dUGmSaiOQsxZ7OkqyWeJm7Vnfd81aS0Q/ymZbmiGI
X-Google-Smtp-Source: AGHT+IEseljOYvhD8MtIArsxSDjZSc2idjroLuQl6HmzTUPw/cc4sS5zSJEXCPd2TOZpEhDbbDtVeA==
X-Received: by 2002:a17:906:6a0c:b0:b0f:135f:62e3 with SMTP id a640c23a62f3a-b49c1973314mr887451466b.15.1759601930527;
        Sat, 04 Oct 2025 11:18:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a177c9csm741528866b.89.2025.10.04.11.18.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 11:18:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][scarthgap][PATCH] apache2: ignore irrelevant CVEs
Date: Sat,  4 Oct 2025 20:18:49 +0200
Message-ID: <20251004181849.2737787-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 18:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120233

Ignore a number of CVEs for this recipe (because they are for another software,
outdated version, or because they affect only non-Linux platforms). This commit
is a backport of a number of commits from the master branch (which uses the same
version of the recipe):

0e7733f1b8f51949ec91d82267d5d864ac0be16a
1b86a60f6283b08acadc50914075d93dd362700b
59d3949e3ed673bd049aadfd2238213b550f1461
1b86a60f6283b08acadc50914075d93dd362700b
da2b5e8b93c248363581b1bd4ff67ff1d8357c41
0e7733f1b8f51949ec91d82267d5d864ac0be16a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/apache2/apache2_2.4.65.bb          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index 34526fc78e..dcba815831 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -37,6 +37,18 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
+CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
+CVE_STATUS[CVE-1999-1237] = "cpe-incorrect: This is vulnerability of Apache AuthenSmb module, fixed in 0.9"
+CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
+CVE_STATUS[CVE-2007-0086] = "disputed: this CVE is officially disputed by Redhat"
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
+CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A52ACAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 18:05:58 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.14443.1759601155532383479
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 11:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ReIFu4k1;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso6581674a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759601154; x=1760205954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYW/a3xTVUe95wYfTIgi70ILxGa6nN4JuUUQuSfByko=;
        b=ReIFu4k1lQAdP5feieu2JAQHzAOSrEyM/Nd09U56hjpksHk1/b981aTPvmI+fmuvxS
         go543byDG9jdVTbdfTN75XKKWPojEcJ6GGxEe5p0yw1CxJGrJqKdvkzMGmrbU5E07QJW
         H7TIJWtYP9x55dFRwmzEyYdHNiXesc/AuB8zugeHh5U42VO4k1gG+q/xCtEQ1nkNCrb5
         bytgAKSs144z6Y/VGazFhdBAR0921R6uNarGy9EDPhyUlPGFol00Y4zcN/zbhpVz/Iep
         TRPaR8mXf7PlkFNF/D8QJtv2li5tkzDsPIR5JgyWC65PZRm6N8saUuSN6jX4wAXRX6eb
         Nspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759601154; x=1760205954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYW/a3xTVUe95wYfTIgi70ILxGa6nN4JuUUQuSfByko=;
        b=CLvU3sd3W7iw9TjXgfAW99RoD4InC6rKEjMV8SNNluTlcX6gun+frxwCB+56q8cPFA
         v+bkzYfN0ITDyk8v3oC/evRxRkSUpUs9ZaC2A9Kvq4q4587/6vS+UNtg3/hAvenSSDr6
         MmbGPj8U3A7eI3kKN2C0QQ8r999rRmPFB03jEmUgr2vnFgRzaiRBrp40mXr+u6k0IrA9
         80VY5dk6suMGRWDWC/jSpjuO2MPDAKZqAw8YnMMdhyHYVLvChMR0J+tGQ0t6MSiYeXs3
         2fFJAO+6blVUH5g5Hfaa6msAdacHnnTfdEZyb495XJWVb583QC/Ok0vR6kid6DlVXNa1
         djQw==
X-Gm-Message-State: AOJu0YxXtR7Vd5rmpUQJDBRiPlg5dAO/N9kfTBdVNRPR/662qnl8InbK
	mNDy/99yXVX3wfzuKCYbb+NaI8yV2VcImZ1ETu7LgYgbMCmGJD9dteW4NqIXTw==
X-Gm-Gg: ASbGncvev3AcJC+nn53Qp1gejC5+JBVnEGSXrGdKmPJOhGRgpz6rD/m5071fhOp0+Xr
	oXpqAamT/2prABfYK2L8ebTuGd9HKFEa/6wotYQ6BHHV3ojKK60nA8w0rEtPwJXI2Ox3pvAo+ep
	3P9EHut0EWAp/0HrUFA29f3QrUW0ug8o0zNZdovRGwB5A9xUyQvs56YsxyISWKOFJAZcAOxAnFO
	97Ncw6/y5DoUIIoZaEaYp7nb7dhtwsYlS1DSiGN96ZUkMi6g7/4wXSrNDJ62Hn3obnKmyGNfso6
	vcCVsNMpARzdt/bsPlzE+Qcr36EpiWYGczLAXcBraMXMCgBldFebNFpJklCoqBMg+jDyBg05PJs
	g/M0g4vxOKlXrycmSdhq//WGgXgRZwgDwzlEvLWYXsOjSXf0oS+3hWxw=
X-Google-Smtp-Source: AGHT+IGHN+917v8sGFUmOvBgjJXc6XoI5TC2Lr/ThkZY6u1/tSgm7aZEm4jOjlXynH/unqiO/MvQwA==
X-Received: by 2002:a05:6402:2354:b0:637:e253:45d0 with SMTP id 4fb4d7f45d1cf-639348feafcmr6904092a12.11.1759601153671;
        Sat, 04 Oct 2025 11:05:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111e1dsm6440796a12.40.2025.10.04.11.05.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 11:05:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH v2] apache2: ignore irrelevant CVEs
Date: Sat,  4 Oct 2025 20:05:51 +0200
Message-ID: <20251004180551.2507944-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 18:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120232

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
 .../recipes-httpd/apache2/apache2_2.4.65.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index c05304f96a..e6a40e0239 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -37,6 +37,25 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
+# not-applicable-platform: The current version is not affected. It only applies for Windows
+CVE_CHECK_IGNORE += "CVE-1999-0289 CVE-2010-0425"
+# not-applicable-platform: this CVE is for Debian packaging configuration
+CVE_CHECK_IGNORE += "CVE-1999-0678"
+# cpe-incorrect: This is vulnerability of Apache AuthenSmb module, fixed in 0.9
+CVE_CHECK_IGNORE += "CVE-1999-1237"
+# not-applicable-platform: this CVE is for MAC OS X specific problem
+CVE_CHECK_IGNORE += "CVE-1999-1412"
+# disputed: this CVE is officially disputed by Redhat
+CVE_CHECK_IGNORE += "CVE-2007-0086"
+# not-applicable-platform: The current version is not affected. It only applies for Windows.
+CVE_CHECK_IGNORE += "CVE-2007-0450"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)
+CVE_CHECK_IGNORE += "CVE-2007-6421 CVE-2007-6422"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev
+CVE_CHECK_IGNORE += "CVE-2007-6423"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)
+CVE_CHECK_IGNORE += "CVE-2008-2168"
+
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"


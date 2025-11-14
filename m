Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB84CCEACC6
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6777.1763149526740977887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 11:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=npyUN7MB;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c965df5so1566521f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 11:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149525; x=1763754325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7b+1sMnmcayadSnPw+iP0RhJocdRMqFiAY/ZZLoIw4=;
        b=npyUN7MBbzmRjzyUnkfMyxKv/ktMT27/ipKgchJfeqBZWXmym5WML2Fuo8xC8+xRSz
         dXQX6HGCaeoet5rCIhmVzUXpun5383CbQiHyM9NIx8IwKSRUQuy1CFtm7BlJyxqcxBwx
         XJSIKzDN9gDhcv1myL+ZcfTZP9Tt7O8gFvJREWPQNIRwY65hohHgXRqKdyTdtxC1EysU
         dL9+1vnj2eHtRRp6OPpK5jj3S7evrziVTZQfVF3gtcMiC9iU/68wcpa++vA39wqN37ua
         pKqiIfOqH/0V7+iDS2GP7J4Zp1UXZ55Nf5TiwmwRmZT0LPyebn9FP9CMegkRa9XCfjhG
         Scbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149525; x=1763754325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7b+1sMnmcayadSnPw+iP0RhJocdRMqFiAY/ZZLoIw4=;
        b=sKvGN4/wJvV7pKz8xa6wRYRlsKtCIeh/evS+Itamj/AU/cXj0Zm5XN8h6IiSGbjlWj
         /oX31poLX9qLsq2qRDl6Yg6Itq3FWHa9gorZjxp/tzPBQ0UfwOCah6+JzPRe7oQtOziS
         KyVXsm49xpy3r6vx7ofHK/Y5VINC0kx5myyAHOkXOET4PsuTDDOn7K7VcBTesdRepxPQ
         OmRa/IFnSIQNAlimWNCsUz2MWhjNCpQwn9w/9i1JQVov+eYBzHpaGMtRbW2n18R5X69k
         1yyJus6rD8/QdTuMO2nUGINr0jcInA0DicILrVh+zBFiynMiEGo89c1WSmTK30e5/tf/
         vQBg==
X-Gm-Message-State: AOJu0YytVQkNNNbcy4bIuYCvQRRazaYaPT0focNa+EfdC+PFu6lk9sOo
	YlSmXf2m97kP1rTVDitleuL4n9toCdi7IGNi8AOqvDocGmPdjJMXaHuuBPrhg70I
X-Gm-Gg: ASbGnculSmJtYqge1EWiQBfG21EcijL8RSiN2mJd2+DZvZMdUkQcf3SrQ74PoNSHu47
	gPWWE0XCEwUwW4l5D3AYssE775CyEhqEa1tWura53G/oixHB3fRVilacMCoyvsag5bfwcQ9c3wl
	unulAEddjEJbFsix1V6TAscFGq4bkCQxXNieCN+H+VSk/S3qoL6t5W9oBJxNztuvxcx6gQ+Xra+
	lmhwvUDuOLv8FEHSoYe7hO5yQI/+pP7EkxsVKjH3fgJN9lGqGaC+wZfrsbElMFwNHJVQhx3cI55
	Fk5+Gc7jIx4AkTI+Zo6rz6io9r4fX9tBlbvzFMy33xgBwlj7zPSHClWaN4I4WoUm9xRwjVro/ou
	gtPIRrRzpPLbQjr6FecZOXcjksbLgKVh45N0VmT2mPUuE118QpLwPwenE7kVIqml+XLCAiA3JA+
	oXMmtKzhNcg8hCdTRaXwU=
X-Google-Smtp-Source: AGHT+IGOqIfk95FyI2bk0ghlzFjM0cx5HTmGAGmfxBaobWkVjie27eITSMaTBHI5ar+iJ0tRbt9X6w==
X-Received: by 2002:a05:6000:1447:b0:429:cbdc:871 with SMTP id ffacd0b85a97d-42b593503demr4141259f8f.20.1763149524903;
        Fri, 14 Nov 2025 11:45:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm11561514f8f.35.2025.11.14.11.45.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:45:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] uw-imap: patch CVE-2018-19518
Date: Fri, 14 Nov 2025 20:45:19 +0100
Message-ID: <20251114194522.643069-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114194522.643069-1-skandigraun@gmail.com>
References: <20251114194522.643069-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121712

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian from
https://salsa.debian.org/lts-team/packages/uw-imap/-/commit/873b07f46ce40f43bca10ec85fe63a7a0b934294

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f7c1e6bd101494c6cc5dad16a7fa65a13cbac70)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../uw-imap/uw-imap/CVE-2018-19518.patch      | 24 +++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
new file mode 100644
index 0000000000..d942a752b3
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
@@ -0,0 +1,24 @@
+uw-imap (8:2007f~dfsg-6) unstable; urgency=medium
+
+  * [CVE-2018-19518] 2013_disable_rsh.patch (new): Disable access to IMAP
+    mailboxes through running imapd over rsh, and therefore ssh (Closes:
+    #914632). Code using the library can enable it with tcp_parameters()
+    after making sure that the IMAP server name is sanitized.
+
+ -- Magnus Holmgren <holmgren@debian.org>  Tue, 26 Feb 2019 23:35:43 +0100
+
+CVE: CVE-2018-19518
+Upstream-Status: Inactive-Upstream [lastrelease: 2007]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/osdep/unix/Makefile
++++ b/src/osdep/unix/Makefile
+@@ -988,7 +988,7 @@ onceenv:
+ 	 -DMD5ENABLE=\"$(MD5PWD)\" -DMAILSPOOL=\"$(MAILSPOOL)\" \
+ 	 -DANONYMOUSHOME=\"$(MAILSPOOL)/anonymous\" \
+ 	 -DACTIVEFILE=\"$(ACTIVEFILE)\" -DNEWSSPOOL=\"$(NEWSSPOOL)\" \
+-	 -DRSHPATH=\"$(RSHPATH)\" -DLOCKPGM=\"$(LOCKPGM)\" \
++	 -DLOCKPGM=\"$(LOCKPGM)\" \
+ 	 -DLOCKPGM1=\"$(LOCKPGM1)\" -DLOCKPGM2=\"$(LOCKPGM2)\" \
+ 	 -DLOCKPGM3=\"$(LOCKPGM3)\" > OSCFLAGS
+ 	echo $(BASELDFLAGS) $(EXTRALDFLAGS) > LDFLAGS
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index df90b629a9..de614716cf 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://imap-2007e-shared.patch \
            file://imap-2007f-format-security.patch \
            file://0001-Support-OpenSSL-1.1.patch \
+           file://CVE-2018-19518.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"


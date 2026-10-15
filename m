Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21708CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33240.1792043013773646589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H2oKytvg;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e7006bbf77so10873055ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043013; x=1792647813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/nydFnaJBfC4ToqKC57bH38g8KweER4BCyTyRvk3NE=;
        b=H2oKytvg92CYEjE5pvlTTwWMSLKnMuiVEDpZ5xNS4VG1iMs9UI0NYWZ2vjhoMba50R
         7SpqfnV85ayReLUn1HHnfLWaU3dta77MFR6PWfer98f9DLfixQesB2BqHgCgs+JVjVmp
         il3U6XXoZJ9qB6dq95f/Mv+ei0wyEZ82vQYDzWFFu0NASjAU5COk1L+oCCPWClo7KlB3
         zvSdPVqJVh7mG0qzQcENman5wQvtEZGGTiDZOfPz8ZEnM38ueKSMGCuWNaXWX5jqiC6d
         +wd++ktScin0kij0bbB96NV4hc9FTZY/3SxVjhnlmg9CZ+JNzqe024UMFkdsj3KOc29H
         W1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043013; x=1792647813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m/nydFnaJBfC4ToqKC57bH38g8KweER4BCyTyRvk3NE=;
        b=Gyk1Ip/eNYXA4QXRNOAxS55PEAcJm908aFJTsCJ6XRmMp6B7G4XtaXJqt5erY6RDjq
         Hp9PXiz8gXyXWbC4nM5idDLhh2NcKV3zlmoUhzHE3oNHgJ+dzzrs9mmOnS/IbIdwyuTp
         XSJBVvYrxSGfk/dqwoDfq2Galg4gG8pjuSIE+G+VUJzgLFK44izFUXCCdbEvTdyaJdzw
         Xo4jzUQO4lH5Gkuq2gg+3kDqFk1VFugkPxABsMpjDLNmoUj21KkAfsDcxXHS1CQ03gQq
         k3BpcB6kBLCStG+PReVO+jbK+9DZHY1V19cuJegbC+XWoqCSJXE6w+/LQZSw+9taQDqD
         aLGQ==
X-Gm-Message-State: AFq9FYLDYMTscjPu9ak0SHfyCf72p8rnZRJ1ApMQqbrO/QYnfdp2T3iN
	sJRH1Z7woY5IWY13OwUZwYS1XGEOzTC16WW1J++Xj/qcea1LVNllRX5xZ00E1w==
X-Gm-Gg: AYBFou1uc2FywTENQeJ8RcJlcE7Fci2BuqDdnuaRU06eEyqWHBei1V5OvwGVIv6097h
	ce6SEuoOR+R62QJu84deklroji7gu7BxF8nAp0NfGCH5rk1zrOzcEIjLOk/EhlFEiSsNt0uJP8z
	xhn78G9TGvtuy0YloYbQa1nFBJjj0ryvCCH2J3WGRah7LUg6b5PjotPRF5NeR/lztuga3VpgQhA
	9yAZ+Ek7fQV+J0xPl0ee2WruG9ZxIM6RMknqeaOYJuIC6YqIUYktr0P6A9MA5ic604OgX1OYcMI
	PU7ib6Omk6fa6AM0M2DL6fZpA65rf2K5XFzB1LFFvtoQVcE09s0vjSc4OxeK6V5fjLfgltCnQQ5
	RN98ibl2/4zABJLaeKI8KZvUNUfbnxiGrC1ZSt0jgP7dTmMk2RdgsFUg8BoTTrgxjelR3r5/1sM
	ej2c0+yWNrhcpKQ6ElGi3H3smbpIZ2/4IS3rGT7k5DE5Fukm28XAdNeryEv33qMHKqmDRgu+SFC
	BYQ1m+UG0fEFm5vzzwV8l0=
X-Received: by 2002:a17:903:1967:b0:2e5:dbbb:6c7f with SMTP id d9443c01a7336-2e8427efabemr156351745ad.1.1792043012966;
        Wed, 14 Oct 2026 22:43:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/82] libde265: patch CVE-2026-49295
Date: Thu, 15 Oct 2026 18:41:09 +1300
Message-ID: <70486f9176375ea28967d4823efb19bd2ac50e0f.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130941

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49295

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit bd09bb41b41ee12aeb181bf04e5f5961b00123ef)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49295.patch    | 41 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
new file mode 100644
index 0000000000..189d330b9a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
@@ -0,0 +1,41 @@
+From 7d5e48dbf9324691ba3ce4cd8ffa089d735b0b70 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 25 May 2026 20:14:07 +0200
+Subject: [PATCH] bound aggregate short-term RPS size (GHSA-g2rg-wj66-w594)
+
+(cherry picked from commit 691f3a3c55b3d32478c4a49895dee061a282652b)
+
+CVE: CVE-2026-49295
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/691f3a3c55b3d32478c4a49895dee061a282652]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/refpic.cc | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/libde265/refpic.cc b/libde265/refpic.cc
+index ea4db4b0..dcd2b214 100644
+--- a/libde265/refpic.cc
++++ b/libde265/refpic.cc
+@@ -322,6 +322,22 @@ bool read_short_term_ref_pic_set(error_queue* errqueue,
+ 
+   out_set->compute_derived_values();
+ 
++  // The unused short-term references are all collected into a single PocStFoll array
++  // of MAX_NUM_REF_PICS entries (see decoder_context::process_reference_picture_set).
++  // While each individual list is bounded above, the predicted-RPS construction can
++  // append the current-picture delta to an already-full source set, pushing the
++  // combined count past MAX_NUM_REF_PICS. Reject such sets to avoid an out-of-bounds
++  // write when filling PocStFoll.
++  if (out_set->NumDeltaPocs > MAX_NUM_REF_PICS) {
++    out_set->NumNegativePics = 0;
++    out_set->NumPositivePics = 0;
++    out_set->NumDeltaPocs = 0;
++    out_set->NumPocTotalCurr_shortterm_only = 0;
++
++    errqueue->add_warning(DE265_WARNING_MAX_NUM_REF_PICS_EXCEEDED, false);
++    return false;
++  }
++
+   return true;
+ }
+ 
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index ca05e9099e..6bed3250fa 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only AND MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-49295.patch \
+"
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 


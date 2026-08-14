Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7D5C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24493.1786747571901139247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lc9SoAJE;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a30a259so591038a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747571; x=1787352371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ius89W9zMAxzGkdgXgU15/JnoGG0kAY5cqYYFjQQjdM=;
        b=lc9SoAJEp0qR9NxZEexOWkiG21tijp31T+Sr2uN1HDmc+d6p7a1p8/ibAI0lgyDm2j
         FytmjppobJml6B2PX6zLQQmsfHRDt2LetHKLTaWhWiETFRlDgqo/BhAoSSKk+CAddHhf
         d8CrMhwGAj8ZsmW3WDj+DxaNvl1Lhx20BkIeFVAcOlR4I/INAPTcoRK8/znlYoBklA/v
         p8ohUIQeFD/nPAA8CLqGksdQ9l7S8M2Mz8sHcT7ia1LEAyFN1G0MzVd+mbpvrIDCVta/
         rv5ZWtM8AyZFOEup2MVcuLfts4u/nmnTAk9cjJiU0SQx1aeBgFFZG9ayr6twdQJX2WE6
         ekbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747571; x=1787352371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ius89W9zMAxzGkdgXgU15/JnoGG0kAY5cqYYFjQQjdM=;
        b=GWE3vTKPA4WayQlbdPf68cypqRbvcp/wPodqf3wZy9ovtxE4xRb8laYaufgG2h8tsX
         CPd1Ycnf/hibX5+cfnYQYYu6ZFPuMCqQrbY8SzRZT4IvN41gfxlj95CL1WshJZwx25X3
         AQ4YRlg9NI2ZfKTa57JXAhcf7ZCOm7OZNl3oEroo1jbUrqEwmIQ3CzMnK5z8W2iZqfZb
         P0YTmkFAd4x7uzUaRJDu8tu7G2xhfzlEvPorD1u+exgi0skEDkBsOxuZj115miIDakMG
         N0Ys1dQJuXjsXHNI2TjU1QyKpsyNl5ldvOGzw7VCeivea8qoVrGGpT7GpcgO6xEGwTfs
         Rv7A==
X-Gm-Message-State: AOJu0Ywzw73P1vz0ohXvIdXjqxJWLmHjC/ckucXHofEadLJGAlBYpWdw
	lINYdZHF4CCbg4kZa+KC2/8WSLknDrMP7cdSLJkVxrgUzoaWEAnv3qJMrE+gJUjz
X-Gm-Gg: AR+sD103Fp9E4dfipCG/c5wOv7rXz62aBs4RRoPR+SnQrSkAIR0xfA6grk8q9lDSTT6
	j3bZ4qwMG+mGggM7EWNkkcB3df/4aFN9rL3KURmBIhrOs4zTxR+fvmcahAVmQpPhdxVHBYm+l8Q
	KiZogvG68gmm0m4FNESGAk1hGEnqvE86FY7/jg+gPSlbjsFrAdt9oaMEd8D5l3nlCQrQHCGMq2/
	KXvWRaxy2TxvCDjzSgwiIoS/qnG60VwfzS+qKsAguHhj3C1q5AGrgAye9IzbRykw3un5MQQjSHq
	K9IjSDoTDXJ/Q33fIFcyazZX53Gj8Uz0qx+FnXNg7LXa510iQtCgp9YdyPVf95MAqEn9HQr5WV7
	fZsaPWZ7gY2oHsueKjutUqgCqalxOPmSnNAuLHlaX19NzFxBbBktE9IwYpoPBKDy6DP0VF51FL0
	N1BlH92VG2XjEdpoe60sMGQwMLiLCsV4tCDLviORfMeh8zDYiY5uG8GXfwkItXQj/wlFFDRxpbJ
	bPo3gK/ti7Dx238MxplaS2trf7CW99SINSS7RItFpkCULBfuL+CnmEiUi0Auykw6fY8qcsKIMJc
	09ngr/HKOZHlcWI59P0L/nTVD2i00T/8v4emTteQsg66xrkwZBki2jaUfWwK+Gi4Bcl9CdYPnlF
	koHXs1JCYF2zZj3YepxA+AXosySXfhOSHGASIROOprsanaA==
X-Received: by 2002:a05:6a21:9981:b0:3c3:a140:9392 with SMTP id adf61e73a8af0-3cc7177a8e5mr8667189637.0.1786747571071;
        Fri, 14 Aug 2026 15:46:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 026/109] gtkmm3: upgrade 3.24.7 -> 3.24.11
Date: Fri, 14 Aug 2026 15:44:12 -0700
Message-ID: <20260814224539.1523174-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129090

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gtk+/{gtkmm3_3.24.7.bb => gtkmm3_3.24.11.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.7.bb => gtkmm3_3.24.11.bb} (63%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
similarity index 63%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
index cc1266dce6..7710ac9a8a 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
@@ -14,7 +14,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c"
+SRC_URI[archive.sha256sum] = "19e383c82d5dd89db275e00b82864e90414d4c3fb3d100b2f996bcc2338a4cc7"
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 


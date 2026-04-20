Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454F7F557F7
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15579.1776677612702440979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VrDXLvbC;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso38595375e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677611; x=1777282411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBmsKEoAuaOLxqeDzv+upI1fxj9mAepjkXxqyIFeza0=;
        b=VrDXLvbCcCUJJftd6T/u5mKsojUs4KwnqaeGMyb+S3uRxLSizKhYHYUFuiP7tvT9JV
         Vspdhcy0ZcbmDpCyckY6PL6ibXJpnULGYf7K+30zMHmNCVrmXbwq/iUQDFV7VrjdGzq7
         KNv1VQ9bRGAvZAYRNwQJyri3i+G6uY/HK6jPJs0Dr89xwFJdMWubWhe75nyYHmcM8vmF
         QE2Ll6IjOkha9Ad97Qdji8GDgRUxkpikg4pjs5wknjiWdvmhc3Kdd7cRQ6NYwVm33Kzf
         M9LKGwZgc9KUJRDpZNlm/XRVeVpUdBRSuJCTgvtY2eVKSayURyftM0ZG0AWofFsauUCh
         h1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677611; x=1777282411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBmsKEoAuaOLxqeDzv+upI1fxj9mAepjkXxqyIFeza0=;
        b=gRJg16a3OUM8o1NfJcU6Danl9kA25OSWcr44d335zjeLfIGZamxKU5kktwx15WM0g1
         e8sEyNk22p+0PZZZGBG5GYdEfqRrw5fsHw/tQL/kqAcbDeIU4KXdnB21zyvxa2adavWg
         x28OOce/y1qQs1rIBgLBgj4PEENfD4AZ2rhuLocPIrkgr5rQa14N/Ia6CcVgFqwoy2Ur
         ywLn2C42PQ3vq77IA3/tAgCETdpEaf6Y5ajQZqEn8ITIIfbyMvZSNRRL3cs/SnXOLP05
         j0u88dxNndpx94j7yjMqZW9Ix+JgMSnmfagP/lukhUgGtHKs4MRWz3WaTlMTSIdQl6fc
         XDlg==
X-Gm-Message-State: AOJu0Yzu/xzIYYywHiQsxbYgtI/uc4LvB+HhAaotf/gvUvaJMFddra2K
	GK1NrBx9sus0OKIK7oHFRvfxemNUFgqrNAHRiD7KYh310CpnL2DQsXO5R2VWEg==
X-Gm-Gg: AeBDietCJAaoe6XtZjZhVLyWqEbG5fvRgetCaxk38ZX1RzHUib6d1KCrl7z5GTCgJU7
	3+RGg80XYwQKkcqfg4J6BMw/Efovvt3zKgk2LdeFhPE8LbsUCoapiwvnY65WxCZBuoKQbsuZQr4
	tPSs4sceWu8Ay2CrgzqS+QKzT2D7DFC9VVmr3I5J/S1EMt8Lowzb4P0GVjCgJo6GjdmnDtgVhzZ
	gztgW+NHB+uln0NPGAzcFLNiC00RN6pVBets/lz6jDJRBAklt/SluozSeebZ9fJoBwstMMvEGnF
	zxHgTOFA6/NZ8xI5M4GhySp9Te+XsxJtf8w4lNeFBewcZwyXghq+E856G/lmuJEfTfn15E7BtYe
	nosb18JmdyHUpe6gqDxexfsOAW13lI4fbayBiFXNoUDGNurr8TagkATaBDwsC48ETrAGTyZ3qAm
	XcXMXcujV6rrcFAJCFvsgOjWE1A5m8TW5BSWA8f2Tnrg==
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr166061835e9.2.1776677610792;
        Mon, 20 Apr 2026 02:33:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 8/8] xrdp: upgrade 0.10.5 -> 0.10.6
Date: Mon, 20 Apr 2026 11:33:23 +0200
Message-ID: <20260420093323.357053-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126494

Mark fixed CVEs explicitly patched,because NVD tracks them without version info.

Changelog:
Security fixes:
CVE-2026-32105
CVE-2026-32107
CVE-2026-32623
CVE-2026-32624
CVE-2026-33145
CVE-2026-33516
CVE-2026-33689
CVE-2026-35512

New features:
Support for xorgxrdp bug fixes

Bug fixes:
Honour pass_shell_as_env setting only if user sets a shell
We no longer try to create a NULL authentication file when using VNC over UDS
Problems with the Brazilian ABNT2 keyboard mapping have been corrected
A 'file exists' error when installing xrdp over an existing installation has been addressed

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/{xrdp_0.10.5.bb => xrdp_0.10.6.bb}           | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.10.5.bb => xrdp_0.10.6.bb} (89%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
similarity index 89%
rename from meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
index 8d7c5807f2..152b37cb37 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.10.5.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            "
-SRC_URI[sha256sum] = "9abc96d164de4b1c40e2f3f537d0593d052a640cf3388978c133715ea69fb123"
+SRC_URI[sha256sum] = "dfc21d5d603b642cf583987b36706b685bf05fd3aaaaacefb8f57c5f4a448677"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
@@ -127,3 +127,12 @@ pkg_postinst:${PN}() {
 		fi
         fi
 }
+
+CVE_STATUS[CVE-2026-32105] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-32107] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-32623] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-32624] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-33145] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-33516] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-33689] = "fixed-version: fixed in 0.10.6"
+CVE_STATUS[CVE-2026-35512] = "fixed-version: fixed in 0.10.6"


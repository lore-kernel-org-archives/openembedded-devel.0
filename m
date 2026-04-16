Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE198F8D772
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:30:46 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22971.1776365905199703695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 11:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=M9GRhyAh;
 spf=pass (domain: baylibre.com, ip: 74.125.82.180, mailfrom: hfranco@baylibre.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so7610007eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776365904; x=1776970704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IF5e5lurc45DRbodDAj1WKSyhqlmjjW8lS3K8E2rByI=;
        b=M9GRhyAhYlqZi0vLtz3KutPnN3G4PcUgYLJ2CtMjqogA62OrBjtwErkQqWVeso9NaX
         PlkC3EObtSVjyBhRlXT2LB/r3085IwzC0A1xSbYoh5wvx/kTTYjZx8ngjH1yRKdDgRUD
         VaL/D8fz8GFL2+y1lAxv0041BLqKdqjlHGQpzpKKZ8+lnSPzQZ6Orx4DyvMlxDQd1wou
         yag9t4ySOQoswq6PgE8yMYtKnLkTrlmKYlxXJja+5mO/tukdGEgBWmxKIokunQ0Yr09n
         73tU9jeJaCbb2D7z0M1e/fg6TBXnLDSpp2ibHxd57WU3GsQfRjFnnWmGhzX2xqaJLFds
         A/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365904; x=1776970704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF5e5lurc45DRbodDAj1WKSyhqlmjjW8lS3K8E2rByI=;
        b=fGQhHn/f701hPyJJaLkjSEvLHqP00+1tjXmzzbIn1eU9SCWsiI9lpW1hApn4QyZafA
         dHaP3KVM1jAoUNhVA6KxAkPLA2ntXzPtpsGNuJ8B2hWwpIZcr+fMb7Ppd3GqEe7EYfR/
         Df41YwJDJv4MXFRQv+UnMpu1oicz1YjiPdnbqhsoPGVsJU7QtCGT6a0igj6cZMvm1bPU
         xbSd68eEOJXgY99+O/EV6KVjcr2ZGRApwEXkitrO+ZaDOmpVHvqYawJGNq+GDNFlof7A
         sbemVt0A8scWR6s1x2zeG4XrIQeghOPYngw4drDfbt5sYL7bUAdp4IN53S8IH0ME9Iep
         8VkQ==
X-Gm-Message-State: AOJu0Yz1YIr29D4yy4i4UIKNXDe5YLy2X331gUI7ycnHTL99pepgYszk
	gtGZOFnOakUWQtxDXFgyGGGvXiQ8M6lJXHPjtkHJiEM5KxNMiUiwSSys1+1UTxJMZxt4F2uLWzZ
	c9oWY45E=
X-Gm-Gg: AeBDiesO57ozyO4gZ7Fj8t3MUidN6G4yCTrUqzCGrx2N5Qvg5KhnxYYHi7LcjWLu3lZ
	SDEkheEt9+pzubhO7vBUj2Kjx40NJkgw3yAB4njB3vZjup2hLoDgchiSfB22OM9xHlZ7LgLB5AT
	KqU0UGO9LzR3Ufu3mnkH4E8PbkrUWrsY7eOqwoUSiI3iW+LW6sr2WEEeB/x3iyd/ZQ32oHj3WcN
	80t6r1jtGvgbkWjAi/9Vfi2oGmrUanOi4EuKCzrMw0zfDWqhtq8LQ3uxMj8rOJ4tQUI8cOM+LPD
	kLJi/Nmd/GeqXbKWsPjrL+51YxoN1N34fzjvI0gJ585PtBkV/ubXh+eo03+go5YEYIZFgOLDPDe
	LB8WYVzbk0eQUsSM3yo0tvhy0rxgTMurkcSOHQESzPKKtrqHNug8wDZgPkJ7A1dmyZXHTvNxUSI
	XNTjC3TsV69XCg5kWsI1+md/gACOSLfqD31D0L700qKbXoeQTNteFrEFOlXmDVEfJws+j8
X-Received: by 2002:a05:7300:a10b:b0:2df:3eb7:531d with SMTP id 5a478bee46e88-2e2e5afa838mr255220eec.19.1776365903831;
        Thu, 16 Apr 2026 11:58:23 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm8654483eec.19.2026.04.16.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:58:23 -0700 (PDT)
From: "Hiago De Franco" <hfranco@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-oe][PATCH] uutils-coreutils: make selinux PACKAGECONFIG dependend on clang-layer
Date: Thu, 16 Apr 2026 15:57:48 -0300
Message-ID: <20260416185748.3908706-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126409

SELinux layer build fails if 'meta-clang' is not present, which
shouldn't happen, since 'meta-clang' isn't a dependency.

If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
'clang-native' even if uutils-coreutils is not being used (this is
enough to make the recipe fails on parsing time if meta-clang is not
present).

Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
warning if the user wants selinux support o uutils-coreutils but haven't
add clang-layer.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
index 8b9b4dc199..99beb70104 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
@@ -18,7 +18,17 @@ require ${BPN}-crates.inc
 PROVIDES = "coreutils"
 RPROVIDES:${PN} = "coreutils"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+# This is required since uutils-coreutils uses selinux features that require clang-layer
+python __anonymous() {
+    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
+        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
+            d.appendVar('PACKAGECONFIG', ' selinux')
+        else:
+            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
+                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
+                "if selinux support on uutils-coreutils is required.")
+}
 PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
 PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
 
-- 
2.51.0



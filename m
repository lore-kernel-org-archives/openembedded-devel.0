Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E40CCCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 17:43:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2469.1760463823848019252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMlO1z/F;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so749435e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760463822; x=1761068622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vClIf7kvvKH6Py+Li0BZtbq9AcNbhjimaS3cv2SJQ0=;
        b=TMlO1z/FMTFoLUYwlIqIqQYVZ1C3EIcBGn89aqyXO583wiwzyfmkfl0B4VfD77Nysn
         jFRDA1gufhRG1V1gKF/lkBSLv9paPHD0j3c/yCachpMN/vWprdqcEcHGUS6cPKEB9kQ3
         uYVt+5udoUdBLZ71Ump2G/nxTBXMEL4cuuVtEe5EieHDGWto9lxglimzf3Q+QHrZ4o8A
         g5LSFSOXDStQiR3kkKtLib8pfDhX3yRC+Ys5OR46N2JVhVMUNr+ZJwOCjZGsv1wFpAra
         cijBqU4I3azRV7gycocP9y9+bGSQyaYbXJqVne4MVHw98Xk7iYD6MWzAvq0ARTCIEjzi
         9ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760463822; x=1761068622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vClIf7kvvKH6Py+Li0BZtbq9AcNbhjimaS3cv2SJQ0=;
        b=HdEdRNDcCWIR3cljWu9jrpo1PF9IRpw1Cu6JUEz/mSmtFB0vDdwSsPxgVF2JmNSqEM
         WC4Af3q8Qk+BlqfljKrYNhyYgOjKlCNS3CfC6wdh6chd0jGgEoRhGyuvq3qFTPVbY3KE
         rLepFE26EbZuBTuqlSFzX+DviHabE/4t1OGbtkzQRtq7rfB06d4yhiOwQy6dMYJo9lyx
         0dOrqEVpv+WISx1w6OjGrFRAPSADPlnK1lRq5MePzoVerjpHjXJ0WkIodzJDNzNfAIQl
         5pWGlZI30volF3Fwo9qEl3hEZ/WjC2RzzQ74B/njKxAb8crsIGXpKzKp5XBYYlAWATrV
         R06A==
X-Gm-Message-State: AOJu0YwF7xml0m+XZSMjVLMiQQKgDJRzlSgohvh8CoY7EvqCBxy24BwB
	mVqeJk+uttQWFE//qiT64IbWoqSxzduUf9/9m6lD+Y0OdgDKdv/A4LFj1f1Oig==
X-Gm-Gg: ASbGncvEvXiecWstXGJVYWzbCCZqbVaOOsskSY4kIJKnnMYZCxAOr4Qehb0ssQaP5YE
	cDc5msPR+Y2WQlWcMym+aVKdeJu/uJE0s80YsaVJcIa4v7SdhHjwXBdwRmez/quhJJ9MANbKExM
	Hn/islEU4IpYjLGPiZa4NsHRAUTVnzMqo7PPUOEXqMcSeyoBkn/JU8NMPDDlYwIQ4ChubWV9UfO
	Z0vYW62TtG6SH7XYjxwNVsELgpwBwaLhf3smEUt4vopgUkq6DKYuHzk3nwQck5WOY5DXoa52Qjb
	cgyM1cqK2ljaoCL/jNy468/ialEgN7pY0Hmx3Q/Nj/VrqREV9Xwq7eWUgtwflea0pDz9f6mKXmT
	Y6Vc7ZNwlbc2fVf/hWWMOO5c9UZPEqaj9u2ZfeyfHjHCTC55SGD4D1MgfeoZTxD8CvaikViDqCl
	OjRvDjmq3IQF29PNzGX6VBw/7bVf2FVDllfNBTui2FPI+iNny2qWVNIyS+nFsnHRqY
X-Google-Smtp-Source: AGHT+IFwof4BZlUz4BGUUmcC13jssrVhLD0tSppmU8p1wQeeddX7Gmeod1PePjuqmesvp/XBqHsGGA==
X-Received: by 2002:a05:600c:4713:b0:46e:5302:7751 with SMTP id 5b1f17b1804b1-46fa9ebe22emr172501305e9.9.1760463821816;
        Tue, 14 Oct 2025 10:43:41 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-426ce5e83e1sm24821591f8f.51.2025.10.14.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:43:41 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCHv2] upower: upgrade 1.90.6 -> 1.90.10
Date: Tue, 14 Oct 2025 13:43:37 -0400
Message-Id: <20251014174337.642569-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 17:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120621

From: Marc Ferland <marc.ferland@sonatest.com>

Update to latest release and add support for zsh completions.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../upower/{upower_1.90.6.bb => upower_1.90.10.bb}            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.90.6.bb => upower_1.90.10.bb} (91%)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/recipes-support/upower/upower_1.90.10.bb
similarity index 91%
rename from meta-oe/recipes-support/upower/upower_1.90.6.bb
rename to meta-oe/recipes-support/upower/upower_1.90.10.bb
index d2f58d5b22..a7effcd7de 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.10.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a0edccdc32964ea0c"
+SRC_URI[sha256sum] = "c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b257b287eea564d3f56"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
@@ -40,11 +40,13 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_dbus}"
 RRECOMMENDS:${PN} += "pm-utils"
+PACKAGES += "${PN}-zsh-completion"
 FILES:${PN} += " \
     ${datadir}/dbus-1/ \
     ${datadir}/polkit-1/ \
     ${base_libdir}/udev/* \
 "
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
 
 do_install:append() {
     # remove integration tests scripts
-- 
2.34.1



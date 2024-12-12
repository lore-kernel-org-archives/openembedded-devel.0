Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7B1E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 19:40:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.47.1734032455067061460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 11:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxV0PTra;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361815b96cso7181095e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 11:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734032453; x=1734637253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj96IO2Lc5C1pEdbruEQOfuchEMWIer5n9PjJEnMrxM=;
        b=fxV0PTraUHm2E9Pbp7UOLGb1p0IxQiLAgNfsmM0q54idH3CqFTr79tKMbo1JanY9AG
         +SDmgDlxgJAh74cwbu2ByXtRHlj3fxJy5Ytc+SFQqkYjIO7dA+jmlHjPdHiISDtYg2Zn
         g+9TS0GYP0ELfPiINUb2/kPzpwisFAlDNRSuLh35Xv2HRkVDKWCN/tpkYymBRR5IQK4h
         WQaIEsM/mnbi85I2tQYsPX+LmlwfaL8GAaYuTxvk1GmAuc52U2aK3/SNLxbfkuzolsnQ
         ThVGHMJ6FZvtWr6/aP5Hsz2c5qclkUxRapmsCFjMpcW8l6BDqgSlUtvbkH+jQjvOTVf1
         GGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032453; x=1734637253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj96IO2Lc5C1pEdbruEQOfuchEMWIer5n9PjJEnMrxM=;
        b=IcD/LDnBfV7Dof5GkjhnKNaKzFs+Go1phtqwdLeyaL0DUZ2qmZgPNRZZzzhZjGEaxn
         f5BAqqjL6gkvYhRQPVdc4ZvY+9VfzHLZeOLxKHfSQlf0cR0D45qTLSKBaMSi3IFRnfi6
         9cLb0OV/7etFhtBGygNWwJVT2wVSumhptl0CC8bSBmeEKZiyFNHvGfibsa/STXDpTWIa
         XNroUYT1thnXZgX32pesgb1PmOzyLolBbgSTakSEKoMLkyngbfZfXqpSTgr9Xd/K7PJC
         fjfeMUrLbb/UKXU/+5ArjNnVq7R5QPTmRKg0y84dblV5Gjd5rAhpIdpNbS+shJRKhT0l
         9aQQ==
X-Gm-Message-State: AOJu0YzffL+QxQTardAKZfLR6h9mF/pd4M15CSVj8nD1AcPUhuEDWw5P
	hzLCpA4FNwZeKXYau5EViNLpCYsUfSXPah2cjAdcxR2fVpIO5GtqwezQAg==
X-Gm-Gg: ASbGncvHcIGQ0cCoGst+CoOq4cwTJQ6i2h0bA3PPyVuUwB3tGlKKQj78da2qikhw6ur
	B+rfl3JoGdoAifOR/urlvAQThsoq6Xc2puKmINGjHhE8jhkQE8VDzRjsyE190wupJUcQOtcfIQt
	ZqxXJcieoIuIzkwmZxA1TMZ7LJWHbXd+xggkmkgXZAEmsbXo5yTc8Xp2KGlyvjFDBv0E4dJnR4z
	3vMbQdOGjuR6anOwE2atNowiFXhxIgXrd+3Xs3NIJGk2tHJxEGInyCNE+v+Hrf5JJ/3iuFPBqcE
	X8IggM9NvyqoMr9YTesviic5YbucXe1hB+foTOkCZMUMZnqy6uqJAMb2qX8Y2BwSHZD6UdzNxZJ
	0x9Aq
X-Google-Smtp-Source: AGHT+IHFCMjhDZ8RMmU1ohVW1OrsmQOIi3Vl1wl3S6GQYQG7EeY/KW8ZYYzn24S38SuF1ETko7n3yw==
X-Received: by 2002:a05:600c:5101:b0:434:a1d3:a331 with SMTP id 5b1f17b1804b1-4361c3e2350mr58140425e9.22.1734032452587;
        Thu, 12 Dec 2024 11:40:52 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4362571765dsm25788735e9.39.2024.12.12.11.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:40:52 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 1/3] upower: use archive file in SRC_URI and fix UPSTREAM_CHECK_URI
Date: Thu, 12 Dec 2024 14:40:44 -0500
Message-Id: <20241212194046.874645-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 19:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114295

From: Marc Ferland <marc.ferland@sonatest.com>

upower releases are available as tar.bz2 archives let's use them
instead off cloning the whole repo.

Also, fix the UPSTREAM_CHECK regex that changed after revision
0.99.13. The format went from:

    UPOWER_0_99_13

to

    v0.99.14

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/upower/upower_0.99.17.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.17.bb b/meta-oe/recipes-support/upower/upower_0.99.17.bb
index 0572cc801..5e2f04f31 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.17.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.17.bb
@@ -11,11 +11,12 @@ DEPENDS = " \
     dbus-glib \
 "
 
-SRC_URI = "git://gitlab.freedesktop.org/upower/upower.git;protocol=https;branch=master"
-SRCREV = "c889154ec8e3e2239db9260d48b2e198d72ba002"
-S = "${WORKDIR}/git"
+SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
+SRC_URI[sha256sum] = "de7177deb2ee23d9c505046c74a856564acab8fd1d39aa1541d123af5a99ca8d"
+S = "${WORKDIR}/${BPN}-v${PV}"
 
-UPSTREAM_CHECK_GITTAGREGEX = "UPOWER_(?P<pver>\d+(\_\d+)+)"
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
-- 
2.34.1



Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F23CD4F4D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17874.1763014784539504274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VEcLPPnK;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9387df58cso405646b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014784; x=1763619584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt51xmMMoVogG5p0kk2pS0mJRrAGU4g2w1WhmF/Y0f8=;
        b=VEcLPPnK0JLYARrIZ3IcdAeknFAo19s9Y6h/1ZqCCEuErMWGCgztM6RTmo5F65AnvM
         nvClDjdsdbnI2Mtsqh5xrjjELFVcr5JTFYtLciOrD/cgJnw7kHK4/xZbE5aqPCAIe7XO
         pjxH+MH1d+HSBV5Mc+El/d2mXNxn1j7KaTOHDmmfVWKWNydNbi4oz6yxDO0Tu6dnpL5v
         1YBGaavFHSg4DwwED+A54Z9FG70h13IhRnWbdVOIc6lSo2ueX5iHK67dhiVTWHHNYTq+
         yMGXLv3l9l/41bNlkRPisAy/L/2kBytO3PVso73Fk6ufkdUirT66+2D3qBMhAfb8YI7/
         cAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014784; x=1763619584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qt51xmMMoVogG5p0kk2pS0mJRrAGU4g2w1WhmF/Y0f8=;
        b=bIwgI0A82CpluotsX7nSAC7POO3IJ3L3JmS/6i/K3rimJ4m6hLC7iVBbBBkeFmkPQb
         P/NNnK9y3HSDZwS/H+zVEjwK7bT2/duTEXnhv60uy88V+215paPpTvOm9Q/hBkKRC9FV
         dBBxwF3Ivr4CpMK8hxuUggUj6K+9iejKLJ6PTTQUdJgUyn6Wjuj86pl7Cb0qOlOgdL20
         HOy1bKOzrulT4AjoqTsKnAoWIR82f79lOLULuOw1hnOK67nS7DvCMfFvXbX2zMRs0Fg/
         qkdkdJwO1JFLbKKQ2eaW9k5Plg4nU9EzEyWdOCCLwd1/Kw4nbOfd/2ynhQenz181SNu0
         Ntbg==
X-Gm-Message-State: AOJu0Yzd89crczqWD+Sdaj2yYxOmibgtXM8Reo9hCrhEpQscudT42vDl
	qojmbDy47kR1r0oy1XXtABntUIukQmri9MHYbt8Au3DlbakJFIVEl0G37q7BSg==
X-Gm-Gg: ASbGncs8tBmbbNAhr3QkJROunB83P6Aad9i00daZVbm4O5gRxOTHZhcl34DeEwxijGE
	APfNnKi5O/rZSmkLv7mRGkNybxPCMX47OjPsKm3Q4GCBH3FsghDjBGTUQgQQi+2P8vfduhBQhj4
	p+koVp9gE5uRieLw8gYi7bCRR6fyiysU0zwERUr593GOE6w1Vv5juE55MNT8hp/cW7IXyC2TIRl
	AbCteFKQceGvdIkLBe6H7HoMHxmXAg7A3PFtJ8yxM4cBWvdb//7CwAGlEWQMWyHdI5ozK0a2nAy
	5bCqFxSQ54ItmIlYHFbYp/7J7dcUqCwWsYuk6QrfTj9hqr/WXzURXG3bO75Hhzb4+Oj/yxfMu+b
	wdB3jgiZcSKRXf0BmxMaTD8scJ9cUIp3i+UI3ExYXasmp8a3i7SxZnd7RmRVvPuMOC3nFhO6eQX
	j4HAFu3Of4UHHfwQ==
X-Google-Smtp-Source: AGHT+IFGJ2JJibDm6idsFV2bmET4yCM9tY3Lk5v1zLtLfgvV5UYyxXkw02D8kjPirzRVKoLAmrAMvA==
X-Received: by 2002:a05:6a00:23cb:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7b7a55b6c30mr5947979b3a.30.1763014783794;
        Wed, 12 Nov 2025 22:19:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 04/38] xdg-desktop-portal: update 1.18.1 -> 1.18.4
Date: Thu, 13 Nov 2025 19:18:39 +1300
Message-ID: <20251113061914.3756301-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121602

From: Markus Volk <f_l_k@t-online.de>

Changes in 1.18.4
=================
Released: 2024-04-18

- Don't allow commandline arrays when the first commandline item starts with
  whitespace or hyphen. (CVE-2024-32462)
- Do not store device access permission if it returned an error.
- Fix crash with config files without a default backend set.

Changes in 1.18.3
=================
Released: 2024-04-04

- Don't try to read D-Bus object properties of Request objects on construction.
- Fix various memory and file descriptor leaks.
- Minuscule optimization to the ScreenCast portal so that it stores restoration
  data with a single D-Bus call, instead of two.
- Fix a crash in the OpenURI file when trying to open a non-existing file.
- Various smaller bug fixes.

Changes in 1.18.2
=================
Released: 2023-11-22

- Pass the token to the OpenURI portal and, when missing, an empty string.
- Fix various memory and file descriptor leaks in the Document portal.
- Make files and folders openend with the Document portal close properly. This
  should fix cases where the Document portal prevented external devices from
  unmounting, due to files inside them not getting closed after applications
  stop using them.
- Implement FUSE getlk and setlk callbacks.This should enable using sqlite3
  through the Document portal.
- Properly resolve fd symlinks before opening them with O_NOFOLLOW.
- Fix cases where the portal id is assumed to match the .desktop file name.
- Allow sending directories in the file transfer portal. This should make it
  possible to, among other things, drag and drop folders and files simultaneously
  from and to sandboxed applications.
- Fallback to a hardcoded check to xdg-desktop-portal-gtk in the absence of any
  other portal or configuration file, as a last resort mechanism.
- Various smaller fixes to the build system.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e57692e9f9f98e1a4938f277237307763d04705)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-desktop-portal_1.18.1.bb => xdg-desktop-portal_1.18.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.18.1.bb => xdg-desktop-portal_1.18.4.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.1.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.1.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
index 0aa8724281..8161ed160d 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.1.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
@@ -27,12 +27,12 @@ RDEPENDS:${PN} = "bubblewrap rtkit ${PORTAL_BACKENDS}"
 inherit meson pkgconfig python3native features_check
 
 SRC_URI = " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.18 \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "37a6f7c8b8e08b9861f05e172cd4e0d07a832c4d"
+SRCREV = "11c8a96b147aeae70e3f770313f93b367d53fedd"
 
 FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
 


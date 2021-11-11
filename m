Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C599CC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 23:46:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8014.1636674416570978565
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 15:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AR3nqXLc;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b12so12498413wrh.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 15:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8II0Yqlgw90iGfnulG1IEmeH3dDU+u0yns/8vCpAIRQ=;
        b=AR3nqXLctYXi7UlyUOLWJexiiWX7wuptn+d4E0I5sgd/eY+/eTuE/gPlQF6DlF2HTF
         ykq1DJNRYyUATkTuaxf8zrr9ZtudCBU2rkm1JCSu0XmKt7lNM3V9OzKsl9gngXDtY0bX
         ixaidVZ7WCuq8YG3Cv+kMbgyjM9a4pmg5ShxxtBl0WyAWYmj5ulNKTrkT71nt/zgELsi
         3I9JyMp/h591+4wxFiIw4+NmdICDum/NlDUcxH/uPVhjpqabtxcYNr9HN0QpoZk+lAdI
         dnC6n+IYiFhqkhXFUTtt/eixYtaFTp5+6x4bawWF2k1IabfbY/USJMUyBUK6SDdqoX08
         38Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8II0Yqlgw90iGfnulG1IEmeH3dDU+u0yns/8vCpAIRQ=;
        b=vM8WtBQ0+TOiAXqDgVRYhAoCG3t846vZKZa2J4RgiMty+A/9zMLn8a2JAQwdCfy4EW
         VV7FKm80Y2phgs/100t3umIfvWw+rA2ncKgEBf31W8BptWLx0S+VStkpTaDrF+e6bNQF
         QX9tlGi4aNoYYpYT9s0FZQzlInYqgqwYc0XYASQwOTGcSbqJMjMx3PeWDfZsLgvhBX7T
         nCalvAUYf0OMJac3eEFRKXSnZJk1cSBBO0qcxKDKJIxOgx5uvEenLrsjFOUkWxTfaVSF
         s5/glHNYLDJroWJvZvEwv+rErzjw2lcevl7ZY1gZZHO/bpfbpNFXmudslDN+LEeUaoCC
         Verw==
X-Gm-Message-State: AOAM532Mo36XD3FYnk7YwXzClC7sg1SObn+mMzjdoVY7047ArmM7bidr
	9bZWCji5N0+OgagOYgy/AaUE53rwoOHrLA==
X-Google-Smtp-Source: 
 ABdhPJw1A3LhO8CItNAfyvep+gV4+lwD0d8XjH3p5dZDqEdPCxhiLCpIPTSEkvSULKrdJeDeoUmVew==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr13370338wru.2.1636674414261;
        Thu, 11 Nov 2021 15:46:54 -0800 (PST)
Received: from localhost.localdomain (bzq-84-111-132-196.cablep.bezeqint.net.
 [84.111.132.196])
        by smtp.gmail.com with ESMTPSA id
 o4sm12694652wmq.31.2021.11.11.15.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 15:46:53 -0800 (PST)
From: Ramon Fried <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH] bitwise: Upgrade 0.42 -> 0.43
Date: Fri, 12 Nov 2021 01:46:37 +0200
Message-Id: <20211111234637.526046-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Nov 2021 23:46:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93910

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../{bitwise_0.42.bb => bitwise_0.43.bb}      |  3 +--
 ...ormat-security-errors-with-mvwprintw.patch | 27 -------------------
 2 files changed, 1 insertion(+), 29 deletions(-)
 rename meta-oe/recipes-extended/bitwise/{bitwise_0.42.bb => bitwise_0.43.bb} (82%)
 delete mode 100644 meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
similarity index 82%
rename from meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
rename to meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
index ebf4b3c5e..f473ccaf5 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.43.bb
@@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz \
            file://0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch \
-           file://0001-Fix-Werror-format-security-errors-with-mvwprintw.patch \
            "
-SRC_URI[sha256sum] = "d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2"
+SRC_URI[sha256sum] = "f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb"
 
 UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
 
diff --git a/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch b/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch
deleted file mode 100644
index ebcb0dd5e..000000000
--- a/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 53237c103b06f58ad9c2ce3914fcc7fe73629f11 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Oct 2021 01:11:33 -0700
-Subject: [PATCH] Fix -Werror=format-security errors with mvwprintw()
-
-Here a non-constant is used as a format string which
-compiler complains about. Fix by using "%s" as format.
-
-Upstream-Status: Submitted [https://github.com/mellowcandle/bitwise/pull/49]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/interactive.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/interactive.c b/src/interactive.c
-index cce418a..2c0b152 100644
---- a/src/interactive.c
-+++ b/src/interactive.c
-@@ -114,7 +114,7 @@ void update_history_win(void)
- 				break;
- 			}
- 
--		mvwprintw(history_win, j, 2, history[history_pos - i].line);
-+		mvwprintw(history_win, j, 2, "%s", history[history_pos - i].line);
- 	}
- 
- 	if (g_has_color)
-- 
2.33.0



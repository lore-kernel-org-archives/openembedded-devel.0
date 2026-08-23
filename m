Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFE7C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:28 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12918.1787485943894823283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GS3igXLR;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2521868a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485943; x=1788090743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmNkbcNgCkYNvGHZHVLWnLPYXiI7SRAzsalYNEYaCGw=;
        b=GS3igXLR1WSjU9NVEIdUirYoukJ9/K5CplXY4KKw5yoGi+BovLI857S20rkqe8FL7E
         AuwRZods+4IoB7r18fRgl0+ZdIHvHoshpTRKQsDDv4cx91S+m5uqsjKoXVehyrKk0slJ
         n6fNmhpDLnDXr2LGkApUx+k9Qr7tKyAHoynet75+dNY3ijovxXJEaFsImgBlFMD4wGZZ
         MSIoFtfkYQD3Keb4NqQaHezEaJp5iSgrzdthu7cPCXrLaYydEG/KCIGhm+gRHoTajqGG
         MnXh42xGSn1V5eXK2nHaLPtMPDRDGb6+DoeCNWJugo6gCZPnQSBBWlHWYMJe7Q/fBUqm
         nQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485943; x=1788090743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmNkbcNgCkYNvGHZHVLWnLPYXiI7SRAzsalYNEYaCGw=;
        b=M0nKnX7P6bnbc7KmRaxrEJ9eZOJiarg1vlhhWFWu55ldbzPxNmrAlky6jKDUxJ7774
         B9wa9rNk56156xQOpddniLr1jzCLk/TCH7SdAeLPnY79+Sw/779VH7RXMHGMQ4rK+6aV
         fO1Hb5kwVzGTbevH4dIu4DN95pNwj53nEZzzu+nnMT6VzaYo1/kjPV0zoJ4Y2A1IxRKs
         0VKTw8nNJQF3uK/SZwqZxOAM2/uAzsbWMWjCNc3cFIsug79zrcCokwt6GG+5zXR5lzid
         mmXQsJAa0PcguJ7aUYXJBwCKKP0UMOEfnG1m85BNlR3OuMyTweYr+A+gVC4PMmgjxYdZ
         7PFA==
X-Gm-Message-State: AFuF++ktxRS+UY+agaTpvUYIlb105l1idPEUAmz+OAfb776FMqsGdZFv
	2C9tpYuUl1qtyzg7yzURwAmFjriBVUL3Y4fTna4lkGpMVLZWTG19UG+pIGM5Bg==
X-Gm-Gg: AR+sD12dEeq5rqbxZ3Iqa3TO9UA09NG5aBlGXEFvFIQrFnPMfVSOFWW3hqxWUWRsvz1
	LhxbZ4mc6S7q7HWVE45JMJ0Y6FRIPqapfzoSEdej3IkF+tpKxt9Z6lB6asxIEboM2JExNLj4kLA
	23Td+4IenFwRokKqIlDsGnNZRpKoUU6Gjrv9cY9f4OX7bvfsit8hhMt4sZJoKdPbPo4if/2h+Ad
	s2kBsy6OxyYaUCbVzrY4GS/iQqfW0wpDRy6khjQEgJGg5NwMgkla724rE8pBiXeSLZRoZdY7VEV
	IsIO/9v6ZRjyvRkoxraCVYnCj+YJrCl6wVG4H7b0Vn+ZjgtFJsso7qH5tOJobftZ8zGGLjqatQd
	G25cWBnsUcCRd0EIzswKF8eh0rujjhB7z2bY4P+e0YYFBl6PNX8oOnAHoQqs2cZVC6BBFA6/jtE
	xWwBtli1H3QaF/dBd+rRZ6jjh55GhUA1KOfKntUemQZWKWf8JuuRMjDYvVQ/NYhV1aGalmWUtEb
	Eo=
X-Received: by 2002:a17:90b:5823:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-395c4bde19amr17231194a91.2.1787485943215;
        Sun, 23 Aug 2026 04:52:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-gnome][wrynose][PATCH 7/20] file-roller: upgrade 44.5 -> 44.7
Date: Sun, 23 Aug 2026 23:51:45 +1200
Message-ID: <20260823115158.1582363-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129441

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version file-roller
...
INFO: Current version: 44.5
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/file-roller/-/blob/44.7/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cabbb12e12d9b2bb782ec974c0f5088408475938)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../file-roller/{file-roller_44.5.bb => file-roller_44.7.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.5.bb => file-roller_44.7.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
index 050f6803c7..3e1a654284 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.7.bb
@@ -17,7 +17,10 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gobject-introspection gnome-help gettext upstream-version-is-even mime-xdg gtk-icon-cache features_check
 
-SRC_URI[archive.sha256sum] = "dfaf4bb989c0b8986be8bdae9fffeab8d0f30669ae3a627e8c3df94f23888339"
+SRC_URI[archive.sha256sum] = "67cada96a2409c859f378e82fbe868b0e9c00a69e6b7b885d542c64ea2a1297d"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/file-roller/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 


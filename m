Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED29EE0AE7
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3910.1770467016253987133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wov7TkTn;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483337aa225so570605e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467015; x=1771071815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjQck5sR/pibOnWfhZMpTP2Mr9z3gxXmn2QMLvY4FEw=;
        b=Wov7TkTngoe0DYOzaNJpUuTHovSJNHecJicTEBrFPT4psETZt1VKgocSGyDTf9ozdK
         uQEzdooQdwu6mB+J0O3+c+nA+CS+doY7IYqa1MUvwC7YZl+04VwyY+ofbX53I83yrnpw
         d9aqCZx/UqcnNJVsETLKDB5QbZ9d/giKxfUeJ+ur9ExoAkBRoRA3j6mHGWfKUXgJIl7I
         EqeGtCRSXuEuvdkOryKz9Ac2WWSuymvkXpDiJAoniIPxOlHDzie1GzUFjWGHDPpqOEcN
         BvAGvokm27zpaWwWfkL50yFTiKPLfTRzrSbnVHI+ht6tmSstPDYOSfzDzVlR077M1d6/
         G08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467015; x=1771071815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjQck5sR/pibOnWfhZMpTP2Mr9z3gxXmn2QMLvY4FEw=;
        b=APgpxAFHmDMIRa8D6B965oGHN3oe6XYEujPvI0WW1L4zbV0OSicb9c6hr++sC1UT5H
         JpM0G1TPFSfsOPnbJpyr2jiDef4LSQWMlWuzEleCve9/TyFXuxQsjJlHVPB4X9JE7bVI
         +06DAJZU+4gOQ0Ueej//p71luaS9h7IlOxMSdn7VdaBSRDT0lZ7a9mHwPlAyt6TjFAAn
         7mNZpHihXa6OB1WUYiKle3a2WZK9UnMbHxcMl6dn4a3bn8PXEjPlHCDIaSkXG9WGqkV9
         wS9V4goEox35II/IZ4v+Yb5emLvqDIp3td1rL+iyDeC+NVgDwIiFYkViEfHKW2mhA2Zo
         fOHQ==
X-Gm-Message-State: AOJu0YwIlYmVhPVHaT28rHBIJis9Adwv3pfX54spA2FcRMBwAXTbV/PN
	8eHTXBW3vu9mC42FCmD7Hv3SSQbPTxwKMGCWQgOHGr9+xJjIe2MnqfTd3Oy2qA==
X-Gm-Gg: AZuq6aLPSXyO9HMXY2cevBvWJ8Gx2TVIHmRK1ifEQlaBkPfzFxPjhdwcR6zl9E886Jf
	4U2RtWWb/jU268AF6+1+WqnS5CXAHho/DdU+NNSn4PqyOhuMael+DlQ5qaEhIJOT3QQ7ghzmpwR
	DFwI9nR48k15MInROZ2XRU1bLrzkUo6fcUYMe0zfrPocQB1cUyv4Hcf74BP6hL2UQb+681HTwUo
	4eXDv8nxP87i0PFYfhx5cIls0Wlr2t6Eb2LgU+ygUwQBsKTooO/7p6Pnaneu5HIGjXf0fDjSQCZ
	s52niKeP6CqLqLMVRMJQeI8yn/rRjtqLmn/HgAGN5YpPisrW218eHGYwnzqmqJ2n2NWNQZ/9Kjp
	j4M/b/5yIU4+P8oaoqJ1Q1TlZfahdIj555sNDJ6r3iouBEkZMyVe2hx9xZQCAKnVpFPHuRITUCZ
	WxTvOWGWwf
X-Received: by 2002:a05:600c:4745:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-48320226f11mr81395285e9.33.1770467014479;
        Sat, 07 Feb 2026 04:23:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 08/12] tracker: upgrade 3.7.2 -> 3.7.3
Date: Sat,  7 Feb 2026 13:23:23 +0100
Message-ID: <20260207122327.664604-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Bump database version to fix SQLite 3.45.3 issues in existing
  installs
* Fixed possible infinite loop on incomplete/unterminated Turtle/Trig
  data.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c6a9b1559cc5b10d61b552d947da83ac81396654)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tracker/{tracker_3.7.2.bb => tracker_3.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.2.bb => tracker_3.7.3.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
index f3c482b279..885f3515da 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion python3native
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] = "debcaa291e46afadc1cf6a251f17efb02440aa48bff643d78c61123807dce00f"
+SRC_URI[archive.sha256sum] = "ab3d4a50937e04c5ed7846f6dbb999e2909819402f389ca592ee6b77dd28d1f9"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)


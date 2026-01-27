Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1667D2594A
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:00:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3947.1769493638528579464
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PirfVM0N;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so44357195e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493637; x=1770098437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/lSUYqTq0U/CPcXUnmwdMD7ECDQsm/UFp1nkxhraLQ=;
        b=PirfVM0NoLBkMWiETEpQMIdG/0LO3LXLDchhstUwccJSu8ACsi4ZiqF1dZM9y5EFAf
         Vl5ySdqbYUPj75UJhA39QgSoFvX39eG8a/m8w3QxVUeSSzidGgTMKgMwXVKskjs6NkSM
         k4oz62VfJTF//88MNCeicS2TA0YSiJN1x/ZnvWZUdbemjPyNDL0COj40b2sry9JUUD+9
         QjlD9aeRwZPg0ZUyyjyhMOxgx9kzRHM13MnvhoIPQCPCkGPjxecmLEVhwzy5601ZICZ5
         m6jbu8+5N6cmVXCL8LpNQHwypzDHHZ1s8ZLv0v5ckVoeBRxqg/HVBuxYqCf5yoP1Ybre
         wKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493637; x=1770098437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/lSUYqTq0U/CPcXUnmwdMD7ECDQsm/UFp1nkxhraLQ=;
        b=uDcauYPKWJUkWTO8WmosjwDq/JL4pcUbZQYSOujQUADrlUws+qj+q3ECScSNY0vNm8
         fcLnZcmIw+irz0JTnVzAzOpRMepJrl+R7GPe2iVjMntFiItK1vzBuwot1tXd+dE7PbrX
         7R7/kltkjLOzMkArzsH+DqjhK2aMgRqlWcimdoGPinD8srQB+jStZY3gnh37vfFxBHuA
         LpqcekbiGyoz4nww7cU/s16p6yT9HSOkf9kEC2G0VO7uWOjT1PsoKQj6YFKnCrgn7rvh
         nIOyrePs8cw16Op/0+roveGmfwfrHBJHnIYBY3dWyfqmY/f8oduiT8TSGxybRo2Xru5D
         1xJw==
X-Gm-Message-State: AOJu0YxQvZceoKhxG25rRbBWR/PxUCxvLKZk+HZfQTgHNeX0k5vDUf2s
	5y6tbbXRoyLxi7+zq9bh6guNvshnxvHli94bXFo9kajwOx6Hj0MdroCnQdzO0w==
X-Gm-Gg: AZuq6aJQ/M/20PT3C3i3BShDQjKQa54NF0w6DfUJgyditEGsN+DEvVbusK3TFC1HTIQ
	PuShf/nC1i/F4ZQjRKuwtltFc8w0sY0od24KqQn+tV+rbWAQKXdYkStsgisMV8DE1NUKRzapl3n
	fLN7PN/E9vRFbuPq3i+ZIN9QmjVy89cB+cw07Ln5/kX2Myu0hjOGxPmikS+U/JBJI/Zph2fD4xW
	mmyqdeEpBcEnKxtgWQCW4mAVZm50WNjEfesxbCANn/4e2A1XZdsK6wX/mCPfSWrazlciEB/gbie
	p71RwPczhFm7IpmIZjcPxIgBXxTQYbTJ/Bdbu7UsnOR2O92bP1onzj9aC7yrrrUKgU7MouQx1v+
	Zvc7OIbYgZsRBlrElZm5hEpdcTgkNkFV/vCNOHesPfjtX0emMbjyJ5efLXKl0qpkPacXPvMMB2u
	Vmmk5XPylrsvPvbGuE0EQ=
X-Received: by 2002:a05:600d:640e:10b0:47f:1332:e5f with SMTP id 5b1f17b1804b1-48069e70ebcmr3928775e9.12.1769493636791;
        Mon, 26 Jan 2026 22:00:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm126122825e9.0.2026.01.26.22.00.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/5] gtksourceview4: upgrade 4.8.2 -> 4.8.4
Date: Tue, 27 Jan 2026 07:00:31 +0100
Message-ID: <20260127060034.1301860-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127060034.1301860-1-skandigraun@gmail.com>
References: <20260127060034.1301860-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123901

Changelog:
4.8.3:
* Adds support for more Pango font-variants
* Style updates to solarized-dark, solarized-light
* Language updates to lean, rst, c, gtk-doc, javascript, and json
* Translation updates

4.8.4:
* Style updates to kate, classic, tango
* Language updates to vala, python3, c, cuda, latex
* Add unit tests for language specs
* Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gtksourceview4_4.8.2.bb => gtksourceview4_4.8.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.8.2.bb => gtksourceview4_4.8.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index db4d89de22..90661cc5b0 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -17,7 +17,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "842de7e5cb52000fd810e4be39cd9fe29ffa87477f15da85c18f7b82d45637cc"
+SRC_URI[sha256sum] = "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"


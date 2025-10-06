Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA441CCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:24 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.23998.1759715297461333686
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OQQgfGOT;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-749399349ddso55612417b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715296; x=1760320096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGSOEo+XfdTZaLJKodRzQ/hM7izOxzQ5Aa8mQVPp2V8=;
        b=OQQgfGOTCHL+D9pM68Ec12GS7wxRPBSb6NBAqES7zXGzOOL/JTDpfmvjLSrlC5oiiR
         Rkx7ZjAMdn2H9MV9Fzttg6d22uL6usW3wuoTjn8rI5Jb9aDMNmNP4C8NErMZojaRh5Ga
         1QvxW+UBq9V1auZsKMX0NM5+zIo1U8FgA8XKOZJ72meUrHXMD2T/HNkGcUomVxQwNC/L
         mwqIQVRLOgOzYTN+4ruZUyFzQp139QDXNeMzeaXkJZBs7c/qk+L4ya2ru2KujiQaMyK2
         P2HYaEm72DDCp/ExFkJ4T4PDgcPCdwWKfZq3iNK2BHGJZTPLfWsMsydb20zBXNlEZAEJ
         SpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715296; x=1760320096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGSOEo+XfdTZaLJKodRzQ/hM7izOxzQ5Aa8mQVPp2V8=;
        b=PkFuupRnRcrKja5w0ZsvZunqnFEf2ho6DGPZF7IlOUlVf8nPpSZ5t7hEaoMN3AWvr/
         v7gMTblhLw3k3OsLC4QnogtZns6n1Yp6FP+ApyFocVnPNjzgBveqK022yyLu4ajbSlwz
         53lb/Eg6OHya3xERJ+nzhjsAmZ4tLHt23E5hTUgEQwj5I/J0Zf7T2oLllnBu8lT3M+VB
         8igdUAjZ+o56OHPxi0IZ2z8rYPF9c2RBOkgM5zpz3K0s4b0xjWZLJbcq8zLbZRtWfFNJ
         FQTFhnhBOEt0ahXXA1XmwPNDvqnzi+mBLsQQkxXJlNC1mlwCa5uA3WwzSypE2aWuN4BQ
         nwqg==
X-Gm-Message-State: AOJu0Yzed7Im2yd3A/2KDG9TMLtKFCfBWv0vt2x1ctjbIpIDCVS8w9j1
	b4fLzwhD36BBFa3KD9PzHAA6C12MnVugfZVBnrmUfQWFvUnJZKBJa4utRiDApyQm
X-Gm-Gg: ASbGncv4Hm1xGORMWYZrdwDdqyVtlpHgXCPy1RC6SAYQgAWyNOoHylY5YgIu2WLbjzm
	ND6bls+OkNbZaL72e5fFwqFE2v1rFBdAuLzrypBE5PpfyTgxU6Ra6L5z532TFTIV413lzEC1Vbg
	uN/7p0XlAXfDhKnh5iTuHjFqBM/f+BgeYJx4bN2csf12EEF1HWQQ1g+X95AOMgZVKxP5pR3ESF/
	z3lhoQx78SEzLFF0FyccSz8IZUia09Cisvjb6nMhp1cmlq1d30s0QPF+pk548LERF5Ig5nRInQM
	C+fM1JB3wAyeb90H+JZM0nRrDNh5jgDAU0W6wdjE1ZrydvMhuogRJ/FxX+8cGtmosmQfxs1WvqW
	VHhURTisMnovcQSLkMX+cghvRXMYAA5rLmsootb27pB9nLodsaUDWD0XV6YLkaZw=
X-Google-Smtp-Source: AGHT+IGlpNVuMViBJtV5GDE20KhcqdysqNFlZz66QLKlZc4S/bvuJh5l9WSGUj2Q9etn8bIRU0pIkg==
X-Received: by 2002:a53:cc01:0:b0:633:a326:3b07 with SMTP id 956f58d0204a3-63b9a0e1666mr9122937d50.24.1759715296171;
        Sun, 05 Oct 2025 18:48:16 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:15 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 03/10] xfce4-cpufreq-plugin: upgrade 1.2.9 -> 1.3.0
Date: Sun,  5 Oct 2025 21:47:20 -0400
Message-ID: <20251006014727.58960-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120260

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpufreq-plugin/-/tags/xfce4-cpufreq-plugin-1.3.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-cpufreq-plugin_1.2.9.bb => xfce4-cpufreq-plugin_1.3.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.9.bb => xfce4-cpufreq-plugin_1.3.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.3.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.3.0.bb
index 44b3be598c..a0b48b8671 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.3.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpufreq-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin perlnative
 
-SRC_URI[sha256sum] = "d0714720d588c649457590e5de3d95859b922a98d5fa9d0d1416f36a76bd3ef9"
+SRC_URI[sha256sum] = "baa5b90f72e8c262777f1e246acae125af489e2c168a5f7f890d9d2b5567ec20"
-- 
2.43.0



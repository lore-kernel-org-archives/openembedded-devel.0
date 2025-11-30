Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7861AD116F9
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4137.1764531861323877286
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NmU7LZWB;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso28726735e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531859; x=1765136659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISFdzEmPZ5my08z6MpsXxCvinm1tyr8CxqIU7Rim/PA=;
        b=NmU7LZWBhr7JAbIhHCYc2n5/koDo7cw01ehHs0awr6zxSHo0bpJXo0CfuMnBKyUnAt
         mwD+zZRnAKDJrabMEhuhXPcgzp4vYits8AkgP5wgpxLZQ7+FCD9SR4JWP0cKQSweFqdK
         yKgkbMHNjR3FH9puJIbzOem4t2/kEWhv0Q20u6utlYaiTvVuvnMlb/yStSJrEQvk6M1b
         n/Xq7LfxabKBa9kG3KWklUaNdK2onP47GrGTzhrjNfgLYwtSzfm/LuY5xZbOy+ArWpG+
         0Vg5rY/18KlCxVojsCZAmVfCjR89DDHJaO6StiosiwSDJyoMtRUtEnxyejgk2A7tQQdP
         4XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531859; x=1765136659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ISFdzEmPZ5my08z6MpsXxCvinm1tyr8CxqIU7Rim/PA=;
        b=CpWkGK4apP9UIQLJlGz5e2XQlqGQ2AVE6VpRbM7Qhq0lXtLdVDDkvKX08Dnol0b0AH
         KdTQHE9EOEQJ92raBqOVLD1wPzbODGRMaJAVVlh8DAwQhfYRSk86tuH9D56pll7Cje4m
         gurFirDgabPvJsUIhlkL1Ku68ru37/TTujfVRH3Kz2MnVoOkeU3aYQpQdhlpKOfQ28Zd
         EimL6KiFwKIktmQxPkueortSnKDT6TFUUr4mLcVFbEDR5tNTNn/JEoGW/4a8PaNzFCET
         hQ8XlnZUJ6v8LHw6ZntWebH1YE9SmKfzHIXrJFj2HYsw9ZOGG4ELiRGNiHUO7KZjGL2r
         TKaQ==
X-Gm-Message-State: AOJu0YxRljhnX3HOv82Ma67uBXuDMMQlmcCrnJVdtJVhV+h3UlcakpfH
	xPReeC8fKoadjroej7lfbob3S6/BvNONWST9FxG5NzSzvQuNjtmOkxLRHdeACA==
X-Gm-Gg: ASbGnct22f8hdCqx67erYZbJxvHlMTFRFGzYrtGSZczKWbP7SvWd6Ke8elw0+deIE2Y
	Z2RVFkpSjwTlJS96RgIoseSfnoqSY8BX1iD8wbHoVk3MCpd2Ngiq443Lbe/vtus9tdvGcXbIBEA
	XEzJzMp/lGDGx8Ki1BD2pxYp7US+GMuHa5MIFnuHO5jtmsS9PWnHMDISd3ECzDD1eLpT63claMz
	qM7z/IRQr5bS4NxG7cdP3xC37xRCSvUAy8LVP2XhkDJCGnkQE96Psf5bFISLwUgj/baLhK7oNyg
	w3fksLd8/Da7hL6NR7hOO/m4z39uwBKRsRjNYJgYyrBeI4CeUluyKjn/U2mI/eZbm3EEaBo5i3q
	vBGe/STdICuIRA8viVVaBGUimpJLecbFYRQwo7wzANSuHp/xQ4bw7eVzJF/DnzYAdUpIgZZsfUk
	3pxZ6qbrtp
X-Google-Smtp-Source: AGHT+IE8jVQgruO5ge9/mNJqwwn/j7EaavoXfhlFjyaFkFZJ2gaqPKchXppfGwbdV9TCM49SqgCm+w==
X-Received: by 2002:a05:6000:2f86:b0:425:86da:325f with SMTP id ffacd0b85a97d-42cc1390f07mr42493865f8f.27.1764531859454;
        Sun, 30 Nov 2025 11:44:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/7] fontforge: ignore CVE-2019-15785
Date: Sun, 30 Nov 2025 20:44:12 +0100
Message-ID: <20251130194414.2335669-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122178

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-15785

The vulnerability is not present in the currently used version, so
ignore it.

Current version: 20190801
First vulnerable version: 20190813

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index cb5f4d5ea1..84644f2560 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -43,5 +43,8 @@ FILES:${PN} += " \
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
 RDEPENDS:${PN}-python = "python3"
 
+# The vulnerability was introduced after the used revision.
+CVE_CHECK_IGNORE += "CVE-2019-15785"
+
 # for e.g kde's oxygen-fonts
 BBCLASSEXTEND = "native"


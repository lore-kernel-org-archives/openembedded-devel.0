Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0606CD58D59
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:25 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.20498.1732546458045937835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWnD8u98;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6eeafd42dd8so46143977b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546457; x=1733151257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ctqMShDf9EBdXzRNAsvBaaXmEfybTQAPiNd5/BKUWI=;
        b=GWnD8u98g80yH4f0biaHPv3GmQ3KAQz99XpxHsHSeeFXS3tvKaHz8ZoihGbQURfhhD
         UfWib7nQm7lIUbXXh7A681D8DjHaowdWE6qca3sinm8PHRqvmr7a7Swp1lMrYHtGJzU3
         BiRdfU9xPq97C3TSACZByFpEBG7364gUhmXvpZc+Tk3vzLwNGFfaW+549KEfr/DBdgRu
         zLOUvFUf8QztxghI+JR2BVfhoIKrGlkjdUIrRDHEqvDL5GfCpKLzZHOYbFnRUVxs+/XC
         iN6wXOEJyEL68Ap3LLpBdx10EOzrCqZUCmg9MIWiDJiiDuS1zq3duHIScXnPTd1v4mFI
         WBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546457; x=1733151257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ctqMShDf9EBdXzRNAsvBaaXmEfybTQAPiNd5/BKUWI=;
        b=ZHtF0XI49mqhnCPtbjSQJGY2hMjHDExPvaZ0zUqiTkmcmz+6KS9HuPXs1veZx2WDZR
         GgFNqSFV3XRZ/prSl97wFEtW8BXfEoTRZLEqIzMEAGdyScxbnozRmY7ByI6bEBA11egN
         bgUucYbsvoU73Mf/fuOp6MAwnbG7WFkZc/Wb7fY6DNlMWphq4KC75uYbaI2i6iFvHS8z
         PhAAMeDMoxd6wVMi+dtxYEl8h6ZvkqfslzicfdPLjEckDINDpZYRBv2ASb/t+Q/lPEpH
         a4muVLDWt2yD4lmFRsgY6DsPZ0PYk3XLYPGXVR7knKSdmRl4S0cj4e1+qfOyQghtwpsy
         py/Q==
X-Gm-Message-State: AOJu0YxqJKXhYNxblDYtRR0n25HsjL5dJjEb15DkYAw0r2GnnYWb186E
	PsCf0nU5taJaJPvehm1xtbKjzB/Ln5gMaBMU9UbBcoGKBO3I1y99IzueCRjS
X-Gm-Gg: ASbGnct8OunmH3RQsLxmlFp/vW+oAm9YoLu3lUrDcz0n8eOUK49r1EYWFbv3Ti695RW
	i5CzMyv2IVfpTCckPDou5iRkQtKHlHbzP9JU/9i13pGsrIq1pOR03pep+ehayr97X6b8q0HNWHr
	sTZwk01FAAvV/jVWBnbSo4tjoVR3a5uqz7npcTuZPMETVlB1OL5t92kStLx0aFX2l1jUpX+QX8I
	3HQrEGcbG6Onhsmp3IFKy/gmWVuQnb9bONnUEHkAi9xNoX5K4d6Zn5f
X-Google-Smtp-Source: AGHT+IHjIsks/DKvMoTX/CtOqRqkC9fYVJnV1WDs7ukVDpv2g2rauo+AaFUhYdhv7fbS3gnzGu9KWw==
X-Received: by 2002:a05:690c:3606:b0:6ee:e07a:a3fa with SMTP id 00721157ae682-6eee08cd678mr114255167b3.15.1732546456634;
        Mon, 25 Nov 2024 06:54:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:16 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
Date: Mon, 25 Nov 2024 09:53:03 -0500
Message-ID: <20241125145307.5479-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114040

Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libxfce4ui/{libxfce4ui_4.19.3.bb => libxfce4ui_4.19.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb => libxfce4ui_4.19.4.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
index e53d01d00..ce711eb36 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "16815eef494ba9bac9c854e95c205c0bc5568c8022c31604348f9edadb02f227"
+SRC_URI[sha256sum] = "c873ec46d5dd448df60a8385e029892f85b40ad66200cc3c055ab7156d718796"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
-- 
2.43.0



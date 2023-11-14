Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E254CC072A2
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.5392.1699931299539277125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvR5+uqu;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc9b626a96so37831535ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931299; x=1700536099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPyHlu4UF2gDfDeuPWVytdtkRocjRsHclNoBl7Gyyuk=;
        b=QvR5+uquB2dAsccL4YmLuKYmyXMBioH4RjhUKuAw3JAd3onODym4A3oAsgCmhVNAuS
         EmY+5O42JQC1n+ypvUpvtOzYE7W99EwNGEI3lDcdW2eH69graXRCthhYgNUVogKQ0vpG
         wvdGug0cJ/o/45wOeIritEOXiQk4z+Je+d8VoY1IP/gTsSBu19dWsPbIRjTA720accdG
         7jp2EWcBAyHilnINk2keGWxq0bxG1hCkqaZ+DqnBALgGgMIs6XauPCfTZxBcBGIs7Dtn
         4bSRRbm8jcosqGkIAtrLlnGPIWM0UOjwKkNiopKn4sUuKpNzdU0Lk3mCFfKWRBcl5PZA
         BoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931299; x=1700536099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPyHlu4UF2gDfDeuPWVytdtkRocjRsHclNoBl7Gyyuk=;
        b=paudSI68ZDEtMOGkT0EqrUv2DqPy4aK0qBpPa5dJamDjSeQX8wzmuYzEWLWV1i4IyH
         oi7Is/ZohiB9YfUitspbFKdXAztOZ2s81AzmdxyWwqA6/FQTMCmxie6Z3o/Hv+wfZH5d
         ViIhERrR9yK5Eih3ujBX/z5WUQQRwlxiAOF5Cvb8uX6nzqkGW+ZUEIOZKZ/R1mS4WBQ4
         RlRo7qoi1tkpNB+wk/kM4yqFYgMDGqzcnma3ZdI8mIvYqQWun/IixSEmkp2PFXCoOjBk
         hCPKRIuzOE6mHyHWLbHwGjhquqxoyAOG1CIvho6QWAX6g+0cr3v+baC4wVpgCPuZpmSX
         8YUQ==
X-Gm-Message-State: AOJu0YzKKxd+Uwwlb93biYN/RuCYUWYeQSFEu+4qSYekAqQO//IUwP6i
	hhEKb91t5RG0X8arI9tKQTv2+k4JuUYe1g==
X-Google-Smtp-Source: AGHT+IHgrVQxdM4PSaH35s/yG22gzKgKLxT+WmwpE16LCrMWKbw5ueqWFEe4B1tTh07vTHlTQSWaRQ==
X-Received: by 2002:a17:902:9898:b0:1cc:5378:6a56 with SMTP id s24-20020a170902989800b001cc53786a56mr878311plp.48.1699931298656;
        Mon, 13 Nov 2023 19:08:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 03/10] gnome-terminal: Add missing dependency on libhandy
Date: Mon, 13 Nov 2023 19:08:04 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-3-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106690

Fixes=0D
| ../git/meson.build:367:16: ERROR: Dependency "libhandy-1" not found, trie=
d pkgconfig=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
Cc: Markus Volk <f_l_k@t-online.de>=0D
---=0D
 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.=
bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb=0D
index 069a95f202..014b329b34 100644=0D
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb=0D
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb=0D
@@ -15,6 +15,7 @@ DEPENDS =3D " \=0D
     gsettings-desktop-schemas \=0D
     vte9 \=0D
     dconf \=0D
+    libhandy \=0D
     libpcre2 \=0D
 "=0D
 =0D
=0D
-- =0D
2.42.1=0D
=0D


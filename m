Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E14C0755A
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.5382.1699931302096377470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yql/J67Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so5186803b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931301; x=1700536101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1O0dwxuU4cyoXbR3rgE12bNW6xQX+BkaLe6a0WqwXE=;
        b=Yql/J67QfnQGS+PwbWWp+/m4CIY86i9DOhAkGiFqKOvadNGQfLOfWuP30yaZrKJRqR
         9R6cH7CqxpykfnjaFJPnm24tuGSSHWZsTffeqinJIS1ctk2ddA9TPDf5fOlMZILGTzKH
         LkbV5UPmItkY5NGxDejgVJ/BR+OV74MfUBn0Gf0pM42kS7qMHDA3lWTDCJSP9Yv2/OIh
         oWnunXm9+UBpa3N7mWlqIzWc2gIAscWCdKhc9lbkkK5Cf5srCzR4GYzzLAYzd5euUkzq
         VvO+R0nl13k84dJh//ebcCxxhi/4sxiVPTnzcyqIzf/Pj3KmbiFgdjM0ceaFqWBDiNNc
         j4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931301; x=1700536101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1O0dwxuU4cyoXbR3rgE12bNW6xQX+BkaLe6a0WqwXE=;
        b=FpaV03kBoRArCpB063O6J7B2Fc8a/Zk+Qzm/YAP6w6X82TEEEsj3Pm6hKAKiRCH8+d
         NyA10B9UqQ3QbHC3REMYc16pC/8fTLdLUUN3Dw0YsHNHyTalBT1xUDfNIyhfWS7sFa7g
         9CNj93nRltyxOekbVLjJEtutjGI9m+5l9iCWo0DJgLvTPZuuEd0/v6aszyqoWZOAceu4
         lSZZZRTzROIxMWioCUuNFbUce/K8GilcRPaIMFBugZZdEuPhPSFtJTqgbKteaYKIm73J
         lVXsqP+czCXEVk5wkBR3an6aZXRCcIjfvmUy2AB0HRFSqdGZqXTY4VRQ+eMyWonRCp5+
         GCig==
X-Gm-Message-State: AOJu0YxG83WRKIPyqZvcTqzexfUE6h4yryPJqW7GZuJfzJWHTrgaCpom
	hvrKBnhD4BSnpG4tZJXCjs9n7GsObZGycA==
X-Google-Smtp-Source: AGHT+IErEY+8favKKGIsfejeGXWGVVkPimWGiuTVSjyM+HNepcbOwC88jgn4o+JzcOTruY/hOwxM3g==
X-Received: by 2002:a05:6a20:7f8a:b0:186:664b:44a6 with SMTP id d10-20020a056a207f8a00b00186664b44a6mr7168620pzj.48.1699931301347;
        Mon, 13 Nov 2023 19:08:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 06/10] packagegroup-meta-multimedia: Remove dleyna recipes
Date: Mon, 13 Nov 2023 19:08:07 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-6-111dd5d0fe68@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106693

They are skipped now=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 .../recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb   | 3=
 ---=0D
 1 file changed, 3 deletions(-)=0D
=0D
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-=
meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packa=
gegroup-meta-multimedia.bb=0D
index fddfd720da..b18ad6ad1b 100644=0D
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mu=
ltimedia.bb=0D
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mu=
ltimedia.bb=0D
@@ -25,9 +25,6 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\=0D
     bluealsa \=0D
     caps \=0D
     cdparanoia \=0D
-    dleyna-connector-dbus \=0D
-    dleyna-renderer \=0D
-    dleyna-server \=0D
     dvb-apps \=0D
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faac mpd=
", "", d)} \=0D
     gerbera \=0D
=0D
-- =0D
2.42.1=0D
=0D


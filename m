Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20314CF2582
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:44:03 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7902.1763527437591311978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hC/WJ3Mc;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b98983bae80so4699858a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763527433; x=1764132233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/eRgnTDanJn925eijLqlgoFztxAD6XzO2DuLx0zbYE=;
        b=hC/WJ3McgCyLx7O9CfSadFoRUloSSSOMBUnKC3rEJOur714hSbi7UhA7hF5m4gwMBp
         Ch60brBflIcjhK4U0N07S+gwI1wjCzWkr/BiHOwmgUa1ZuEQAk71Fwm/rYtNB72XE8/E
         rIZInCPV6nZ6ReMfQJh8018o/pVHHKwOcbzorTcdoxHzSAFgcYmMF40awG5FOXydXOKZ
         nZnUuoKr0WpKAydBFCtQxpJGTfKYZeBIHSZuW1eve5cOJcr/bWjehxr9wk+QiYH7Mg0N
         TjG9iFES8/S2Iws7AlfC034I+NaR131NwZGXIPdJyUEJNy2mMdH6CAq4+eGCzR0tbsZd
         NafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527433; x=1764132233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/eRgnTDanJn925eijLqlgoFztxAD6XzO2DuLx0zbYE=;
        b=maSXJwCB7jojvmTHhLTNJvtTXTJuIWslNgSYTjLPeWGeDfefiaSdMj7BcEXPY3OV3U
         aVeROgLQSmaCMsHQKifW2+oUxbrhKLoqxXd5qcu3fGj8NQXbFLfov03t0o/dn927/Kf3
         dtCxZFyhP3jFOpSLZ+rBaBI2NNYm4CEwkQlmbF0KVHYQzcfExrTpIL4G+F63yZNFmgY/
         77+sHfU4vncm546NrkIrg6zJBW5f3JMYsUTXNsbnI5B+w2fRcOnp+afmseGMMvPQwESY
         7PEc6QzVQRNQoQeNk4pOuRoXb/J0V3AVHrO9Vc/quj/mDWULWRLNynIR+PUfKJOdgKez
         Uu4A==
X-Gm-Message-State: AOJu0YyS+KxP7jR+zB74AqYKy83l3W3O2x5JhJBQ1NLDiGuRgbqHNv5m
	Dl191Mb5GUIJehUAyM7f0t6zKappOmyYZMsO7DKay2r0um6yEdbNE2WXETsMb9Ev6rs=
X-Gm-Gg: ASbGncth3v6lNz6X2mathJxPf27tt1xxS/EShuteZDiN+BHPXWCmdgrEC1OeJTCeUIN
	avMyC15lYk7fNhon3YNCxxxWVeJ3j400JAO6ZAHKfCCYGaHI25yrv+cuP5mkbVdpIos7SE0hHAl
	kjWxbuHnWm/Kr3gTwcN1fMCt//Whbey6p8hKoeTMWNUJV/6NyzG4I1n6eE4Xjkvd5A37YS39iy1
	xbRd/E3mhbxrZFeAGtQXSS12kn07fkhEdap/VbrsIZqwQAiBzDs1Gi47bcEyAyhycPaslCoSliB
	lJ0ooL6oNmWcQa5fDwbDuA87eDNMwI4qJb7Ou4B21Jq4nmYCCfuLUM45QV5l17JHK8Hri576um6
	G/oJbd8Y4w2m4zG/gKvA2f7DlADQ6slpkKfFSBE+ephyjffarw7xo592gLRSa85BSJUREkEI3Db
	elg7ET3lN50qU7CHGPQnSiPDJJDrlBVABr7TAWUi4s/P32zsN+0N10rtUc52PUABOhlLQ2n8VBm
	9cjluzxoVs6Y/gq70aJSsC9EbuBt3ijI20AyDBfNDQ=
X-Google-Smtp-Source: AGHT+IFOlb3b95H13A3MBHaVhd+8faM38ZMMoWTUOlaVIpYphimia26GCt+zsaRemyj+IizPSmBogw==
X-Received: by 2002:a05:7301:1ca2:b0:2a4:61a1:c0d5 with SMTP id 5a478bee46e88-2a4abb4d6a5mr6448738eec.36.1763527432782;
        Tue, 18 Nov 2025 20:43:52 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49dad0aefsm50079315eec.3.2025.11.18.20.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:43:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-gnome][ 3/3] gtksourceview5: Upgrade to 5.18
Date: Tue, 18 Nov 2025 20:43:47 -0800
Message-ID: <20251119044347.2884483-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119044347.2884483-1-raj.khem@gmail.com>
References: <20251119044347.2884483-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121886

Adjust for setting S in gnomebase.bbclass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...gtksourceview5_5.16.0.bb => gtksourceview5_5.18.0.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.16.0.bb => gtksourceview5_5.18.0.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
index 7076214a4d..334435480e 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.16.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
@@ -14,17 +14,14 @@ DEPENDS = " \
     pango \
 "
 
-PNAME = "gtksourceview"
-
-S = "${UNPACKDIR}/${PNAME}-${PV}"
-
+GNOMEBN = "gtksourceview"
 
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache gobject-introspection vala
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "${GNOME_MIRROR}/gtksourceview/5.16/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ab35d420102f3e8b055dd3b8642d3a48209f888189e6254d0ffb4b6a7e8c3566"
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_version("${PV}", 2)}/${GNOMEBN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "051a78fe38f793328047e5bcd6d855c6425c0b480c20d9432179e356742c6ac0"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'


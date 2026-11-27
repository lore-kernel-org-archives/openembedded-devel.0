Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11799.1795762952054676061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Zf0ofFlh;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3600377c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762951; x=1796367751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJJbS2g9VR5/k4erWeuYcWoH3cnO1F/hFEE7ZF2xd8E=;
        b=Zf0ofFlhXhw6vC+axQ7n/DEuoYVFSUPP1m3zaMiIm2wpZuSquf4oFm8iDbXQIZJQcw
         Cw8wSmbxm+9WDVM4u2jdF9Fqd/x3cicPECTkaV+ZY8FDmZRsFx1YmvfEEMzh7+mPQeDM
         yboMgwbm4xzMCg4Z+HkcgRXgVUf0UoaB49UOQ28rif7Go2kAYd24GD3hrckJG0mPOTOz
         IxrTIWeU9r/Zk9H+DttFIeir9mxapWkL88efI2PnDERlMAbbv/6wGd3t5UGNJE/znRBA
         Mb56z3+00AjUz0LrUa7FbKjOuH7h2mIMxNgpr9n8+Pt7XkXq6V8UoGtQydkRHwzfCEYJ
         duJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762951; x=1796367751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJJbS2g9VR5/k4erWeuYcWoH3cnO1F/hFEE7ZF2xd8E=;
        b=h8scwmuFNEBBFqYd8RYI9LnRePEfwpYMc+ADzVBD/baL4SgSBD09+EpbZEN83OYH3x
         D0r78J+kB/CSJ/SP+Lh9vBCsUEr4QBGeBCqus0g4VEmeoYqW54SqGcG4VVblvUs3hqpI
         ljfWFHyzDKp+aNHyC0mOCi9XGRqmWuvDlbMF96sw1iIHfqjTVNtbmmCwFP7Bxv83La7L
         2mideywm7dqlAsMJx81Lmb5h5pnPrdqXPjMbtD+acm3IVQICRzAeWMcJipoJHvDGbuO6
         T4J+/Ki8RfSY2vKxATHZGZRIrzxP5XGmAj8t2LLMUbVrjLE7gR4H8UKhFxy7ApcDbefC
         W9cQ==
X-Gm-Message-State: APuU4Z8O5KxApa9Cxow6WG3C8wFzaVzd83StjCzNkr90u+/ONKT9ljwA
	8GmdHJq7+OpqxDTsjP1juRG7+h8fIQnaV9rnJZTuQE7QvSu6JfbIlrqe5N9/uDhh
X-Gm-Gg: AZFdTZef8cIHTso/HsEzuxR0RtE8TRqPknwjAGJ53/qtscDPssJROV8wPt96++D6HXL
	3yYjoEXV5RH9z0Wk69CeN824xIiVC88VEJEso/JgiPUEL7GQ9xZ94NIeLILiaDBtpflW9VrKupy
	M8555UhjDOZ3xBqkhPMo3X95TvfI5IdzHGE5m83QRDk4mwUMSrTV0GwuD8o28E3UUQZIECeXLpo
	ujsoa4yrvE7ZGWxMBgP78u8UbX8gX2M0WhfNbZvCj4oLRqW2MUqURCU/kdEEiWoK2QOQMzhC25F
	cU41FdPsHLt8ExjLm/1m8MH3HFIAptIrk7JnvdPeVarXm/gPe8tb7JZPI9TmoHkbNS2XMIIzDit
	3j5tFNF0Zqh+e8v3ZcatuiblRmNup08sijBjR8VwkRpLz0cMa7nPgp3mSnxjgomGFh+XpDiG8Pv
	qqnH+iMdHOWCkaYtgK2UUzBIDx05MWp6nVn1CuBoolE7FiWkAWjG4LG9Cx9+cvXvZzvRhL+fS+I
	6UP2ZbzW0UOzIUGl7VQHA6aR6AakCGMMrUyft0eb10cfVhGpd2Yl1rqiPl/fZdWRutE88MualpS
	e+QASsisBrz1PDuM27spIHjYmOUDz+RQqey+KMlEVsOEANqTPOCKFq7fnY/ksnUl/C+ftmrElLr
	RtwsHP6MJDzivyTAgxB1rhLOur245PXPTTNiCJ6dQnYmsx8twtUql3dSJeF90kFnGBjf2ecDfJI
	m2zI+i3SimqAzwpvorQmW2iZ3AbvXSe7a8/LCB+3F1yGpiXrOs6uOrALJ8ANhnCGMZHuFWPM+FT
	DeunmO3v/oFXo0i77FXriZgnx4Ci6/MNZDsh5aq1XjyasbQ1UZho/y9po5xO3cHwlTZp1EXYg2X
	6iR1
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr24449236c88.20.1795762951332;
        Thu, 26 Nov 2026 23:02:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 15/21] gspell: upgrade 1.14.5 -> 1.14.6
Date: Thu, 26 Nov 2026 23:02:03 -0800
Message-ID: <20261127070211.2329979-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133342
Content-Type: text/plain; charset="utf-8"

Translation updates only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gspell/{gspell_1.14.5.bb => gspell_1.14.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.14.5.bb => gspell_1.14.6.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.14.6.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.14.6.bb
index 9e4a597440..c0c3e39dcb 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.14.6.bb
@@ -12,4 +12,4 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 EXTRA_OEMESON = "-Dgspell_app=false -Dtests=false -Dinstall_tests=false"
 
-SRC_URI[archive.sha256sum] = "788783b56fc3d03283b3aa29302d0b958aeca88835e10b1ec61f19e0efc7e8a4"
+SRC_URI[archive.sha256sum] = "d02a6f1ff3cf324798f184062a6777302ef4b325deab277d8469d3816c69282d"

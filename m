Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.18209.1590941821821908501
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GmAFZVLI;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id m1so2377801pgk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3/8urO7toVgszGksN1+vR9O/V45CnYZQdJ7Z0IRBVLc=;
        b=GmAFZVLInekDf7mmTdSfomgR9Qz4ZxgMXyhU/QJQ/rfi8J/auhFG1HSObZrw6uQKff
         T9dSSlRyNL9a/orZnKIR99HNzeFpXFP3oWEb8oUQdHUM86mDG/7/1tytVeRTWuN7rS2J
         j+jCuNyW8COryeJpj571aCbWKkxEJVw59R2/syAGNqepWpCQD8wHUOeaqjVtODq52ZU5
         EFoDd35pFOHDYEDwnZLCLXrihdEufN2HxwD9AWEvNNYh8ZrRCk9PSpayImE6TeEx7Jue
         kdzupvBZYSAO1mqbmR/NqMOMSzobqwevHC35A/pxBFnSvXJGmaejdHbOvebwyUcgNhj9
         2wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3/8urO7toVgszGksN1+vR9O/V45CnYZQdJ7Z0IRBVLc=;
        b=bFYz2iTMY6bT14G8Dgh0NCe0sR3lUSZm6As9aw0MQzhjR/KFL2eZLqUUcKqMgISH91
         08rIa2hUdfyPzm0l0MN/39IaMwmy2L0aRBpcR7++s6LC6XC3iuJpXRSOtuRXBOJUQmWL
         PDcIia3x+6SYLk67lNO5zm6SxQLziSlWyjeXoiImFum1QjTIPe7EQa91HMye9R3+XLEs
         3zB18dre/jl9tfstyHbh1nMPmQjsPlXu3R2xPs6kRbAk0r6EFTasvri9e9yDGSOswxIO
         bK6jj3BEKMKf0llViudV2M15WtbgwcK5DCXeEmkDZAjYJjr0bbFhYo0fjqVqt+Boxh+F
         vrzg==
X-Gm-Message-State: AOAM533Di7kriOG6TEVWfsLNIVkxV23ZNqT+C0uhFWkI7I1J5kEJCs8/
	QpQ7l+MSrKrHC90zfKNYpXTKtvyV
X-Google-Smtp-Source: ABdhPJwREq2YjnPDKSeZ/GPrr4cxVvY8W49U74EQNpIE53JoAFpmR6eCf/zpFdPseHw9Jni/FWvwvw==
X-Received: by 2002:a63:9513:: with SMTP id p19mr16588599pgd.101.1590941821166;
        Sun, 31 May 2020 09:17:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.17.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:17:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 31/35] tremor: update SRC_URI as project moved to gitlab
Date: Sun, 31 May 2020 09:16:18 -0700
Message-Id: <3c79f7f3ec20616f457289978acc777854979b2c.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

It appears Xiph.Org is now on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index 28bb5d924a..6abf6080bd 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.17.1


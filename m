Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3586.1618693588187980410
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0o1zzGj;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id w8so17159256pfn.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ofKwgL5r86PZ/k062TD4Eqv6ZDuZZU8Y0zgHbBhf21Y=;
        b=h0o1zzGjXA9jVA8PtJ0o6jDSsMwh5CEbyQ9Jt3GD1oragJhvV4piZ2FuC7U9A2PkbU
         ZqH6KPVbNXLwImqflGzNtbFGeg6n9hbaXv/OxE6Z/inzFlMr9NyjMDmFlsoah66qDaSd
         BCS2CvbVplbri/Cbs2+ojRrc9GprrscPGSs82LTXJnsUWsaF40EVgeurBX3Zt4Usafcj
         Y3zQWSkjsOamSb9tB6FJiobgjOhuT3am+2jjfzr090jeiFDKt6oQCBU/EBQyp6TUQdRJ
         yjbRc/cCe9hAIw+ArodyMio/8sKNh8ILjWqfaFJ55NBMb9AACGdBEv2k5cqvdXoc6+2f
         9rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofKwgL5r86PZ/k062TD4Eqv6ZDuZZU8Y0zgHbBhf21Y=;
        b=JDvRso5hDhKv4MJtBK95UDGGs+KTmGc1eolYSLbxwfXmEUlKwWi4VtljUqICC12iCx
         +B1ezxYoHACGtcTHfhxcdCfYBPWEC7QF+/wdvf8snb1gHw1tQYI9fjfXmts6Sc6WuQ3B
         JgRuG4HBBQv+kUIbM+StTiRQsSGBzOhORz79dB8PBJtH+m1KKvD37p20WM3ySpKGh33w
         SFxgt0UcV+WLSPKWgtBa4eiqD1IC5pDN+M9Hjv/HoegPMLFAKD1vOBCGLUJyrQZ3TNER
         y/5//ZHESm6LQzGNA9Qnho/xdBkHRePfS4+WmgdkAmAkueHxRLX2WNcPg83dz7uoo+j4
         79nQ==
X-Gm-Message-State: AOAM533ALTL8cXOQWkoVnWSODk64q8piX9E3To2CGHYgUwVZ4dsQxFsZ
	7BWj5H68RPEqIEAcjP/gJkXIyz7Lxz6TTQ==
X-Google-Smtp-Source: ABdhPJyivU0s0AwmmW2bRWFLVGxdd0h9YWYFsD6vLvO3EzoNzqQiWiegooIZIIS0C7alOK+93xOq2A==
X-Received: by 2002:aa7:8e86:0:b029:25c:876c:1824 with SMTP id a6-20020aa78e860000b029025c876c1824mr3300211pfr.10.1618693587664;
        Sat, 17 Apr 2021 14:06:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:27 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 25/50] catfish: add python3-dbus to RDEPENDS
Date: Sat, 17 Apr 2021 14:05:34 -0700
Message-Id: <18550097f98b645aa59c739d0ef67a6589388961.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Otherwise it complains for missing import and won't start

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4a85e070e199ce66284904e1b22e58440674e945)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
index f0391cb2304..44a0524882a 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "1f6facee57a659af560f06024ca6f98aa4d638bf57a8bcfb613b4dc70f
 
 FILES_${PN} += "${datadir}/metainfo"
 
-RDEPENDS_${PN} += "python3-pygobject"
+RDEPENDS_${PN} += "python3-pygobject python3-dbus"
-- 
2.17.1


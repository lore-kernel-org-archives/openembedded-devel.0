Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C745C27C43
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3090.1716315030234051887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwEzpP5a;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso3505405ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315029; x=1716919829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRtaQ5HluQak9rMe3/ErNqMR1MLJzdOvV0Adr+bdlFM=;
        b=mwEzpP5aBCgU/EoEmnAHLfILrw7GV8XyavkedDH8MZMW5VD5toGUjom0VQeZM8/puf
         El2YVRygkDjoz02V5Vbnoly5pFrJs6q+CBd/GjvCfnNWfjF1ooiAUqdpeja/Hw94gxt9
         Wqtx1DpI8hBW5MM1XGYDst/VSq5nHIn8/TRnfh0F4M0hXlKFo5CA6e/tViyLsfiVcXMX
         9EXSncBn6S6nCsCWEqRc56QO7YFVscNjEeN8wu7NbVU0DB3K48FqvkNZ0h78CMgKA/Vq
         difibpho770ogjD9gswrCAWRDVi0PXnF9F06ok22Vhz3/KLRBzJsc8vJBkeXSrmWc3yb
         79Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315029; x=1716919829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRtaQ5HluQak9rMe3/ErNqMR1MLJzdOvV0Adr+bdlFM=;
        b=bamX/J9i6jqrTNG0hX6FNlaX6j80zs3GLDDMZFS3HMPf/2Xlv0d6DHlGURxzZTwahk
         OUEuA80sHDiNnKUkhTNC9MLmYuvHicYz3BCIme66YYqZwPY3Zh/fo6ysyOofAdwMr3kC
         AFdvJOyCv1g5zcozowM/PuIaRE9CM7EcUTEGX/2QM5kEa5C28Fsccd2waSk5scgyDDFN
         LU+NDC6ht/3JVWpsMfa2eoFudaFD5Jtqn+Jo5R5pnjOyy0n5P3nsU9QXteNMTrKcrz0S
         2alDrKPdSJNTutalA7qrgVCJ+A+N4TaLjoPuZ9PDCO8RqMnP/tt1dusUFyFXxxttShUn
         McuQ==
X-Gm-Message-State: AOJu0Yx+7geL2zOrz8V8v0ME4vlw5yFA1VshDXfLk1QZfAM3TnJhrXsn
	JkHUQvQjpSSPVqEUr6yIZKLZwVqlXZI+Uzo9+5q+144WLuzHffxh4yFl7Tn+GV8=
X-Google-Smtp-Source: AGHT+IF2ULkei/IFrSW3DnjrogOajxMm4qAZdT37soSdc/67LVgPOJmp2SgIkdC0YAYowg/CoSoLQg==
X-Received: by 2002:a17:902:e809:b0:1f3:695:eeda with SMTP id d9443c01a7336-1f30695f16bmr58094775ad.61.1716315029415;
        Tue, 21 May 2024 11:10:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][ 03/22] xfce4-notes-plugin: Upgrade to 1.11.0
Date: Tue, 21 May 2024 11:10:04 -0700
Message-ID: <20240521181024.426176-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110452

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-notes-plugin_1.10.0.bb => xfce4-notes-plugin_1.11.0.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.10.0.bb => xfce4-notes-plugin_1.11.0.bb} (57%)

diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb
similarity index 57%
rename from meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
rename to meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb
index 8c9768b1e3..0262620e6c 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.11.0.bb
@@ -7,4 +7,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf"
 
-SRC_URI[sha256sum] = "2ee4406042edd352a91e166c83b60d13220ef04dce3fa6b9e0eb13636d636929"
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+SRC_URI[sha256sum] = "eb38246deb0fc89535fa9ff9b953c762cece232b5585d8210fab9abbf282aae3"
+
+# Add /usr/share/xfce4/notes/gtk-3.0/gtk.css
+FILES:${PN} += "${datadir}/xfce4/notes"
-- 
2.45.1



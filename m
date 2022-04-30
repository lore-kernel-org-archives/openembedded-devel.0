Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A11C43217
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.25956.1651346310015703196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R48s9WUz;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id p12so9516048pfn.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gvw4Po62G09h/x18w4ppalitlS6Q6VhcjJpKQgzkSdg=;
        b=R48s9WUzrtwwfeKTOqVc2LmQiSqm1O+9BxjQMTJ3rT1FVK8gGT1ArEPMs2ppJuTY6u
         D1/WEHvsbTMyT+neKQx6rVpGgytAC3LvyeX4e72DSb58LVuqu5dYFScYC3vy6EBMfvry
         zBC8thcKRlKBDAauPyyfsSpf+ot591+tiJQoT+xlbSPOdfvDGW7ulUVuctdVuhm71MDM
         E4Lep03TtvmPcYoMQ96k0PSOJmIOZZk8h1vFeL+Ux9Dyzv32p+r41qkBnT1CA4GBHrC6
         5EqoNPCvduMKWIS7ozE99ZZLRxDUe+0ejWOzP45G+x/veiqQcgJB1+LllWxv34ihKO5f
         84hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gvw4Po62G09h/x18w4ppalitlS6Q6VhcjJpKQgzkSdg=;
        b=xfS3EoFzly4UNW9pRvbLsLm7yJUwzA0+bu6m99tWFOy4nKNB2O2fR7Lh84zu2OFXfH
         kDtZi0qw3UsbFFbHGaSzn4HsZEKIZCiufVpVlZh+kCIqZ2hEwsh0ywNcchue4CCLKpmN
         0Aaq+MermFnqY9ZHEUp1DBTa0QrWAqCKjYi71JZ1Gqr10SXvNba3r+TM7WFtO4L0z7Zo
         eliBwfhFJFEjXyGLFrCjZu229+qpkVserIp/4JKv3fRES4VE0v38vrYpCmlR4run77jc
         3bQoU0CLlBYcly2shwOaFNqKUvmh/HG//C5doXuewumUK5+rDg+gp7fMrxeI+qjU9Dz1
         y76w==
X-Gm-Message-State: AOAM533NDWlBsXK5AQB07192BMvXt16zKmq/e2FYC5sHMFtJUiC6Eq1o
	k3OwmTZnUvK0je6obDDftuIANbYn96Vn2Q==
X-Google-Smtp-Source: 
 ABdhPJw42ZdSYcGT1aaAAxDLDHZAV2OpR3eqSFenLgVNrslVhtjR061VrblwA/qGdarDKrIS4Lrc2A==
X-Received: by 2002:a63:fa4d:0:b0:3ab:7a48:b2b7 with SMTP id
 g13-20020a63fa4d000000b003ab7a48b2b7mr3901886pgk.519.1651346309154;
        Sat, 30 Apr 2022 12:18:29 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 03/39] tcsh: Do not install symlinks into /bin with
 usrmerge
Date: Sat, 30 Apr 2022 12:17:43 -0700
Message-Id: 
 <d31f2ac68bee153cef23c128fc19a90699b8d651.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96870

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e059bf5da05dd895ac5fde665f283022ad5c59d2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
index c4da5cd835..f7282bf1fd 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -27,8 +27,10 @@ do_install:append () {
     oe_runmake install.man DESTDIR=${D}
 
     install -d ${D}${base_bindir}
-    ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
-    ln -s /usr/bin/tcsh ${D}${base_bindir}/csh
+    if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+        ln -s /usr/bin/tcsh ${D}${base_bindir}/tcsh
+        ln -s /usr/bin/tcsh ${D}${base_bindir}/csh
+    fi
     install -d ${D}${sysconfdir}/csh/login.d
     install -m 0644 ${S}/csh.cshrc ${S}/csh.login ${S}/csh.logout ${S}/complete.tcsh ${D}${sysconfdir}
     install -D -m 0644 ${S}/csh-mode.el ${D}${datadir}/emacs/site-lisp/csh-mode.el
-- 
2.25.1



Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.136.1620745189531596913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 07:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THuZ+eS1;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id l4so30224165ejc.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8HESEaKs5AQAnE6yVl/PFzBXYVd7ANB1WjMLNcnFns=;
        b=THuZ+eS1G6abl3YzoL0aOuAwI5+fgEIFM7tE2nuYZgMdwIzKXqUuLkquy2BL49WYeO
         Dybol8GC7UkmPuk8Y7DM33zOaXju98wvyylFiVW7fggW/BvPSwr9GZRJuWiXJFDMizSe
         0A+Sy+RsOO3+ze/w8/Mp8RTgXBFagMzVvVKl4jVofXlXXjpO32I2ZltNoUCpApKF16Cu
         CcBeLAe3TeZW1SRH5Q1TBkeItcZbC6GTTrRRBbQUdBTuoIIQ8OSsj9ofhKovkUl//Ka9
         dVhAiZcMxUkJFLk3Eep9mVDdyGAzDvDcl5ZeXI0Ljj83i9paW6f5pr5bv9R73jjT0aRP
         4fNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8HESEaKs5AQAnE6yVl/PFzBXYVd7ANB1WjMLNcnFns=;
        b=BAeDg458GUH0FxlfVwz/uHjt7+QpNSNx/T/qw6w9t0e4bA4Xjy+nlJKZJVTO8Fv65n
         QEg7HjSFzIoE5auGYpnDLS5XrfrkS0bPjAd9MBdL5Hd+NPvoKBbBfWrUH2EcBJs1KGyC
         v/Xvamsrchh94XsACAcPYPRrU2Cn77C//uaf1MCBEwc2LUnd/5tony8CZ4WAPuvs6S+F
         73I0UmEsGzOGtgf5myzAXHqf4xo6q6unxJ6QPyLIViXH2HrDa8+oY/3b9NFmmVLqSNx3
         tns1Be9upbYRVrrhgAkaLCwsRDP3LNeXWFSAKh2hi1WSjX3Yny9QcieL4g3P/fp/LiqH
         ZE9Q==
X-Gm-Message-State: AOAM531LuHaN6m4bDIlQFNvwCJcx8qno+dSTRHNDl6tAfgj9F+CtSiLL
	bcP83UFRmav0PbEyd5bl9qB+XEwlG1M=
X-Google-Smtp-Source: ABdhPJwVgho7mqASI3LojrU0sWmQsynrWXo/Za0aQhSsvvgYkAHcpnlBSSnAu0lOqH1RTdSc7AaFSA==
X-Received: by 2002:a17:906:d9c1:: with SMTP id qk1mr27151806ejb.412.1620745188138;
        Tue, 11 May 2021 07:59:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jw9sm4096004ejc.48.2021.05.11.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:59:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] remmina: make avahi support optional and off by default
Date: Tue, 11 May 2021 16:59:42 +0200
Message-Id: <20210511145942.980276-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This requires gtk support enabled in avahi, which was
disabled on oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.4.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.11.bb b/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
index 215c04a22..38fcf45c4 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://remmina.org"
 SECTION = "Support"
 LICENSE = "GPLv2 & openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
-DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret libxkbfile"
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret libxkbfile"
 
 
 DEPENDS_append_libc-musl = " libexecinfo"
@@ -30,6 +30,8 @@ do_install_append(){
 }
 
 PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
+# Switch on gtk support in avahi recipe if you want to enable avahi support
+PACKAGECONFIG[avahi] = "-DWITH_AVAHI=ON, -DWITH_AVAHI=OFF, avahi"
 
 RDEPENDS_${PN} = "bash"
 
-- 
2.31.1


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3888.1605344618903220809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 01:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UJWAduEH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 10so17292447wml.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 01:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YZmrHiUaxbX9uFe4kFBq2DwDfJv6Kmz/iMrk/aJ0VKA=;
        b=UJWAduEHrGOekU8k/jytaHlgY9Uff9fUKbv63GKTJ07bQ0PhOAf8BzlEnVNMS5umy1
         cVhH6aNcOJwBMwItZTt1vLyKsJFEQgSgArNs4jrkuVw7Hr2bPD86FYNyWOEG1N7SZGzV
         IORqEWlXhgXRfKrDvNs+XRkhEKohXm+7TrlekxG8ht5hKOziXkr1wYp8TPmZaMbwMHOa
         hx3y9YmnUCYgCVgrTZBDqEGzZrMPh7rE5Hh0Xp3SRubErv5HFMXCe+J/+IpZiVtSLcL5
         SHoJmty92KAUig7ml3c8mglSduuCg+5m/oGpHMEFGHuWQBDXLkHMYIO9Y5twPXEDySIu
         imaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YZmrHiUaxbX9uFe4kFBq2DwDfJv6Kmz/iMrk/aJ0VKA=;
        b=tXO8BhV4mgTzhUPdVUE5v15uwbBaHCGQrfBiH6uCvrmxvPE6jB04B/KY5O1RwMrIlD
         2v7ALQERGFn61cWOf9qJo6qKJ7fgxSx7/07Ocxp+cppqFYPRM3MObFP701+RNAmNRrJR
         KSlLHA7WADd49xufpEzH4T6l85QceORqsYRk06K97S5lEdP692Xf7lMOxzF/WNKJRMlL
         AjqktLwHgsZkbq8T7Tc1vVL9WmXOkYBL44bWF/CTTaPf12PRxvc2txAjE1WCRzk4gVlj
         YDwvgyFwT8zELygdab9LrYGKFsGrZMXuUrF0dGzB2ps30h+UmoPZFSBSszMbqmnCEa0M
         jvjw==
X-Gm-Message-State: AOAM530OLcdP7XYRcVuFgLWGCw+pxzlwZ1nwNvgQMQNAAs+1MJAfBQz4
	X9QwMSiWIE1Q2iCc5MkS9Mv6/mE+sz8=
X-Google-Smtp-Source: ABdhPJxYm+aI3U2/neT5j8bBYNNF50pcHxnozV54BVpfjw3dth7BFqw2GM+oSeKQVr3oXR395zZfHw==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr6068986wma.158.1605344616938;
        Sat, 14 Nov 2020 01:03:36 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y200sm15051094wmc.23.2020.11.14.01.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 01:03:36 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][meta-oe][PATCH] remmina: use git fetcher
Date: Sat, 14 Nov 2020 10:03:32 +0100
Message-Id: <20201114090332.217238-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes QA recently backported to dunfell:
  WARNING: remmina-1.3.6-r0 do_package_qa: QA Issue: remmina: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index 5b663489f8..1c2f270e32 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -9,12 +9,11 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium li
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+SRCREV = "cc391370d8b4c07597617e0a771a9732f0802411"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https \
 "
-SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
-SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
 
-S = "${WORKDIR}/Remmina-v${PV}"
+S = "${WORKDIR}/git"
 
 inherit cmake features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.27.0


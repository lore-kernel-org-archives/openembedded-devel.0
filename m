Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7285.1586164855538210444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mm/sA0qV;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id j17so16433364wru.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tkI+OTALxtU8oM2MSHWKkHQB4lC6J8DDeFlqLdmaEck=;
        b=mm/sA0qVdmTNWzPkfRFCJgMhV0d1z6tKhvD4ExrdE+gHmUTdNbxJTORWe0BeEPT4n1
         k55Je66MEpifgOBxVO8OP6/zZVq1HVRBc/keVDDadUVEUAT9c7qOcVikaxjvdqKEYD2m
         ReraEdRJQ+1v0HLsnbFXLLipMUPp139XTauPEIyhGFqbjHbnB1F905ahKXC/sPOZcpJ1
         3Nn0WZn+v5ZDjEhYFS/JmlSPymQAWtBxIgERK2V6OMUNC6rql+IeGMUD8923NkwWqSlW
         5brF1mMVUoxGxD7VAMEv3IsVwx7AOzGN45NvmCEPPyuL5ioseystb81DiiDW3Nasa5Vn
         MLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkI+OTALxtU8oM2MSHWKkHQB4lC6J8DDeFlqLdmaEck=;
        b=oybY8chhym8iWUsM313ve0a7dpo0mqKu6h0XjO7mLm9TifKpU2+l9qOe8TJ+TeZ4vX
         WpBn633CGqOOtVufmifTHxTElDuLVn7TAMWyMCnUE79CfASVVMepYc1LmiNrvMFIA+8y
         KjNiDR8rfbJANfwrcOPvwNLqZ5Mxp33rlyL2pnqqR7e6vW1uxaENQdefdOOkQDg8f5En
         uEBIz7622dDZjAdBqNb7fMaIt/5m8WxuDcjq2CCPJG8wjO5zo8pEPGLHw9C+B0iwCQJ2
         Q4+VEYRWni0ErHSMADuuVCzeZIzwKxYu6XSyljL16FVQcNJNGvxYQ8+QwSq5TOXMImOo
         8unw==
X-Gm-Message-State: AGi0Puby62q7wGHM+uzFgiCcInaM/zfpMqBC0Sz0kxAnzYlbXCmLXSpQ
	nLPQYU0b1aWq5oM7IsvN6qi0sQBthPc=
X-Google-Smtp-Source: APiQypL9ifk4/vCe87M9a5vyCCURWaxoOptqxoqn6rSdfhsPRk7rxJ480L51QBfOvVK1ZtKAMOD/tg==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr23045327wro.68.1586164853973;
        Mon, 06 Apr 2020 02:20:53 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:53 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/14] geocode-glib: upgrade 3.26.1 -> 3.26.2
Date: Mon,  6 Apr 2020 11:20:30 +0200
Message-Id: <20200406092032.3574-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.26.2
------

- Fix build exporting all the symbols
- Allow GIR generation when cross-compiling
- Allow unknown parameters inside geo: URL

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{geocode-glib_3.26.1.bb => geocode-glib_3.26.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/geocode-glib/{geocode-glib_3.26.1.bb => geocode-glib_3.26.2.bb} (73%)

diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
similarity index 73%
rename from meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
rename to meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
index dc218f3a3..c0f3c27af 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-SRC_URI[archive.md5sum] = "21094494e66c86368add6a55bf480049"
-SRC_URI[archive.sha256sum] = "5baa6ab76a76c9fc567e4c32c3af2cd1d1784934c255bc5a62c512e6af6bde1c"
+SRC_URI[archive.md5sum] = "e1ef140a11a543643d170dc701009e39"
+SRC_URI[archive.sha256sum] = "01fe84cfa0be50c6e401147a2bc5e2f1574326e2293b55c69879be3e82030fd1"
 
 EXTRA_OEMESON = "-Denable-installed-tests=false"
-- 
2.21.1


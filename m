Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8941.1623133349649576072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GCXDDd5C;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id r9so3462002wrz.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6OQSvBy0Fppiy8YzW+0ceLpbU/vanhrsFM0nq1sfcx8=;
        b=GCXDDd5CPbCVLKJ+CrT/cCW13c/rM70+iDF1E+HKs1cunn/IjG3cvPvWQx2z+KTl3e
         JxuEHLsSa7lUL8lXabIqsGE0dO0Gj2BTxnwTSumeayff7OZJ5ul+26bw2W2nwVlqgLM8
         KMYCq8IMu4pTpdtT4dEAFLTdN8u7zcaJFK/BN2pKcfbxR4Rrtxp2zIAUd9CxuUGFiUgj
         5Q8Br0eIWGiyKgsV/esjPbWILRvoz5i4Qqj+63m0CU8IelJnOitll8A1EvUp1xiC9Q1H
         Rp1+PgpMSBi4XEoX/JTSZw7XbzDzvJYdWFGotCqwIxp4xMKUECJfENE4GoC3jQfvkRo2
         8g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6OQSvBy0Fppiy8YzW+0ceLpbU/vanhrsFM0nq1sfcx8=;
        b=l+NRJTyLq8L6P4uBbYn7MP3k1h5xJKo7snjUXVxjd3KTtYfPXZwigy925qWcaR8ih+
         ROBVFa9zsLSMIdZmZambAxDIvDb6Ja805MMXWsgvwIwIJnWKE0pCmttQD2sK3K8zj+Uw
         lBl7s4rqm+yyT2xfJDWGO1x094Z7Jf/LPHbHLOMfF9qN3y82sIWttrLQVbT/wOEjOMVw
         WCgfzGWgwzK4C5iUYWWo6tRxGlUMLrchlScbp4VMdkTfgUCkJwOkGjSbxQrohZ/sW4i4
         Fpz5z2cn/bDOVg4TiX/x1kIyVrR0Vo9N6NYWTr0PT+UyNN/aFYxGjvBK5nRN2M0vPuqc
         RWFw==
X-Gm-Message-State: AOAM530qJ2LFIkMlRzfeVDghmjz7c3ujV0xEIjuqzhfiWelQVNY9TzLA
	IgcdUd1mH/Y2mb3l0cVLNFfoAc1H/aCX7A==
X-Google-Smtp-Source: ABdhPJweXZZYAy+5dbxwKA7e7aM5hjwvcwuwuJGd69LUMQGyVGQKvZ9dKdvx2gOzyit1TqVKj3IvYw==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr21442354wrq.111.1623133347991;
        Mon, 07 Jun 2021 23:22:27 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e97639a19d79e95f79a.dip0.t-ipconnect.de. [2003:f0:7f29:7e97:639a:19d7:9e95:f79a])
        by smtp.gmail.com with ESMTPSA id f18sm16493969wmj.13.2021.06.07.23.22.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:22:27 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] metacity: upgrade 3.36.1 -> 3.40.0
Date: Tue,  8 Jun 2021 08:22:10 +0200
Message-Id: <20210608062212.2887426-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608062212.2887426-1-schnitzeltony@gmail.com>
References: <20210608062212.2887426-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../metacity/{metacity_3.36.1.bb => metacity_3.40.0.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.36.1.bb => metacity_3.40.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
index 0cb59cdc9..5865ca73d 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
@@ -13,6 +13,8 @@ DEPENDS = " \
     startup-notification \
     libcanberra \
     libgtop \
+    libxres \
+    libxpresent \
 "
 
 
@@ -21,8 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "d1171705829bbebd42ac08ec49a9a90a"
-SRC_URI[archive.sha256sum] = "11f07693e2b266840759063a4bc807346070e8e7fec8f53cd0757f6662c1b323"
+SRC_URI[archive.sha256sum] = "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.31.1


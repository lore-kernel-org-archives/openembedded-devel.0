Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.591.1621121953772497626
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J4czel/I;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id s6so2596177edu.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kxFnOdoA4b9565hovf3ZppiIr+nvTsWiBWjh29x8oRI=;
        b=J4czel/IzP03uH0CBr1gdCFQ6eU5oBc/I/S4VQfJRqr0wqIwVmu66sn8HozZvNRNqs
         Bg98HAd+v3/X8LbbIdLdzKJobwdiNDk2HEC0hlCd0OMxuu/8pCjwrXxbUZyTWLqHo6iR
         v+BypOf8QnUXhEgsTFVKBz4rw0JE1x37QGwwxwUq6ROnIAOsY8uFNHmziCtolN+5x2Fn
         ElBOhHU8tl8gu1taq6mje5YlW0imFPz96c8RzO0XLTZmgk+hUsFWARcpLr06tKXBG8mD
         upr4YGmcCmBDrEpn7hq0i7PGzAvojCIFyBl+150JcQBresUGDwpcVJXZkNBbqehbvRc/
         Du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxFnOdoA4b9565hovf3ZppiIr+nvTsWiBWjh29x8oRI=;
        b=q9MOiqZ4sIlcY4d5AMLyVo1i+WNWB7J78BhnVq7RtZg6LNawM/q6B3m07BK/2Z7eDN
         fW496YwLzObDFSzcG+A9Yu5QZdNSIsBy3e8tMo8Lw4fB8KZo0jI/gDZP/JRQSCEksQ3/
         fGST2Mj6xCqBzPvbW/wETcGlrq8Vc0PVrmox3B6qYXlG5DD7M6WYRnENNU3yVYAHrEok
         7q7WaRf0Pe0DBYeWugJVMWwdBq/pszg6Lo5dSZCHWEs5t74gVse1aWynvaroxHgk8RUq
         BDj+VszWYp0hqpjnWjA/GpFUiEwROuDL+eiicV43z4D0vceOQ+L6RaYlw3Ru+ZQLKLT4
         qxFQ==
X-Gm-Message-State: AOAM533cvB2QrHXVmpmchqjum8lWiXyxwWr+70lV6e7ntDAUOyMii/fB
	03DMeFLG2Bpbyc5rieFn+qlE9IKf8ps=
X-Google-Smtp-Source: ABdhPJxc6MxH529R4NpfObVv/h+wwy3hRR8BUjA3/ICmAgXlCLeZ/2wQcprX080HsQ7W7eM9YZ7Xpw==
X-Received: by 2002:a50:ab5e:: with SMTP id t30mr12832392edc.50.1621121952447;
        Sat, 15 May 2021 16:39:12 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/20] gnome-calculator: upgrade 3.36.0 -> 40.1
Date: Sun, 16 May 2021 01:38:42 +0200
Message-Id: <20210515233853.583490-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...gnome-calculator_3.36.0.bb => gnome-calculator_40.1.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_3.36.0.bb => gnome-calculator_40.1.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
index c250981c4..5e6982714 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
@@ -11,6 +11,7 @@ DEPENDS = " \
     libgee \
     libmpc \
     gtksourceview4 \
+    libhandy \
 "
 
 GIR_MESON_OPTION = 'disable-introspection'
@@ -21,10 +22,12 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext features_check upstream-version-is-even
 
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "71854fb58671b4a88ac990e2f2439e4f"
-SRC_URI[archive.sha256sum] = "a2e830f9c9856fad65dad1d6c0ae6abad0f0b496c9984ac005315c5cc4220db3"
+SRC_URI[archive.sha256sum] = "7fe6c561f7b1f485ac106219772e45cc135c983bfa4278dd2d3fd83b57ff6af6"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.31.1


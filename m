Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.48762.1591047932623123095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WMxfMNRE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id u13so947355wml.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H4GV5KMbCYExJEs8rQyCMt4WP6xHt9ORaDbO1Yf8O2A=;
        b=WMxfMNREYNC7VocactHAOqxFVrA54C50buBF7oojRdNEBR3uKe/38QACrrpQEbXQCh
         Kv9qDgl5//Fp0fPgr5vx4sgaf6/D7ZYFT1NhNYAEsFHNjdMAUBFWiYM4tbM/wY2ioUHe
         eEt9MeTUM5RHG3hW7PSsqqMhoZ/Xnc+NeApke9E/+RIfVbYgwABmJUbCqLV3/QnsjAnM
         rUq+7Armx9ULyu/OI0NDx8X9Dy7zC/ATr+amb3CZfN/W1f/e87lC/cPk4g4+XB5e1QiB
         VvI36fhEh0idyUKU+LjpRQiG+OnKBime6E6mUJ44sqh/ymZS2z64OysTjtZ1fuqAnYdV
         mxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4GV5KMbCYExJEs8rQyCMt4WP6xHt9ORaDbO1Yf8O2A=;
        b=oGT9Q6RZLp8AZsm6yPDFv/UbLdmXkSYCi4+HqWyNBm6wR5lX/l8u1ujhH6CrRHhQ2R
         mQVQSYqRu5LiJCHnyx3qFwksC0bw8z43J4MbTAfXf3gLNgl0L7lj/oON3ehM2Kj51hy7
         e9auJU9ihaZAcAFerz4rV78yvLh/M+jYVtsDhEwhQqCPzi6lmxa5qVu9ExwXjTTfwkGF
         IvwC9yHzIi7dTRLI/G5JHTPj3kl6h1wduPpafTxG1FfnctMN0+rOIbU1uv/FFFWvCkdn
         AuHh88rDa+PT8pjjGASYLC0b4eqHcJAKyzIy+ckAVVEzLG9xtrvjlZXjXX+qN0uz/1a6
         frTg==
X-Gm-Message-State: AOAM5326GPs9TUcw/7FB/PAl5U8SwuUnGZkQkyK1hD1NAh6zACCTNBxB
	mA/CtzzaU35KKdNs8I1MfOFcDULRA6U=
X-Google-Smtp-Source: ABdhPJxLwsKNE/8NK04CPHDmt3RFWFenddIIntN/w28hlMwtVajl/0+Rq9n9mB70CaGrV9lqr13C+g==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr1084230wmj.153.1591047930629;
        Mon, 01 Jun 2020 14:45:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:30 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/38] libgdata: Change PACKAGECONFIG defaults
Date: Mon,  1 Jun 2020 23:44:40 +0200
Message-Id: <20200601214516.26624-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* goa is required by upcoming gnome-photos
* both consumers of libgdata (evolution-data-server/gnome-photos) depend on
  gtk+3 anyway -> no extra payload

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
index 25bc202ae..9ce8bb8e9 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
@@ -21,7 +21,8 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
 }
 
-PACKAGECONFIG ??= ""
+# goa is required for gnome-photos
+PACKAGECONFIG ??= "goa gtk"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
 PACKAGECONFIG[goa] = "-Dgoa=enabled,-Dgoa=disabled,gnome-online-accounts"
 PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
-- 
2.21.3


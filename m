Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.8198.1588332958494683233
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qM6ojYzK;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id y24so6045959wma.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n5V0q7+o+8XoomNZqH+5RldfgosLE9fnmPU4/WB82dc=;
        b=qM6ojYzKC7a4C0MD4ATj19vASqqatu4kEzJlYGN0b6bvtEx1okkT+oQp75qj5bklvR
         JxIvl6nr7QQIYoPNgcf8m3H0Cdn8wKxogQ6X72XqRmQT3R6sIHWCujILSxd8r3p+xFB+
         6vZBhWLZWK68G1ov84kPFrqIBufG+LRvyBkCqv3G4WTa+KVUp2NLAO9/8gQnk5bC2Hw+
         /4C9y+HIk+Z3h/aJWn7bgPWNzJzBQPEGIqzoGlZTUnJL2Eq50gM85iXjMFmk6Kx4UiSO
         E0kphcJ5661y/vD5YYL7d1e2WKtvjtLxmHSg9bSGmMpi+bJaZNrox45kEbQvzwwurZIm
         h3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5V0q7+o+8XoomNZqH+5RldfgosLE9fnmPU4/WB82dc=;
        b=GQRqRYj5o9JU055n/RHE80ShudPD6KtMCoLAWMW5VEB3CmodQNiLQpUzhf9Bl0FPe8
         5XrBrjEiyPPpzUg8DBqlFmWpX0vjypRj6Yx6nP7QU7Bd+N9ayO4ltNybq6GnST5c18gW
         kqIwuzKOOGywR4sia5D2TV/gQ2kXwUPsXhiFahglykAcnJ5eCwK9/Y9HrnryCI7VzkOD
         MdPxbnrAAglKc1GuGliCELJ7/qhRmsVUwRp6waIXJnV3gz1N0dSsQBaX3lzi7ABbbndW
         ywS0R28OaTba3ExweVXRYq5U4O/MTxz4FyClV0I8UHBsCLZ/fVjfgHBPr/vC2eC64x9/
         jRyQ==
X-Gm-Message-State: AGi0PubywBz5qkF/jIl8rF3lwXNQo6hPcVHvTx6jcux+r9nIhbJzygoR
	RHm9Znkm4ylDaumSENcW2HrPJNf/
X-Google-Smtp-Source: APiQypLIb2deEVd35e+zp11OkVlmRtm2srCEOmYfN/6cXvHE1DwOF5d4syjBkZi9yWbwGzp1Bp2j5Q==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr3604705wmc.69.1588332956825;
        Fri, 01 May 2020 04:35:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:55 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/10] mutter: upgrade 3.34.5 -> 3.34.6
Date: Fri,  1 May 2020 13:35:31 +0200
Message-Id: <20200501113534.16030-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.34.6
======
* Fix various clipboard issues [Carlos; !1198, !1203, !1204, !1186, !1206]
* Fix locate-pointer feature interfering with keybindings [Carlos; !1014]
* Fix overview key on X11 when using multiple keyboard layouts [Olivier; !1219]
* Preserve keyboard state on VT switch [Olivier; !1185]
* Fixed crashes [Florian; #1083]
* Plugged memory leaks [Sebastian; !1001]
* Misc. bug fixes and cleanups [Pekka, Laurent; !1209, #1074]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mutter/{mutter_3.34.5.bb => mutter_3.34.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.5.bb => mutter_3.34.6.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index 00b89dad5..29b9fc62f 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -22,8 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "4a16dad1d93d5e1f81d555da35faf0e9"
-SRC_URI[archive.sha256sum] = "d1d149b70ed7330771f4524886b98775fce5a11cf17f9683cba151075f2879c4"
+SRC_URI[archive.md5sum] = "20913c458406e6efa3df005a3ce48c8e"
+SRC_URI[archive.sha256sum] = "23bde87d33b8981358831cec8915bb5ff1eaf9c1de74c90cd1660b1b95883526"
 SRC_URI += "file://0001-EGL-Include-EGL-eglmesaext.h.patch"
 
 # x11 is still manadatory - see meson.build
-- 
2.21.1


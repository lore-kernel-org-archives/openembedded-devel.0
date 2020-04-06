Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7274.1586164845135160585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oOOtvr/H;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id p10so16507654wrt.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OLrr7RSWIEa+ny1uOgvii0pJ0s0DtNlVJsTIQEDvRAQ=;
        b=oOOtvr/Hg8vFxBKelaCNcM8NaUKdiMnsUmWDkDzQTLB4hD2uxb2e4WO1xAxLNK9u8h
         LLJHFjSsBhEn02LrgA/7LIxq0TWpAhXZLoyq5tDtriK2il6CnXkpTFk5BntQ4goeRLDo
         qHpzT2E+eOZqlANup0uRqOWTAn8jVpIrQ2qiQSAa2Q4DHbpZ0UYuyNf2EHB5I7RsAnms
         whkBqlbF6hxI0P3WpEDCD0gNvZSLF6ZWy1ZZeiPeX+vnN88ZWhidTeSj1j+e6HSyqAq1
         IPKlj9CcX8vJ5ZRBt9VVSCAX8KGPeaQPp9f9ZKZR5b1eUlvnIKOETsZk4ZO5Pcb7BUdS
         /TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLrr7RSWIEa+ny1uOgvii0pJ0s0DtNlVJsTIQEDvRAQ=;
        b=Y/C/lqgufw3Wlin1vBQvge9Wo5h4mMIV5RTUwkf+I0620hoMqFzpijRy6/TDY/Tr1Z
         dqwGdqy3R2iqihJXS0gIT8fKY2KBEGP4yYv2GxiUv/Bahp3RktY0WUqKoJNNv7ycG2IX
         HndTsiekpBtdxBB9JPVw7vOv8CszlpLROWwFNOHvC5DPs9RCP/ZdvYJpyjIAVwkH0bMS
         aytJX/KdT4qKQMAUke/gHzluDprXLoY6K1zH3xC/H1bBgySKEh9F+AXhnHyVUwTfiCVT
         ie7ZfUL/GFWESUt8vErsZ9x1USJjR0zLAwN/kjxYkp00IkItzA2Q7pv4ldKG5u5s3s5U
         wQ1A==
X-Gm-Message-State: AGi0PuYWIzpz+5nzZdNKaaZ/oBLTFFnJ27e6XemMzft2AKN8vIiPRMSI
	Bfv+Az+wOD6ekis/yvkNDsSZw18Hb+8=
X-Google-Smtp-Source: APiQypLkA8Dk6OlKQlnIV96ZgUK5CDUPWGfskMd2qtvzNkUiyd8o9R+N471WRirBSz553+TSklGHpw==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr690551wrt.376.1586164843447;
        Mon, 06 Apr 2020 02:20:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:42 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/14] mutter: upgrade 3.34.4 -> 3.34.5
Date: Mon,  6 Apr 2020 11:20:20 +0200
Message-Id: <20200406092032.3574-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.34.5
======
* Fix visibility of initially hidden windows [Jonas; !1066]
* Fix hardware cursor on GPU hotplug [Pekka; !1097]
* Fix pasting images from wayland [Robert, Carlos; !1141, #1065]
* Fixed crashes [Florian, Olivier, Jonas; #1029, !1073, !1121, !1120]

Contributors:
  Olivier Fourdan, Carlos Garnacho, Robert Mader, Florian MÃ¼llner,
  Pekka Paalanen, Jonas Ã…dahl

Translators:
  Yi-Jyun Pan [zh_TW]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mutter/{mutter_3.34.4.bb => mutter_3.34.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.4.bb => mutter_3.34.5.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb
index c90559cae..00b89dad5 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.5.bb
@@ -22,8 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "de19a6de98a2250dd7efdfca14359e39"
-SRC_URI[archive.sha256sum] = "0134513515f605dd0858154d0b54d2e23c5779d52590533e266d407251e20ba2"
+SRC_URI[archive.md5sum] = "4a16dad1d93d5e1f81d555da35faf0e9"
+SRC_URI[archive.sha256sum] = "d1d149b70ed7330771f4524886b98775fce5a11cf17f9683cba151075f2879c4"
 SRC_URI += "file://0001-EGL-Include-EGL-eglmesaext.h.patch"
 
 # x11 is still manadatory - see meson.build
-- 
2.21.1


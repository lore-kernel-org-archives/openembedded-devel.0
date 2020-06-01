Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.48684.1591047940559939214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbD793Mx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id x13so1329855wrv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h08MCqk9GGqSrq9ZBNbpx6AJxi1BYTxihg7wcBPVdTQ=;
        b=SbD793MxkN6AGuzedTPnTZLn7B8KllXGK8gglX38epG/SPV8eS5E961c8c7eLhVoCb
         ehpY41fKJcmr59vbGBUotPoUkUUMxQvYwO32TOWn7TUikxf9CI1lMdpZ/zAPh7iu8/Ns
         ZWrvznV9vMHleDY2HzsToRbzJAENURmRX55jUx3nK9lAyoBqUIxyPr/OG6FHda10vQ0d
         VEpN0qatjukoHSL5PIQM+TfDxsKpWYvFoOhEeW04twnZ5yDSISGvUUZ0mq64mvPjxbjL
         Ku2AQv21eVlhS/JlTeF9zbdR0hcImI1NA4BGiNCWlDOiJnvc6XL/OP/9D+FzIuevADjQ
         jbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h08MCqk9GGqSrq9ZBNbpx6AJxi1BYTxihg7wcBPVdTQ=;
        b=dyADt2gg93gRbt5wcYF2HH888hocQVw/D8t6hzmwzqZNwZkxVVgqdyublwxCuZa87/
         m6Afz2IXBMQnP7YznmB/TW3ib294fE+y7D0f2gNj/QKUYmWDNrvacO34Wm5xICx4uW+x
         vmCMjjv21FRWgrsCxZOBQ4Xc+csEptBnu3VjmcIBaeohbhel/chjOr8ByRfSCc/yT3k7
         24PZraPXfHN2kL9XnQ2afMR0aP+UK7i0ZRCpb4wmwsjsvxL4wS3vTbrGF8tTwyC7fNWg
         p3dRnwKOVv+4xxbR8fUhUXzCufFWXAzlEveX+3q6SViII+zwL9tDsiRb4s7yx3NajcKF
         6DRg==
X-Gm-Message-State: AOAM530WjK67akaQtCMYdgHp/NlZlACy4ByISMEL7p+5SRxu0oyarSE7
	JnYdhdEg2bj7YpbgE76JAkobqaseNp8=
X-Google-Smtp-Source: ABdhPJzIlZUhjzqM8eVN2UFM6srzqG+eGgC/a90m6rNnPrZOsQDbgbidPzVXUytyhARBgSyYdIhEPA==
X-Received: by 2002:a5d:4282:: with SMTP id k2mr22957905wrq.196.1591047938918;
        Mon, 01 Jun 2020 14:45:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/38] uchardet: initial add 0.0.7
Date: Mon,  1 Jun 2020 23:44:49 +0200
Message-Id: <20200601214516.26624-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is a dependenccy for upcoming gnome tepl
* Since others (meta-webos* @Martin) had recipes (0.0.1) add it to meta-oe

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb

diff --git a/meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb b/meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb
new file mode 100644
index 000000000..4a595e643
--- /dev/null
+++ b/meta-oe/recipes-support/uchardet/uchardet_0.0.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = "uchardet is an encoding detector library"
+LICENSE = "MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
+
+inherit cmake
+
+SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.7.tar.xz"
+SRC_URI[md5sum] = "623406dac5c5ad89e40eedd7f279efae"
+SRC_URI[sha256sum] = "3fc79408ae1d84b406922fa9319ce005631c95ca0f34b205fad867e8b30e45b1"
-- 
2.21.3


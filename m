Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.43860.1589813439066991487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eYcAfMq5;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id c75so3935801pga.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aEaKK453zWhIs4prd0P1RWI8sdN2071i+64jton+pgk=;
        b=eYcAfMq5ABQjiN+WJ/iScJ7qa0becWq52C5Cp4rwNboMH2U9fnKxpsXOCUlQ/73+Yn
         pO7RFhbg1AV9uWrnut84pjLp4+EcavrA8EO+eMwudUZfioYCxGptXSRKfsTTtz8Sp7v4
         IwMGmUmloJJyCyLP/gBRe8UDzlLvAJ0wERIl6tbCzQGLu6YAtdk563fmhdZReX0VwFKr
         vNObewLkk3hrqxPTwLsM9nV0ORecXm/MUKd6ag/xSllhLxBhGjW7T40hN/qrySMfBsz/
         Ul7iYjxemjnVBg8HKVmIsX4JRbdsTGANM9jpd5tnuMYll8X4gXra5duKv+LfABhJe63C
         7cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aEaKK453zWhIs4prd0P1RWI8sdN2071i+64jton+pgk=;
        b=bEVGxLmSyCx4RbHHLiTY65yISaVamVLUsvzx/jQ0kaaAqO7Iq3ct790xFje/YuwKcN
         LXcbVyosRDjFMMUtJ73THmkjUx5XwwiSYZ2H/gg0q60rQ8UPR7E912WqjFj5ocqdyjgj
         /48otW4c+DBflunvefkv6AqpzceuNrEWE6FdcU+Ok2z7ddqwtamZZcLbuLvI9xHPgXJl
         33WrmhjYAQwWBig1S/Tg+mURiGLu7pnoD/G0R8nS9pDS4ZYDZsPnSSbIBVmdIvn0spIl
         jLG0B/f8SSXF6TkCGUSOB8reQdR90jCeOlCI/GXK6RfCNZjSD3qZlJ3Bfhxij9e+XiR8
         6RgA==
X-Gm-Message-State: AOAM533uwTOABEe4+vwqULpCARl/e++J2JFjoqesEuT0uC75wKEuPQjW
	OzpgDXxDXRjQ0TzdefGShGL3wNsv
X-Google-Smtp-Source: ABdhPJykaqRXKWI/IDW9ibEs+KEIwP4ATNdIU4j9SfEyvIIQuRG44K845rhchYBZqWtSbx3/rAknQA==
X-Received: by 2002:a63:cd51:: with SMTP id a17mr13279952pgj.99.1589813438398;
        Mon, 18 May 2020 07:50:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 29/57] mailcap: upgrade 2.1.48 -> 2.1.49
Date: Mon, 18 May 2020 07:49:34 -0700
Message-Id: <23820f4cdd0b2603cb04215322cf098de7d9b975.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

man page changed from mailcap.4 to mailcap.5

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2d6575d3f1aeff68961530990814cf29da1374e4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb} (81%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
similarity index 81%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
index 114ce4607c..ff3047f325 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
@@ -14,12 +14,12 @@ by several applications e.g. to determine MIME types for filenames."
 SECTION = "System Environment/Base"
 
 LICENSE = "PD & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "2c26e18e912a5cf00318fcf7f8f2d747"
-SRC_URI[sha256sum] = "d7b023b237d6053bf05ff6786e0663c55c614efcc99cdf856120be13b5c29157"
+SRC_URI[md5sum] = "d5701a1a541383c0eda328f4a6518751"
+SRC_URI[sha256sum] = "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe821dd248632d5601b59b5"
 
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
-- 
2.17.1


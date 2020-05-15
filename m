Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.945.1589577102728038958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 14:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=h7XmLait;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f196.google.com with SMTP id b1so3260083qtt.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OemOA5PetUMtLDfUuwk5PjqqoJs+ToXem2EnurS36eI=;
        b=h7XmLaitNEY2N8nJwavt56iOTWdsJFXyMt5vrHoUkZ5EnSvDmErP8/PrbJMcL4E9MO
         YGiiGEaNlSz3/ocgoO4ckONetUP6ePULW/lKqdyQmm6YXSDHWcFbConIFKTfifxngAEP
         ytsMg4L7XT8aCY6nx6wscebgqC/d8+ZbZo7e/1XTDAiO9RWNmqH0W9DJqbEVSgfSpsib
         gBPv7dJlcHaMyQLEvSFDl3wtALeQFJNI4odhsX6rcRSs7nTCSoJNqrO8ageJjjxxIBUb
         1KHpMDDQNWEBOWORThIptoT6FII7ZTibgs/IMhP7Wyrz1cbc8dT/SmB8IC+fc7rOQd8z
         OZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OemOA5PetUMtLDfUuwk5PjqqoJs+ToXem2EnurS36eI=;
        b=nlZfNlqHzKd8/w20Qr+QEcECFdZTDkSJU14ncVu+tCSDZisI4nvQfAe0BCGj3DCEbl
         PIGPrLeYRn7Ui9MLo/1rZfEK7W9WlfTlsBGZ/TuwvKMGh2EMuzKUERL88G8ggehucmd3
         m1rJCZzvZGysYvyaUj9Efjpymrx/X0eQVkIlXh4Ffrzpep4Hl82aVc2ZMTqxttK4i67z
         hYLtVHkvddqYLSDDqsMVmhFt7a2F5ptW6tLY532PPTDeXC9aVCWETSq1PX1qSGsbTQAL
         uvgal0FUBq+Rd4lUVBAyVdGEFKNTd+e3oX1GDR/sLISAfrmf/ZZP+eLbwcjIbP6JHDgh
         BV9w==
X-Gm-Message-State: AOAM532asPRz9Dwr5yd16ioeTbe6d0K7IU9DhJP3j+EVjuRFXMML7AQ4
	k8JFRg9QBTVTOnUkaXPB1GZx6S7cvqI=
X-Google-Smtp-Source: ABdhPJw9Rs4MM0Gk3iQa7JNxD4oeqbvOfQCxKPvs639Gq9QqLwUf/G/ABCmhuEoHVo8F5kRDUN0kYw==
X-Received: by 2002:aed:2142:: with SMTP id 60mr4139460qtc.177.1589577101308;
        Fri, 15 May 2020 14:11:41 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:b83f:ce2d:1156:b223])
        by smtp.gmail.com with ESMTPSA id h134sm2483276qke.6.2020.05.15.14.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:11:40 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 3/3] python3-cbor2: Add recipe version 5.1.0
Date: Fri, 15 May 2020 18:10:43 -0300
Message-Id: <20200515211043.10347-3-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515211043.10347-1-domarys.correa@ossystems.com.br>
References: <20200515211043.10347-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-cbor2_5.1.0.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
new file mode 100644
index 000000000..b42516b7d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "An implementation of RFC 7049 - Concise Binary Object Representation (CBOR)."
+DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


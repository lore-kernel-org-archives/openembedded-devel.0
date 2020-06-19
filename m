Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9965.1592581650113821802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 08:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aSom/wA/;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e12so8000310eds.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 08:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFCtPZeSgBx5mT3ipPz+KOGs13SPrbbJUHT1hJJu0RU=;
        b=aSom/wA/IE4QMfx2GEiZORomfdTNYWzRHLvVXlY1Nvbx4RHROWlPbCutpDq5UWGJ08
         6I5qOYNITEYzpiVPj8NUEIP2hr85Y1NbMtN5btWF6UfF4qc0atA+KTFpeyAcVA/vRiTN
         QoIEijnTeS5XmsHI5Mkn72OYJgmurVgZduGPSq5IGjtyORQxszItVFIR20UzSuoCQl+N
         nCcnifRd2zjcvP2GeIppx3KWwOzoyuXQhmIR/RCvbeUQ3shiQNsr8Er8q9B/JTZYnwoM
         EkxxjMATwTRoCdG/5Ti6bBAQaxc0vzZRzW2L97hKXvq2TCNCcKqgMchzHqayFsGTjm5n
         NBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFCtPZeSgBx5mT3ipPz+KOGs13SPrbbJUHT1hJJu0RU=;
        b=sKiI13z+q5VYRQoDKxDpJ+SAO/8YE2NxXSQWwF2RK6mOrZ2fW2vT++6qbx2irrhHtF
         sWOdnOBJY2myeUlDyRp9zwpzahFmIdUukoB8TXFNMztBdTSZl69Y3VbbMg+1KWrbWv9K
         tpABRA5L4LMbNFdiMeSfhByPiBWxB1LdCL5EuJup52pjNdPsq7Vb6PlvcNCdWnNKPgWD
         iC81mCp4eOKJ3L/1UrJ60KmIt3qXQHX8+xoKpf/bme3CwaQMM8zeDGckIrDJiC2Uujbc
         9ccdUE2I7vLwR6NGVe3E4e/81l7kj+t9FViwM5voF++TVAPzt07F5wgJ/lHaL1hYF7bY
         XiHg==
X-Gm-Message-State: AOAM5331TgGfSYKH0PdiKoe0j8gdIL9YfJtCT0W+CZwkHoTJ6YpOC0TW
	JDo8XDbf0kKLeKK4SfK482WHM5Af
X-Google-Smtp-Source: ABdhPJz+Y58ejBDbsywHRC5Z0Ll/dkkvqOXb+qrpp07i0cMqNkBYGzVtpICPqucBcBmdr7mJbpIpEg==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr4042777edq.214.1592581648390;
        Fri, 19 Jun 2020 08:47:28 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id dn15sm5365283ejc.26.2020.06.19.08.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:47:27 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-network][PATCH] squid: upgrade 4.9 -> 4.12
Date: Fri, 19 Jun 2020 17:45:06 +0200
Message-Id: <20200619154506.43803-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.9.bb => squid_4.12.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.12.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_4.9.bb
rename to meta-networking/recipes-daemons/squid/squid_4.12.bb
index 19949acd8..6e49790fe 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.12.bb
@@ -28,11 +28,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "b315d0dce37627dfe61eec7f5304baaf"
-SRC_URI[sha256sum] = "0f5829d878002147e7c4d9b8901c2c3c051693465e82e45cef9ab0e226e3e729"
+SRC_URI[md5sum] = "5d058f7f8f1db9fa4ce3db910a008b0e"
+SRC_URI[sha256sum] = "eae0ad993921e472ce36cce34674c47a224fc2868b65ef0c4b41b2f5f18378a0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=19cc4dd146f397e72f3ff6f9f58fbfbe \
+                    file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \
                     "
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
-- 
2.25.4


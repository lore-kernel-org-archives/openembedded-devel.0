Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.5792.1596028638106420445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=lY8dDdJ+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id s16so9768508ljc.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5ps1mXT7jNYZPoOkkQExaJnIhATYnbA5NYCllO/U+4=;
        b=lY8dDdJ+Xr18oiz6CiOv1Dc+2rRNn2P7Sw1hAUQDuX7g1iVQnBtRNbFqfpJK/dYju7
         5p9iM3U+mo+e+VAFcsUcLrvowoNPqDXZ6v+XcLblIFvDmajOTm3uyli2nVvQcYKwX9zi
         5fgo+W5qu+vEeuZLZT1OHHQRLtOeTmaiOlC31ayEiKxjaMC0iyLj+pecRNARe+v7rEcB
         t4RSZRBn0XmjKyqnYZpb35od6e8xJNkB3XI3NuMNmhnjV22i5/PT1AOo0kA1pBKi/Vgu
         exT9t6ggRk+A16RBJADY2B7UJaQG9zkwAXqkZqtnBE2Y7lHV1+6AoOuAm6r00HEcRMEE
         cEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5ps1mXT7jNYZPoOkkQExaJnIhATYnbA5NYCllO/U+4=;
        b=SZx2sAvyOJcZJ8o6tBVdmxQoHQDsfXd4SXT4LHgpM0E6bLyNl90RhSeoyzaGxhdayl
         jaTEy7tzcHgBwkwNw32BQf5OBwbaYh9r58K8MJEIjRTk1heMHYOc34HNzv12QXXehAe0
         Syjh935z7xnxVZtxiI57q5f5mD/SC272hjoi0BzuFBV01jf98ij3rYL8DfNz1R5J11sR
         VQt+9O3F7q0oJ3P3YBHOki0cQgAIs469IOP7A7+sQal2ClqZ0ZMb7AQqBdodvphFjiXx
         u8N1ozERaI3Jq6iiaRMu/lB4eH/hAy9yo70oDvzBHgdGMT6lAknl0UAUTCbk1pxmcr/d
         g+yA==
X-Gm-Message-State: AOAM5338uK/3zLXTBsoDbzUqz0l/Z0bfP1EilQX+P1at5W/sLHo8dxCt
	rmQn6HqL+5tMG7cr/pXIbcAEcLn/3sg=
X-Google-Smtp-Source: ABdhPJwPmufZJUGJrmTS8pKup7l/pvGzPigDi4O5nV/fnsLQ1cD3ZIzn3aDWGoCmodonmpW4x3VMUA==
X-Received: by 2002:a2e:8798:: with SMTP id n24mr13977581lji.372.1596028635593;
        Wed, 29 Jul 2020 06:17:15 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t205sm456469lff.8.2020.07.29.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:17:14 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] ifenslave: update to 2.11
Date: Wed, 29 Jul 2020 15:17:12 +0200
Message-Id: <20200729131712.3449121-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifenslave binary and its man page were removed (see @2b0da97853367e34).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ifenslave/{ifenslave_2.9.bb => ifenslave_2.11.bb}    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_2.9.bb => ifenslave_2.11.bb} (72%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
similarity index 72%
rename from meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
index 125b59e76..72a7eeec5 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
@@ -8,20 +8,15 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 inherit manpages
 MAN_PKG = "${PN}"
 
-SRCREV = "42bfbb9beb924672ca86b86e9679ac3d6b87d992"
+SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/"
 
 do_install() {
-    install -d ${D}${sbindir}
-    install -m 0755 ${S}/ifenslave ${D}${sbindir}/
-
     install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfdir}/network/if-post-down.d/ifenslave
     install -m 0755 -D ${S}/debian/ifenslave.if-up ${D}${sysconfdir}/network/if-up.d/ifenslave
-    install -m 0644 -D ${S}/debian/ifenslave.8 ${D}${mandir}/man8/ifenslave.8
 }
 
 FILES_${PN}-doc_remove = "${mandir}"
-FILES_${PN} += "${mandir}/man8/ifenslave.8"
-- 
2.25.1


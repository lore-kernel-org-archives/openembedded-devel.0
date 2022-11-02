Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522C3C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:55:52 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.2529.1667361347112264199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NV6ruhuM;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 20so15181808pgc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 20:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xgY7BRID5pEgG11vcwPVVXSR7DzwFfk2uokRMlAhso=;
        b=NV6ruhuMrJD+h/bC0ouc8VkgGvq+7eFydhzTp1uRDcFx6LqYktLFSPvHBUcmOIiU2X
         S6OSAM8nLk6moAZlynssG4cLYyRGTVJ6VkVg6Xo0US80KHnfH2/ZIXGITWfcfyMGa3Ks
         elhDzXohRpTVlah32rb3Pj6mpXdxufE6PRS1OB7uqVMmIaWsN2jXaxsyZAO9W90eRx1j
         Db6lYg3ivpUASYVFe9ieHtfElfHIPl7Q7DzIxJ2+Vlh2ekYVwP2FmjlYH0/RTZo2HDSp
         uM5Utkrpzb2agjTdj/tqqRQKNn3FYy+ZIVz0cjpuSeLe7Oa39nJCq0sxN+MG8//hKNCH
         Y8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xgY7BRID5pEgG11vcwPVVXSR7DzwFfk2uokRMlAhso=;
        b=1+J4i3QaXxMgRauSyJDtHOt/SKPQTCJT/Yd/MbNNoYizSzx1w5az/NrujgS+wLIoOW
         2nN7YkhN7lUGkCQ1fVwz/4OmsgGVUZT0gnXPGkHEVTb52PetC25ro9DwnqMMWNAaJH1g
         3Tjs9zJEIdqqCqiMck4imKUIZAkIbaW2W5E0IH23aKekfea6YuIryooR94tJV0vqBiaY
         1tS4S0p7gexek90fNjJVzjXVv+gdgQbHn9vRA7gpG9qklEW7i4Cm9dNy202KStjl0qSV
         I7AfqG3shB38iXHh4Vvsstl2l7oJl+bSW4IWxrNCpH9sLxtYjV3UqT9d+r66nZM2sn55
         aVJQ==
X-Gm-Message-State: ACrzQf09cN37odafoyABpg4b5qUNpE5U0FIgIo/ng4vr84NEDPmZa2KP
	xQoZ7FCy6Jvf5OdWkdfFBNa8BW/hBBlnaA==
X-Google-Smtp-Source: AMsMyM6gI3uQ9Ndkb0qHcGXuBqBOUY59+x+yooGi1pXoLG4RH2QfOz/NybLTAK0HifYzdvXE3+3Urw==
X-Received: by 2002:a05:6a00:b82:b0:56c:d5bf:1019 with SMTP id g2-20020a056a000b8200b0056cd5bf1019mr22866081pfj.72.1667361346106;
        Tue, 01 Nov 2022 20:55:46 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id c2-20020a63da02000000b00460a5c6304dsm3514585pgh.67.2022.11.01.20.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:55:45 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 5/5] libio-compress-perl: upgrade 2.096 -> 2.201
Date: Tue,  1 Nov 2022 20:55:28 -0700
Message-Id: <20221102035528.3967640-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102035528.3967640-1-tim.orling@konsulko.com>
References: <20221102035528.3967640-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99405

https://metacpan.org/release/PMQS/IO-Compress-2.201/source/Changes

* Add RDEPENDS on perl-module-time-local

License-Update: Update copyright years

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-compress-perl_2.096.bb => libio-compress-perl_2.201.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.096.bb => libio-compress-perl_2.201.bb} (80%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb
similarity index 80%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb
index ea120b8246..fb4efee42d 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb
@@ -14,12 +14,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=36e282c4a4078cf2650d656cdda23210"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=00f9580b6984ffc2d5f1dc4cc7c3dfcc"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
-SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
+SRC_URI[sha256sum] = "f6c55c4e39cfaa3219965dd3b36c9de1edee9a82a10a9cadeb3b74a9ceeeaaad"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
@@ -33,6 +32,7 @@ RDEPENDS:${PN} += "\
     perl-module-file-spec \
     perl-module-posix \
     perl-module-scalar-util \
+    perl-module-time-local \
     perl-module-utf8 \
     libcompress-raw-bzip2-perl \
     libcompress-raw-zlib-perl \
-- 
2.34.1



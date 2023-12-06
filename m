Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46F2C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 17:54:59 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.39952.1701885298262496746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 09:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1u1I42i;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54c846da5e9so43920a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701885296; x=1702490096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02ptYWfkXq7luE/RtuFjQAoNwg1p1HL/2QcVTXZNi6E=;
        b=P1u1I42iOY9QXoSWyRNRm3mRGYjGYrCVJdsqv7+j+iFs5rTF6GDzJM94q1Rtap4Zf1
         qrS4DS7NxdFOZA3nouk6jS5H3dvJYe4j1NvLkHOSD/+Mis5iTiTM9kBy0EXMgl1z8hQJ
         L6JwbQMyhGEXixLbi7nZWu/fAcAiW5c0Gh4yKYkj5mSlYCVdR84BJKryt67sKAsaGngT
         DWhtM97rUy6Sg2Ci4a9ug1pdPI9YzxJ7psb4OmhX1uvoLNF/fpIikOITivO805or7OBO
         eGOyrTqH8i7tFg5fv7DUaMVO49dcfnkaugh2P6/85guCJxW1nnCaAdvNEc52AxTkbsB2
         Qngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701885296; x=1702490096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02ptYWfkXq7luE/RtuFjQAoNwg1p1HL/2QcVTXZNi6E=;
        b=AytDv+3irHXJDthPjgyNG0Bsvmv1WcpMuJgubXACdJB3r06JFWxv5nSynqEqH6TnqK
         NlY71lR11joIqLQc6XIVdWa5euRi1whDRajQelqGpvU7iC/lxCh5AsN8GZYtVyC/D0UA
         fRULz5LuXXLqKXb3gGctjmMtW17v9t1QEb86gQcHMyWCY23r3RtBssj2bVlnbhNFRgCJ
         SON2+uPtQF7QJtnMcb34ziRns+myRZTLSqXcl2nYPr3T8ZNO+tXHFuZCIkH5OfR+MNML
         EZudd+cVukxF1AxhLM18k4wwWaFHCs61kzzeUO2plxRWSCh0SRXmCGWLYBexGhkuIM3Q
         1VaA==
X-Gm-Message-State: AOJu0YySxIdCJb5+O6s2R2pDuwaQjQdoz/GJ+bv760tNvE52EGNGh6La
	6D69p4RPTO3Z4A+COrCRlYgnhrpUGUc=
X-Google-Smtp-Source: AGHT+IGAfo5ZobsbqmAE8/MxzhSsfLZTzHk4agTWQusIb6MHaCXobHJZYZ1kSDelBKuFHt4Ra8bhlA==
X-Received: by 2002:a50:d087:0:b0:54c:5fcb:8138 with SMTP id v7-20020a50d087000000b0054c5fcb8138mr1048605edd.3.1701885296155;
        Wed, 06 Dec 2023 09:54:56 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e13-20020a50ec8d000000b0054ca2619c1bsm235761edr.9.2023.12.06.09.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 09:54:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] monocypher: pass LIBDIR to fix installed-vs-shipped QA issue with multilib
Date: Wed,  6 Dec 2023 18:54:53 +0100
Message-ID: <20231206175453.2967092-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 17:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107260

* fixes:
ERROR: monocypher-4.0.2-r0 do_package: QA Issue: monocypher: Files/directories were installed but not shipped in any package:
  /usr/lib/libmonocypher.so
  /usr/lib/libmonocypher.so.4
  /usr/lib/libmonocypher.a
  /usr/lib/pkgconfig
  /usr/lib/pkgconfig/monocypher.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
monocypher: 5 installed and not shipped files. [installed-vs-shipped]

this only fixes the above issues, to make it usable with other
libdir values the .pc files would need to be fixed to respect passed
LIBDIR value as well as now they expect just lib:
monocypher.pc:libdir=${exec_prefix}/lib
tests/speed/libhydrogen.pc:libdir=${exec_prefix}/lib

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
index 899638161a..e6380d9a20 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -11,8 +11,8 @@ SRCREV = "0d85f98c9d9b0227e42cf795cb527dff372b40a4"
 
 S = "${WORKDIR}/git"
 
-CFLAGS+="-pedantic -Wall -Wextra -O3"
-EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}'"
+CFLAGS += "-pedantic -Wall -Wextra -O3"
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}' 'LIBDIR=${libdir}'"
 
 do_compile() {
     oe_runmake library
-- 
2.43.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A8CD1358B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 01:08:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.41696.1730077689377039571
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 18:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBERAXnH;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c6f492d2dso41413385ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 18:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730077688; x=1730682488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0J67sI3qmVjodsE1vXhFhSPpqpWtthv01Mk34OSs0CM=;
        b=KBERAXnH1ET4IBiVm+4aIjj9yCzhlwYFGsb3ORP4aFvfCVACXuH94S9hXELG4sHh+r
         4wz/A17NTHdCJG6sJQO+wWhHoviozJ56fyfbRSsTu50pKnHv9k/O8wNU1lOGvTZ6VuHf
         pMJnTcV+p4dIG+pw2DT26zaKXeeGRvstVoqNI8qdkIJCLimMfX6ellmyDxwgoBrST7QW
         cJ3fvQ+2K8K4TZh0S/FUKYyK0O4WQEFNWgL9R34PrcI5IDD6pTE5PbLMIVj6MGEfHesh
         qc+V7R24NBWPglzUzXb+6tlFDYOibZed7TWA0l+Pbs8+MplUerMiRegfRng6dUh9nZol
         hwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730077688; x=1730682488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0J67sI3qmVjodsE1vXhFhSPpqpWtthv01Mk34OSs0CM=;
        b=gfJ9+P6UQD86GzVYlXVdTbllBZ1Bfk/SaIWTKnM4AWdTlj2r34/VvfpdsMT6KitPV0
         wxSQ13UvQHWSK0XY/8CzQIk8LbdO1ONbZTQGFLpj0mBVA6uET+FqAGwtouwATqgmWQdz
         p9Hz/7u7e/nx45v3++2thyjmrT8SXt6saTpX9dDlI+2B8BbsE+8/KxGMldStwhD/leMe
         +84WdidAaOt6Wsni6rHs540SmHC/6hs/Iyu+3mBbDYafftGsa/LmDzfDEaBrJYt4ByoZ
         1B0szE36DspVomG2A3CjI0w+Esauk4aC5K5t4BWz0cv1JIsC8SGJhkxjvDO5A1ApPdg0
         6aKA==
X-Gm-Message-State: AOJu0YwkkvKGQgVKRh7AZNaj3A2Kdpt8BzgD5HwuX/uWr73X47rHdV9g
	0jiuQ+eDFGzmXMHZgwkiCXWOPZLKTkQzOPqWQIGo1US4plzkZ2gjbshgCIEj
X-Google-Smtp-Source: AGHT+IFZ2SV/iD0xXXsVafM7avwz5PztN1uIX2XOhvgeVFSzDiewncEGAwPv4SztF4ar8H7rVsw39w==
X-Received: by 2002:a17:902:cf4c:b0:20c:ce9c:bbd8 with SMTP id d9443c01a7336-210c6b06ed8mr96254525ad.25.1730077688366;
        Sun, 27 Oct 2024 18:08:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ebd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf88428sm40840585ad.118.2024.10.27.18.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 18:08:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] graphviz: Disable perl support
Date: Sun, 27 Oct 2024 18:08:06 -0700
Message-ID: <20241028010806.2090369-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 01:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113254

It ends up peeking into build host's perl installation under /usr/include
for perl.h which infact is incorrect. Its better to either fix it to
know cross-compiling or disable it, for now chose the latter.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
index 50243da344..36c434c517 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF:class-target = "\
                 --with-expatlibdir=${STAGING_LIBDIR} \
                 --without-included-ltdl \
                 --disable-java \
+                --disable-perl \
                 --disable-tcl \
                 --disable-r \
                 --disable-sharp \


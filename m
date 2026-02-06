Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EE2EB28F0
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:37:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7075.1770367040227853540
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lsmnzEsu;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8849dc12f6so251593066b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770367038; x=1770971838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuPQwVhwQzDgVmPcqB1zXJ3A7lGEeQIr2or629DmDvE=;
        b=lsmnzEsuEq6gjatDSNx3JeN1pig9oPY8Oy+wa3xsWkJNwNdeSKa93hf4mFSryakSlr
         fQY8ezNSvheKNwCdmQ6Kfp8QcEYXfhlL7u1h3xaw8bDxgPpnFR/N3P2H1T4YBMtkhtNH
         r4f+FNv3STHJQe99Ye55O8Fk79vEdAQImk1vAPBaOiu6JJU450kpCMX/lVtD+i/YrInH
         +L3L831LHmz+bRaGIN4BFvHHoQIWnKEgGgK1cbJPG83egHQovhjDsSAEnXV/iuSxmpMV
         lG/z665GA9vkj7b3PXQ8oh93FjCKVX6nv8bKVG7LgE5l4G4qiqIZqlXN224pqj59uTA+
         eiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770367038; x=1770971838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuPQwVhwQzDgVmPcqB1zXJ3A7lGEeQIr2or629DmDvE=;
        b=dg8c6v94zgU20KOfl2Jbq4I3t5vPTQmnrYJDAwJPSgn/I07c1Kxtksss7rVhih9Zj4
         Cvij4uMi/CSM5wGCU3C+zooA1jasr0josykHNCGqs3ecNXebrgZj6U3UDo6Xkd5VkZzV
         +0xu1/A5+UyWtyo4MJ61YFgLyyqb7hpQtVDHRkpksXXuAXtYuIwjNnbUDkw2diloNnk3
         5plrZxpVMMg7jvw6fPREIu+vNHuECJLRB0C1xaiWGWyyKcHur/8GwRcY9mMOXN9Iz3dm
         pLTN8+zY/Ir7YwnNAQtcu2yCRgigqa0rpZR8C4Z5bWj8N+6MpHIj6cw+xFMhSAsPG04z
         di0w==
X-Gm-Message-State: AOJu0YzNs+u46EJEyBWx69jO+5wCa+1DrvMy7F0pJZvUhD5n8W8az0Ff
	OrR6V4ZT0tSdsvQFNjtr6tMxESpbHiuL/N0ejvdLLhG7WzjYIIDPDj/3pN6IC2bT
X-Gm-Gg: AZuq6aKXtuy4o8cVIIyt/jT6RgXynkzSi82H/mM/FSWFv9UcHbAEgZKM+gm16mvwaGQ
	x3fY1cwuGE/XZPMbwcnlZlcqf5FmpgtnsXCZ4JlfNnnuq2lEK27/TUBxE+++szouJP0jjtdxxaV
	5SZo9VCMsEfYd1zMrEQqqE7ym9yo5tog+VyNxa5ccgYGofdS70BHk8DDgHp5tJi7xmdzyIxvq95
	ZJRWCakYcG/vZ0aO6ZyAmtjXoD2c1nxD2OOOkEOBRPewHtQVtwAVO0sql4VX8BFdJd0mZQhTWbR
	wWwB7PcYuRkOw/ioQ4P95WR0MJj7sADW+XnUaQzhp9M1Qm/u+4ytcxiDEp2z7fytJ1HeOYIYIOE
	og4EAdV6BoIFz+PhmMa1hq0VCBJyNQDiKE1yNw2rumqheqngoYJaVlCU0t8au9jThCOZfCSyimu
	J3X1JPv+jCV3OsOXQ7Lb05dsFb8SCuE1RQbk0mdJ5iNoYT+vL8tEhD3b0mmtM=
X-Received: by 2002:a17:906:f590:b0:b87:2b61:b036 with SMTP id a640c23a62f3a-b8edf1bfc8bmr108050766b.18.1770367038336;
        Fri, 06 Feb 2026 00:37:18 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.38.mobile.3.dk. [77.241.128.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7c310bsm64503766b.26.2026.02.06.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:37:18 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v3 1/1] glaze: include cmake files in glaze-dev package
Date: Fri,  6 Feb 2026 09:36:03 +0100
Message-ID: <20260206083559.471695-6-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206083559.471695-4-frederikbraendstrup@gmail.com>
References: <20260206073208.340688-2-frederikbraendstrup@gmail.com>
 <20260206083559.471695-4-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124240

The cmake files should be included in the glaze-dev package.
Without this patch, an application using the following

    find_package(glaze)
    target_link_libraries(myprogram PUBLIC glaze::glaze)

Would fail with the following error (with tmpdir redacted)

    CMake Error in deps/vesl/src/Platform/CMakeLists.txt:
      Imported target "glaze::glaze" includes non-existent path

        "$TMPDIR/recipe-sysroot/usr/share/include"

      in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:

      * The path was deleted, renamed, or moved to another location.

      * An install or uninstall procedure did not complete successfully.

      * The installation package was faulty and references files it does not
      provide.

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
index e481290b9c..235335b471 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -11,11 +11,7 @@ inherit cmake
 
 EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF -Dglaze_DEVELOPER_MODE=OFF"
 
-do_install:append() {
-    install -d ${D}${datadir}/cmake/${BPN}
-    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
-    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
-}
+FILES:${PN}-dev += "${datadir}/${BPN}/*.cmake"
 
 # Glaze is a header-only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
-- 
2.52.0



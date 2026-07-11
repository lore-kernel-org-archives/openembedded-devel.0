Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C7DC44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 03:38:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.289.1783741081697835955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 20:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qz6augHE;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7c61b5292so27425855ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 20:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783741081; x=1784345881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2hkcfGn3REtcxFkagboGM01XyR8zJdGyMoKxcUxnzM=;
        b=qz6augHEjV0RYDQ8ZFDBfNJ3J65R8MFDJmnKU0DKBlC32bWJLRLq0gy+OAATqHY8PM
         jV/39y37aCmIIlqtdHOXyhIMvDnhZln1rfnXyvBGp41Q8dihNTIEzD1y+v2J5Xxn0MuL
         wbJ4/cAmhU/ImWxtqB3VylFG9OJGZ7peUGax+7vPhZserhiGZdjIh/aXpvCqpB2+3p/F
         LmTKiqKAzHRD4OqnSuvocr3Tr+My2SKhvojgTY5mHt1S2mY7k/Y78S77PbpiMG2nkcPQ
         mOOl+MI1gg3oCo3O60wrP/NoBWsOko555qDywKpw7cLEFyttsfNFiTTn119ANg4Db2et
         5Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741081; x=1784345881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2hkcfGn3REtcxFkagboGM01XyR8zJdGyMoKxcUxnzM=;
        b=NOwihIgOn8WlkHg8so+jHsXf1fX/4KwvWCHS8+SsvbZoZnTAgAoxs810omDjScGhOO
         8HtuQT9OfafZ01zYr0v7tqM568t2uq0zO7Y1LNMMV0Bgh8SDV4EW2Iacopbxs/TYOORN
         FDFYf+3WKZBcFmmymZRarxKBu2oWNgyOUw3vnAm2zja26F/qJZslUkD+v0Uf6dupNG/N
         kaW7lNAOEQb5n2ysMnqFf83M42Pc+Kv+E3q9hVZ82mqRgLNTV0PeuRQpuGUAElXsQ1Y4
         IgsDg1HlTTTMw0DRYCPrcx4flCr5qFbDqhPF8Hpfzof9BPlb5Dr4h9dCyj5x8CP1wX01
         dwiQ==
X-Gm-Message-State: AOJu0YxnhmuF8XswtyXvZiGS3i7hT3eC72REtViG599XV7GLFfGZHQhj
	ecgRmxK8up+w3hCuEhalZbIPy6N06Get9Pa3JuRSmkifPbi45thDV/SSkPr5JsNsunCKLw==
X-Gm-Gg: AfdE7clci+Xm4VaGFftciOY/I7jisFdAWqBWZjrYKdbzbo/htJD98WIbFmjuh0wRVbF
	smVgQQ5aCncpyWc3SSpKxbAWtYxL0J+mS4e3bgyLfVPRUt+wjvzprP3UBJxOODosuCu3gyp6XxH
	G2yllG6Ma4jmIrimgHGcn8ZOGVhRb5jyQMMHGj8OjzEk+MZUc7X5t2a4idMN42ov/59aux1krT4
	LzpKjI2yxwJcv8PPXuZ1TczvlLI3H2YeV5bA1gtW0yx2FIXOFPtD6jP4HOgWPLeG/ie01sYWDRO
	Bda3/foq5QwxzstyuyfnVHgL4B3kZl02wd9n4+0m+qBgAKoDfkjIV37lm62DS4woe3gRURQG7a/
	wYd2tQLPWCAzKMHGBIGXUzFv1dJkf3xntyU7FRyMQfDlVOK3RaVDZy4/2RffjXjr0P/eFUo3ENF
	iJZ+kL4ffHK8zCorrX1IuK19ujANuSNBNXsxTv2iWkNzxLNkqdS5D5LGvrxwE61qugx/VMfkUVc
	hvgXWjfNbYCoirXFVyiaK/bV4JGtRlp8sqW1mriSb3MUc/DnlLpKWOz/K9Z4/KkTdBxvKdrjoCM
	UZpfF0AKYqS9gib8R2JVohLDJfZRDw==
X-Received: by 2002:a05:6a20:258e:b0:3b4:dd7:6304 with SMTP id adf61e73a8af0-3c110009c4fmr1756317637.8.1783741080981;
        Fri, 10 Jul 2026 20:38:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm30306037eec.17.2026.07.10.20.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:38:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] fex: force use of bundled fmt to fix build against fmt 12.2.0
Date: Fri, 10 Jul 2026 20:37:55 -0700
Message-ID: <20260711033756.981930-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 03:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128134

FEX-2607 formats std::byte spans via fmt::join, which its pinned bundled
fmt 12.1.0 supports but oe-core's fmt 12.2.0 rejects, breaking do_compile:

  fmt/base.h: error: implicit instantiation of undefined template
  'fmt::detail::type_is_unformattable_for<fmt::join_view<...std::byte*...>, char>'
  ninja: build stopped: subcommand failed.

The recipe already dropped fmt from DEPENDS to build the bundled copy, but
FEX only falls back to External/fmt when find_package(fmt) fails. fmt-native
is still pulled in as a transitive native dependency, and OE's
CMAKE_FIND_ROOT_PATH includes the native sysroot for packages, so
find_package(fmt) resolves against recipe-sysroot-native and the target
compile picks up the incompatible fmt 12.2.0 headers.

Set CMAKE_DISABLE_FIND_PACKAGE_fmt=ON so find_package(fmt) reports not-found
and FEX builds the bundled fmt 12.1.0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/fex/fex_2607.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/fex/fex_2607.bb b/meta-oe/recipes-devtools/fex/fex_2607.bb
index 4737c9fd0e..387fb7e8eb 100644
--- a/meta-oe/recipes-devtools/fex/fex_2607.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2607.bb
@@ -34,7 +34,10 @@ SRCREV_range-v3 = "ca1388fb9da8e69314dda222dc7b139ca84e092f"

 # fmt is built from the bundled External/fmt submodule rather than the system
 # copy: FEX-2607 formats std::byte spans via fmt::join, which its pinned fmt
-# 12.1.0 supports but oe-core's newer fmt (12.2.0) rejects.
+# 12.1.0 supports but oe-core's newer fmt (12.2.0) rejects. FEX only falls
+# back to the bundled copy when find_package(fmt) fails, so
+# CMAKE_DISABLE_FIND_PACKAGE_fmt is set below to stop it from picking up
+# fmt-native (a transitive native dependency) from the native sysroot.
 DEPENDS = " \
     catch2 \
     libdrm  \
@@ -50,6 +53,7 @@ EXTRA_OECMAKE += " \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_VIXL_DISASSEMBLER=OFF \
 	-DENABLE_VIXL_SIMULATOR=OFF \
+	-DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON \
 	-DDATA_DIRECTORY=${datadir} \
 	-DQT_HOST_PATH:PATH=${RECIPE_SYSROOT_NATIVE}${prefix_native} \
 "


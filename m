Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2268FC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 16:54:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.48578.1737564885292745293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 08:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnSg4/4B;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so82495895e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564884; x=1738169684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2pAIL3ABxoqkENA/fc7pmvH5lPN0S0ovH+0pswYJzw=;
        b=cnSg4/4B4CottObDQrY//LilyyXPKJdVtjKlxXjI5cdQaNWPGwMfLhiVK31Zgpiygn
         4BxRIhFB3hKIUsa0fGosUl4dOf9QAqYZoVWlV/1ZEGlcJKv+P28shH9C1jZIVTTtggSA
         URKO6efq0mVZQb5Z7xWls8QIJjr/4eYWYujjJ7sf8PGVnCzGcIAuLdWLiN460NpEJ6Gb
         uHC2v8WL0kljwh5LcRWFkDtVQSXrLN7juETrG/rsOSanxGjc+cXdwnJHk7BoJztk6og5
         BdVklz5R1LiytZNlupYcOa3rxnv0XhtQ0RGN256h1cqFuaxGUWZXeFz/JMAF94RqqVs1
         Omvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564884; x=1738169684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2pAIL3ABxoqkENA/fc7pmvH5lPN0S0ovH+0pswYJzw=;
        b=fc4fggKK73VuE7a5e8tD8uZHpUh7xG6Gik/+oM8vMvQDvok8352LDdXYMLT94vuUdm
         pijR/Mf6JOQQ12dLz1Zq3urctZgM86ETIkiNFB5qyZDb6pFqIF6Q8o3Lm4IJhWYSbEcu
         kL3ATU9Z+g3n0RmhXSU7wHTDd7+bQx0NzXNRrMmH7SAAtvt+m7H5WeTvq/uDrJt+CtO/
         xiCilYOIuVX48arYGO4nwDzpp8OsTAkwTE+2DWhU2W4C/vRolGYRlSswfxR5r5d5hxkj
         I2mILvwJkgSmHh6izzfp57nza3MeuLs+91zRqd1qnaCuL7k9kG0n0Cy1vKS+TaxGzWQY
         ISSQ==
X-Gm-Message-State: AOJu0YxZsDiZfBL/Ezmq2Fw07ZRRNtW3Ky7MLRAf4Hc2zj7I72byvTpo
	yaMNQGmEaMv1lT7T9YMffie9B9jwvHd2uWCtjZUeKwa0uOkDe8DzXsIMYw==
X-Gm-Gg: ASbGnctxOmN+4z5ABiTdj5q0vZilFaC0yqHCx31ll3UJiMhHes62Byy98bzbqz3W5ys
	ODnUSxSwpb6znIUlHkGd95rJjvtFUiBQzavZfLY7F95N2O4RxNsbTRSBa0ubdhqWN7MvKm1i5YF
	JuURjgWlWDKeQq7Tdai4GsM0/c84VBHbDWFTNmTBENolYbg8gyPqCNNNFbzkXK8Fv/1AyA3gClI
	y5kyUqFujkBkyAUWjy2RFgOVdxqabsUn/gAimIhGntix4yHF+FwE3YBWuT1M4dUTq0eAuh5+u/W
	jBHv/YrW9Q==
X-Google-Smtp-Source: AGHT+IG6YrJ9qHhSWkOmUC79TZHuGi6PBZ70J2e88kfjAP49N8Kcu8dbiyHxM8FOeZR3MoJbHxPI+w==
X-Received: by 2002:a05:600c:4fd6:b0:436:18e5:6917 with SMTP id 5b1f17b1804b1-438912d3aa3mr223106895e9.0.1737564883375;
        Wed, 22 Jan 2025 08:54:43 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c010sm33167265e9.2.2025.01.22.08.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:54:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH 1/2] ndctl: fix compiling without including tests
Date: Wed, 22 Jan 2025 17:54:21 +0100
Message-ID: <20250122165422.2750317-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 16:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115019

In case "tests" PACKAGECONFIG is not included, do_configure fails
with the following error message:

 ../git/ndctl/meson.build:51:4: ERROR: Problem encountered: '-D=destructive=enabled' requires '-Dtest=enabled'

Since "destructive" option only enables an extra set of tests, it only
makes sense to use along with including the tests. In case tests
are not required, this option can be left on its default value (disabled).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/ndctl/ndctl_v79.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
index 9a4bc49d1..90f6d13fd 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
@@ -20,11 +20,11 @@ DEPENDS = "kmod udev json-c keyutils iniparser libtraceevent libtracefs"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMESON += "-Ddestructive=enabled -Diniparserdir=${STAGING_INCDIR}/iniparser"
+EXTRA_OEMESON += "-Diniparserdir=${STAGING_INCDIR}/iniparser"
 
 PACKAGECONFIG ??= "tests ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-PACKAGECONFIG[tests] = "-Dtest=enabled, -Dtest=disabled,"
+PACKAGECONFIG[tests] = "-Dtest=enabled -Ddestructive=enabled, -Dtest=disabled,"
 PACKAGECONFIG[docs] = "-Ddocs=enabled -Dasciidoctor=enabled,-Ddocs=disabled -Dasciidoctor=disabled, asciidoc-native"
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-- 
2.48.1



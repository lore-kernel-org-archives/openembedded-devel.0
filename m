Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB6CC7EE2E
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69127.1683477191715428731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VHhIy9jH;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so56931627b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477207; x=1686069207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4wkDzHCtTcVi9fdqJFMAlqx0WnS3J8KrOZwHRJH9w0=;
        b=VHhIy9jH+dmVFIccFnombtRSS7fGfbDgl9Pk/OTqQ7ffPAAFI/bZOl35O2CVDcvKcu
         fd5DfBxZmvME2J2Bf7OzGbko7yVqSqU+s/SjW9juDIOkY+r20fM3PIo+ZFK6EoKEvUcK
         QGdW0jLZPog0yIG5QdqBXmSXWKu8w8ZTCRzevYAOSYnFSwxBfVJOfo6fx4s53vYWi2D4
         3/Eak1atijZz11RA97rVR6nj7EWpyU3pxx2lLKeV9uuvKdcnh44oiJz2yytvYsQNMydK
         ovG7EWxuU3qVcLUjc78TMYkVnlf26JUjJEPToioBXoQuSyGAzl5fYq1mINIgBNx+hsqz
         r2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477207; x=1686069207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4wkDzHCtTcVi9fdqJFMAlqx0WnS3J8KrOZwHRJH9w0=;
        b=WigQKPrKAd2zYCml0hyhTe1ukdFISzfGKLRmtk3xNKT/qLVuY1w482GOpqgp7qM8if
         Oad3691eYUS71Co2dTGIF7DfH7YeAIhF+URwORzW+XIOV0IWbWjVqmwjTFRP9yX4L3ff
         fcZx/pBQCeBPVC7tz1eKDkERonsCJ4Gl3QtXGmYANmtGUAVlWvya9sbmo5GaZZ8ortzz
         /OSJuvUFaiqw8KzF4xFnb2UVhdDfLCb5zS9ovQ/FJ9QhgPbh+6pEj+i8y28XiQFjDiBw
         U0CzF+qFvI2OtNryHuSYft8OqE56Yx3HhhNc6T8fQdw7qHOQC4G6qrGWnh70rFcFvNyM
         PRVg==
X-Gm-Message-State: AC+VfDyBXHte/Wss2CHohqeCLxv1LGPxIxSCoR5YB0dbwwpBUE2XD4Ny
	WYvRUK3yxBcMQvsKKjWyBsoSdiFTssc=
X-Google-Smtp-Source: ACHHUZ4lL+l5xkLx3ySPAEs0qqp3a6bbKfxfeoVFSZ5tJEH38RBY5NlRDWgXpdmgBsN63w8kCqBN6Q==
X-Received: by 2002:a81:6c42:0:b0:55a:1022:7814 with SMTP id h63-20020a816c42000000b0055a10227814mr9427891ywc.28.1683477206759;
        Sun, 07 May 2023 09:33:26 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Petr Gotthard <petr.gotthard@advantech.cz>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 19/29] gensio: fix QA issue: non -staticdev package with .a libraries
Date: Sun,  7 May 2023 12:32:55 -0400
Message-Id: <20230507163305.3261044-19-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102349

From: Petr Gotthard <petr.gotthard@advantech.cz>

This fixes a bunch of the following errors:
ERROR: gensio-2.6.4-r0 do_package_qa: QA Issue: non -staticdev package contains static .a library: gensio path '/usr/libexec/gensio/2.6.4/libgensio_xxx.a'

Signed-off-by: Petr Gotthard <petr.gotthard@advantech.cz>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f030642efa8d58b8ef98e2cdd248b9423b8e6570)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
index 4aca6fee5f..1b161741c2 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
@@ -22,3 +22,5 @@ PACKAGECONFIG[swig] = "--with-swig,--without-swig, swig"
 EXTRA_OECONF = "--without-python"
 
 RDEPENDS:${PN} += "bash"
+
+FILES:${PN}-staticdev += "${libexecdir}/gensio/${PV}/libgensio_*.a"
-- 
2.25.1



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522C4D35E51
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.27854.1730831916777244073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPLGbpJq;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e33c65d104so48820187b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831916; x=1731436716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSDoBODkf6l74EHiVR4eLWHFOMutQ5F8QgwChsKHAm0=;
        b=UPLGbpJqHjmfUyqoS3I8bx5OMDEy5wrrpw4vTfFCuL7NzLKlPaoVkMrxPwlNMUayNk
         MYoK8NbTBpJzcUhL3GOJhUU9VWnQn3XZI1Xemx13EFXs+7Ep0k5r6V7tejbXL5G9NeuO
         PbzrRMghsoWOpRaX/GSG61rxKK2KdXEXFEc1jWm64g0T93gq2oRvbmXTSm8cpbhGKgXE
         jvAMs9tQtpQD+GclgZZCmgzeqpnyx9DWNgj8H2I6LWey5WmU6ZlYDNPUN/s0hFlxLqpX
         jHFHqzzaq/8bavhkKG29NibnGlALyyph8tcLPhjsVYWmAVjKbV9qxb6gBzgkdDZ2Uj5b
         J6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831916; x=1731436716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSDoBODkf6l74EHiVR4eLWHFOMutQ5F8QgwChsKHAm0=;
        b=A9/xTE4iDF9dzuWke/PQUCfYlTVYcWt7n/AZMDpG3BoklvKGPORamIY7+hQn3VlLrp
         8c3aZgP1HZhLoSfqaUEE8dd5ozmr7BDR8/LWxKyAx+kS5azbkn1Q9JZ8aYWZFrePCf8z
         EGN9JYV+UZRe2AYvWKJz6fA4n4gNv2RzfIQyf/mub+Fn9hOBvt94WknZhHyHYzpnf4Rb
         6OS9c3Mw0ehl3TmL7ALCfqB/93+2ffVFlVrkAdIQ7p8PR7z47ks7KjsuOkj/RA7/0Bld
         CIF4Sly+Vz/o4URsHJgrqNetvUzl965F0g2QIPHKJKdr1H8PfW1YGVglfGkCGWIC8uSr
         QEfg==
X-Gm-Message-State: AOJu0Ywfg77md6DD8NfaCSRomUhm4GDLRC9sRkMxAGsNNs59zyE2TEDe
	ICxod7VGfn990+hBro4uMjKdPeup1YCXJsBjMadwur2nppSKSL5WSlscFVug
X-Google-Smtp-Source: AGHT+IGA3Ao1uNmMQOa59/2GpT2zMi91sAhmyuITF7Of2nZXSAbGzAs1bcPwTL6mGfr0sicyaG0O2w==
X-Received: by 2002:a05:690c:2f89:b0:6e2:10d3:e13 with SMTP id 00721157ae682-6e9d893fb09mr271007597b3.17.1730831915414;
        Tue, 05 Nov 2024 10:38:35 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:35 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 044/161] libexecinfo: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:20 -0500
Message-ID: <20241105183658.34982-46-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113559

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
index d4bad38b7..10e6f3487 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
            file://0001-makefile-Fix-build-on-linux.patch \
            file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch \
            "
-SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
 SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
 
 CFLAGS += "-fno-omit-frame-pointer  -D_GNU_SOURCE"
-- 
2.43.0



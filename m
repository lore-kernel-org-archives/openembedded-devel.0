Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9D4C04FF0
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 06:07:06 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.5630.1712988419561549921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 23:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmjlWn3O;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa27dba8a1so997919eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712988418; x=1713593218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMvBox8x6vE2N7uJBEnFI8kuulj/0gxbbTB1Ao9SAwY=;
        b=HmjlWn3OhYF7jjtYqCQyUzzMyRIaOTrpxYLdBCqTCPikEW6tAQwPpJeCBCycNeblaj
         NM1MwLY9C6IE7jZbPDIEUjesxgF0HTw6p5sJOISupR8b+o7qRBwLEA3wo+ITuO3/57lF
         BK9JWbNSlKiFmzBk2CmSVMe9W5gq04Z8y/tHD6hi3+lv8piXyOu/Kg/h75z7G1SWuY2F
         8TOF/k6g4kjrYfiwvtqa7tSmERPBkTyCxU3wxRHlx0TSTBfN+oDZv0PRXuThF77uwZ87
         Qgy6hYTlwSuqJsT1wZpJZSuyGeg8pN1bd6XN+NrSh+2r2WM4oHoWOvEO+rVhBgsAck7j
         zihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712988418; x=1713593218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMvBox8x6vE2N7uJBEnFI8kuulj/0gxbbTB1Ao9SAwY=;
        b=wDByTzyNsWLMQ4asr0MFrTYLm5Hmz8g2M2yQDCIYagFKDqc+cKsYq45W/UunpdzxF6
         3CTxwodP//RnY49qJQQc2cb7FMqEIPlNbebGEIs2YVgZkR0pbYmFEkTdHbWKQfCM13Dx
         eS411zYwJJKrP71v3jIAeuywQa/azoAefsfHYPLkpS1N/66t9mm/rPSHY6NCjGvVUcDG
         UF5bXp+KMpw67dRdA/9olJtZVdruts/NA7uaFmNBvvwSFkGmQ/9W3g1NgFHGeeVfmVlA
         yQjOH+IzumtwbPTTYGGfx7oNjfF3yz2Xr7klzEBu2n/EXuOiiw6nqqC3PGXhVQBl5c9v
         Sz+A==
X-Gm-Message-State: AOJu0Yw9dvAc9ehb8iqWIR5A3uAPVhaWyBOQsr8cNdpkKEYYLnxIpjQ1
	ZzgVjAZ0EWDZHVdfFMBR4epeVEiBOg7cEs+DADnYxT+KuDTi9aoiwnbweuL4
X-Google-Smtp-Source: AGHT+IHSEbzzsQcVT5bgop/+HqTdfxMjVZAn/0qQW447uMZekregmleY5c8skq8zgE2TMKe0p7hLFQ==
X-Received: by 2002:a05:6359:4a43:b0:186:162b:50b5 with SMTP id nb3-20020a0563594a4300b00186162b50b5mr7459232rwb.4.1712988418369;
        Fri, 12 Apr 2024 23:06:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm3953366plb.261.2024.04.12.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 23:06:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] unixodbc: Enable UTF8 init
Date: Fri, 12 Apr 2024 23:06:52 -0700
Message-ID: <20240413060653.2147909-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240413060653.2147909-1-raj.khem@gmail.com>
References: <20240413060653.2147909-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 06:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109947

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index ccdd666408..7819387c39 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -21,7 +21,7 @@ inherit autotools-brokensep multilib_header qemu
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
-
+EXTRA_OECONF += "--enable-utf8ini"
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
 
-- 
2.44.0



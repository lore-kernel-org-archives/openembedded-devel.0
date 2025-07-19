Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8DEC83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 01:35:22 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2972.1752888920760596133
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 18:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YDjry8He;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3413301b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 18:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752888920; x=1753493720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASSb9DIpA3hUvNLbnDtP8wZIvtPpnAG8zG3UH4Wd0ys=;
        b=YDjry8HeIxU69qNF0xnx5sXhVGUrxW6fJrgr1o/covric4xFVkrCJiM6xyj+rcoNhJ
         w9Rlfx0Mhg+BAsT+kquS6AgQK/0OsY5dMyS7968DtXO/vzrbsbrJAaExD0SE/+u3OqG8
         2wXX6vJSVIAdxrYtXOVVEGVQ1KJ+zXWGoz52Mzo6UC5fLxdm6ZC9ZSDkln835qdGuYOI
         ziiC+uJrrHnEVimSwQNcOFoYRSFgD69Zs4S+MzUYUfim9klEFeeY8X0Y7RwJQ/zqyfu+
         0S2q5joV4KgC0fkIym5Gw/h6jru8MuOVD7Sg0YHdrjKDhJgV8WBPOnIE1pFOfp5zvHvq
         WfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752888920; x=1753493720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASSb9DIpA3hUvNLbnDtP8wZIvtPpnAG8zG3UH4Wd0ys=;
        b=vDR681XHpceID1CV7elcRdbV/FFIv+smxIm+L2KKj0WRrAyN1qNkCpljZZHlKX0gxR
         al7ILWy+gTiUOt3bc1Eql7l+Lh71cRrYPk9sv0tOO60AHWIRDCnFYNIckQc5c376LHeP
         R8WM4LXcRklSXhohBOFdJuMxErRmZpaZVJingWiZcFwmSOVGoXNfCO0Gikl4abTXVOEk
         tghIOI0YIdxC0OLjY2W51x0/fo6c8tahvcCxctGMnbBhTaaD4FnpuvXSNXYCV5mOmBqd
         WqdeBwrnVzhwdhfVTYsFIMP60LpcafkuY+t4WmL7k5kegGeG8cVnhuRnX+LVYFp3sS1i
         mktQ==
X-Gm-Message-State: AOJu0YwjjOhiIkZi0WtdknhdYUTBWQW4S1jJWqt1/NdEieysVRwCctdo
	8H5YekUmS8AS0iEdcBvzGSjPCQds9vh/EUNdugaGtsurCRac3I9lahEsKJjCkdBUb+0=
X-Gm-Gg: ASbGncssYdQp6qHxhvpMq/xVoQq4Khe6KE54HNJOACHF0mC6hg/941nY+VFWCTB8FXj
	AlFMoSjWl4c+qvG0Az/4CZTeeIWplOWZYQjJrVoyZI/1KmgxQ8KQhsAEHEcEhkJxPmls/1bzTnj
	XyEABzTu66tZCqIxPIgNZZuBVyhmqnXxowTzVjqG7jJGiK7ApPhXa8lfl5s4Xb8Zx9NS0vJTBhP
	Hl9h4ocqkuhdEQbBW8d1VUgWu6Vghrw3mJwQO8W5QTuaMY1hFpG28qR0efB84ox7QS3Jge4MDmN
	Qwus+X/gtudNu2rw43ciYCsgfFIlZ2R5Fj2SqzPNqcxw/sL1faLaW8wmKGqIjOVPXjRF7YkD/Go
	Z7GSPiyiz2BtpWzHQlLh12GA3
X-Google-Smtp-Source: AGHT+IHTwYg2eHOl/mRX/Qk2wXjcf6stfbELqENx4YezLRbQXexdnP8HCxIRZbAkxbzRKXq9LaCbMA==
X-Received: by 2002:a05:6a20:3d05:b0:236:150f:eb92 with SMTP id adf61e73a8af0-23812e4ea2bmr23461479637.31.1752888919733;
        Fri, 18 Jul 2025 18:35:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::edf4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe69c80sm1818357a12.12.2025.07.18.18.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 18:35:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] ruli: Fix build with clang
Date: Fri, 18 Jul 2025 18:35:14 -0700
Message-ID: <20250719013514.277016-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719013514.277016-1-raj.khem@gmail.com>
References: <20250719013514.277016-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Jul 2025 01:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118633

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ruli/ruli_0.36.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index 178906b7b5..0526f842a8 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -18,6 +18,10 @@ SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz
 SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
 SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a3999dbfa"
 
+# -shared is passed via CFLAGS, clang complains since its used during linking
+# and not compiling
+CFLAGS:append:toolchain-clang = " -Wno-error=unused-command-line-argument"
+
 EXTRA_OEMAKE = 'CC="${CC}" CPPFLAGS="${CFLAGS}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" \
                 INSTALL_BASE_DIR="${D}${exec_prefix}" \
                 OOP_LIB_DIR=${STAGING_EXECPREFIXDIR}/${baselib} \


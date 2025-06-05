Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456DEC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 03:48:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.35900.1749095300662575359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 20:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0XBqUUX;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7481600130eso693301b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 20:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749095300; x=1749700100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgXqXUDx+m7L2h+dijmZfPb1jqZi0GorD1/nob/pBcc=;
        b=g0XBqUUX8MpEZyWDAwM1z4EfS6kvI8ITDpeTb3LSh3glEBndmIe8XMF62kzhLnp6Iq
         bA5xg1htUmsqSsGHGufubjyLhOMwH0EYltH2UTofI25v4XV3xNMYbKoX0wZfyIKOWFhL
         meoELwq0isnuIJJXJiSLlGZRuOjpuafppZg53q8ADzpyI9rjo2Xjmmd8ZjXAhn68N+cv
         0/9Tv9Ma4FqNtSwanY5rH7A3jJPRRfeUTjIeKmrdjGn1l14u+DlLc54rvXCRkJajSHsE
         t51oZjgQJ+0kty2/SQ4zP9bTX542o98dTTfwRP+6D2yqWOt9Kooo2hBMxWkDEBG5fvW0
         vpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095300; x=1749700100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgXqXUDx+m7L2h+dijmZfPb1jqZi0GorD1/nob/pBcc=;
        b=pPDk6jJtSz/YCA8KImCEoUpkVsS4InrLzrZEoMKM/172U6DtbzRIIzKeplGvCmz3Va
         h0QwbVHnIvJ2aOtCPE2XU+PDHgis9Ra7y1woACMqPZ+k6AyNtqsRGHjt7eM0wo2imQR6
         b+J0lCSPjsOjOmPBq7/pCJzcfNSNoBSeNdCpWph62I28X08PUFlPqc6HETGSvyazLS8h
         aeTQoGOSXCJTKXnYYph9xetBgaz4eQ9Z9q7HY/RXEdoMDX6OtzLzJa4H7LkMDV1CIqmp
         hkUuOrSVnXtemkPsSIBfm2kUPFNzBvoH14e9VfhKvvDBr5RO+w2sR6N8hlvgtt827Vep
         VJ1Q==
X-Gm-Message-State: AOJu0Yw9zNNX7CAg79t+IvUojR8fGSjcpxxHK82jYsLeo+zzTZ/QCTu0
	rHy8NAC/IdJRjpmM4QV91PoHlVtuh6TJtkfeymED8nd9Jaq9M7O6qtXYZ521s41I
X-Gm-Gg: ASbGncuS8jaWxFTLOD0f4SxsDtDjZutNrqnhFTzF59byJWdPdlgxuOcALg2mxtJh1ep
	TNXnuKJw+AEvFRtNTnKH/nTGEdxwiGWC4zficuAkJF2S09SXR3lK57JXlVK6ZZYxRUfxT7pJMrF
	vO3/oUPMztVnwuA7YeKcW9X+sVHm5wAvpuU1bmjEuv99919wUgY3SzpabjbX0zaHDMd4pgu/diA
	5ZXWAmCb50pEmxDNcR21qqSzSFBAwyN+XpxwwVfVcjTehwSNQ3utP3y2YjDySWi7goeUqmr3lDB
	mir6wnswSuxw/bCBtNiYu8W5NEKQ1TBHeHxp2JtTpg==
X-Google-Smtp-Source: AGHT+IEOnlhG2CYmLW9kPWvf33y9O95YDbTqmPtMIcRnufaWhnwc9Bp3h2RjfYh5lPXnZ87AYtfwyA==
X-Received: by 2002:a05:6a00:21d4:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-7480b225efdmr8810389b3a.3.1749095299784;
        Wed, 04 Jun 2025 20:48:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::9b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafad4sm11903975b3a.116.2025.06.04.20.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:48:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lapack: Force gcc toolchain
Date: Wed,  4 Jun 2025 20:48:17 -0700
Message-ID: <20250605034817.3197292-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 03:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117745

It need gfortran to build and if we have clang as system compiler it
does not work properly to compile it.

Fixes
aarch64-yoe-linux-gfortran: fatal error: cannot read spec file 'libgfortran.spec': No such file or directory
compilation terminated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
index f18ef1f292..7cb6c097f3 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
@@ -101,3 +101,6 @@ do_install_ptest () {
     sed -i -e 's#${PYTHON}#/usr/bin/python3#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
     sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
 }
+
+# It needs fortran compiler and we do not enable fortran with clang yet
+TOOLCHAIN = "gcc"


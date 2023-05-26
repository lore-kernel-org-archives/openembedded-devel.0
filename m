Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390ACC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2490.1685081972395701867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IZF64XWW;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so468116b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081972; x=1687673972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWipQX1lvj0RVdWmEUGJvgmIAaLRtGVthYiQ28pO0Rg=;
        b=IZF64XWWkXHlb3LuadxxerD9DZsY3OBvdvw2JrVXf/Sf5TmKM3Q+ZTAiFxJBkqxnmN
         ++N1il2cxG7wi5lOY0gocqcBPyRbIyBF+w/c1BTzFQ834AqQH0feuM4W0OgKscgN0o+D
         bjFapeXBEHCme5DrDPGLbwVdXibseB8sGdpPebKiprYYPW06pRRbbQMqOkrl1vOqpWJc
         Nb/LcFsho7Yn2SquKjxk9O6anyzFftKjOf8M/IiOIEPfS3xILumZGlRX91NgEZLGpuLa
         BedUXHTldJB7SmXfELS/vqVWLb+CSchmEYRVIrh3vyjaI++iOFikIeHmbm5YNwHND/mU
         oKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081972; x=1687673972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWipQX1lvj0RVdWmEUGJvgmIAaLRtGVthYiQ28pO0Rg=;
        b=Gh0PJDjIKCnEZWJwf/lBI6f3C3iIaHGHfGQEQ9Dp6wUfZHgFY4uambdvSwjYvkOyYR
         fgWIaPMIxQWb/YmZ6R2IcS0HeRV/ctDvn4QoNMJYLTjGo2XWO0iOVuP1pTzCCvjDSQCm
         pYpAqM0xnV9OyR73LdEXTpHoMZ/CFwzp+PeNOx9RdOyDYbusb/q5w7ZdUaMaOWRMTUPv
         OVyYPtFTUdjlWJ093DNLG3eBGYAK08Cnc9TGFNNqfWlrbv3g3nnogR1z/uRGext0IVVI
         n488ViAqUPR9ZK6HlX2XZXhNppvK+v0LJaCb6xJ0amrWejAH5DS2AU0uJm/m6adL2WRq
         a0sw==
X-Gm-Message-State: AC+VfDzrqRba/0ZFErhVTkEns4PJFh1OPmjVE2E4tZWPHR/XwMx0vtWl
	8Sdo6AQCznWZL23PNTBydVcMMWsjWOs=
X-Google-Smtp-Source: ACHHUZ4paVTKvxl10WYHHvVsAAAVK1Qr46/MxPJR8dMSRjYIl29LIYZYiQy9f6B5DhX1bE13GEmHvw==
X-Received: by 2002:aa7:8885:0:b0:643:857d:87a3 with SMTP id z5-20020aa78885000000b00643857d87a3mr2300282pfe.11.1685081971512;
        Thu, 25 May 2023 23:19:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] ipmiutil: Pass --enable-useflags
Date: Thu, 25 May 2023 23:19:25 -0700
Message-Id: <20230526061925.420351-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102869

This ensures CFLAGS and LDFLAGS from environment are passed to build

Fixes
File /usr/sbin/.debug/iseltime in package ipmiutil-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
index daf084f399..c85bfc13af 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
@@ -43,4 +43,5 @@ PACKAGECONFIG[standalone] = "--enable-standalone, --enable-standalone=no"
 CFLAGS += "-I${STAGING_INCDIR}"
 LDFLAGS += "-L${STAGING_LIBDIR}"
 
+EXTRA_OECONF += "--enable-useflags"
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.40.1



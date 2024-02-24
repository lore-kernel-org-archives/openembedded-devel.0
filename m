Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F841C54E41
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:43:01 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.15928.1708764171175357026
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJ+6Z+ad;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-565aefa661bso230156a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 00:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708764169; x=1709368969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlocjHLnakq8GG/MKrS3t3gvYOuJgf71LtVFDPXOlVM=;
        b=iJ+6Z+ad6oHNvD+fDWQUyslFl9JEDHQk8IRGsL+GaFjc7cAqgxXe0DDS+xdLp0ORoz
         DHB5KLVH1io+7kqt1n142QC2Y2bBdi/RVNQmt8bO/I85yLujuUMyTqDvvWZwBfuxchDv
         U0pUinLdLvi1RFOpBA4IL1Vm+Nyk2RGJVba/Ve0SNT3u2FXVXoTPw4Hjc7mRl98W+Wrn
         wTOhbEhPtiCkjojROvf9EM8dprw/py3R491p/xxzEW4+QfUe5IMGqlF3v0zLn/ZAG/A+
         Dq/j8xn9v57DWEPyMBXfgwvpiPZ76bQBx6rNJtNiI2jinKhCjyKXyjuu8lpmWWmJnShF
         6zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708764169; x=1709368969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlocjHLnakq8GG/MKrS3t3gvYOuJgf71LtVFDPXOlVM=;
        b=xBMFQiJbtRSrceuYr3PXw+NsGgqMeggnJJg8nGKoAqbvuzQVIqgt2U/gO+Hnl3/I+S
         TZ0dUBMjVZkwdlFZWRwvsrLciCPRtaZkwJYrWmuKiT+ZulyJ8st14yZzHaPEtvSUa570
         TTGjpn16WU1qHjOOtD6kGdvdc0NlOP6k82Hliw3q/QjpniCbBRjbUo+ei+lKoWefbiZk
         VU7pHGqKTl8a0XCL22dasjLIBqNxNSNMUKjPu17ZgJTXbFrW63k0t0ABYHJF3v/p5rvK
         /iH+CkqA0f5/5qGTRJsP8qeG42cUJbyh8SK4RdaLxu9jZqpO5ERQckvHRBirEuB+Wmq5
         ct5g==
X-Gm-Message-State: AOJu0Yw+afiqsPOH96iA8pSwcqr6Oq3BmbjI9JKjWSNIqHBzcgMD9gu5
	PAGT4EYqAz3jkAaqcG6IKDs2s1FROqPPn1cQBds5EL5I38MgfuCLY6C4TEoR
X-Google-Smtp-Source: AGHT+IEoIJ9TLzlSy3VdbyKXbIygxRKCWuNR858D8CyZs3zPgDUAQQZLrcqx69IicO0Qk86wz1TO1w==
X-Received: by 2002:a05:6402:f1b:b0:565:767c:ce37 with SMTP id i27-20020a0564020f1b00b00565767cce37mr1998707eda.3.1708764169286;
        Sat, 24 Feb 2024 00:42:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p24-20020aa7cc98000000b00564da28dfe2sm341621edt.19.2024.02.24.00.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 00:42:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: behzadshaheryar@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-openembedded][PATCH 2/2] snort3: fix snort.pc
Date: Sat, 24 Feb 2024 09:42:39 +0100
Message-ID: <20240224084239.121470-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240224084239.121470-1-martin.jansa@gmail.com>
References: <20240224084239.121470-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 08:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109024

* fixes:
  ERROR: lib32-snort3-3+git-r0 do_populate_sysroot: QA Issue: snort.pc failed sanity test (tmpdir) in path lib32-snort3/3+git/sysroot-destdir/usr/lib/pkg

* it's broken for non-multilib builds as well, the issue is that
  FLEX_CPPFLAGS points to native include dir, e.g.
  FLEX_CPPFLAGS=-I/OE/../lib32-snort3/3+git/recipe-sysroot-native/usr/include
  and the work around from:
  https://github.com/openembedded/meta-openembedded/commit/973647848049abda6f2adbee0189720109863731
  sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/pkgconfig/snort.pc
  strips the "/OE/../lib32-snort3/3+git/recipe-sysroot" part in non-multilib
  case, but leaves:
  FLEX_CPPFLAGS=-I-native/usr/include
  which is still wrong, but not detected by buildpaths QA check anymore
  and in multilib case, this didn't strip the first part because the
  target sysroot is:
  "/OE/../lib32-snort3/3+git/lib32-recipe-sysroot"
  so it didn't strip anything from native sysroot:
  "/OE/../lib32-snort3/3+git/recipe-sysroot-native"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_git.bb
index e9c37c8346..b8826b0682 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_git.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_git.bb
@@ -21,7 +21,7 @@ PACKAGES =+ "${PN}-scripts"
 inherit cmake pkgconfig
 
 do_install:append() {
-    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/pkgconfig/snort.pc
+    sed -i "s#${RECIPE_SYSROOT_NATIVE}##g; s#${RECIPE_SYSROOT}##g" ${D}${libdir}/pkgconfig/snort.pc
 }
 
 FILES:${PN} += "${libdir}/snort/daq/*.so"
-- 
2.43.2



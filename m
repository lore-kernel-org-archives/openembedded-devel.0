Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E8BC44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75154.1782663763175356997
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DEcZuz9l;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so4915378eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663762; x=1783268562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDYVt+bM6c6qqT5xU+srg/sLEgpMWjIjYuX2Y505XBk=;
        b=DEcZuz9lQCIP8BZNYdE7WxsMpV+KB2W1A7HnkPxOnomFMgk2fRMW84irZennc6fBl1
         syGtjVmLLRnsqb4597xp4unIJO3ZJ1rTH6DNFwI91hkQcbIe6T/EqYhV8zz3NYo2jgpZ
         spM5Nkduo8iYkYVHDdQw8/V/ZncYyXyygnk4GMrrVZtcnDjJN9UEPTlsbUGJJoR5Iisd
         OeBYjppYYW/JYkRkQ/GwiWHQlg7bdqc9IUo+7yr85WkVXVjMAhIdGzBOlpl8DUAqPna6
         KdjhxQ86hmkmlEgg8dnJzQhYKHv10DaRVoWYAQdNicErd7HzHiWiCyITNOouJ/wzVB4W
         PDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663762; x=1783268562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QDYVt+bM6c6qqT5xU+srg/sLEgpMWjIjYuX2Y505XBk=;
        b=JAw0iMw677DXjuES2MJvrcZAnZ+nOnci15NgREo7IM9DRnqnY/u5zi/UplczKQkE2g
         USGha2Q948eQJ6hxmMRjOyXyIyyKrvpETsqptM9wf7uaXreNCPeGiE2bPdWzGs8jy28H
         0rQlXi0jBdwvr0jOLHpbf0J18VAeYDMoyB5sBF9tu8vdYMdnfq/blkBtXH0ZDOARLEHy
         63vOf4XxWIIAR7ukoxVA7+UFDlKZE0+vyMUk54UHN8U3GQWjUcWnu3yXiisXE9TDauKn
         iAGIeuEx2paavTlpt61tEGVsbsKZ3zQT+ml7OSFqgVt3JyvKy74NBUPzb2b/6MhQaCyL
         1apQ==
X-Gm-Message-State: AOJu0Ywl7MfY2HvPovYdOdDyMVDy2KUm5DyKuPJ/98rBN4pFCPfIqXSp
	Z9INCEV4N7A6c9X48AhtmrBXoRrR507UEfabZNnWNniLfR4gjGbwereFnnmhw2UTTT8ghA==
X-Gm-Gg: AfdE7cm0v7tzUvZFFO9FNI0v1tl7IWMsIHnpMwOKR7J873XSHgDGjebqP2DEjZ55Fyq
	VaSy6dKuWoDvSFO6OIoXOy2QkjtUjUKrYP8HjXtGE4U7XZXWUERE79sE5D+xoTwlhAusCT81xIQ
	K4fMSGlS0Uu5QUfCuo/4G9ra/p6DOsfcL8JhAiLQ+v2KVdM3HgiSIbflOps8yCISfpdNpbXLP+R
	w/gV34/m2LN3pRPXPajleTsL/HcXU679jKmQgaI9BUhGceGIxK2al6dOgBT5UUpVETSCSlIU7GW
	7UCrdnJv+k9pq11UcbWPxG+XkUWBGTMzXgvdBTjUMLpS5hF/G+a0WLOvheQVztmGzGsptrS8vn+
	iu537uTaEU4MkqmOrB1QQ75/S6M/IOeiz2hlFl1odfNzP2Bne53kb3IpikovNuR5pMT78WLvXSp
	oa5bfiKu0U5vMnDGqulszKZTfg74gFw5P6oy/pZLn21SfR/fsN9WwyQD8rURjV/pGk4QLW6ZBKJ
	w69y0Xew13nt91dQtJBX30evLkEInh00/IZqb2wBgNOoA4SZPmWf52iTQqe8Sy1nbE743k8zAfZ
	jQO9Zui7Sr7ZqqyYujqGpGEM3vq8lTfkaPo4WFI4
X-Received: by 2002:a05:693c:2285:b0:30c:45de:8fbc with SMTP id 5a478bee46e88-30c84b64cb7mr12351101eec.9.1782663762415;
        Sun, 28 Jun 2026 09:22:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 117/128] procmail: drop target-only libs from native autoconf.h probe
Date: Sun, 28 Jun 2026 09:22:11 -0700
Message-ID: <20260628162222.4081517-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127927

do_configure generates autoconf.h by compiling and running a
small lock-feature probe with the build-host compiler.
The Makefile hardcodes the target networking libs
(-lnet -lnsl, from the libnet/libnsl2 DEPENDS)
into LDFLAGS, but those only exist in the target sysroot,
so the native link fails with

'cannot find -lnet/-lnsl'

The probe does not use them, so override LDFLAGS for this native
step with just what it needs.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/procmail/procmail_3.24.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.24.bb b/meta-oe/recipes-support/procmail/procmail_3.24.bb
index 6767f87db6..01b48cd148 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.24.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.24.bb
@@ -28,7 +28,13 @@ do_configure() {
     export CFLAGS="${BUILD_CFLAGS}"
     export AR="${BUILD_AR}"
     export AS="${BUILD_AS}"
-    oe_runmake TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${BUILD_LDFLAGS}" LOCKINGTEST=100 autoconf.h
+    # autoconf.h is generated by compiling and running a small lock-feature
+    # probe with the build-host compiler. The Makefile hardcodes the target
+    # networking libs (-lnet -lnsl, from the libnet/libnsl2 DEPENDS) into
+    # LDFLAGS, but those only exist in the target sysroot, so the native link
+    # fails with "cannot find -lnet/-lnsl". The probe does not use them, so
+    # override LDFLAGS for this native step with just what it needs.
+    oe_runmake TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${BUILD_LDFLAGS}" LDFLAGS="${BUILD_LDFLAGS} -lm -ldl -lc" LOCKINGTEST=100 autoconf.h
 }
 
 do_compile() {


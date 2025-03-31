Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C07C3601A
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3845.1743454893506540686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsmptdJK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so989392866b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454892; x=1744059692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPzbTQRJR4I2Wh21byuT9FQHPphUv3MHFM49YvoqtMc=;
        b=jsmptdJKaiadJrKODhPlQOeP4qIHHEVTaUrZt2tSUfKBXhuCc/GYAGapVuWXGjIDwH
         P/HHQ4KeEZQLe8GLNc9TS/gpdAoxJHAst1OBHxuVDQFzDdPtYN0vdWdrM0wOkdo+JI+W
         jTA0EARs4B3zrPzS+AQe8hA4yO823MoLkvlJcWb1SosBw4u2Hh891nfX8iHZ/MFcFcRI
         ywXd19tAX/deKsjmb6Eby6lBW6iMMpvYfpTfswg3DbYkUao7aAcymcb7nyMLJheZ2r58
         0XzSWZiTG2KbLjKvRA3Bi1yI0H7TOo+aVfEoMnQ/BU6fNlCZ+dU5VGhA5sTf/eIo3m5I
         Ql5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454892; x=1744059692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPzbTQRJR4I2Wh21byuT9FQHPphUv3MHFM49YvoqtMc=;
        b=nlT+JplgA98NK9AnB8cNAf86O3R/Vz2X0QFSV3F9SYpIpbMHGCUPkpUojky5mJJNmV
         m46Ueoj2ssuaEZCzWOICzcu2Tw4KSwtVJmuQltCzjNBMFrJ5KVXabElGRvsaz1alcsgz
         XQ8U+ICV5btxTL0CfzQ3SjBLs3VixoZZj455gOTv29RGB/0ztmb81kEn3K5pqvyLTrlv
         5yU1+/1lcH5kFR2FIa8M/f1K7VzJZidm2rc6wnn6LkM1z1F+8Tg5p6syOlRVajBQ5e7c
         yFB9wp3EfDv0Iv0IuHfh+SLRfRWaknJuxet8OjTjkrJlc6ue0JEVXCxs5ju1MbHXh9VU
         gDgQ==
X-Gm-Message-State: AOJu0Yysn0+qT/dsjnfF+ATsAyhUt4/5zFHwwHl2GC/ukoA1oWz88RDk
	ksfdTprwIj9rRz0VzRaN+mtBH4bQfAHttBT0EZ0RBVqhCRVf+GXyLQcD6XXG
X-Gm-Gg: ASbGnctafrrB/GFqfpZcRww5AJi2yhvZAbFka7gPHE/8bahJrAhuBNmfymnv28LS6jd
	pXvalzdXzV1jOCdS3MgYq0UuZxmD9yVazhiqcV8zs46HxE18Z9hcMQrEA+PKL7xNCEiHyPR3z4j
	qVL0sQ0MUbmBlelQmPEcw/i8DAiiFOCMAM2pXLOSfY/pb8pajEjXNAkdR8yjIYWHDD/mYwlFahS
	CpPRwQkUlua5aQ8bsmuKu8JxM+P8N2Lc2Ipw8GDHh9oJv3VzyK/Q+xuspQ9NlogXzjtBNPVCqOe
	Cec7g68tN8k/j/Jrl7Of7BOHnWyWsI0sKNKknJGRb0AjOcA=
X-Google-Smtp-Source: AGHT+IGFsZPBBN2xFxvA4LVCu1jC81RP+ULT5+QTLU/QONYX58GleemfeZICNCvQ9DqXxW1tYBp1zw==
X-Received: by 2002:a17:907:97d6:b0:ac4:4c5:9f26 with SMTP id a640c23a62f3a-ac738be3d3fmr876894166b.38.1743454891672;
        Mon, 31 Mar 2025 14:01:31 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196c8281sm680888566b.149.2025.03.31.14.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 18/21] fetchmail: disable rpath to fix buildpaths warning.
Date: Mon, 31 Mar 2025 23:00:58 +0200
Message-ID: <20250331210101.3460858-18-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116454

From: Wang Mingyu <wangmy@fujitsu.com>

There was an error with the last modification to the buildpaths warning, which could cause segment error.

fix the following warning about buildpath:
  WARNING: fetchmail-6.4.38-r0 do_package_qa: QA Issue: File /usr/bin/fetchmail in package fetchmail contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/fetchmail/fetchmail_6.4.38.bb            | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index 6cde94b202..cc23d5a34e 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -16,13 +16,10 @@ SRC_URI[sha256sum] = "a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905b
 
 inherit autotools gettext pkgconfig python3-dir python3native
 
-EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
-
-INSANE_SKIP:${PN} = "already-stripped"
+EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix} --disable-rpath "
 
 do_install:append() {
     sed -i 's,${RECIPE_SYSROOT_NATIVE},,g' ${D}${bindir}/fetchmailconf
-    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${bindir}/fetchmail
 }
 
 PACKAGES =+ "fetchmail-python"


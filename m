Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C306CDD0D3
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.21772.1729612080690112750
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mBE6sT4W;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2e3e4f65dso63808717b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612080; x=1730216880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T5Ghq4/l9vg7NYGcLV3lN8pD/J9A40B2vOtVu9qIAU=;
        b=mBE6sT4WG/aLWDqOAQT1fu+cAXxS3nHJrTktw7n0yMgKATG+cfZ/sdn5oWfTY/qVqV
         lXf0ndW6PJSnh0vonD5R9zUIAHKT/znBOQ0v1M7vzioDSrIx+hxKpL8qQ0wuiu0FulYb
         HvIggi/deO9K2xYP5BtEiQJTyUQbKrE8TmzXk4/5svV+lgj7LvDMHT8iUB14ZL6j2O+p
         VyUGUtn7nHGb+SmZ829yjiWQ0DRy+Wsb5urMzkRjbXhgv2RpweAWtqffU7mKCsZBXOWA
         SeLOR6aEDCQLAVZuk7a8PbqMo4Q6+jyU4Kre0OCMsZLMy+dcaSgGDlmyhKmfLgoernrE
         f3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612080; x=1730216880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/T5Ghq4/l9vg7NYGcLV3lN8pD/J9A40B2vOtVu9qIAU=;
        b=hNWJJYlGd+lVR/J6Z5+BFcWn+2gAHsI5h2dvw6GKyTplih1XeDOpwzuVcpnJWI+4KG
         f/a5zLX2O197BzRMFSuSPZcXJpe20MzvdhFuFKz4TxsZnWUV/i+WntiYMy6JFCKEpznn
         GxlTQCjllU6wysIYWvYNxAoJmHZRkcKVSsnzIFJw5njGY3daj7Uc2wVOUA664NjXYdjj
         9H+iZ2xI7bft0DikzCTUC3Bj8W+u1x4xtPj2kZOOKfIh05TMXJNJoMdiBUfxd7bjrODd
         3LOQSjvupuRPT8X7SXhFdQm74tKQBoAOwoTq1QU8Kr39/01dcqsZA/kWWWWoU7zkGpT1
         5TKw==
X-Gm-Message-State: AOJu0Yw9UYrtJ+4kXhPl4JB3Qd5QJ9MKs016EbPjzYJdMvdDWvxFtovG
	iqZIoqLpjpX65HvtDEApaEIMuVNK9wR3ktDr+ow2d0rJn8JypFKzciJbfw==
X-Google-Smtp-Source: AGHT+IH8L2KejIFpEcEH1AOU+9dVRIVFHq999MRWRWjWegiEkMtqCG4Fa/XtESq7/dlpb8OCyONtgg==
X-Received: by 2002:a05:690c:3009:b0:6e3:ceb:ce2b with SMTP id 00721157ae682-6e5bfd89bc7mr119480347b3.44.1729612079340;
        Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 08/46] libdata-hexdump-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:26 -0400
Message-ID: <20241022154729.20331-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113099

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
index 4493a7e5e..66369df64 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -18,7 +18,6 @@ DEPENDS = "perl"
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "467b7183d1062ab4a502b50c34e7d67f"
 SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
 
 S = "${WORKDIR}/Data-HexDump-${PV}"
-- 
2.43.0



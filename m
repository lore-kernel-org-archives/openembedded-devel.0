Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FDC83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.41008.1752341214833075267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YS5aNiPj;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235f9e87f78so30155785ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341214; x=1752946014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1VlTlfWvUpdiq3ywW7WppVYKPntRHLVJFkg0YLlvto=;
        b=YS5aNiPjxzoeeZPGQ6KvL/4eLEaLCLGN1m2vWyFA44AM4YSnXT13E/w8yXkWL1BEKm
         1kB+ZzYFQvBKzdnOasQwTi6nfp1Bn9uduvN0j+yjyGZBU/90Pdo41d8eRch3n2qyL+55
         bhe/rBLxOFs+6qoBDp6YivETXfhR0npbv66AN+mtSAFn+NLpGt9/a5pVN3jwxXa9daP+
         gxRKLPq+Fy51RvMrhKVBN2ef0GuE2OpoudP1y3FmbM61KADzzyocg/PHDebHU4Nwaett
         7c4X2oqqyINASQp50V/fcFTr4o0CdqOAMyUqiVwKQjQnNaMPQuPzT8uX55nJo2fxB8+h
         Isbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341214; x=1752946014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1VlTlfWvUpdiq3ywW7WppVYKPntRHLVJFkg0YLlvto=;
        b=TQtc6phTDUAGhRcRWymGzIyuI0FI1vV1Fy7lhXGtTb+3S1fgUx2+9ArEuwFrNU0IKI
         /LmwvaWevr2+3+yFOeNuEgpTC/SaBhT2IpJl6wf7fS5007RaaJxpZaDrmNEGGncCu+dA
         E1g3k8rQD9gUOUHpUrqBDp4FAI3zB/6VSHEBfdPH6BuUSyWbm330fPTnJaWhUT122wPN
         8U8C4h3L6Lij6wDE95qCNCot1QowT5dznZRYu1b9FYLfM7x6rN1MRnRct9dEe3J27yoY
         BCJuKP0FmvRbnBpydYNYgduVcl4NCI1uWTtdxXVsTyfExxt04I6Er6TDTDlhgM9b50Ch
         Dm0Q==
X-Gm-Message-State: AOJu0YzQvPL2b7Mcls6uygq4OOkFxS0afsY8C7h/bF08HHA3iqeEQoiv
	WLA+9roSAMOLR9Ssc3rMIRKgv7xYdwl2QA9tB8KC9T65U3MMQcvbKilHHLFuvHqt
X-Gm-Gg: ASbGncvhDHZyE38YmL5V05vNWrJK+jobC5eTrpg+2yyl8B4pnIhiBl4rg7PKB1JACR9
	xA7ywl9oY+CJuQSxA2cKd6zKnSwIzVXToLZFNmGT7oms/7lpIQ//BC0mGZ8txf+Fe6iH2IJh0q1
	pOxoTvJj46VVTMVaXDUY2W8q8kcAcfsYjdlyQmaZKmZIK0lI5nOZGAfxwEoCSbuThqQ4UlsWTCs
	2BtwHmQ4bubgXEpNb/e4oeiKCES+5JSbdzqXu9Kj9WKMNd44eyXS+sQj2pjqL3n7Pxu9zfviRk5
	wsRHvi5786JX4XrY0Rrca0TRMigrgoK0uRcNWV5vdtsHdnPHl1SCC5GEyMOFH8o6iI/HTU8J/vs
	VmTPdKwVuIAgylw==
X-Google-Smtp-Source: AGHT+IF+9NkQHtFVBkL9hDhurjG0FXuE9uLgpYFKfAgrjb33ppXZxxC6Wk/m/nh3Cg0flJ1ycPCdug==
X-Received: by 2002:a17:903:2ac3:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23dede2e018mr114408275ad.4.1752341213870;
        Sat, 12 Jul 2025 10:26:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 5/6] catfish: Upgrade to 4.20.1
Date: Sat, 12 Jul 2025 10:26:45 -0700
Message-ID: <20250712172646.3899204-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712172646.3899204-1-raj.khem@gmail.com>
References: <20250712172646.3899204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118483

Use meson for building
Add missing buildtime dependencies needed for this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../catfish/{catfish_4.18.0.bb => catfish_4.20.1.bb}  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_4.18.0.bb => catfish_4.20.1.bb} (73%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb b/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
similarity index 73%
rename from meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb
rename to meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
index 6b93928721..49483f602d 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
@@ -5,11 +5,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg features_check
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-DEPENDS += "python3-distutils-extra-native"
+DEPENDS += "python3-distutils-extra-native \
+            python3-dbus-native \
+            python3-pygobject-native \
+            python3-pexpect-native \
+            xfconf"
 
-SRC_URI[sha256sum] = "fdae9b73cc754a50716bb04b958aa31dbd7e94047068b7207f2ae313a7d58b99"
+SRC_URI[sha256sum] = "fe00d45b163cf86b4c85ebdd23a73d53aa55bc97ba3f691a248ec403d4ade62b"
 
 FILES:${PN} += "${datadir}/metainfo"
 


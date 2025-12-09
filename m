Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1EAD3B992
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:34 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16653.1765309529054268007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaIYyXzE;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso3351573a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765309528; x=1765914328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZr5tPHA2iwpVaPBokqj/ApoQ1VpV5Vfio+zAdQF8kw=;
        b=CaIYyXzE70OXezz9aoeRzkIvKtT33RkkKWn3AqxEpG786sIAn1CWOPy57T8yNM7xXp
         6ENoc6jgIl/evGdJtNDgwa5UAYQuG4rIR2MzV2eCNFH80uJrKB05qIWQ3qWI4QQOqfVD
         KFod0uo/lR0+i1yJJrcI7DSdIRLUA1mVpFmUQ6MBbWTOGwf1hVYY6Clz0QtGNPCnV7/z
         FkOTe1mvhVw2oefRDuK0T43I3xl/a7qS2FEhZ7/yPxGP+8tEpzh4b6HvWQxTV+vDIzMY
         ncuJvALY+CDgLSLUC9hNmn5Pb9WAoWwZE1Rr4lQTW7l+e/o+wqq5FNqialVRAlbq0H+S
         K1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309528; x=1765914328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZr5tPHA2iwpVaPBokqj/ApoQ1VpV5Vfio+zAdQF8kw=;
        b=qVQ2wn4r3cB866N12w7cC5g+1weZy7+CaS/NnhsMqO1fWFwuhnCan9mPXzPHC2nAo1
         w1O8ilU2qm9roeTI1VTJoSNWx61DfFKPXh5sIQkDFThfzxh9Ev8DlrYORaoui2gB6Luz
         K90MEfVeHNluHN5puoUTmv7Q2r+4UNwXQ/u5dh1TUsmNqzLKhGtVoGuK+sBI97K222Ml
         fHe+EZ9T0vz3CO4lKZ0OKKreef/lr+HBLiTapfresoFPw6flxN2dhf6yzNMZHh/S9RA6
         aJCEssd6rsBeanNbmyko+8jogCqEAi9KI0yA0CH+PmKlqHZtzfdJw3XqGJp4GQVlNBqE
         kXrg==
X-Gm-Message-State: AOJu0YzGG5pDF9JwOYyC/SsxOmk1E3IFb1QqeXzOTryrSOszg52E5VpJ
	dFw3uC/soJSqyLEF5vIK23Rh/Xk2km3/WzDsL2lWK0RcLQO3tAZiuqR+hYYvGTc/WrM=
X-Gm-Gg: AY/fxX7eaBkEFOnAtmImPijZBAp7KUiaXC3VAHGezXv5wfeDp18rRhYQR70TY9rnaej
	sH23RYGpbgXkWXE+IZHddnAoveFflZXpYzazf0LI7fA66mtde4sUvJtZtDdG832NKjl+k3LPX6U
	4LA5LUlxGpEcq3CsQeqv8qB7W1Wb/JEMmr3yu5/GIVn4sXBmEaQ4IEmxuaIiA9KT9jDneqff+Pl
	+X459DodUSlQt7AuvXK6/9cfBKcZcRK5dyiH27hzSU/X5aOS+NgMUQK3RC/dLlBVbvGCOWtFrgv
	wMUjfXkjUuACvPCjRitQyjWrGZVcpMSPE9ZkAb6qfHYf/VqJPq4TQU1Dy/X2+20Hgimfkwoavc+
	kYhXijJeUYp0ZURDztTTYr03bTUayoFQp5wz/3rHfJZ3Zk4PVytSgN3syaacgS80VuDSq0RIKUg
	w3q8P+1Kx64bVY+DJHr+16UxQorrTteKtGwHPbcXsBBeM1E/KfsLzAwOLKd05qwJr53KMC+ezSz
	FxtncBiXVo10glIiFXV/Xyhn2Y0cXWJE9qBQuSIO4g=
X-Google-Smtp-Source: AGHT+IGHbIEt5Qmq5n4uOHLf+ITp3lYrY7FfHNjmibguw5rJc6FTxx6XQovmvJBII2AqpyHmYAb6Nw==
X-Received: by 2002:a05:693c:4016:b0:2a4:3593:ddf9 with SMTP id 5a478bee46e88-2ac0568ba73mr88636eec.38.1765309527761;
        Tue, 09 Dec 2025 11:45:27 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8816ae9sm48596685eec.5.2025.12.09.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:45:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ktls-utils: Upgrade to 1.3.0
Date: Tue,  9 Dec 2025 11:45:24 -0800
Message-ID: <20251209194525.675379-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122475

Drop musl patch as it is fixed upstream [1]

[1] https://github.com/oracle/ktls-utils/commit/3b419faa9f67cc053031524cb3b079f054c6b029

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...PERMS-if-it-doesn-t-exist-to-fix-mus.patch | 36 -------------------
 ...tls-utils_1.2.1.bb => ktls-utils_1.3.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
 rename meta-oe/recipes-kernel/ktls-utils/{ktls-utils_1.2.1.bb => ktls-utils_1.3.0.bb} (74%)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
deleted file mode 100644
index 954b1393db..0000000000
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ca95e956307672484e8c018263600749aa9c4f4d Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 9 Apr 2025 11:14:52 +1000
-Subject: [PATCH] tlshd: Define ALLPERMS if it doesn't exist to fix musl build
-
-ALLPERMS exists in glibc, but not on musl, so we manually define
-it if it doesn't exist. This fixes building on musl systems.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Submitted [https://github.com/oracle/ktls-utils/pull/88]
----
- src/tlshd/config.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/tlshd/config.c b/src/tlshd/config.c
-index 38948e8..e653bd8 100644
---- a/src/tlshd/config.c
-+++ b/src/tlshd/config.c
-@@ -46,6 +46,14 @@
-
- static GKeyFile *tlshd_configuration;
-
-+/**
-+ * ALLPERMS exists in glibc, but not on musl, so we
-+ * manually define it if it doesn't exist
-+ */
-+#ifndef ALLPERMS
-+#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
-+#endif
-+
- /**
-  * tlshd_config_init - Read tlshd's config file
-  * @pathname: Pathname to config file
---
-2.49.0
-
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
similarity index 74%
rename from meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb
rename to meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
index ce36bda7d1..748e1cae99 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.2.1.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.3.0.bb
@@ -7,11 +7,9 @@ RDEPENDS:${PN} += " gnutls"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"

-SRCREV = "03abde4ed7f539d77a412a1c98052e1c4d262963"
-SRC_URI = "git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https;branch=ktls-utils-1.2-fixes \
-           file://0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch \
+SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz \
            "
-
+SRC_URI[sha256sum] = "8ee295b26b608450bc0c47ba199b34cf92f7f9ec4c81a62363e6450da76b6739"

 inherit autotools-brokensep pkgconfig systemd



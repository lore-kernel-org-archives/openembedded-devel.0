Return-Path: <stanley.stanton@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55DBD60CF3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 22:16:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6549.1731968171953353899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 14:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=google header.b=McyJPBZ0;
 spf=pass (domain: taitcommunications.com, ip: 209.85.214.172, mailfrom: stanley.stanton@taitcommunications.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-211ef41959eso3475455ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 14:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitcommunications.com; s=google; t=1731968171; x=1732572971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8aU05mI1DG7rZEqgfTfY6hW7PGZVSN1j78htU5OhPM=;
        b=McyJPBZ0g/NWzPYhoQ9mx668sykd/7w0LAPdoDrs5KF4pq9g+Bx65Hkp6j31/sM2Jh
         wSbyBKuv2ryW73Qj9yAJOGLIPovlu3FUKWi+50Jph67T92E5Ua9hUx03xf//1GwCweQ2
         2g5ySb4w+o+0OpYmlBRVjT2A2KFkPXzNjibbEk23QEjCg1AA/8WWPAUNEV+OwRZ67jxu
         ksrfOqpX3A/IDctKO4wCKE6jNl93s//mRab70kbkpM/gthubBomvqGOVA82ylg+Nn/nE
         pB2WB+Ekv5z4rTGuLe5dNz47pkbxdiSwqOGi6BRvom6dmFLO6YW2qFmsZelHs1tdon2s
         xxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968171; x=1732572971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8aU05mI1DG7rZEqgfTfY6hW7PGZVSN1j78htU5OhPM=;
        b=lwMJf+njl045wZWHQxtcJ1UqPcdR6kYylIxWlJscpUXEZNnsz0VzGCF5CgNfdjJJ3d
         9+GKv9/rNq342h1/2aa/cOYkBuOCiLl5mmBgnAS70frnovXsRWDlH7jKYJmqTmKat+so
         W3ZeFK91gjNuFq3LVYXBthiLMInN072LwsW7n0TjDigtMM2QqT2dP3YpsF8a3bAqoYnQ
         Qa4GpQqXfgGzrBKbhhQuIDtXAG17/Li4hvj4dphH4Berwz+9k932z+d2/MnrsMrrPlix
         V/rZyohZpisvSy1SWntJCm3ezOvye+pEpuoU7loT8q+P0PVuDK4EVGje5eqwkjsFFx1z
         3n4g==
X-Gm-Message-State: AOJu0YxG0p2A1MhBDPFQmTuTJ1poeN3o9xJi5QPlwKHKp08tH7fIFD/D
	p9lEFTXNsPaAf4SkKxx/yoi2Jfxay9GYq61ypbr+9INJseKCBCGWbGmxRT5CUbn1hwAWXIwqOZl
	3WQxyXs5oMRkMSBvYq9QlZvoctxO1GFRzZof158Ex1UzoDAxN9M6QUJWh2KFOuvVoN2++7NpWUS
	3fwAaaFrA=
X-Gm-Gg: ASbGncu1ksQdjGjLEEFhexRh212G6fNRw5WF2txS6rO4trFvG8vVHwh/XQtT7dO3ZPv
	HpiFigKPxFfqdJC47M5mT91w0ryt7pr53DAxh+MKR7ouA9Z6ruHjiSioh+RSUCfAuFgGWu5MyWx
	6bC5umJyBgGx6zi1DyCYmmYp4skJ9Iip+LRugG8TzTPJJFxiJ+vBdZ6oo6k4n1a1D2233+5+JCT
	nWAM7GBK6p1ffzptPtp90tIVbvKJce9TF6YZgwdvq2zVkqmSQKE8dVjbl1PogwBncsDYRbr3CWX
	+H5bZA==
X-Google-Smtp-Source: AGHT+IEbcFEK8R+ucWSnAdYjv9vPlVUxELXnhlk1J7JJdoU5sEvATpNB0Hwg5WBtogd31m382PdhtQ==
X-Received: by 2002:a17:903:2b08:b0:20b:7a43:3693 with SMTP id d9443c01a7336-211d0d59e6amr78348335ad.1.1731968171070;
        Mon, 18 Nov 2024 14:16:11 -0800 (PST)
Received: from WS4976.taitradio.net ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211ff9000f9sm38528615ad.140.2024.11.18.14.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 14:16:10 -0800 (PST)
From: Stanley Stanton <stanley.stanton@taitcommunications.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stanley Stanton <stanley.stanton@taitcommunications.com>,
	Douglas Royds <douglas.royds@taitcommunications.com>
Subject: [PATCH 1/2] java-library.bbclass: resolve do_deletebinaries race condition
Date: Tue, 19 Nov 2024 11:15:31 +1300
Message-ID: <20241118221532.2468927-1-stanley.stanton@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 22:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113905

The do_deletebinaries task is attempting to delete directories created
and destroyed by other bitbake classes such as sstate.bbclass and
create-spdx-2.2.bbclass. If these classes remove their directories
before do_deletebinaries has a chance to delete them, but after they are
found, the following types of errors occur:

Log data follows:
| DEBUG: Executing shell function do_deletebinaries
| find: =E2=80=98/build/tmp/work/x86_64-linux/junit-native/3.8.2/sstate-bui=
ld-create_spdx=E2=80=99: No such file or directory
| WARNING: exit code 1 from a shell command.

Rewrite do_deletebinaries such that it is explicitly not looking through
directories that are managed by other bitbake classes, to avoid this
race condition.

Suggested-by:  Douglas Royds <douglas.royds@taitcommunications.com>
Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
---
 classes/java-library.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 67541d2..033d6d4 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -55,10 +55,9 @@ ALTJARFILENAMES =3D "${BPN}.jar"
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
 do_deletebinaries() {
-  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_=
NATIVE}/*" \
-                  -name "*.jar" -exec rm {} \;
-  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_=
NATIVE}/*" \
-                  -name "*.class" -exec rm {} \;
+  dirs_to_search=3D"$(find ${WORKDIR}/* -maxdepth 0 -type d | grep -Ev "re=
cipe-sysroot|sstate|spdx")"
+  find $dirs_to_search -name "*.jar" -exec rm {} \;
+  find $dirs_to_search -name "*.class" -exec rm {} \;
 }
=20
 addtask deletebinaries after do_unpack before do_patch
--=20
2.43.0


--=20

This communication is confidential. We only send and receive email on the
basis of the terms set out at www.taitcommunications.com/email_disclaimer=
=20
<http://www.taitcommunications.com/email_disclaimer>



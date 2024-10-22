Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6168ACDD0DC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.21955.1729612099370656916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvIvnQMG;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e3e4f65dso63811797b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612098; x=1730216898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IcC+lb6DCENvnnpnamVTxJCOj2npwboqwMxq3+TdkQ=;
        b=UvIvnQMGQ5kYfn16H7qXiMqsBOgaBljIM8/qfabZZcFrWiE5o1UcB76XcifLYtlGVi
         5KRg5eG3By3OT89T3x+WBPQhCTSLzDwSTz1PW1C7s4oyiWHpDFEjTIG1vcvLnIK5boAu
         DAm1RmgzhC5xAqZoMAWHKsqbiHhjq5/DFJsBlfmLNo8ha5/sHXmOCASDVDkMnn9lPcrZ
         NBCi3kuuokRRp7EeJAdK0fYz90r9jn9LOrw987zEMaXagaG/6JdtrG0Vf35d/PQz7Znn
         yelxJMWGFNCSNbAb3QsZ7bAA73tKkta3lcheJ8NdDAbXxqomolIMI2VWIxHyzySP3/V0
         imMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612098; x=1730216898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IcC+lb6DCENvnnpnamVTxJCOj2npwboqwMxq3+TdkQ=;
        b=Qvai9+RufS2872EE1cOOVbVcmTj0iCt9JlHTkW19E+5EHgDzaewGPJ+RYwAtr/9Z6r
         msNJIsCLvdVyi9YM0sfcAxV7q3S/v1spq1AskdKFOyhVvGlVBBFCYboZw8pjJuBE00tt
         Sx2rG9oEroo+pPBXU7p+1X89VyIuqmJxlkNZmk5ojR7Z7EWyJn7dkg1PMFngCQczjFCI
         2ffElv4QBRWKrPDj/7XsQW3/Wt0uyVWT/M3fkf1IplClKjf3PLqdt8dW66yQQbkmLUEC
         YsKi6RjeQSi6PmIC2f7GdTGPTY5TocWU3f6xaNOqen84VtXbiTkn7hMcIN/g7x2Y4AEu
         U9Hw==
X-Gm-Message-State: AOJu0Yw0faVla1akReMixJj/aJR8vHFtVuOAn+2AMWBJYyvY/RDhTE3i
	SgUKt4ONG228nMxDOrwGUs0Et10JGU5nGE0020rV3poeRTFFCbYhUoPgmw==
X-Google-Smtp-Source: AGHT+IFL8JgpTGuZ3TMSQHoDFdUoN7wQGd8EsXrBEyhzotAVzUsqj64XSi6GOMxswZ37EY5DH3Zkpw==
X-Received: by 2002:a05:690c:4a06:b0:6dc:c105:6d84 with SMTP id 00721157ae682-6e5bfc36556mr158628127b3.12.1729612097961;
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 36/46] libsub-exporter-progressive-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:54 -0400
Message-ID: <20241022154729.20331-37-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113127

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index d51ab2171..10f0fa204 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -14,7 +14,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
-SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
 SRC_URI[sha256sum] = "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
 
 S = "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
-- 
2.43.0



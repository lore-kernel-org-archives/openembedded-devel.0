Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4802FD40D0D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.31169.1730840414224450384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jsu5g+Uq;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e9ed5e57a7so46932437b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840413; x=1731445213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npm8w7oEd9NhGUvzl91l+nEIwcJyWHznzzikCNtzwW8=;
        b=Jsu5g+UqwACsLzd2A57EdvniZlRtzzVu3K20+AwqW8MzXKWQ14HzAtCM0FL40+V8uX
         7HjY29OUvpYGdW8mwgscIUSRY4g4vIjnUy39I5GVeSeAF2prjdhh6T/ezHbuJrUxR5mj
         A38Alxg5KFC4UW2tu9YZSzWgex3YgKrwuZD5t3SNSUurAWtMYULA71aYP+t4U2oQVRab
         cMFmbEWsk68U1Fow4NWQHCc39k5pq9SJaJCNCOgrpsNx7U7+VEi0QBVKIckMVrD00ljt
         tsZe7YYxBLk7lhNUoKaUnA0sN650LtMIhlp3LNSh6TPhWQAf1/8gKOfqNjTh9JIv+FtR
         5Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840413; x=1731445213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npm8w7oEd9NhGUvzl91l+nEIwcJyWHznzzikCNtzwW8=;
        b=FoYcSZU8sa1sNTYVqqy2gsD6V8Soa48TfPqrZP7qGunGgC5m16xnvWa1b1fzK8Y7nI
         OZBDu7jfGA2JRn5hvteUH57Ncj2aOMjIx9Hl9ImAHlPTLxMv8IDL4rcBMDrYRocjLt2l
         l7rSAvbGD+Olx3NZC4q5lsvmiB/J10/UldW1Tqr4Cc19ZftxSwrp72/taIr3Jgj7g3Bm
         RV0ncaocdO9bo//3TD29Rcn+rI8SBw6ba6qhbr+qg5R1BdrTcij68tUDCvjVTbq/kXd4
         qJv+AfgUkDKRwNgQLLWmyo9UncdZGSZOMEReEaSGp/gDgkdFNXMM2dkDgB5lH7tpFHfL
         U+ww==
X-Gm-Message-State: AOJu0YwXe/gh05Y4qtnV2CdYdfeWBBzXXs3rFYZQlpI8mp2e0dlataAL
	DURHjqJ4lb/45ga+zFPZz8fNecH9HbkC9JIn3wDdYV0nZkoWcRfbiFHfsDAd
X-Google-Smtp-Source: AGHT+IEIXsnOleUVQ5cnOmuvL68d9IzLsKSxCiLgvhayZw0MQDJ0JbTOoQhcZwfg+j2UHWp/CD4Tow==
X-Received: by 2002:a05:690c:25c2:b0:6de:351:3e with SMTP id 00721157ae682-6ea5232965emr214883487b3.8.1730840412851;
        Tue, 05 Nov 2024 13:00:12 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:00:12 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 153/161] ssiapi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:59 -0500
Message-ID: <20241105204707.4155-153-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113669

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index bf9de31f8..6a6c184e3 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
            file://0004-include-limits.h.patch \
            file://0001-Include-libgen.h.patch \
            "
-SRC_URI[md5sum] = "d06c9b426437a7697d77266e9835b520"
 SRC_URI[sha256sum] = "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd75df62499728dad8a"
 
 S ="${WORKDIR}/${BPN}.${PV}"
-- 
2.43.0



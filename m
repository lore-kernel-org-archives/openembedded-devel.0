Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC6CCAC5AB
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.17308.1758290379128949363
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMZY8LO2;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c2908f3eso329910266b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290377; x=1758895177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJJvr1ltn5fIUUsfIXOyVudFvS88cp+eL22hiupvXJQ=;
        b=hMZY8LO2MJptZJxarB5S57aayH0EOOr6aCbIIwW7celmbdTBzHOIUPJc66eGctvwhy
         JE9v2jcy8nZhYb8O/t73jqUuGIlafXiUrW6bJ1ZYF2QvJsz935SQdklFq47gDZWKUUcp
         e+MJivEy/AKQu/KTNw6hITs2CotMEwdUEAjm6T9ATTdguEQXqXINGm1bP65CX2bzd5ol
         reDLD9GqCSdeFt4jYyLjN1WIJ4ngqsFewrRBjQAsUEqFI1UhaNlg7r6ozlzF1zUwEQZx
         I0QfYPItQx4ylchs+Xs4RQZNZ1Lymw7d7ZhcrBAJF4JKa2l6/yBQNxWDEL0i4ntdF5YT
         MGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290377; x=1758895177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJJvr1ltn5fIUUsfIXOyVudFvS88cp+eL22hiupvXJQ=;
        b=HDKnJL+P+AslNmnzCaEqpn6Mwz+VI6Z7FQchdRt1/xwgxdSwJCz93Zb5ZeyyoUFW9h
         N/3QN5tc3S5Gg0j4tGWsib6wIb/9yPtzkvINwCdwJdG28nGYbyGXSMQVdlrK4LqnIQj5
         q2ND+cbZ+xO9T35WnIovtbFn6L5e7/AUX11AhWyiIfPlZmyYpu5N3Qo02plavLfoVJhz
         Dw1yp/MwqpDw+xp2Ls7k42EZyG8eHX97VMIKBI8lIUD6dQqZWqd+v2GbPQI2LVhHquU7
         q+vsvmOnhCt8n9MxbTmOsja1OK29CsFMK0YlSX2CcE/fWCTtZHbgVZcUp7FYRRZKVXno
         f8oA==
X-Gm-Message-State: AOJu0YzBKlMZvARIOrPOeH3kzfMTY7pVHHaeC+2U4Bb9Hg6Em0DNEIse
	JQEJYROV6J4PGD8//pIpBdtfeJWAS2IspcQlB9iJ4GNwnmf9paHjIy30QCj/gw==
X-Gm-Gg: ASbGnct0hd5MtW9EAxUT95fUxlx90VtW/EzdpEUf0CdHdybzBupQIjZCurLcWHBSoLS
	LfWY1ZsP3wUyD3VB0IqoSTnBhnXE/cIHBSmzr0h56odDN+LCtA7eLxckdffRqAgFlsS4ol9QH9x
	L9sGsZ0GkHrhM2HhEfmRQUP0Y9Nsz5cbtsrnJDLsLJFYnEKQNfvEU5R459Cqs5Lk57SmzN6O5bp
	+h1NEAhehMSTS8b/Zt62wSEEaeaPfHnZ0W5t0VV3iQR5A9T2h5FLTF1/mq5MiobY7+XITcnJ5Cr
	4TJu2vTVQa8g/qN43HnHxqNxvGzx0vnH6R3af7y07xfYxqxJlyXdIgrlizTL6lRnz3KJ8mA7c2Q
	2A85Uko41oZcyaz7mnqrq
X-Google-Smtp-Source: AGHT+IGTH3kY8U9hEvmyN7tWnBdyV9Rs9iLHwOiIkqslve+PjJUgKj6TNXcaEKkrIClxEUVwk7rt/g==
X-Received: by 2002:a17:907:1c0f:b0:b07:89ff:5ff0 with SMTP id a640c23a62f3a-b24f4ebfd99mr317893166b.51.1758290377341;
        Fri, 19 Sep 2025 06:59:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/9] ctapi-common: Use archives.fedoraproject.org to fetch srpm
Date: Fri, 19 Sep 2025 15:59:27 +0200
Message-ID: <20250919135933.916848-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119602

From: Khem Raj <raj.khem@gmail.com>

This is a better place to fetch the srpm as it is fedora's location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e36553fcd9b98889fc356a2517645c030f8315e9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index b7a9d3e936..0e994d8b09 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,9 +4,9 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.LICENSE \
-           https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.README"
-SRC_URI[sha256sum] = "0531a6db39271166f1e9060f81a0b2d47f878210dfb4f465c703fe205cc3a8ce"
+SRC_URI = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
+           https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
+SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE


Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AF8C7EE2A
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.69015.1683477217403565599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LYmuQljz;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-559e317eef1so54026967b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477216; x=1686069216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL/ex+vLyrFjtC0ITDwlp9Xx+En5qLJYDXRjXAEgsMA=;
        b=LYmuQljz9WDJyhUjOKpy+Xmwrn5yeJ/zPeNChyiQ3T+7FcWnWULwPNpPGapm8iLS3U
         tpUp5E9CytQks8LzATnthWZ42pw2vtx9dKjqgyS1cUihBjTZ036mRWM2TRilzuMIfho/
         YqE6l7N0TDLWx9qTWMUrujF0gBsBsMTR9pk0tKu8Zy8j+cFSNvjpfhU9EghTC2t3CFw3
         yCdBCs0Qx4cRB7KxNfjQ/KOzmkB3PDtzY9ddwqhczQQ1GYukzaG9V9UtINfpC5sn1zL+
         AM0XWAkBlHdxGNTKCFNKWq3ZYDxYvgDyDl5Htu2rXCnrsyKxN+BtHGkMiyy/v0H/9iQd
         5RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477216; x=1686069216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL/ex+vLyrFjtC0ITDwlp9Xx+En5qLJYDXRjXAEgsMA=;
        b=IQTOGYMZQFd34nJ6JmFSoNBU6QWTPiwuhtRmL9oUYOd67GnF3XD7+e0IMjZslwzbAX
         gVZQUcORQigCkBBcdxH7XzJajAuQftWL5W2l1ObAF9Epc+m0f8/e1qDJPmDKLxP2+EDJ
         eIKBmbTleWV2jMkdQJWg6P/8xyeK8laG/bZ2nbmNugbII3j71WroizAw9uuT3xETeHLv
         xNcbtnBVEERqVBwsKNW0EkdAt9z7X8GGpjvmPKxSuizuPnBF4rFgWsEczCVzDkw9mQ+b
         FO3n05p0YUJOwSXYqI46imR0IJ6m9RFhWKlGBat+bcLIRML4W5ILb+gQpg4/mfy+Ewk+
         GNIQ==
X-Gm-Message-State: AC+VfDxylVy0y6SemPiu8P/1Z0MVzPlPEUnqCkfjt3ipjci2mRuAQ+kv
	wwx8tGXCyIadoxPy5tAJAZan4+tj34Y=
X-Google-Smtp-Source: ACHHUZ6IkJcb8kriked1v7hi0USFYHNZBTY4JtbiEyXE+h0J/Z24WWKnEKgXpBdB6u3c16q2RRws8w==
X-Received: by 2002:a0d:d516:0:b0:55a:f428:e8ea with SMTP id x22-20020a0dd516000000b0055af428e8eamr8522157ywd.41.1683477216384;
        Sun, 07 May 2023 09:33:36 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 28/29] nfacct: Update SRC_URI to point to valid URL
Date: Sun,  7 May 2023 12:33:04 -0400
Message-Id: <20230507163305.3261044-28-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102358

From: Khem Raj <raj.khem@gmail.com>

Update UPSTREAM_CHECK_URI accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88b295625df710014b67cd2a6bfbf2cbff8838a2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index 20a84121ee..9b938beae3 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -3,12 +3,10 @@ HOMEPAGE = "http://netfilter.org/projects/nfacct/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-UPSTREAM_CHECK_URI = "ftp://ftp.netfilter.org/pub/nfacct/"
-
-SRC_URI = "ftp://ftp.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/nfacct"
+SRC_URI = "https://www.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
+
 DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
 
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-- 
2.25.1



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE36D3610E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.27764.1730831935388915684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDZeBWXQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso5345954276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831934; x=1731436734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+C/eQ4w2Te0CulCRZw7jMYLlbLBCgHTndETpOzzLFg=;
        b=GDZeBWXQ3tRNry/7P6TMwF7XtelB/Y47elieAVHGUa4pM0h61KvbsMPhCqz7hfsvTy
         94LAHxaSfeKCL5BPWExBwMFaMIayH+bPiVb5sejx61f7bBB26roRzJeCpJ8SJyl3RZSR
         hvc7UOvIolKC9s+9HJ20B5g0HbFj+YPtUYgcVem0Es6wtjMOnG1sRlPOLa5naZmkP8tK
         5PaMTdj4bOVLKb3Js4yze6yEygTz5kDWy+uI8xM24+Snup5xH1fXg/GeKBN9xqptEtgY
         JDF0PAb7jrJFiD9oMKBVuNPaMwNeKagtsDqB0TylX/NjAoe1r5z6alodp2H1OcOxtDE5
         WOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831934; x=1731436734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+C/eQ4w2Te0CulCRZw7jMYLlbLBCgHTndETpOzzLFg=;
        b=Bdpgtlprzuo/jdyu4k1s9frcUPRhxCWkna1BSdAfvMw5sT7D8MKVDrr/uDgzavr4tP
         cWOLi1iTl6m6u6WJFB07mt86LpkOJYDXt7DCKb2LN4soeAGG9V4G+gc6k1yfI3Ocgux/
         vulSkgbk6AHYuINZ0NQVf8Nz/qasn/t03sV5Fx/5FsYn6cPkm5EgS0wisykFRGOVZ0wy
         1z8lNYm7WtW3wVO3HzAf8MJnzi6P3pg8L2hP9R1W1DKV2G6MWw+l+njxO0k8vlMl1UhK
         7fZqEHFbJ1Ds3EyY5QL61LmPmMq73JBhRD/QfJLD/sLX0fbKbu5MFh0XPizUlG5MsiD2
         NIjQ==
X-Gm-Message-State: AOJu0YyQapxSNjJZxz/R/nLwlscRj94pKK29itHzpg+Sr2LOPhP0aAaR
	JdUvefJyAygw1DjPXWD11tJv2NY4z9J312+Sl0lEMl6cYlum+GpbWc7hyD28
X-Google-Smtp-Source: AGHT+IGKwe9Sw7wChj8shvgoodysVLD6wdDNyEZaV0cx0i51K8VVEnGcK9LCRM7QjWg6fwx1wMvsiQ==
X-Received: by 2002:a05:690c:4a0f:b0:6d6:aa50:9267 with SMTP id 00721157ae682-6ea52551fa9mr222597237b3.39.1730831934074;
        Tue, 05 Nov 2024 10:38:54 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:53 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 068/161] gtkperf: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:44 -0500
Message-ID: <20241105183658.34982-70-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113583

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index a5c8de8f6..16ab6d6fd 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
            file://0001-main.c-Define-prototype-for-setup_appdata.patch \
            "
 
-SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
 SRC_URI[sha256sum] = "9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gtkperf/files/gtkperf/"
-- 
2.43.0



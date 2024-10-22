Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C4BCDD0D1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.21775.1729612082554550793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QaxXw2Rh;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3a97a6010so67284257b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612081; x=1730216881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTBdX6Gvn6cO0JLWem3F4MW3quxX6hf9krb4+nj0rjM=;
        b=QaxXw2Rhkn4cTm3BwqRBRd8LNv6QU8yUquJFyumzF6MZqvI/I9tuo992UZoVLmky0v
         gYidBP2gVFk9+KnO4VC+159EPcwpB09fdn8OxeB9H5DCt6X+LVaLA+9X1brT9zP2J5gU
         vr1dhrEddO67KhkkgTc3BXa2pxhXNOHgflilSaJ2PpUReCeO/JfNRlwapV+p7nhsJEUg
         sjqgUf75mTOc8v6D3i2bVrlPdnTW/PclLj2vNczmvDDFDT+jDeLIQQwlrBZ97O9vQlsK
         rQiEKZ2qfiPJnDoFxNUy5Jhs1U58vvUp/htf/sUzMQqK6sBGn6XTA6p4UxOLC/x3EoCE
         t+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612081; x=1730216881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTBdX6Gvn6cO0JLWem3F4MW3quxX6hf9krb4+nj0rjM=;
        b=w2xdKUKtdCARk9EWsrWXJ3HJ/fb4i0P6UM/q4eKFmqYSmvEQviFJavCydWwfcTIMr6
         H18vqzfK155H7MzhWGohOpKkbuQF/poyugE49W9+FOHbGs2jLpIaoF4m9lABTxVxp+EN
         D1ixx1+XfniWdHZ3/uCZJ9YCJozxDETmN8RgIvT1VWCbJQvHBM8vdOX/NEYKdnCSYp9s
         ENlrO+yPIMLp173dxAx5TugFWjFAV62g0TaYgsTXsiKr8xkBeQpvZapaM3SGGZwGiKJp
         sia5ROoMuxSSYS+kSDWIFcIAwy1slkrfHMots93CXqYNLfY7LS5SzJQPrdCbC+AuFt9N
         VvLg==
X-Gm-Message-State: AOJu0YzqaSdLmqXSnKGtuwSohyBatpVDI2svtiOmwOplVuaagX1Nmg+M
	064g1jjBpe6MDWSzKfKRy2y+7HHB2w3Pv2Doun5U3lkGrf/ajIHmVlrtOw==
X-Google-Smtp-Source: AGHT+IEc6LB9/cyVxt8GTB5RaAXq+xOWKywk2Sey7MysKrymemc2UrpTgR4RtjyAeGkPyKZZD2B69A==
X-Received: by 2002:a05:690c:6f0c:b0:6e3:420f:a2d1 with SMTP id 00721157ae682-6e5bfc78c7emr157623957b3.23.1729612081333;
        Tue, 22 Oct 2024 08:48:01 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:01 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 11/46] libdigest-sha1-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:29 -0400
Message-ID: <20241022154729.20331-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113102

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index df89c9bcd..4aa37243a 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "bd22388f268434f2b24f64e28bf1aa35"
 SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
 
 S = "${WORKDIR}/Digest-SHA1-${PV}"
-- 
2.43.0



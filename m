Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AE2D3E788
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.30352.1730838817887293750
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XcRoXKbe;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea07d119b7so48381467b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838817; x=1731443617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbjJDNQUF4QY7yQB8iBY4tTUi7u8CbKo3rnc5r+bVuE=;
        b=XcRoXKbeuvWjEfEms1hdr8Xd7txBuKlg2hrD4ZblVWHDyUzrZdgJmTCjqHjGgyeOdy
         K/uwKqs0+KVnuonLdSj0qmL3VOhhFb+lE3ImFj4M/oilBSPJ75vDEpF1br0ZKdBxqJVM
         ycb2TpzyPSgmoe2a8W7NWv9JnSMZaXhjAvr/yCH0nXbB6lJv1RJx7oMfMoZOHylGSioa
         b+GJf+Ccd12VjUHar4T/Hjly9QaG6v2ALtjImtevspakjT95xY/YcfASgmj8qN6lqrhW
         FPpIS2SReuyalDvt80qFnEbqsnbBQWDb0P8GDf6XJNPecv2DLCMItTvATU5dhMTuT19H
         H/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838817; x=1731443617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbjJDNQUF4QY7yQB8iBY4tTUi7u8CbKo3rnc5r+bVuE=;
        b=Xm8uNb8mOFpKuIP3mNJr8BLzoOZxDus/3mOpLranpdtpqNS1tICeekVS724Qd4B7+z
         QoMgZWaKFAYP1mQ3To15TYOtjWI5TMT9taF07WWqaYrfar9fv1MjcnPf78zB+x/MXsx4
         7eRY0ojToS3ESm2zkIWhlbAvmJxYmKnwr6cKR2oVdWruJ+QUBVCEqV4WneNHBEtqaarf
         Tk7d+FBDaMBp1lfcoLjOFKT//WgBqJj220mV+SUszNdC3U5F5+c2LlWOn60OD5KEepmu
         3ph0gfldQzz6h13vZbv5O+pEEdTdPr3xGsamZyOfqZTacH/Z/dzm1xSetiOqM7Zkga9u
         Bhrg==
X-Gm-Message-State: AOJu0Yx0jBnNzTq+zaFhGWoOArcMfPoK+Rziv9dP1n8i5w942zNXHv0x
	s/2INcAWPh708nyi5ftglmYn3BOP95Zwr+UlPaNSLJwebyXbNY2bDzAi4vUj
X-Google-Smtp-Source: AGHT+IHU7fqlmimV00IhwaAW6fiL0oGiopHI+vlVmRbWJ+j1sylZIjLd0xodhkz+9RRQYbbt8Uwfhw==
X-Received: by 2002:a05:690c:1e:b0:6e7:e76e:5852 with SMTP id 00721157ae682-6ea3b96aaa6mr307954597b3.32.1730838815919;
        Tue, 05 Nov 2024 12:33:35 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:33:35 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 117/161] geis: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:42 -0500
Message-ID: <20241105202827.3104-117-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113634

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 139649b97..2ac535d25 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -27,7 +27,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.x
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/geis/trunk"
 
-SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
 EXTRA_OECONF = "--disable-integration-tests"
-- 
2.43.0



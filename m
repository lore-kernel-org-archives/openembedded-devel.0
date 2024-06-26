Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C9DC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:50:21 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.28982.1719413420317474125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=AWqkvblB;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.181, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7066f68e22cso3165238b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719413420; x=1720018220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vKpiM/sU5nIOmirwcMMxN2e7QSkNrRGuMyIibH5E1zQ=;
        b=AWqkvblBRhF94bSxrd7JsmkdiFU24HrkTb1nznmnms2WR72rPti4XyLhMEHNtULyde
         P6WRGiza1SrO64IX3vZhSmbNAAns53uMp0OZ9h5hV0SAG/2QAc1Nx3pKA8/yUfWwkG+r
         FLqrUem6318vBvLO3tjKrIz4fUG/a0MipJWC3/M4MvGqEOsrVTj2/Mqt3W2J3DVF2e7r
         EhUiYmFjN0MfJL60NDQr33rN52v7+FwbUfCOj1RZP/UcwVQ8dRmqqTyX+cFfYVuwHlQW
         pfCsVTgpsn5+hZ8VcS+MOU2APE3eCd5EiSemjaF2dJxk0H1hClI2cQ1pHq9vHkwZMI8x
         K/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413420; x=1720018220;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKpiM/sU5nIOmirwcMMxN2e7QSkNrRGuMyIibH5E1zQ=;
        b=EY3Hl2XfI4EZ4mWZ3ztNEViIzbpItjluY+/gea6HDpW9G6qgi57T10KS2Q/6yfRlKV
         AG8J//gb0qRsNNMTioPjRDX2RDqoxlf57xTVkcqpeLlpM5NPeDUZUzN8ggshzk1Xn6x2
         GgLeBZ/eJ7WZlqNqV3TuR3p+jnQqb8cB1XFQHjjFz4aOR3mshW2FYAnTrgEi0akdWNIm
         b7wS1BXs5vGxj+oYxPLRSL/0GgLbe/mDeFs/2ZSDPufML2a3vJ94JXiGol6sqtsDO8Yj
         X0C8MsYA9ur84q6gl7Ntn4sgOqKJ/Dlmudz0qdb1u6k8eYim7tJjIdcz2zgoxtG508K/
         xQgQ==
X-Gm-Message-State: AOJu0YxXmz1UST9h6g2PVjhHTe3aWULWLejBm45Eu06Gu5zHXMZqXVvE
	zTbfIhzlY4npNsHSat8aIIlID9dQyPGZxzMto0PYnMKggGjb6Yqdh5EBj6eXaQmWoOEmCbC6DnD
	G
X-Google-Smtp-Source: AGHT+IGMh3FKmZsHgVvgFxJ1/1J+ORuaXK/CWuA5BySWnCoZodU4ognQJt+72bCc8tbzzgY8Dv8uVQ==
X-Received: by 2002:a05:6a00:d0:b0:705:d9e3:6179 with SMTP id d2e1a72fcca58-70670fd4148mr9524215b3a.26.1719413419663;
        Wed, 26 Jun 2024 07:50:19 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70682d98ce7sm5826308b3a.39.2024.06.26.07.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:50:19 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] libraw: CVE status update for CVE-2020-22628 and CVE-2023-1729
Date: Wed, 26 Jun 2024 07:50:06 -0700
Message-ID: <20240626145006.5537-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626145006.5537-1-ninette@thehoodiefirm.com>
References: <20240626145006.5537-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111104

The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/libraw/libraw_0.21.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index 4d089f3b7..6b1355fa3 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -9,3 +9,6 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 DEPENDS = "jpeg jasper lcms"
+
+CVE_STATUS[CVE-2020-22628] = "cpe-incorrect: The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2"
+CVE_STATUS[CVE-2023-1729] = "cpe-incorrect: The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2"
-- 
2.44.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3245CCCA476
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 02:07:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.6733.1759889229953439673
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 19:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8U/7KJJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eec33b737so94131805ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 19:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759889229; x=1760494029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1g34V2ZEQVONZWLaahjyzeITKcIG6xxL5H+uKybUFM=;
        b=L8U/7KJJWU0kuIkkCmcdV5ws4Y80TwNGqK6qpJV5/hssaebNg0pDHIYffgaxGpqYc+
         jq6qDa1SGoxKZ+Ka651rsWm0QpmAeDlVWRoazDNXI8z5GULIroQPhQfNubC7OC5ydP2l
         ouRu/0/sY1iQdVyFoOa8cbosaXiTrh2Ig1gaSYltlPuV2N9x28ro98uTmJyQ4OFFMige
         hwLO8ZS58tBwHpM62cgnhLA/jrfhVFwCkQNUji0zxzGCezUX98OKdQjeci5v6chflILe
         aUVdbDUM64IMyuDxAE4Yx/zpQo6paRD2SrFYzn7BH+iH63+Fr/cv4vPDBDh4WsgUNQcI
         np4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759889229; x=1760494029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1g34V2ZEQVONZWLaahjyzeITKcIG6xxL5H+uKybUFM=;
        b=Ofnr4EoOmYN8ChawMA4w+QIDWT+kuDxEKe62YAfA/igRqeV7mEHKe0diGyw33n7B/T
         33wiFH4w4i+nD0IRFFn22VJBrD9wUBE5UT2LBLcRyHw14qjhiq6CcA+3z5o44LflBjr/
         CVeQRa7VN26TNljPKzf/FjQhOzeYDbVoGn7uhHSnfeQC35yLIRXUEWeQ0meOUUjBAZJE
         zPiXPDvF1sxOSMf+iQA5HtfD0A6lSA+sJqeOtdL3IJnswy7xnBIjmelTY+kQLaBAFfRo
         Mjsr2WCI2xwB9hzfEIx7jE4HgGpZU/T7le657zywjFvPJXQQpyOn9tWzjQNCT/phCMyj
         XVHA==
X-Gm-Message-State: AOJu0Yx7kO0Aq88GiyvOjVDXKILiZfVyr+ysKQzDPK9I3EKgTH+8SZzm
	Rn6vEb8kmSzxhUjaBRJtFrLt2Bcspb2xiVeLM4nyW/2c/QTAIzNqxQ1dUFXlMBjE
X-Gm-Gg: ASbGncsNoveFhRD0T9wjeMhfpqNZNVGx4ekZohmfGOcpmHs/mXXO6SRUxElYjPFAjks
	IGDR75oabFYEKm+ennCGXnsSYrNELQl+27+MQyH9mU30bk6ixe8iYrn3K6sCojtbdeXSXzU31ho
	1zdvSqCeYxJo7kRtruth5zCNhqtUndZrkzo6MTTb/kZ/+5AJQcaaRngL4oq6lFqaXA9r1F927JC
	SZnYhVhYspbcu3px18AyIT2TCClhIbkZYjW1v9onwnnmbwCNde0l3C8Ee508HVM1Cv1UIBa1A9w
	+xMPEuV8+8wh2johdQCbDxkc4vaCUwIW94j6rvh5wibnzADZUgMxrslbWXM/ev0ZdZC0aFAXF+Y
	cLM46rKs7/go2dv3y0GpvUHnPqqai9KmTZzO7MU5BXisFPqgopNL9Y2ExdU8y4b4iIz7HLIhlDI
	jXzHrr71ecsyyrvzDJ2Rq9u1EmZazK/gPtwequEwBwh2gpNmVkY+bNYRN1Zgf6qiY=
X-Google-Smtp-Source: AGHT+IH9bJUuyPSrrmLN425njJX6Ja7boa8MYuWnYU1djoDsoHhEdMsMEXorvVamMVfw4FXe6d3yrA==
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr20738505ad.22.1759889229011;
        Tue, 07 Oct 2025 19:07:09 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f19ddsm181080335ad.127.2025.10.07.19.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 19:07:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] emacs: Use GNU_MIRROR in SRC_URI
Date: Tue,  7 Oct 2025 19:07:06 -0700
Message-ID: <20251008020706.2152417-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 02:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120354

Sometimes ftp.gnu.org might be slow.
Add UPSTREAM_CHECK_URI while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_30.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs_30.2.bb b/meta-oe/recipes-support/emacs/emacs_30.2.bb
index 6f9b8a485c..95769aa94c 100644
--- a/meta-oe/recipes-support/emacs/emacs_30.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_30.2.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "https://www.gnu.org/software/emacs/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
-          "
+SRC_URI = "${GNU_MIRROR}/emacs/${BP}.tar.xz"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/emacs/"
+
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \


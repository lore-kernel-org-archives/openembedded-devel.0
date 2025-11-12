Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E54CD37B6
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6294.1762976147568706463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4WLlU6m;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b312a08a2so26186f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976146; x=1763580946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1zHgx4Xbdw/b2y9/EbMAvvaarZg/fpDarL1o4pJn1k=;
        b=B4WLlU6mrEnRHS6fthugQjreyN5SiGjPeP+T/Z00eJ/f2rAlWg+yXokX/q1ZCyaqhZ
         FKdjqhpp/NBEzlIbVTLM4zyK+Zx501Au45zDYBq2cDlSL5s2x+0LNzna8CRNExcO27hn
         lSOW6z00ZNUJnEyWAFdw61hiusvqgEJT0iA+yQX1qbMVrXqqYnAhmn59eu1Hcnc5LCR8
         ZLDhGhaVwb1x/h688TblGtCdZaXEuG86PmqDy1ykxBYI3g8SrAAJttxj4FAxeO2IE+SI
         62mN1en7lE2UA5pbvoHn87PqwujPohLPz8uoB8EuyNhuEGycbPmzGFP+kvHt3Ifm/ms3
         ASZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976146; x=1763580946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1zHgx4Xbdw/b2y9/EbMAvvaarZg/fpDarL1o4pJn1k=;
        b=KOmQ9rAyIG9w1id3sijjiQuOuC0Rt6iquF1HlERb618BKXZNRSdB+s3hKPRQ4l476W
         kcLWZK4nzqslLoRWf5XutEjW+FwsWeN0WI/zPPphigt/y0eAbru2Z9K9YTsmE9ti6VjF
         Iul+9ANK6dNHhRWqX+HS7onv3gdUfDAx6EU2GulqtMR9jib9IY7cJmidUFCwMHTW8xFy
         LKhwvjjH+M038BD6ANXwxFyuBF7eY8qP6PogK98y7fuMrrQBhMZfugzV78+hcenNU/vs
         kQNCYlOWJYfrnca5VM9Rh7kgrpOKbbolHBAFCqsSgxvpEJihWMnRAdogvqMf3gKewdKN
         EBVg==
X-Gm-Message-State: AOJu0YwQOK+KFXhE0GuRlMOfU2uNnkWKOYd5AEPpqWyAm5k/UAAO2oln
	REZvQG0wOeVOs0dra7NlTMg56/a6rN71o8BSQ6xVxpA+83eMmXMHbEcMnJVcXezz
X-Gm-Gg: ASbGncuXiMSeu9zY6l8zK9Yl/m8CiDwXeC7JkAsezU3YKT6zPoF3JZZv2qwejMPCAB0
	FsKXjV5kjlTVrLxo4U1W7Fd36EWr1vtumU7yjBvLGP1rY7rcrwy5vLXc51Rni4b1hrd4BB6AT3H
	BubHjQHN+Q1C1bSuSFKq1Vdt/cBhw2VLcQHwURX2ak896PeP/ntQL8tSQDFrcDbSDPvqvrFIDZ6
	aYVBJd6UlpJqE8N5vz3IhX/qu4jM/Xl9GqfdG4dDb7K8JuBAV4QL4VwZQJ9PXnwlgC1vVS9YvCV
	2Ra4hv0Qcf4F7fR5HJrp6YCdzuFZhxSRTnNi63ADLeU2uVQfUiPlf643pMfKVrk5P0pkj2092Dy
	zWd9s8hxawBm4/Wu2DLCZkWKoWN/R0WJWtik1nUf2l4fVXyVFAoeaU4598dBmSbRwkSRj4cx9ZG
	JvzrPJMMaJ
X-Google-Smtp-Source: AGHT+IHWLC0qLFYfg+WFmYQ8SB3Z/rU7m0DUKU7WaHwD7xc1yaLsTHK4CRH/c0OTtKrSXnSBTrwvsQ==
X-Received: by 2002:a5d:5f53:0:b0:427:7ac:5287 with SMTP id ffacd0b85a97d-42b4bd9bcb6mr3662246f8f.34.1762976143817;
        Wed, 12 Nov 2025 11:35:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 02/21] http-parser: fix SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:22 +0100
Message-ID: <20251112193542.1589821-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121565

master was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8fb37f0f954e234d132468adba2072a70812a818)
---
 .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index d4f76850d3..09e26e9f1e 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
 
-SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nodejs/http-parser.git;branch=main;protocol=https"
 SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
 S = "${WORKDIR}/git"


Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18714D35E35
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.27821.1730831886500978633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mlnafIeq;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea85f7f445so30718697b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831885; x=1731436685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYxFwKnH6tY0FBozsr+OqzMlZmrpHNOBHjdCYb9Q1OU=;
        b=mlnafIeqjvUXNbA0EjsgahJQJlQdANaRjQUnu1fMGXp/Sh1YCXG7vTp03zRV+nB8U1
         LjJq1Jcp4HnB5fU/mplJAuPxHQdUTHM+b0HTRlqD/44tfiin4OiTdLvUWPMwPjoDwTuj
         LANBFGKXO8wEINk+NiFl//G0AiiupJCw9XEQY2G4zaFJsJ7sSLSEzkTY4qURzRpltPVg
         pAGbdETZaxR6Q0awyBj6xESXtpbjseDmfDPo/IXujwab+sMG8mDl6PelQGyFByrMu1eH
         +5kX4w71qJkGODJMTB52/5Henl6PbFfZYmxxZsHrz1HAkfFFvVRwOILCjV0rd0OwFoxd
         42Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831885; x=1731436685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYxFwKnH6tY0FBozsr+OqzMlZmrpHNOBHjdCYb9Q1OU=;
        b=VRGDCVzLuYgdOLIXpNMxPfCvFt7svC5cLl3UEDXZURjosW3t8ApsKsZxKZsBT2erYV
         u7BI6xPM2BB5gzHE/3qr02ruTlnNd5Q3x+SwsyhZr4MwEazcoDZvdbcLJZvf2oY+Yesh
         DJ4U4r47bR/GFmi+C7J6sXnpseA8No4PgAST5r9tkLtkxT50eGYRSXjZIc88nKIu3n1A
         vWcrJB2DR1O2AyZXvtZ+K5YCVNURthsYFfII7ciqMC0IDDGNsJ/gKvzmGM0Mqg8dfPCj
         Hyy3M13wHfsejq6zSdjjJ+PPaDOosShpb2ssseW7oXN8hwex68EcwhoewRGTiThfwjLF
         cjGQ==
X-Gm-Message-State: AOJu0YwWP7cqo8odY3kiZvqwHeOK5EcvabHcbf1lztXluYLI8XZxDKw6
	U5x6MuUj95oIOUQaACz3ttS30pZa8bi2UjaRB/2/43xf+wfK6hDF20t2zqNr
X-Google-Smtp-Source: AGHT+IHOTqRKIaGDM0TIs0GNAZzMmsBlk9DXaypQGW9BU3BlAKV459SXfH32GGeMi6ESQ7veGDQPkA==
X-Received: by 2002:a05:690c:4444:b0:6e3:351f:d757 with SMTP id 00721157ae682-6ea523d13a9mr220279577b3.24.1730831885253;
        Tue, 05 Nov 2024 10:38:05 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 010/161] whetstone: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:46 -0500
Message-ID: <20241105183658.34982-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113525

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
index ce28fc732..ea8a43387 100644
--- a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -5,7 +5,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM ="file://${UNPACKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
 
 SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
-SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
 SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
 
 S = "${WORKDIR}/sources"
-- 
2.43.0



Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AFAE7719C
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.48493.1736119451861424910
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAVLgHCc;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e53a91756e5so18364295276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119451; x=1736724251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvx5fkqR9Mh5WbCHUSndrKI6IZ401HxEF5cLYerxiF8=;
        b=GAVLgHCcyObqNdYKMmFiiXfPQsuf95+OX18naUXBfKGj6NgxueGG3PGfTdVkMXsxnx
         AqKVmIqEfKvZD0kG1g9L5fPSENm3NYHmUolLsinnZkSYeByJnNwLMD2YFAAKzlfN2fdU
         LdYg1O9ssLixy14yfG2su8pxBw56JvXHMF6vMVTVJiAnPC4fVzRCoGh7BeUsNpU25Z3k
         DVdcVyX5r5kMn6pd6kfiFtMKUFzRJ3TfAtgL/+IRaNTyWRlZF2aLAUSWDZAPJuD8HGDO
         phtmjCBVr/m/KMxbUQLXoovo+YbzgEpA6aCDDBOKtKOmYNH2GKyKbv2DHrE8AGiBFUW0
         G7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119451; x=1736724251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvx5fkqR9Mh5WbCHUSndrKI6IZ401HxEF5cLYerxiF8=;
        b=FqvXAdgJxqPpPxLlModiQybCedh15fsnt/NVdULzsIkU3PjtEsQDDYJ0B4fJvNUGX0
         mRx/AkHmMHHHTZr7rR1V4cfbDhAo7x6YvbwDztpoqiYFKPkaoBR1vo+dO4vurwZ5JBjs
         tsihZUteg7Iya2xbFLKowm05+xwbbt4UNKEFKKlpQjuDld4f3CGH7jR7WHXK1Rkuew+j
         9GzzYPE407ZjWN6Z9vO6FhiU5xiQcEACzREFqZSJsmbJ1cwaNDR0Brp3EXHy9Y0ekUMO
         LFQuZ/um/AkjEopyCS2q9KbPvEIy/mB3ayvUrnVThaSCPf9PNzjAXsvVBEeLNLqS/rUU
         LD7A==
X-Gm-Message-State: AOJu0YwkJBZwxFh5/x9tOUu4CSF1tmYnQjM7kP7Wc+ERcZMO+nAulAT3
	VeYIDfHKTgqmsGUGEkvrqfvPfw+krLsOmeHPa2dQFX86IxVxlUgCLn1JuKsm
X-Gm-Gg: ASbGncvFkXA6/kzLj9O/rZLXtN8rbwvG08VHmEl6LGoiav4Q5iy4za2hyxCZVTdbEqa
	GPcO9bh6+8YrC/WHeQDPjIrNdBea5mkebDbc9EossQM1eu/gFTfGk2peGKZMw2q52cuRkAiJb6B
	Y/DW2fHVula3gmRb8M8JLbYiA9wOpLXejeu1X5cfpbZ255I0HKxWMZ+81YgQ15erfO6lvvAUdKk
	CwU1ynzXpv3frQZGolPS8uWtcIA4gJpOeB2h/vOWjney1IkOyUVXvAV8tY+rs6q6KUzzQ==
X-Google-Smtp-Source: AGHT+IFq+XSN6Bt4uh4RtXd16nIrkws4FvsTVquYzwlw3hiF7p61dUrQ9sdjZdPg82xBc4MSBenS2A==
X-Received: by 2002:a05:6902:2747:b0:e39:9eab:908e with SMTP id 3f1490d57ef6-e538c40ce07mr40823296276.52.1736119450852;
        Sun, 05 Jan 2025 15:24:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 18/24] spice-gtk: mark CVE-2012-4425 as fixed
Date: Sun,  5 Jan 2025 18:23:51 -0500
Message-ID: <20250105232358.1502946-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114648

From: Peter Marko <peter.marko@siemens.com>

It is fixed by [1] since 0.15.3.
NVD tracks this CVE as version-less.

[1] https://cgit.freedesktop.org/spice/spice-gtk/commit/?id=efbf867bb88845d5edf839550b54494b1bb752b9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e17f8cec02d20813fb8368ccc1c5ae27b291383)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index c8a3f7f532..4ef39f0904 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -12,6 +12,8 @@ SRCREV = "f04479c16f0969fb394ebe74b6eff74e560a42f0"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;branch=master"
 
+CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.43.0



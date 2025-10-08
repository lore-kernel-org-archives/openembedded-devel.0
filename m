Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45882CCD185
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 09:36:34 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.11867.1759916181369202525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 02:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dPF49u2d;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae31caso1354573966b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759916179; x=1760520979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ry6CUXJ6nT3mlZCVYLPzVZr1gDDygkjeAvZhK0Ksyww=;
        b=dPF49u2dv7V61kZiX3YoBAglR8xZvl1lVM8ktoEQqiznVZWLTWr9dlY2nMePo2beRp
         U+7FvTCk8TmfDmFCQoxuOhhf/G10igqlRx5PuVKdYGmNj0TgRE9SF8ioyG9B4fYFCg29
         3WtNS4o5EukceG3IxSvrfX4CxUi9PGnkAzY5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916179; x=1760520979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry6CUXJ6nT3mlZCVYLPzVZr1gDDygkjeAvZhK0Ksyww=;
        b=ShzuSTblm8X3TrWHhugaklLkh+2JCVWlYFu2vWPAM6MI/qtJbNDdp9cmn9CVjmUE4r
         lgHL0zYgezZlMsm7ITXG5/zhaneyBq1HImyrKhFhoXzwwJhpri1hbQ51wg9OJmPcqWGT
         dev3Ybqn+d0/JFbGHs/XpBzhCW+Yrwfh9FTuPNRlGGKPny8s8hwV7eNjzP+pOqQEit8u
         EgNZ1BlPm3eKLBdMjTmRfpiyN77QKMDGlxPXkVYYik/UYqzRi+qJlSBFGWeOIHmjDe3F
         /g7aGjtiXzfsbiIQf3duX8NZ9QUdJXxro8OgIq9XEYZ1aKo4PEUpkXXatvSATS8TSj5z
         FaIg==
X-Gm-Message-State: AOJu0YyDzSmeUvJ29XbTRJiKmxQEu/q6oULTkJyJI7rUOn3ZtLD12ezV
	TP5OzPMa5BIjwDT+zf5rg/eoLEQZhLQjXxfEAoUFsgX2dIqGioDCEmbY6eZRwplbND5TkdY4dYY
	CuDa5
X-Gm-Gg: ASbGnctIrpyz3w9D7h8/3TZaQw5uuDzrMAQ90JGEDZ/e1A7o16fHBMMvtthoWx0g5O9
	er9pgAG0wiuo1dIgLZY2r/zp4AO5ZFxbtu7lzYo+iY/a87+9pWBZTyygYdyjdyqJjNnUKtH1M6h
	4Vgavx0a4m0lWdL+XvsYOLQGmE826/stzbzrqsGX/pLh0l5W3dKjGb3VjXqjLwS6RZsJulV4nIw
	u2zaf54jIcprexNDCo6ClG2RgnZxvGtu7EG7Z/h4heznEDQ3CqM7624AKTfSxmChGvdmgMgQ+2t
	M1AQv/PD06eUaMyl1c7cTyueeKiUJ9FV6caOQ60sQXamJAWNc0CqRLKprFZbIrRDdGCI2bw3tzq
	to9CdL3ZAam117iLZF/K1gRMPPUot7dALsMu8x/xpCNNL3VLRIhkZcycLJueEXEAaURfQqmbGhI
	reZV49YQ==
X-Google-Smtp-Source: AGHT+IEnzSALU6pwZ5euhP1QmsMqwugsLIWoCFwLEYle641EOiE2YHr4Mcaj9UiGSiFJjyN6qNEpxg==
X-Received: by 2002:a17:907:7e82:b0:b3b:eb5f:9f1a with SMTP id a640c23a62f3a-b50abfd5466mr318025266b.38.1759916179507;
        Wed, 08 Oct 2025 02:36:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1640078866b.42.2025.10.08.02.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:36:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-beautifulsoup4: Upgrade 4.13.5 -> 4.14.2
Date: Wed,  8 Oct 2025 12:36:09 +0300
Message-ID: <20251008093609.2094597-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008093609.2094597-1-leon.anavi@konsulko.com>
References: <20251008093609.2094597-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 09:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120360

Upgrade to release 4.14.2:

- Making ResultSet inherit from MutableSequence still resulted in
  too many breaking changes in users of the library, so it was
  reverted the ResultSet code back to where it was in 4.13.5 and
  added tests of all known breaking behavior. [bug=2125906]
- Version 4.14.0 adds function overloading to the find_* methods to
  make it easier to write type-safe Python.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eautifulsoup4_4.13.5.bb => python3-beautifulsoup4_4.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.13.5.bb => python3-beautifulsoup4_4.14.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb
index 43c861c6e0..d1222fe05b 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "5e70131382930e7c3de33450a2f54a63d5e4b19386eab43a5b34d594268f3695"
+SRC_URI[sha256sum] = "2a98ab9f944a11acee9cc848508ec28d9228abfd522ef0fad6a02a72e0ded69e"
 
 inherit pypi python_hatchling
 
-- 
2.47.3



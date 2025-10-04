Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71700CAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 17:39:38 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.13965.1759599574653015655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 10:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+WQlnT9;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e25a4bfd5so671870366b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759599573; x=1760204373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3jlqKviHJsx28PtwGSZcXhohka028gfLyrCO+5iIts=;
        b=j+WQlnT9GAO6VyWjyMb/Qo7uUs9BdHsNwNcuSkhQX6Cx/e9Io9Xbg/So14SDNKHold
         xnkNp6kEqClIOKSiKUr01l8GMi2NUBugcI28+xpIFgjY+WWAZQjhM28pC/N9+yOisnfR
         fZ7sXynsLD0BbcAoEhE7bAhEue+7fDc5Bb9OsHTzwHMAxGTyLX3nw90lbphKU32jPG3R
         la+8k/RbAO/LRKfD4HL16s5RdwzZJm59MDsASGHckMjWtmXcE54F02LzsNHovCdoeqHM
         OL/J5y18g6zOC6QRB+O98WfUVyNK/XaoVCrE7jzvhHkmvqY2Eupjd+HG5dvGCGthMizi
         Q/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759599573; x=1760204373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3jlqKviHJsx28PtwGSZcXhohka028gfLyrCO+5iIts=;
        b=qUubjxGa/tW7mCCsdhdrXRHrS7ni5nC13B8mnGar1d5jQiln78JFNWo8IXqLHW2YGN
         wd49u0IYi1yxgBePPWGfwabxo/vRzjqY4ZGrkDIDQWKGN0uDKD3T2ias3zkeYx9NvoFr
         o4Dd1/zzFiUrDMIQIn5cuoQH6O/TVK8zt1L/NULfDw0o3a58+CLMJ/o5sU42aHLeI6pf
         653CL3QnIIzg7dJM8TYa2krNQx+c5cVxKm8LfX1dRAHk9+g5azpBlI93jyczU7ZSVvbj
         Y3OgD1ySTXGhDwbfpWsgeR7u+hSIjNJRoLL2YgU34G2DEwzOuH9detJ6+wYWd6384UIH
         vCrQ==
X-Gm-Message-State: AOJu0Yx+5QL8y9lr1Q5tYrci3btGs0leo5dg9Fha9UhyvS/85suaCg+U
	Soxr88OU7pPaGx4H7R9ybIOqXVOjGQy8z6+2KjsSl+bBIFboOjncXqAggLRcfw==
X-Gm-Gg: ASbGnctkTDY8Z3+kU00rmNpsG5Ru0feEAUdBlUKsHtzdtXXCGcPZWColvWYmiS8ysTi
	ws9cbUSwlxg/003QpSUAAOIRvyGXUtF+sa1h+l99gMeVsln9ZTfo+1RZ7/ImFR4U5NRzklDpfwo
	FJolmJBBasUAYwbM1pwMqbxm34N9xRHk8ca/pd14EZGK20ZgExY7qP+upAIC6FrIW+gBec5BF5Y
	HTutt8S1H5aaa1nVm6DcvMEICu21zXxJtwV30zrcDsPxh772lME/4gZjqr3sEypzOKx2kQ3UghH
	01YPcTJAOWoP63rqZ3RQe3S7ZvmxCarckKob0JJP8n7WmEeQ6ZMUuvdIafDbT/b+M2Qyylycs+f
	PI0svkeZp09QIqyu9SG+uWyc+ZwaQfSglWFFgRDdpYAP3
X-Google-Smtp-Source: AGHT+IF1AfQrlJ4iDWI5OIwT9LfodagxAzCkPkKRFdZ2+1QS8A6MbU9RFkSkkM9QdgPiB9+kjqDILw==
X-Received: by 2002:a17:906:5ad0:b0:b4b:e419:9af9 with SMTP id a640c23a62f3a-b4be4199b65mr171260366b.23.1759599572796;
        Sat, 04 Oct 2025 10:39:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b37bsm748456266b.53.2025.10.04.10.39.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 10:39:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] ace: ignore CVE-2009-1147
Date: Sat,  4 Oct 2025 19:39:31 +0200
Message-ID: <20251004173931.2276388-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 17:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120229

The CVE is for another product, for VMWare ACE, not for this one.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
index af4f2c54bb..f4b6a638d4 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
@@ -39,3 +39,5 @@ do_install() {
 }
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
+
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: The vulnerability is for VMWare ACE, not for this application"


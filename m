Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1A1D5B851
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.114.1730140097365529849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKawsmi0;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2e444e355fso4179749276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140096; x=1730744896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEfPtJP3Lh03XyYUNp3jm7ZWP10HuA5OuMSzIDqnrJM=;
        b=HKawsmi0nxTufjOj/ulgtRcPz+N+wM+yEaeqdQ1/JV6nqjYqP0zQ8Gp4aV1XjSyRzD
         uv0T5WuneEAAmSJiV+QsBW29TIbwa3HsHI7eOrR8NWA3F6EGmX3dtQvJbPBQ6qKK4IL7
         Dc+GKESXlHB3966GfFkvYkqdlujr9z0kCh4FwkWUGlFhXWvDrlfkN5+uE7rql0rtq2vv
         prjFr+t9hXePKFBXSwrGPM0uqlkW7k3LEXZ+wszCH+VoFO/ZP/dBMkOeXYKE4uP4xZf+
         6BYDw1oCz96ah+18IAui6ZCe3le68bnWzj3yDRNyLCmnJp1h07lOBN7Qiz4yPFnjzPvH
         xdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140096; x=1730744896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEfPtJP3Lh03XyYUNp3jm7ZWP10HuA5OuMSzIDqnrJM=;
        b=iCc/YKKZqx24bCl9BVUp3j7xEREQ6kMwy+A6ZDpPkOXjCLWJvbG6Y9gT/1Y1aNw231
         13TeML41pLzRn/TdOjgnSWx5BwGDL9Dua7qNwGO2NGH1/G+8f/SKdlhQqeJrAzFX1v6Q
         DbwapSs6bPWjW0ot4ZuNO0pdpm3yXo7AkI21tYOXm7dBzlszEriMYpIj0mVbrukO9KWV
         QcJAXwTyBqku8KyhtU2lwhzSGUOJR6myfy93T7ZsuhYIwbkZTjOEouNS6bvtH6jKX/lA
         1v2j8Pq0CgAirQGDydgqXjub4Qd6BRl8xk7DHjAwUsn4t5v/EgnRyo/DYGJX5Fhy+94k
         A6hg==
X-Gm-Message-State: AOJu0YzFnkuDgzeE9U9PSPMvNm1zeoiN9WKab28im47jKbZ7dtRCsAKp
	zomrc4eTAdAABcPrPl2bCErwga5MkVPgpuA7pWGXS6SLT5MlgrpvDNWVJg==
X-Google-Smtp-Source: AGHT+IGTWP298ZejfwVWClBOG42vwPzUX2T1ZAJXMUxD+xO3H887fFkwVaSjeqbH/8neOrjXSa24Zw==
X-Received: by 2002:a05:690c:9988:b0:6dd:dd40:54e2 with SMTP id 00721157ae682-6ea22da5445mr7424677b3.12.1730140095941;
        Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 08/22] liberror-perl: Use
Date: Mon, 28 Oct 2024 14:20:24 -0400
Message-ID: <20241028182749.5058-9-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113276

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
index 15e0ef85c..83baf2a02 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
@@ -31,7 +31,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-test-more \
 "
 
-SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
 
-- 
2.43.0



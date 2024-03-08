Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF54C54E49
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:24:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.10510.1709861076075444784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XcUF98/R;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-221960e3edcso173094fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861075; x=1710465875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td0eX4YlgNSODS4rDsjntt4TR2peqEiGRQtxnjN/p2A=;
        b=XcUF98/RCY+ma167q11plsfyWpFhsnHqejiRYbfp9povVyCezU23s9psaMIyjiTl3V
         3cvzLTUxeMW4X92UFmZnqHFZSiwXa7ryaSDG3tQ2jOxXTnJsQqtEAwQwYBcD962MYgkK
         d1Vxdayg4o7VH8JOyFTl+u2TgtERd914aMBIDQkt3+vyq4w0t5O/tmigwN1qJdsIIPsW
         vUtBOxOWosQcNMXo/zlZplT8BunePL0fMvEyEUwdeyizSeRcY7vGdWIH3P4McSHwXJWr
         7lqqIjO1liWjOPTo1hN2kLGF3yJPcWuyUQoFKwkH71DofsTVmBHCfzFgfT7ExxWKmTZ5
         XKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861075; x=1710465875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td0eX4YlgNSODS4rDsjntt4TR2peqEiGRQtxnjN/p2A=;
        b=iBG0Vp6RDu+mm7ktwmJ6Rjm6WAY/Qy/1TmKaWdQU3jFBEWhcSCaFQUQrWiy1yWoBeE
         4RobD7UiYZfoIu9k4hfg7+MA0jXCjnYzFtGoKPOJaR0z2UgGpDDFv7BoogObmoRrTnDw
         lr6Mu0Xym497Irx+w8D3knJkmwRKi9fmXd01xGfEkt9IMWoQeeefv3jKQYnOxf+Eq51a
         SzpK3u3Jj6284EzbORTU45LzreXZkIh4YDopcDPt4xxVrLyulnZC9gKKjyuxMJHKnpoa
         mZOA8ELX+c50JVt8hYu0E1xCh4h2/O10fQIV6tk6DG43DMMXOtD8GZi9YdGiqmqPnETb
         177g==
X-Gm-Message-State: AOJu0YwlzfShraGJga0Opt/NFnsVm3tN/u+5oTFK1HK85E5oGbCoh4yZ
	7x+xr4dG14yegOb7eHvPy3wZwZ7OKQXA2sILWaOR+R/fi3NDd1b6/2NyBABA
X-Google-Smtp-Source: AGHT+IHfRex0mBtcjHsj9JqnQXZ//z6QA+3Ap8jVFU+7vSM0q1nfPJQORO07O48/PC606YsP93yo4A==
X-Received: by 2002:a05:6870:ec93:b0:221:8a03:6de8 with SMTP id eo19-20020a056870ec9300b002218a036de8mr1923739oab.13.1709861075048;
        Thu, 07 Mar 2024 17:24:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa79984000000b006e559bc3250sm10649731pfh.68.2024.03.07.17.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:24:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/5] libmusicbrainz: Update to tip of trunk
Date: Thu,  7 Mar 2024 17:24:26 -0800
Message-ID: <20240308012429.577792-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308012429.577792-1-raj.khem@gmail.com>
References: <20240308012429.577792-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109215

This brings the libxml2 2.12 fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index e8b10bc680..2b373d31e5 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
 PV = "5.1.0+git"
 
-SRCREV = "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
+SRCREV = "4655b571a70d73d41467091f59c518517c956198"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol=https \
            file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_request_.patch \
            "
-- 
2.44.0



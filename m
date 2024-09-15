Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C985C3ABA2
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:13:53 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.117527.1726416829698525600
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRbQW5Dq;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a8ae00f5eso1985864276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726416829; x=1727021629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f29oHZCR/LdCn9Fr+GlXZRuR7if6Hg/RfeHlbuTNAuA=;
        b=WRbQW5DqeoShlxIVbDtb8DUxSE56xPh1o0pitbvBjJpkkZV5bUbWc5e8vNv3fCccVA
         c6dJLhSf8x811zngtTX+jIkGYjnxEJm/0xhtvRzHVmbU4RbbV8Zd5jgAyQOwwS9x+eGh
         SIDtXD1vmsThnejcts/OPcSwVV6RBuGUTITMX/halgoKfzFpmEE1GLUPzmYs+qRi54Iw
         ES1yg4L6eXJiR88mlmEOJfFij4a1NuXAzlvnTZiI3AkbRI5drkGbZXlKM/+gCP+U20Cy
         CgtGmHqGUQm3439o/S1lY5guF4nI3sLO/KqAnIGpw48VSLKlNwggDqXjaBdKq2ynRUfN
         xj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726416829; x=1727021629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f29oHZCR/LdCn9Fr+GlXZRuR7if6Hg/RfeHlbuTNAuA=;
        b=gniSigZw7tgxzxesV6kUMBAolonkoyGu/njD+I6tQUakTCK2h20IEFnsAUHaRPIMzB
         heyINBKbW1l+tFH9toA8NJmTp7iDCURr8ghgEPZZayyIZFMWH8o2hEruqNRqJD8ijWy/
         xvEFM/jwaADhn7IO2gkHW2J7zGss7tfKlR14E/F5e0CKsTgcuxipBmyxfs6ZSY2e8sqX
         FxVuEDQzGWo+WcukUibHAzG+Bxq/Q0nAXlT2QivtvZlxIT9xAJqxbrLbuQamW6lWiUZP
         fe2APk3PUiV53z8MYOtNfNg16evqtMLGc6E/Aq87xXVKIWomohUlUaQ5NbvvvbcINGVP
         AdEg==
X-Gm-Message-State: AOJu0Yyf2qKBgtJES5Dq75fGMEjFmyA58adqsWKU5HXiwV14vb4AoXXS
	EFZgQkJI54VnI2Yt3+gWEEizui9JvYssYiQK7FHD85VuIW4Vh8gkdDaXgA==
X-Google-Smtp-Source: AGHT+IGAJogGJCuCh5V3H146FywqlreJnKjv1rLzXvHt7OBH0CMAJ3OcuXRiJvuvDsbqZctcVib1LA==
X-Received: by 2002:a05:6902:1242:b0:e16:6aba:f3d with SMTP id 3f1490d57ef6-e1db00a6b54mr7087271276.8.1726416828775;
        Sun, 15 Sep 2024 09:13:48 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1dc1381150sm663993276.43.2024.09.15.09.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:13:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] polkit: update SRC_URI
Date: Sun, 15 Sep 2024 12:13:46 -0400
Message-ID: <20240915161347.187613-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915161347.187613-1-akuster808@gmail.com>
References: <20240915161347.187613-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112302

From: Marc Ferland <marc.ferland@gmail.com>

Project has moved to github.

Signed-off-by: Marc Ferland <marc.ferland@gmail.com>
(cherry picked from commit fb3408270282fbd619df7a5efac5178cabc37ddb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit_124.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_124.bb b/meta-oe/recipes-extended/polkit/polkit_124.bb
index 9e2eb05c62..a597b40ee3 100644
--- a/meta-oe/recipes-extended/polkit/polkit_124.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_124.bb
@@ -1,10 +1,11 @@
-SUMMARY = "PolicyKit Authorization Framework"
+SUMMARY = "Polkit Authorization Framework"
 DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
+BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 SRCREV = "82f0924dc0eb23b9df68e88dbaf9e07c81940a5a"
-- 
2.43.0



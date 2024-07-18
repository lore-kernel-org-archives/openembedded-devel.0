Return-Path: <alba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301B5C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:31:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.12208.1721298675907888906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=pTBvIeY+;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.52, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4267300145eso1385295e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1721298674; x=1721903474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XgeDUuQVmqWlP9V1E894ABLqTXPCzwWF9IaN4lnUwGM=;
        b=pTBvIeY+2tMHiU+SKnvqnM+tlxNnqEIoupH89o786/EzWK/1kyNyJ6EqYiRqgEuW6y
         CxY4Zgq8mTOm7Lgnmi2V2uZVz/KMJu0lpv1iZ0smv8YTxn+KNUEOi66Y2oLTo2LPYkgy
         N6nOQeneeizbBjMLyQARoZ7z3yQLHrr3ZdRkBfwzGxbjNRf7pJhyA5Yznkf/y/r8vjr1
         fNlMUUwl3sICHVJvkzCjmZveVjz24nTBMXZPrCWWWZq3+A6ZGKoXsY9DgHpqnO2aEh0+
         PaEKiQ4iQdj2aeGqwJvVwRhzjADCpQfO+DftcRmhADjNdGVYiMSo6CRhLcDKFcN3XzKT
         cH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298674; x=1721903474;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XgeDUuQVmqWlP9V1E894ABLqTXPCzwWF9IaN4lnUwGM=;
        b=DXZZ2Zd626V8XS5JxYra/48WmxuW0XINyeH5RXbRQrB3U6nX7G8R2V0Nszmkk8eiQ9
         e2uIxe+nCTUjRcK5QG5Orz+9psuq4Na0rFRxoHRnqtkWGe3h2aEY9GJcLmlbGbBKTpmP
         CIu4/sSsQFi639VAqpsSNLZU6a/pdmwLIO0sHCwFHuBO7HYIuoq4A8DqyyMT5v8bn31t
         qk5Fg/4sQH3oXVemEUapjqyeIQTrFISvCxpW9jbdTFjZMSu/aGzwPA4Q8yARSymCIAOo
         2Pxq/dH5NpJQI9J3+r+6twQgJiXCnE5d63Cv1Ze1+Cz1aWky53OycvfSQavqSBF13ZBX
         8wrg==
X-Gm-Message-State: AOJu0YxLsDv8scvctyr+wRV8LLeJmq3ElR3XV6eT7YvwKVMKtK5kR6NQ
	Ta9ZhYb9mIN1R8UJdVWAtZQI+NCSS06m2QbIexIsPeZKWUffqsdASXaJECLgr/98o2WFr/Ncffk
	eKa0=
X-Google-Smtp-Source: AGHT+IHLPeNvfTmPmkomENqJ6Z/MAYXMHTnR2rZhwmoR55/lGsiqqXzgPnpQGAplu1+CLrSrhI1/8A==
X-Received: by 2002:a5d:5987:0:b0:368:69d:5acf with SMTP id ffacd0b85a97d-3683173029bmr4218776f8f.42.1721298673648;
        Thu, 18 Jul 2024 03:31:13 -0700 (PDT)
Received: from localhost.localdomain (20.red-83-57-108.dynamicip.rima-tde.net. [83.57.108.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685834365asm1096739f8f.64.2024.07.18.03.31.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jul 2024 03:31:13 -0700 (PDT)
From: Alba Herrerias <alba@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] yelp: CVE status update for CVE-2008-3533
Date: Thu, 18 Jul 2024 11:29:49 +0100
Message-Id: <20240718102949.6841-2-alba@thehoodiefirm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240718102949.6841-1-alba@thehoodiefirm.com>
References: <CAMKF1srD0K+BZ20ZmVrfK6bOrJaqvLf5zTjmbkoP1o0qdgc3Rw@mail.gmail.com>
 <20240718102949.6841-1-alba@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 10:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111398

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The current version (42.2) is not affected. Fixed in 2.24

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index 1b3ded021..69c421662 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -39,3 +39,5 @@ FILES:${PN} += " \
 "
 
 RDEPENDS:${PN} += "yelp-xsl"
+
+CVE_STATUS[CVE-2008-3533] = "cpe-incorrect: The current version (42.2) is not affected. Fixed in 2.24."
-- 
2.44.0



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A230FD3E79F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.30543.1730838677874995263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAfaYJBD;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea15a72087so47604597b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838677; x=1731443477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9sNmA0IDCSQWA3M4N8D9Myjpxb0oKzzEOXmw0BOKBY=;
        b=hAfaYJBD+DCbfkchTWVobGWld60qfdBJRSIdxCeMuxZoauXB5JcGz354dd2nJNB9lb
         ySCvtiD2EGnjSv76ggQ0QZ7GPR8AgfAAEFCa7g3lItgmxJi2waTrRuzG6h86MO7V8A4e
         92qBQqWzwYUVaBGapluCCpr3t/SdpXysYlJMjHSbjc+RlVvk6GL1KhBTatkgj4tbzduc
         UEQMp8HRzHrTPDYe3K0LHQ5qhUJN2x9T61xF4qu8FeUZpPLlj8Qhlr7P8OJKWgu8h6rO
         yB7UMc5zp4Bw0LnFGnsjD6apxDWGiQBw4kI+kLHAfVUyLjVSnSXXecwGUJxiYsqrg48C
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838677; x=1731443477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9sNmA0IDCSQWA3M4N8D9Myjpxb0oKzzEOXmw0BOKBY=;
        b=nEhSn+qxEkVQ8QPyMlQykn6Ki7ldEdrrW6gBgJ5SFiqysSlcDIMMiHrl3+L2qXIVEI
         gPvsGezlAye/OCRZPAYt/R5nOZ9vo50mHxWqHfmtN+4rXcbuTxQqvHSKTzEt/f7jjE+4
         coVAfFrDKtbFdnawt8Zi1Nj3675+scRxe853oHBTFGYRdzOqjsknECtWc1cVPgA/58kx
         Olz2XbC3TctMs2zKBvyT5P+NdR2QmozvdV5Bxd2/W2dVRZ06CroCWcYg/wfhsvESUvpx
         scExXXy3SD7bEME9ES2OU8pd5Mh19kHtn9b+YzRLKLFHr2zdzx9YnxFdFf6+tMiecuxQ
         t1zQ==
X-Gm-Message-State: AOJu0Yz/ORUcIXLyAuzkFTSmTog0VBbT8mcvfc3dh4pp26tIwItIk37M
	5odRS04Tx1bqg+IzSTlmJI5XTyW9n6sy6EhfeBs5DdRadln1b8UnuzxHHkdD
X-Google-Smtp-Source: AGHT+IF0AmmHnuIIqjmkiU24cOysmCV4SJjx0EMMKVuj6lPPNPBIJe+LlVe4dJcQrvQPpHGasKaY3Q==
X-Received: by 2002:a05:690c:4c01:b0:6e3:14b0:ff86 with SMTP id 00721157ae682-6ea524e28c9mr202716767b3.27.1730838676423;
        Tue, 05 Nov 2024 12:31:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:31:16 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 109/161] sound-theme-freedesktop: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:34 -0500
Message-ID: <20241105202827.3104-109-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113626

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 508519e4f..ed9f561a5 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -12,5 +12,4 @@ inherit autotools gettext
 DEPENDS += "glib-2.0-native"
 
 SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
2.43.0



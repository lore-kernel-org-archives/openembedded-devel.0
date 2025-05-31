Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9342C5B549
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 19:06:37 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.12911.1748718390509494922
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 12:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=czaxmf+P;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.221.68, mailfrom: dimitris@siganos.org)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a36e090102so1729580f8f.2
        for <Openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1748718388; x=1749323188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veGcNkEnkc9GuBZrCrF2l1iiLHn7VLYtCvv0QQMdOkM=;
        b=czaxmf+PugS1vefZNfDulPb1/hyCjErsHa9uiK5IH7fquh/lBCXoZD5qSiMLPPdapu
         qLgRhIPt2RLowH/7mlcVdwrHH04xQMfskKom/QmYCn7MG3H7OEIj9uEkHhnSqo17+r/g
         +9n6j2NjeWeuzEF1m9+4hUSpkcQ+XSeaRUaST0lxBcy3ZUV3DM4B33N399SiQ4ncl5i/
         W1r+dO7zw5I7C7FzDaAchMV84zuXHxczXrGwS1TVKm5Fhetrvw/NkvSCVUY9d78l3JdI
         6xkBrx9CZ9NO/7gjprVNJRY3xGGYjmDGszEiAydw+5ICJJuEEMBVO7C5UdTSElkZBhCi
         byeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748718388; x=1749323188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veGcNkEnkc9GuBZrCrF2l1iiLHn7VLYtCvv0QQMdOkM=;
        b=aj2dt2glOgp/zXwjjk18xsQjfTIL1QWS6yjV651E8Y8ZNuA3V0qp7Fbmro7pZXsEG2
         +kUcAQPNMmzQjWGdErd2dldvxpvMZQu79AcxSk20S4Mn26s0ZqqC11QeBA76XxH6I1Av
         UMhR/BCahhe9hGuVvWRan6MciVaLEO385uE7FlmD8isFe1Xdr21ViwZsnE+mf6QpD+BX
         xgYMfULqLXjLRtbh+DC/dolyCjXtp5j0F4mc/5bzqMD/D/ZWm5nfhjH7OQlZ081i0PeG
         Oe3jEVe6cae6RWoGAO87do6ZTSu3hntfptzDyJHxX0u+708uBn42iMK1daHiBrD+nHty
         y+uw==
X-Gm-Message-State: AOJu0YxuPzxALf29JOOmXV1U2VQ0u67OUlhYC9VVsIAQs1DKgFlGvt11
	bfpI99hsXhNCBDM+4vsZJJEvwY1o5ySELtg65/2y1IHvRl06AYTiM0qs+U9s347UbCfqmrOrlYV
	X6glbP/c9EOVm
X-Gm-Gg: ASbGncu64es6gVyFYCkPqbs8ei3dgrpi2FAk2VwigtYTnPhFC5/v6RoVclU7eWkm+Ct
	XrscJf74OLMfP4fDDz/QWFZaxqSLyBVXdLvWnIhhGTVnIRIWUzV4iEiNgbtTRT5WACShx9ILVq6
	aeLgbD0S1Ad1Hirs99Ifcb5uOhiYDDtdFbNkF77vDiJptN62d0xtRAHcVuxmjAyhCfhMroPSpci
	cXd/ZEvZuf8V/R2dMF/wFebyoMNkbG5/6pdj1z1lDBWE04FLx8S4xQGAaNnIchMK3QNagFwxOmD
	Nw274B7qFwptLW5UCuhp2UKSssrb0r8ezZsMgbzq+IIZafOYYf9UwOAw0D6tQhy4zWO+7KPI1yL
	kSnV2kmsIlLpV3RhfDikoDILewHfDkvM=
X-Google-Smtp-Source: AGHT+IFxqBDUPg6C9yX8sbDKIz4DOUg9yeV96Nsonz/XDdihPFE9y5JHfX0r8tYLq5Y/cUB+y8KAtQ==
X-Received: by 2002:a05:6000:40df:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a4f7a7de6dmr6282710f8f.56.1748718388234;
        Sat, 31 May 2025 12:06:28 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa249esm59215575e9.13.2025.05.31.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 12:06:27 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [meta-oe][PATCH] Fix bvi license + tiny improvement in SRC_URI
Date: Sat, 31 May 2025 20:06:24 +0100
Message-Id: <20250531190624.583666-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 19:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117689

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
index b0081794d0..fb136e16a6 100644
--- a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -2,10 +2,10 @@ SUMMARY = "Binary VI editor"
 DESCRIPTION = "bvi is a visual editor for binary files."
 HOMEPAGE = "https://sourceforge.net/projects/bvi"
 SECTION = "console/utils"
-LICENSE = "GPL-3.0-only"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz"
 SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
 
 DEPENDS += "ncurses"
-- 
2.34.1



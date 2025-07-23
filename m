Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1059FC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 16:23:38 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.19685.1753287817449699745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jul 2025 09:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3rpPuCk;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-719a4206caeso1186537b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753287816; x=1753892616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svCTQVh9EYWIjZzn+LNRXlwOXiVUFXwj4JWWyDxS/9A=;
        b=K3rpPuCkYIG21DCi32kBNVepApxMJJsUn+aTPwhqOjg84tgvcGmqjWA13sPxH09gxI
         kAtttPFfc5cN3IVV8jR/qMA284LMf3S5FRYcS+RjjWamjFmEJDoUp3PW5CJTUI1G777g
         RNSre5pTQ4P36FLcjbjl1H+Ep4kQo7N/a+nBC2MWzseAVIkEkoleEn5/KdubnDVLypRE
         wWjUJYSJyqCyE8qCPvO+YHySQv1g+UtvUDPCVT63g+PD8TMnzJgDom9ARmYKH5oHobs+
         oOWfWN8O4gMDQLiew0zMued6kCTxiat7Qmvh8yQRlOIxGfF3vZyiz0GPp7Yej8ksepum
         n1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287816; x=1753892616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svCTQVh9EYWIjZzn+LNRXlwOXiVUFXwj4JWWyDxS/9A=;
        b=mjvgL1pGZzZdrJgb3GZqQ2+wqT3eEqk6W64+imGndsy3orDDYOeAPdEnewMvVixaDH
         HneLM/4Bk88TXq/taSFLIS4iOocJSAwsvjtOE15PGUrgFcvbtVdMajBCPDwLiB7giICY
         flc6/zfKnX+KltBwJqftkQwNSn2QHQcsvXNautJICnK9AMQ380ssHBT3hM8+vo5IU6qt
         Z+m7HcONOyAf/dm8evhWOrk2ZwvnhNhF3A2Qg9GPhGTqHYWXe86HSL40qS8hc0N2QjgO
         TU+JYvH2YuqDj8/ktgeNtUG21FRQ/twnI3GBLg5DV7Rw9fEUK5K/iyjd9b7TnrmhuFE5
         wEOg==
X-Gm-Message-State: AOJu0YxPIeIL/2ey/Ib8aRGEw0vX4j/daeIGNwPyNF629Knjph2lVTlC
	7lbIeVxPXJiRAy04g6TffbRZXtZFA9fKdLOAP7OkTwrxL/xymdRabK+h98lbdQ==
X-Gm-Gg: ASbGnctUpSa9VO/IRQllmVKZGaE7pfCNqvIBHbEJ6zKrtp92bNxirY1Rji1xIi72xPk
	KPWqmzx3EfI0tmk+228D2yMvQxdJ8oy3b76EQ5EZdsNLPTz+xf5viSa7LHMwyql7smR+GMCdsCP
	PGJKEZrVqrb1+a5oAJ1XuShMLlQL1aOg97Q69hXgZCxbHSM+WcgwrBahCRK0oq3tTYTpPCCD39w
	MHj8WzQ+0wprqM6fa91+IVnRIMZn8UZ2T2s8yQLxXGKY13x/e1CxzuBprnqVNQhKb9iIb0uoEWk
	uqB3Fmfmdb98TwVYxhwR6m2y6K/fAmFaw64/ks7XtNER9rrzM4Rr8IgrHPFwF9qN0ulTEDK7wFq
	56FdMDuFtC5Fo2rLSQGsqQVzbmJqS50Le+iOoQD+OX7HVAahD5XDE0SUh
X-Google-Smtp-Source: AGHT+IFA0lEU1W3SfPEmBbGo4FQNGTYuEBoUEdTLYPN2a9A4foswXNiPuAB7ntenjuTpAEzN0lAqmQ==
X-Received: by 2002:a05:690c:4493:b0:715:96e:fcfc with SMTP id 00721157ae682-719b4235726mr42499547b3.29.1753287815864;
        Wed, 23 Jul 2025 09:23:35 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7195310b038sm29741227b3.16.2025.07.23.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 09:23:35 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libalgorithm-diff-perl: upgrade 1.15 -> 1.1901
Date: Wed, 23 Jul 2025 12:23:10 -0400
Message-ID: <20250723162310.12805-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 16:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118718

License-Update: New authors, new copyright date.  Same license.

Changelog: https://metacpan.org/release/TYEMQ/Algorithm-Diff-1.1901/source/Changes

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...diff-perl_1.15.bb => libalgorithm-diff-perl_1.1901.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libalgorithm/{libalgorithm-diff-perl_1.15.bb => libalgorithm-diff-perl_1.1901.bb} (61%)

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb
similarity index 61%
rename from meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
rename to meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb
index edecc8dbb0..2ab8e8bef9 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb
@@ -7,13 +7,13 @@ program.   It is guaranteed to find the *smallest possible* set of \
 differences. \
 "
 SECTION = "libs"
-HOMEPAGE = "https://metacpan.org/release/NEDKONZ/Algorithm-Diff-1.15"
+HOMEPAGE = "https://metacpan.org/release/TYEMQ/Algorithm-Diff-1.1901"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
+LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=1676;endline=1680;md5=f6b2fe8ca06ca6faefa4f265fc494c2c"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
-SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TY/TYEMQ/Algorithm-Diff-${PV}.zip"
+SRC_URI[sha256sum] = "229a5708b0791675a8cd50ace77e79a323e52bfb4d34799dddfed644a2036662"
 
 S = "${UNPACKDIR}/Algorithm-Diff-${PV}"
 
-- 
2.43.0



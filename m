Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB36CD37BB
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6306.1762976159481350088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAv2pYPk;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so23577f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976158; x=1763580958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWFFzviLurndwjZlIWwwcG1xLc2QaN9gBnvCkbGUYlE=;
        b=hAv2pYPkIMRjApFrsGS9cWT7ztSs3dtHEMJTo88Cm3gG5XTqcOS2pq+HqoUrLbahT7
         O41YnNfAQrkeWXXaR7OhO7Uz/7ef2ylxQcbyfopIB87M58Mm8oD5PANQP09O8QpYwowl
         x05l0CZ7bmRt7z4rpHTMTuNVvdbg6chHgN9uAlLKfm5tvL+wgyzv9DtyUYrxE7fvZl+s
         ELH1sF0wYddeVd+LruTtkwRA+3Mmtv3UXh9aC4tY1wuzEqzli06RrBRue1b23ZVM0MJ9
         DWGK5y8QxEj4J1aQPecEas1uRMfWw25CE9mlmPWxeB4igWtD110hysh25tXhr7eq2+VC
         wOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976158; x=1763580958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uWFFzviLurndwjZlIWwwcG1xLc2QaN9gBnvCkbGUYlE=;
        b=I6pQCA3qm7yHb/o99+0CSkzqWUf3znMKhxLBMHaYYNp7qpptneMZFuZ9SQeTvlS9NL
         81GskJ7uWqAHfEJ9SStP29wNx9ppW9YkTDUaOC2BXW/zHlHyTWyqfS9+kxR2Q6lg8O4z
         9+w2xZjPXerYNhpCwO/Dnz3Gfgt04rJoKfo7mbZNlyMX+9ycctSSm7UEeoFuhYHOYNr8
         2848vT6Surb6DwrCOZgsSvqWltFfpOD1u3m5Sf32iVVpxVjnvbMm88u/1WiyByoV4IDV
         HNkSEiwMe7FWTaIuL6FMghfziTkkYj9hfqXwQD3XHdtTI3m0qNEL5ETl5aZsSMDwbtB+
         m4vw==
X-Gm-Message-State: AOJu0YwzjudHm82Cex3B8H7bomdxxCUrBiM86eG9GXmWd3kIkR5C79sp
	PNYz9K9NsVuzu2mmxXCVApDFIBADcLkg4yD0hlPs6WyI462W+7jSAokLDLhyptj/
X-Gm-Gg: ASbGncs96rYJjO/FCX5B/u0qORmf3a0IvxDiZN1eWkjpRNtT2S+Ij8+XOk08/6q+Xsf
	lK3XlnZKc+5BZxHmdQuQkYlv5PQtz4rf8bZ6z9JGaPuuTfZ+4jSCWtk9IoqCc2BNA6ihlcdSUmR
	6u93XWvEG6nQgmmyZgz59AUmcu33mj05vmMnPRx8CndqjnztULyrL2WTPQ0uXui3K1zZs+Ycvb6
	fATgANVwpXXMvFnEjxSwUtD5T5ozarfoAjqkwp2gw58qjfa7RZqoeRrEn9j19H9TR5LRRYzkA/B
	wEG0WBk0mc2s0YnUB5QHPQzeuSTlCkY45gF730cXv+SMRZE6S7h+OiZUNNI/fstt9DD5b6nMH8Y
	z1SguLH2o6Z0kMEps63yB5nCHaW6lCPvcM94PAZ9MVnuc8R431n1iim5q7HrEzJTdMrlGmMdgcg
	==
X-Google-Smtp-Source: AGHT+IG358QK265sB2amNdYfyo92LZHF9l0de2rQ+AplewOnmmVltC3T+EmLQC+ejOl1p2tluL1SJg==
X-Received: by 2002:a05:6000:1847:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42b4bdae6f0mr3565888f8f.59.1762976157822;
        Wed, 12 Nov 2025 11:35:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 19/21] spice: correct SRC_URI
Date: Wed, 12 Nov 2025 20:35:39 +0100
Message-ID: <20251112193542.1589821-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121580

The previous repository was moved to freedesktop's gitlab instance

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 1887a5582f..290ff3f31b 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -21,8 +21,8 @@ SRCREV_spice-common = "4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671"
 SRCREV_FORMAT = "spice_spice-common"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/spice/spice;name=spice;branch=master \
-    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common;branch=master \
+    git://gitlab.freedesktop.org/spice/spice;name=spice;branch=master;protocol=https \
+    git://gitlab.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common;branch=master;protocol=https \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
     file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
     file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \


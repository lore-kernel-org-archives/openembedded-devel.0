Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AA0D1036D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.6063.1729801134860792262
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K661aafV;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2e3179b224so1557824276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801134; x=1730405934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3JsQUfVHOtwIFQDp7km1QA4QU83d2PAUyYanzn3djs=;
        b=K661aafVX2m+DNZ1/4jOVxys5yp7Ks6VhHvELBuvDBnBnaa1Iw4GRoufDtPa+FzOC3
         u1YXeASncmtZbOY12ibVliZ1y7a6SUrNA60hwELnPbFcjoWH3YPpoJtmYlGiVxr4z8kC
         2SauAEV2D/6oxzGS5DUC98+ytscuLZkqw5GhfOLg25GNwR4KXOTPFF8fAFjLQnEoKFrJ
         ip0k6WLY/4JCZjC3dPZleq4qgEffsWYOg6negGOOy5bXkLW5iLv1uC+iWt47Ly1eWhO1
         vAH5eHRGV3WjnlRLFgerOWx8Vd/hTGPDicMCpcGeDiCHTPBGGgxLjA26rpfChF5fFnBx
         HBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801134; x=1730405934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3JsQUfVHOtwIFQDp7km1QA4QU83d2PAUyYanzn3djs=;
        b=vnTS0Z/KozxmbJEWNcFmwJhx1SozOmNDYZTC5DuuvWRwrr4JkOPMEZXwC6R0h+RNBv
         W4Yop+lJg5rELTvG/3I+K1PHXhDl0Rnh9ig+LeSRXgiEMqhSoXzuv/QgioXBClkJ0bKQ
         5mpuUERZMlKp0m1xIINeopX4VXLzohvdUoT4mTUQtKyLhMJFLKZuC8+PIFbQUQRGAmDW
         UdAtUMIo0ERAyaICIv9oQJAYLbAXPypaNH3UwRUTR7K56yJnmK332Y2qos832k0/dP56
         yizdJsY02uZ3JE69Oqy8GE2ZbzsY27MXVINaJOhiiBaFpo/XgP6fIzHoUknkkOio7YCJ
         HZtA==
X-Gm-Message-State: AOJu0Yx1LHlIYEhCXHeEtYTW1I1SIobpep0LcQz+VCY7kW7piWZdTCRt
	vmoz1PbHlXTPEHTkYZpvCCuNVuvGYO6dQmuWOIIBAnPu9QwPeVzQFnBVMw==
X-Google-Smtp-Source: AGHT+IHAZAvkhy+DJZwLXmm59ZyTOun7eqpeXSfePOAGsBdPjeqc/VnMzQ+L5YgB3lZZLYb6JB5MEQ==
X-Received: by 2002:a05:690c:318a:b0:6e3:d8ca:f00 with SMTP id 00721157ae682-6e7f100471amr65507967b3.44.1729801133611;
        Thu, 24 Oct 2024 13:18:53 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:53 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 02/42] libalgorithm-diff-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:21 -0400
Message-ID: <20241024201806.440273-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113180

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
index 1fc6048c6..cef17fb40 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -7,7 +7,7 @@ program.   It is guaranteed to find the *smallest possible* set of \
 differences. \
 "
 SECTION = "libs"
-HOMEPAGE = "http://search.cpan.org/~nedkonz/Algorithm-Diff/"
+HOMEPAGE = "https://metacpan.org/release/NEDKONZ/Algorithm-Diff-1.15"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
-- 
2.43.0



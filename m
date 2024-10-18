Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C06D3F2A0
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.29980.1729278824918919045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQUq9HE6;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e38ebcc0abso29189637b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278824; x=1729883624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYMSTFkQ5Jea/cAN6s9wwFjpoFusArk5sB18/Z/T3nk=;
        b=mQUq9HE6+f9CTRN6b9A5llV/kCfMasjkZq1N153bC3rsU+ZN01XsxiZMCl42hSVyK/
         nZypoPaBqEqnly1ObE1sDPIu5FCaou/OV8aqsgl2Fniv4FJrLlH7KKl0j3eJ+NPsFrgk
         PGu1xJCsW31KRjde68N7HYC9NtiT6jNfDewnDtIzU1keJayqm+j0nJX98c6/+iKJ9D3f
         +jJ1MM3INkCN7X1mU4xm6zQKiu8ySVgJsbYxKJAJ9PLduuUrdF8f/SGZpSqTs7tNAMm8
         IkqyPucFTkDWBYiHzv+vQkGgClvv50fcddch2nNGwdtsNA8EodIxCWY7iPU6VjnrDznp
         80cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278824; x=1729883624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYMSTFkQ5Jea/cAN6s9wwFjpoFusArk5sB18/Z/T3nk=;
        b=GFuQyIHvksaO42ad8Id9ngV+xDugpNAfV+yzDY2norLE+3HVudc24DsSV3HGqHVJ7a
         m3FXBnd9DEYQct+L0NRDpu8tCSd4gJfRZVq7ObD++E6spZbdzHA7Ps/Bz9WKMUYUec2i
         crwS336Z4c2OMwnwgmEz3PWayEheqp1/Q2ZsXjCt9cNJNReH1CDTR2VOYMSDLDwJQqoA
         Z6ynE5gZG1e9V4TFUHT24nqpxXmJd49+3sCg/gLXxLE9lGS3sFeadTzhqz6cCOGIB/BN
         UJEvxy7Gz7A8zeEZmgr3Ndh469qrTabfjeOW9Kz7a0KFRKBOYj4AoR72N4bicXbEgznk
         pFpg==
X-Gm-Message-State: AOJu0YwqS6q+RG3juUxK0kYnyFsniB945MxFFsZOClFAemBm6OwjoUr3
	sYNyYBOhepk/R7dwlVzvYFNQQ/z2SWb7xrlKIfywiuGNR63mBjOT5wYE5w==
X-Google-Smtp-Source: AGHT+IGORNPMMp74YT2Gh8Jq2JnDjuW6CCcRtRe6naekJW1RQBWhoJQtB+fEoJ6JzqLeij97mJKkkw==
X-Received: by 2002:a05:690c:6c08:b0:6db:2604:ea6b with SMTP id 00721157ae682-6e5bfa00051mr39307337b3.25.1729278823586;
        Fri, 18 Oct 2024 12:13:43 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:43 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 51/68] python3-pyfirmata: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:38 -0400
Message-ID: <20241018191101.25184-52-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113038

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index 02ebeaad7..f902c705e 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -7,7 +7,6 @@ RDEPENDS:${PN} = "\
     python3-pyserial \
 "
 
-SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
 SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e"
 
 inherit pypi setuptools3
-- 
2.43.0



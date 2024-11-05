Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA77D40D18
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30901.1730840333201192329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dk0WNTmY;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38ebcc0abso67803617b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840332; x=1731445132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnfIa6J/wbJtCmEIggPyi+/wEo21oNeoz9RQ7ZaEHx4=;
        b=Dk0WNTmYNJ++/wdyP0JhQMOjyngyPe/6SO7CQSFS18HZSliZkD8+cuIDYrOlRuwgHO
         tN790vHfjcYDZsb+1XAFYB0oTX9/9nZGi+0CYphQKa95FNpc3uEbJM8TXsZWXIwXEJOK
         qDFEzlJNJ5mOyO2QI7rD0lNLjF20nvj0v/7kLS818ab+O5CqzRrUNQHtn8Sq8Vb/3U2B
         wlgHo84YckhfBl8/3l247d0jwDqWsKpcW9vIxDhZ4wsj9VXYcEhWGoCqIaMoikZnGsZX
         FO50yqy6Zbpi5KDCT9Xph1W1AF6qCr9Qu0X8mnste+HQcZoe6IQO2AQ2Dtb8nUQrjDTz
         KrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840332; x=1731445132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnfIa6J/wbJtCmEIggPyi+/wEo21oNeoz9RQ7ZaEHx4=;
        b=CYiGTa2gma4LD7DjD1fp/bY3Hv2VqrCJ/6MX2YqYcE+qxyqfR9T73oruKjTisR5SIu
         6Np6TrDta1k9mg62FcqvtKn5n2HZanLycQEkBR2Nmy2g4yDDLKOieNrl5RKDRMeHdg2C
         2xVjfbLg57BM6rzOUJppMFB3yMZ9JQOJh99WQTAPWDvmPCTPIf7WkgEx0Qrvn55XYdg6
         Qx9jMsmA2FbLqJD5LFlBaph/b1rS8w/rDTqMLc362UvDibjn9qlcSWB022ohs/aSD/IB
         u5IMLXzZU8Vjp6XLBRHOeJdQoPiH8s5xG1825jyw9c6IRQ8x4yh7t43ZLa1zmPhJSibL
         5gjQ==
X-Gm-Message-State: AOJu0YzkD7CuxiccS22OqXhh6eqehYGD90cy1oCkaAR/6VvGOAhiuOUy
	/qW2VuHVxSN7+o227wOWMzLIw9c2CG3z2l2XfUaVfN1+vZxWT/HjPcBsLW3e
X-Google-Smtp-Source: AGHT+IEipQ3OAn10BNfOyNPOmEca9imJpoiFX1hvp4iUSw3TYekKrgG5vzdLpNLHi+llIXfIj2Cqzg==
X-Received: by 2002:a05:690c:a:b0:6e2:b537:3085 with SMTP id 00721157ae682-6e9d8aa410bmr369995107b3.34.1730840331860;
        Tue, 05 Nov 2024 12:58:51 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:58:51 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 150/161] read-edid: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:56 -0500
Message-ID: <20241105204707.4155-150-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113666

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index 28da51a21..5ea0fb852 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
            file://0001-Do-not-install-license-file.patch \
            file://0001-get-edid-define-quiet-once.patch \
 	   "
-SRC_URI[md5sum] = "016546e438bf6c98739ff74061df9854"
 SRC_URI[sha256sum] = "c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f"
 
 EXTRA_OECMAKE = "-DCLASSICBUILD=OFF"
-- 
2.43.0



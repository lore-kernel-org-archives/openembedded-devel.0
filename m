Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B808DD40CE8
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30424.1730839017791983772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGKMfLP3;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5e5c43497so47827047b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839017; x=1731443817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/toFpU5BdL+kLwN6ynfKzPWH/8JSuQROEhGK+s30ZZo=;
        b=dGKMfLP3+HMi91QzL9XaImUlu1o9lVyimrr15dM6Q8DK0vksYcZozRZaTMfXJ7l9I8
         sOpcoaRacFEP87B1ga3kXwk2yHKauySmHljcDbjRxuDFprMhXUnkDtSxNu8p21BXXc4J
         /k7vFxNVclp/W2rxV0X4T1EpRsei/B019ELqJADQB+yR1gcdLJ5/a+pr63BcA75b4wz3
         fT41W1/cZSgGIRAMnWveUBBMS4nP4KkF2XSLwGyql5/r1NS8Ol59hD6gElqlZ1+oNI3c
         hXfKM/m7BldGXMDMWbe51F7aePcDl1mSPSn/n/tWgYF6ut5JwTP+pRIjxn4uCc2ucC+z
         UJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839017; x=1731443817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/toFpU5BdL+kLwN6ynfKzPWH/8JSuQROEhGK+s30ZZo=;
        b=iHuMtcfEvZZJQRCsT3YuvIbIjwh+dCTYfe8/MS2lWbFs2EVTh1XbFB0JWVc9wrNHa/
         46RK/mY8aAS+5FW5707exQ4b6ZO8FUis8GCVMTcD6mXIn2dl3qAgoYMRBU1V61tnTDsT
         F2r82QIBF9tbUQ0TyZxY0IKfK2v6k2LiLfrsIdyNVFa6c/8htqhrtz9VDioPpNnp0Hp8
         EOIW8ACbNjK9xjZUkoTRH4oRpil2WbTVzw+u3lDuMZDQE2BEgWlB5G78S8lMMz9n41+B
         hON6ZxmJX6kbII9ZiABSybb9/3iTipQIx7u7WPkEw/EAJmLhugRr0us7Kz/xUJ4DtPYf
         fDXg==
X-Gm-Message-State: AOJu0YzEyCLOIWG9rfXcy10+UWLa8uLuNEDC+HwURhUjYEU004ZTSR3P
	ClQYy+72svGuZ/Dd1oRDdJQ1aV7eFjAu4FShneZZ2gYEXsg26OaIl8f/KCVb
X-Google-Smtp-Source: AGHT+IH+qG1Qs4KfNoDClPRJMjjOGBH1MI6jxQjLZsYhV09+XQWLjs3GEx1gyI7fPqCAwURBRj1+Tg==
X-Received: by 2002:a05:690c:6ac2:b0:6e7:d974:8cee with SMTP id 00721157ae682-6ea52323519mr231622947b3.7.1730839016431;
        Tue, 05 Nov 2024 12:36:56 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:56 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 137/161] libtinyxml: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:28:02 -0500
Message-ID: <20241105202827.3104-137-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113654

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 6fbdd071e..f2d3b6364 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -10,7 +10,6 @@ SECTION = "libs"
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
            file://entity-encoding.patch"
-SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 
 S = "${WORKDIR}/tinyxml"
-- 
2.43.0



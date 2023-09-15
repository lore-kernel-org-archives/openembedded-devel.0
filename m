Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA3EEE642D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:07:40 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.15412.1694761654409833361
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Keicxcwo;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-98377c5d53eso227403866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761653; x=1695366453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQfaGPH21RdrYJylu7RMm4+3ub6zQyubIYApbEee/zA=;
        b=KeicxcwoVwdWIt4QP3ABDqi1MsBqnkBbApPzpcL5zPGSHsfvpDJAmwYYbUK7pRF7C8
         NV+3wh3SB0DWGgp2zgl/+brYXJdfVz8TOA/8HuS5fg3lVQZC9iTqYK2z3QgqO52qaz+l
         4GAmZf81s9FaZLPoE0SFejzhLyFAvhSqe84RhqjL2KNGBbaZgiCflOKv9A5b1Jyaficb
         bB0d9SH1ebpezFE5LW6CYg4YF08moNC931MZh6yvlZMV81m8XWatOoDoNZLTcDliibRA
         d/MtjmVhsx9H6I/9Mih/gVmXrt3g/Z4wDP4Ub9mak2JMfOdj3vvD/phwnFw657YyTkzo
         /LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761653; x=1695366453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQfaGPH21RdrYJylu7RMm4+3ub6zQyubIYApbEee/zA=;
        b=OgJVXBly9cYsD4Uz0icSixY3sVc3aNlR4XHmcPaQNn2TP74mlr7tmac7UBQCeW9f4p
         o5EW9dTlpEu5TZLREf/YRGgn5+mQl527binU+JX7CI2NQ8geCjZdi8f2+HkXxQOsJAz5
         0IlH83ZFoykau/a8B/TsiuQH9EQ+JjNvOnUpG3Hk+74kLPJ51cQE7WoNu6esiyAQnE+r
         7z0bHbNOLeunC2osxgFvaYkBUg62vS7Wz/qVTUCGiWM59J4BLn0tHhjsotEhnvl6F3Y5
         un7KM6qQaxR2jsO7HVRlcK8K28qcn64PtXwJ+jyYfpi7xqfYncE89K9hBY688Ev2OTXJ
         JYrg==
X-Gm-Message-State: AOJu0YxQwOfZaOS042lB9vRjNtr4y4sz1YZbuNFv0S1eV3EyLiOUuCl6
	sGc9W2F3MM9zCNxdByh22npTSP4PRg==
X-Google-Smtp-Source: AGHT+IG7gCLVwBsu2Qn5YWCqUMY8SC6TqkJFrzbIIcN05AJVPdg87BDtlGllpD9bOJxTaLGXYvsHZg==
X-Received: by 2002:a17:906:256:b0:9a1:bebc:8282 with SMTP id 22-20020a170906025600b009a1bebc8282mr603341ejl.32.1694761652531;
        Fri, 15 Sep 2023 00:07:32 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id lc3-20020a170906dfe300b00982a352f078sm1969889ejc.124.2023.09.15.00.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:07:32 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH 4/6] python3-flask-httpauth: add recipe
Date: Fri, 15 Sep 2023 09:07:25 +0200
Message-Id: <20230915070727.4026-4-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
References: <20230915070727.4026-1-sam.van.den.berge@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104888

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../python/python3-flask-httpauth_4.8.0.bb         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
new file mode 100644
index 000000000..51b907e6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Simple extension that provides Basic and Digest HTTP authentication for Flask routes."
+HOMEPAGE = "https://github.com/miguelgrinberg/flask-httpauth"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "Flask-HTTPAuth"
+
+SRC_URI[sha256sum] = "66568a05bc73942c65f1e2201ae746295816dc009edd84b482c44c758d75097a"
+
+RDEPENDS:${PN} += "\
+    python3-flask \
+    "
-- 
2.34.1



Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6697EC46CD2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.66298.1702656072115897008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kHgw6Wvf;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a22f59c6aeaso100160066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656070; x=1703260870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3QO85iQUJghL6v4VMhqS96iR6msU2BqrAwXAkpjkCk=;
        b=kHgw6WvfUC8A+VOqpqK2AvDdDgNx5dA+4vm+8y3RR7fTPV1owUo0YbXpADts+hJ1ak
         8xyY/tHKm3UXYiK9nswT8lPQpI+higksqu91eStYEm1XiYV+xKmQ+RgeREgOWL53OwD3
         vemMpAs3HDk0I0NVmHWiWlKWnFvi8XvpsT9Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656070; x=1703260870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3QO85iQUJghL6v4VMhqS96iR6msU2BqrAwXAkpjkCk=;
        b=jT0h7ji3PTfzhZyhO5GuD/4DF0y4FmVWAChFAMA1HIQ9SeZXM8o8yScy+EGW99c7qd
         XP4qSbrRLw/sCJTmmjFRQesSnhjCsRbRDt3+yCrJYaqsxKcWFS3+DqRYrSvz3/fptYpf
         XyuxHrVXpwaZAgJ+wKIb3PvVqKoSRdRwXxJwqAl73VC6y1l8BrCYRmAHgRnPvNxoeAML
         XH38tq1jhqCE/S1VJHUpCkbknku5DOGq4L3DAdvocHfoJ0k3y6pE27xqG9C5OpPhBkzQ
         kIvADmnJguOnceLI43FHeEvAfqEfA2UOEc8UhADZsuMPLThI/VL3Kv7/xyldukuViWvq
         ufNQ==
X-Gm-Message-State: AOJu0YzpQRMeGDphPii5sizBYdguTqv+w6gWwCmBMPoc2bzSknXjZNR1
	BjIxG68p6iYU9zuq+uPvnRrOQIp+biQSxfBVtEk=
X-Google-Smtp-Source: AGHT+IGYsC7oJuR2sOYAWHe0Ltm1OxM05ReMKoPu2/6KVjNLFbzqYyeN04+ebC/Pwrf4Q9Xxoy8DTw==
X-Received: by 2002:a17:906:738d:b0:a19:a19b:5602 with SMTP id f13-20020a170906738d00b00a19a19b5602mr5536890ejl.146.1702656070421;
        Fri, 15 Dec 2023 08:01:10 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:10 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-frozenlist: upgrade 1.4.0 -> 1.4.1
Date: Fri, 15 Dec 2023 18:00:59 +0200
Message-Id: <20231215160103.2164505-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107523

Upgrade to version 1.4.1:

- Declared Python 3.12 and PyPy 3.8-3.10 supported officially in
  the distribution package metadata.
- Replaced the packaging is replaced from an old-fashioned
 :file:setup.py to an in-tree :pep:517 build backend

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-frozenlist_1.4.0.bb => python3-frozenlist_1.4.1.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.4.0.bb => python3-frozenlist_1.4.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
index 340b0e384..1ce5c8452 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
@@ -3,9 +3,13 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251"
+SRC_URI[sha256sum] = "c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b"
 
 inherit pypi python_setuptools_build_meta
 
-BBCLASSEXTEND = "native nativesdk"
+DEPENDS += " \
+    ${PYTHON_PN}-expandvars-native \
+    ${PYTHON_PN}-cython-native \
+"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2



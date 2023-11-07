Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5943AC0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:09:03 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7818.1699355334468257035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PJm0bxvH;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso9231299a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 03:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699355332; x=1699960132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTeA64NRGBq9ejQCwJdyfjN88rtzWzEeN5a4LyRcF9s=;
        b=PJm0bxvHRaWYrNvSOvSBpoMzhZnmCGnu+/fNvcvODY8RcSkTi6yJfkZqm5WJeNWPmF
         C9sIAYHNu4DcnQqTajhVy47S8VYTnzMNtheCe0ze2ufCiWUBbT3GNrWEcWqmirM/RQP2
         pURp0mEEmPFt2QkevnuQAA0mzyxUKYQnidi9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355332; x=1699960132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTeA64NRGBq9ejQCwJdyfjN88rtzWzEeN5a4LyRcF9s=;
        b=ZfEk7/I0mMFTa6PTRbrl0zHwWkmIUtYVugblp+YP/zkAGVWLooIOk+eILBj02IeZ5I
         RdQqX2Z09oKRHfIDqdH5pGZ4OpaILymvWLgSXxcCd7lXDM4b4J1YBjFg+XFIi27Vw/na
         zbMszituSqmDDbrZqfmF8NDNE8ERDEiKuV1RA7IoTUMK51Qv1tyt0A385/Xl6dQpMXND
         g/BqO5JOZDUpRJXZ2970ejdFC/UCd/kX/cWhtGBznYn4x7F4+ou/ToDtKWx3fSw8yeN8
         IryDXi08CsnPxRDmdN2t6JOxfsMJYq6qZfom2SvlvDXCO1YvG0ywTsAwwlT3h8WEBoH3
         K4bg==
X-Gm-Message-State: AOJu0Yxb6qSH30dEwysFSin+LO9mlLs1/EZUC7sjiyKgqfGPtHvVXqA5
	wh7sl1PKQTwLdSOlpVfvUdzS2oibkDIbFM47tF0=
X-Google-Smtp-Source: AGHT+IEVpRwoZ6LSrojxUvBXYIMKDScHbWabKjJSMw78l/dSkdIjf54AatPdzJA5+Flenq3io3XPCQ==
X-Received: by 2002:a50:d583:0:b0:53e:ec17:c885 with SMTP id v3-20020a50d583000000b0053eec17c885mr27644491edi.10.1699355332806;
        Tue, 07 Nov 2023 03:08:52 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 29-20020a508e5d000000b0052ffc2e82f1sm5515763edx.4.2023.11.07.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:08:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pdm: add recipe
Date: Tue,  7 Nov 2023 13:08:47 +0200
Message-Id: <20231107110848.1610779-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107110848.1610779-1-leon.anavi@konsulko.com>
References: <20231107110848.1610779-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106448

Add pdm, a modern Python package and dependency manager supporting
the latest PEP standards. Version 2.10.1 brings:

- Fix list index out of range when build error message is empty
- Fix find_link sources being exported as --extra--index-url
- Fix an installation failure when install.cache = true
- Fix a resolution issue that extra dependencies are not resolved
  when the bare dependency has more specific version constraint

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-pdm_2.10.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb
new file mode 100644
index 000000000..d5aab3db7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.10.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A modern Python package and dependency manager supporting the latest PEP standards"
+HOMEPAGE = "https://pdm-project.org/latest/"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
+
+SRC_URI[sha256sum] = "d166531c659fc4905933546544dd2e16cf648c2ba6d898c82126ad6a42117a81"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    ${PYTHON_PN}-pdm-backend-native \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2



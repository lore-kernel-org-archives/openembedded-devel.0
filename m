Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA23BE7F159
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 03:34:54 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.9914.1695785684870021070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 20:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77575531382so12635785a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 20:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695785683; x=1696390483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzCI5BpYbktJ7+pgpiRp/Y331bHL4rjeOq4oaJHWOBc=;
        b=QxW+0UqQZPi3kE0vJa2a+n+WXHKZD2osO5Tuy6i0I4ZNFldIvFj2KTLOjbOAvmhUZ4
         VvcDg9i7T6Se2lbB2VXSJXXg7CP8YR4Jyh40woyoFEDycnX+FxT6wrYpuzxouJw9L0iC
         gDoMNZZd/XMW/Ugs64wOy1oalbOWtvVh1p087FfWSg3YmN7IBABx34uzNJOQYWsnIRZD
         uZzWqBJgr4g2ORMgt/1mj6am+nj+RIV2ky6h3jYp5C42gQ7Mwm0Rovae7WyfvNyNz62M
         E/Snd4o8c0nJhgT/wlUII7BwIE3c2vxJvvI/yukFbf+nP39LPRSyTnq77ah90A7cXkxu
         XMuQ==
X-Gm-Message-State: AOJu0YzZkTQapmXzXCln/dMOGVxcvw0bL+E20bs+I/wl0C2jIBYJlIfo
	fQyL8G153YRUBH5rHVxFkeAmfpIgUNK8OA==
X-Google-Smtp-Source: AGHT+IEKXSN0Y5jehHEHAqTLu5FPgrnDjQaU0volr7qn+IVkC2WpsLscqMnTmQMPEbA+usl7CtaClw==
X-Received: by 2002:a05:620a:f10:b0:76c:ba10:4973 with SMTP id v16-20020a05620a0f1000b0076cba104973mr844065qkl.37.1695785683395;
        Tue, 26 Sep 2023 20:34:43 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d10-20020a05620a158a00b0077568327b54sm1019816qkk.123.2023.09.26.20.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:34:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyhamcrest: Fix upstream check by specifying the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
Date: Wed, 27 Sep 2023 03:34:33 +0000
Message-Id: <20230927033433.1607189-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105152

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-pyhamcrest_2.0.4.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
index 888278af8..4ee84531e 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
@@ -9,6 +9,9 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PyHamcrest/"
+UPSTREAM_CHECK_REGEX = "/PyHamcrest/(?P<pver>(\d+[\.\-_]*)+)"
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-numbers \
-- 
2.34.1



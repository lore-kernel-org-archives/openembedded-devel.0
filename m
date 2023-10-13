Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E09CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:08:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.44319.1697216885807514878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=B2eJVjFl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77575531382so150812285a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697216884; x=1697821684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUZT3hlEFgflyxnjcafzl7hnkLLZZvM34twC2TlLcNQ=;
        b=B2eJVjFlEaBtlZ8XwR9IyViAZlFOW2MHwS33J2wbl02EOkGXa26zHYZKMQocacDaQd
         beY0aMjQ//KeibVZ1ocH+ZFwkha/rXFMoBY5BEC4XKM37+FKY0L5w8YPcivhoM2iLl+x
         u74LCgwHCR1JSqtNXWvKfZ8QJrSOVObIpDY/5TkEYO7M0nu6fKzVhm0zCiIc0OHITLTG
         lWGXJMVuupWgihW+m3dAgVUCBzrex3C+641rKaF7ngABTJDgZtBLUWtTvLwzrwf2/9AE
         8YRebfSUeB8X13M+KjX41KMcZMkHdyhNU2qZmqHgnKw9TO3gV/W/KNJEIvWIvUmvpifz
         apsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697216884; x=1697821684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUZT3hlEFgflyxnjcafzl7hnkLLZZvM34twC2TlLcNQ=;
        b=FRQgzDDbPf+LXsg0XamyIMT3W4SENX+lKL20BjmBExoTKHmq8KDQSIJ/XmJoV3OMe+
         W7MaeVdpNQs5VH1MtohimwAmKURm3o3wqHvcVqYqq8z+LlggqfI8oHsInCDcxfNLI3CH
         35IyJWIjDSTOzJQQSU5m7PJj5PSqcdol6BgdkgBFjNfhptwGjrMSKJlCp/2WKfw8RqKu
         Z0P7ERAtzR3ejJuENq6t1QLo2Xbkkv/2zdaTJ3V7fIBBYzmkfUM94g0MoxP/jTBRFy8k
         oIeF25uZUY3ZBBdjvnjsn/0hd6LOM1xWgkPRoLSMoTVwrd0D0zsFSxdle3jOLA7eWx11
         u15Q==
X-Gm-Message-State: AOJu0YyAjtlYZ73tPTURjT8Eqd22YBmG86CpP4D7tFKRHrw1nwXuYV/N
	R/e/t56gx5HUdLPXeY0Zgq5XTCL0HH6Ao51nsHAKjg==
X-Google-Smtp-Source: AGHT+IEh5Lm4dPPhZpT9kzYjs7MDXjMiMaHIu4U+ZaeA7W7dz6Fp4+uelIcCYa5v/QgI+F2ZHwMSFw==
X-Received: by 2002:a05:620a:2ac5:b0:775:69b4:b4e6 with SMTP id bn5-20020a05620a2ac500b0077569b4b4e6mr30630445qkb.7.1697216884336;
        Fri, 13 Oct 2023 10:08:04 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id oo22-20020a05620a531600b00767dba7a4d3sm781068qkn.109.2023.10.13.10.08.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:08:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/4] python3-arrow: add from meta-patchtest
Date: Fri, 13 Oct 2023 13:07:59 -0400
Message-ID: <20231013170801.3966008-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013170801.3966008-1-tgamblin@baylibre.com>
References: <20231013170801.3966008-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105481

arrow is a module that aims to provide a more user-friendly approach to
date and time in Python. It is required by git-pw which in turn is
required by patchtest, so add a recipe for it. The version is updated
1.2.2 -> 1.3.0 from the meta-patchtest layer.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../recipes-devtools/python/python3-arrow_1.3.0.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
new file mode 100644
index 0000000000..ec49d04eb9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Better dates and times for Python"
+HOMEPAGE = "https://github.com/crsmithdev/arrow"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14a2e29a9d542fb9052d75344d67619d"
+
+SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
+
+inherit setuptools3 pypi
+
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-dateutil \
+        "
-- 
2.41.0



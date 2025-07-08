Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF4BC83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1870.1751994871719525641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=anCtYKCu;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so24909775e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751994869; x=1752599669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q8v7CwIyrV9YGSN+3DaE2TcjJTXtWpxqkNB8xlHW7I=;
        b=anCtYKCurUTvK1x0RjpVr/+mvL7OQbH0cXQpBuzIjQ9NVtO1MjOJ+dKtMFkus4LhGX
         ew9o/gzaHEFhH9Ii/SST4x3dLW5deiR3VXGo2lQeHZ+T/wl328wU31n9mmDOifZjXvEM
         V7F8Y1OD5jJmP/PqDss/u4M9NvBb4qc9O4PrsBjhW6qU9CUjWR+9e8bziQrYMOE3b6NL
         1InI7xwwYSJEzEDYKqZ2Oeg1QEce8KxtWSQc43lOEVeMI3Kxy2KN+BCHufGdlFtOZiJA
         J9XKBfQLywOx5mywRXDVDWmMCsFn4kAuoBlTAelYJTNNF0zD6feg27WD80v4gw893+5/
         Xu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994869; x=1752599669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Q8v7CwIyrV9YGSN+3DaE2TcjJTXtWpxqkNB8xlHW7I=;
        b=P2pTnhlfZyylrUOvYlTPyqRUZ6bclcF0+aU3cjC4ZoUdvzblmHyvu82/RvJ/ilqdAV
         tpUyXZ+pPUx+5kYIqXQc3JGunvKTkEvgP3RJ6QST22pwHO07X2lMqCLsOzLkWf2KUVLh
         Gy1zXfiITcRVeqKNDPP9AmM9GJ8N1A826yoFGE2K5yKsEm6kLpIc5Yfb3Wseiy265SeB
         XXZ10I03dapszgP8x1ku+8wk1ChMGhe7r1jM1c9HPax4Ry5MXuuaeHYp2Cvf92ZZqFk2
         fPuQD5BActCYI9p2kimtygFmK87JRqUXeBzscksU4/ajrOfwdgQd0+cHT9t+JZMKJPoX
         F9rQ==
X-Gm-Message-State: AOJu0YxSR0M15lrUuiEJm9JQwVSFVmCmTS/M0h2jKYSUYjowIEcCOqun
	K8guCHJzlJIjA8yCSmoDJ3uYOw+3IZ0snQbXb6SIwF0F2jdDJrou8eJgiflQcA==
X-Gm-Gg: ASbGncuGd+LXWAcxpYn+HwSVnaUXjngK5LFl004nnVcbbdnRHI+9eaBiMbbgV3jQ6+c
	+qUDZJA3q7EwUK4HCV89RSqt5u7Gl+sEhisjRW4KuC+M/J5tB4k5NAa+nutlSUJcdpjZemMGnhf
	pS2aaGdd1ElIJba9im86NwYS6S+8q0dFY2YDB838stbtpGXTHgkDPvYHIS6Vy3USvi/VkOLfDvm
	04ZVGys53/nOUETXlX8KQiIwm9OM+7jdG8jeOwWuVnGxixzcyP2YSLBuGqAJ7ExAoyOGTAXyFh2
	Lg5zeBR4DHE9R8vHGKOYd2xEXWb/2+FFyoEhArFg413n0XhLp07tMyzH19fsr1zqXvg5xw==
X-Google-Smtp-Source: AGHT+IFmiJ0piSM6LVVqrcaAy5/hqbUoO00t86XxHqnUtSRmwhXMfeBrYdP11ucZa3mfUJXQZZ2Ynw==
X-Received: by 2002:a05:600c:a087:b0:454:ac5d:3919 with SMTP id 5b1f17b1804b1-454d3602e7dmr5556935e9.2.1751994868925;
        Tue, 08 Jul 2025 10:14:28 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd49d0ecsm27801125e9.31.2025.07.08.10.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:14:27 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 1/2] python3-rstr: added recipe
Date: Tue,  8 Jul 2025 20:14:18 +0300
Message-Id: <20250708171419.2695068-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 17:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118318

Added rstr python package

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../recipes-devtools/python/python3-rstr_3.2.2.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb b/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
new file mode 100644
index 0000000000..1af7a3bc8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Random Strings in Python"
+HOMEPAGE = "https://github.com/leapfrogonline/rstr"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5c15c04f1cdbd42c6152066f0b02102a"
+
+SRC_URI[sha256sum] = "c4a564d4dfb4472d931d145c43d1cf1ad78c24592142e7755b8866179eeac012"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
+
+BBCLASSEXTEND = "native nativesdk"


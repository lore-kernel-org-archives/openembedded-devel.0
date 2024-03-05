Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D65C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 15:52:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.27090.1709653925043411225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 07:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VS3LS14b;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso8797529a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709653923; x=1710258723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIC0yBq1PW3Zh4W5Z7nOHAc0MLNaz0fQWip35xXrC54=;
        b=VS3LS14bKoclZkHnPqpgkICx/XKbfejkd/pGivXg0Xojvg2YlOYaJe0r5vbPFPWAQv
         McuZGjLRBz6THDHHMArNfHhnAx6Dd5xK/fidFtkK7BxowIyhwhujzVUOJG4cCswaCSen
         4XUmv8fsrjieu2cTbzHuNNA3ogWLjBr7jj4KXO2A+44X5HXa3SdZB1vlm+w+tFr3J0DB
         Gi8lZOK2j5yqeO57tprGFI/E50uHnwBAFcj4eX2/xHrnZf70Kai99sWuZKT3EHX+lhOh
         XrYYmpav6KWflA2ICPHRpMmqxmSRKSsznecxcIKda8bDuGvw7/v1vObBsT1KwanP/k5o
         cCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709653923; x=1710258723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIC0yBq1PW3Zh4W5Z7nOHAc0MLNaz0fQWip35xXrC54=;
        b=p1Gp9yL5wNa/Q8KL+1vc+Gk7RMYUj7VU5UqCw0ruUmN6R4hF4D0nmpRYgX3vBPkJ8x
         ZJ6bJg7OetF0fL79egKmj91R2DZcSBbRv2baEINO3vN13D02TeZRl17uLDsq24bZestw
         Tgg2JU8wn7lVhCQ8f+bSwOm+dWf82xacEUpa0omKF0QwodDEaO1Rle1v6/Mubq5XZkKW
         NfatyFvwk4CzsyEUVDxevUZ+qH9dsqQ+2DYelzJdaEuQmDlBif9geYXv6DD/eQTaHh3O
         8G/gacQWO8s7Xhrq1klJm87Mp+mIyERvbdvNoGpSnNQvb+ECXvsQy0n13DO79Pt8RYq5
         MPPA==
X-Gm-Message-State: AOJu0Yz44WGppHFs+EdayZ13A4RPrBfsj6O3rjEFu9ELx3p8cH3AbYE0
	5S411ybEjN3p+MqWezJ1HabLBCkeai/of/BsLif92zF51ORs/PeWRd6CUzpXvGo=
X-Google-Smtp-Source: AGHT+IHOmdepSsS0CZywbpXEAVpdsqMCcMBD4UxY2verrzYEFwSMNgyfIEPDWeyZdaPy19V82x3k5g==
X-Received: by 2002:a05:6402:3493:b0:566:f67e:3f72 with SMTP id v19-20020a056402349300b00566f67e3f72mr7525631edc.12.1709653922673;
        Tue, 05 Mar 2024 07:52:02 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id g20-20020a056402321400b00567bdc41c91sm197757eda.62.2024.03.05.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 07:52:01 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-types-python-dateutil: add recipe
Date: Tue,  5 Mar 2024 18:51:45 +0300
Message-Id: <20240305155145.593699-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 15:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109122

This is a PEP 561 type stub package for the python-dateutil package. It can be used by type-checking tools like mypy, pyright, pytype, PyCharm, etc. to check code that uses python-dateutil.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python3-types-python-dateutil_2.8.19.20240106.bb      | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb
new file mode 100644
index 000000000..2075d96b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.8.19.20240106.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Typing stubs for python-dateutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
+
+SRC_URI[sha256sum] = "1f8db221c3b98e6ca02ea83a58371b22c374f42ae5bbdf186db9c9a76581459f"
+
+inherit pypi setuptools3
-- 
2.25.1



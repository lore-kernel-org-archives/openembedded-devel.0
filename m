Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A363CCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 12:40:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.4743.1760791208588363516
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 05:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CFtfdxnO;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-427084a641aso962326f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791207; x=1761396007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFfK/k/psxSasdpzoo3e1y3NxAOeoAhiEfMqduS7ebg=;
        b=CFtfdxnOIh+jFm7JBbk4PXPoW++mTDW4cGmHXkXBhSirWlL8rEvfJ/RzYyzWPc8NWJ
         PQP+1PlQrYlF6F6uexwAMAMh7jjNob7G5IjFKGgN5yMroS29MFgw73OCuShpTRixS0cT
         eOIc4Aj9YW6A0N4BjwwgDIlRKdegFD5nYWhTI5eGOVDQIPuGJfYLBNH4FHK2rYxW3HUv
         rwS6yl0uRbeXE82ZwUY6gVEn11Lay4+zaPVGF2IQmEyoCPGYivYC/Ky2N1HwqA+iM5EK
         rsLf9uX2MxSxc9+gzy73LTJ8YwJrgWmPyxH9zbYYxK+DMEnWVYyjHjyIqi/yPL3tQasw
         JbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791207; x=1761396007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFfK/k/psxSasdpzoo3e1y3NxAOeoAhiEfMqduS7ebg=;
        b=ddfF27C3odXeUvhTRQWmZAGxw0Y81MIfOi1YwWwRLIeU7kXsBx8DaJitfkDZW4bbZa
         lJ6NJfVlJOOMUrOFP6QW8GfYYsIGi9Uz0S6Dn95Z22b2eXpF77TTZoqKc4nT2N6FR/zk
         /n2WZDxqEugVW4v1nw1tHtCwTruEj+IkcqOnFNIa+Gxw5m2bip7oOIltdxDG7L9gIiEw
         ZpT4bfPZYXbp5b25H7zTef8rqzaPIfEcU8GoGRu7h8jjFm7hJuRvk7aXbEOTGh5qAOJo
         ow8ZBoys/tTzsuIaK/X74snS90BaJX/wQ+fSKCKPZ1LmI3LTetiL7rMF0GZ0wfd7yESF
         K3Vw==
X-Gm-Message-State: AOJu0YxSGBdZ0zPueT/QXJlLOqHNsxHxzbQudVJHXl1y7UV+qBR0kEwH
	+81rpUY+y6FRC8FlgCtvb5fLsH8FzT+2RPrdw2Mlt/E7aucu+RaBvDp4lOAk4Q==
X-Gm-Gg: ASbGncu7SX4kzDiT3SBmjlU39fiC693aLdhoymeVQ+4/E0zVxC08aJK1mH3U20Stzs0
	saHe/l2Yb/ZCf10kzMFRrwPqtTooOcoHzSSbZSObuEv09eUkFYkzt8M0i7UvZBD5A+O74y8p20M
	LfPtGNATTzgXihzRF1mJ8WVA2OlcBmcgiCYEGoX7AKwlw5f7j6ctuDHM+vYFs+6n+1eBzJJ0ctm
	KAw+MK483Bqo2VeJzORE5kkxF9E/FBYsLZIlaCBHA1nQ0lnjAvIi4szprZIK0mGT2IEYnTJy76a
	5QhTCzA4ldEuYERtUWJvkXpf33MWdpEKWMDFd/hmR1yq01gW2yyr5Nk0Pw2WZifB/OCry2U2czW
	X3Cczx8M4CvpsedJRy3iBTaXK1RZ+QQ4jNU2PWC9PdFESsZgw9vC0A7OiK/HgsLqnVZPJEAnlnA
	==
X-Google-Smtp-Source: AGHT+IGt3TJoo8vofVSRVeBGrqGK1+YYTpFz2miER7hLG0i2r611cpb+UDU2Q5jayzgZJoeCtcNsow==
X-Received: by 2002:a05:6000:4285:b0:3ea:80ec:855d with SMTP id ffacd0b85a97d-42704d6c57amr4461186f8f.19.1760791206631;
        Sat, 18 Oct 2025 05:40:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce3e2sm4726527f8f.47.2025.10.18.05.40.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:40:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sdbus-c++: fix ptests
Date: Sat, 18 Oct 2025 14:40:03 +0200
Message-ID: <20251018124003.1362665-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 12:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120784

The /etc/machine-id file with some value is required for the integration tests,
otherwise it fails with the following error:

terminate called after throwing an instance of 'sdbus::Error'
  what():  [org.freedesktop.DBus.Error.FileNotFound] Failed to process bus requests (No such file or directory)
Aborted

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest
index 5e285b39e0..845ba7d8c6 100755
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/run-ptest
@@ -1,6 +1,11 @@
 #!/bin/sh
 set -e
 
+# the integration tests require some machine id
+if [ ! -f /etc/machine-id ]; then
+  echo 12345678901234567890123456789012 > /etc/machine-id
+fi
+
 ./sdbus-c++-unit-tests 2>&1 && echo "PASS: sdbus-c++-unit-tests" || echo "FAIL: sdbus-c++-unit-tests"
 
 ./sdbus-c++-integration-tests 2>&1 && echo "PASS: sdbus-c++-integration-tests" || echo "FAIL: sdbus-c++-integration-tests"


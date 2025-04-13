Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8226DC3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 09:23:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25804.1744536231653583178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 02:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUWT2NST;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac9aea656so3257065f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744536230; x=1745141030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogF7bq+4gbNME0bFWWKQY/eXM1M1dOqxVR1egj0wCSY=;
        b=lUWT2NSTcNdyTwQgoFn36LNQkEIkCJYD4NkQBN+bnCDBAws9lGqPFqFVNhBQlbdqdg
         5zhKEmfDX3g9WjdwBNshbdlnW1cYmt0Uc1K0UQDPPiqOnsCMsw86cY7nsd9FMxOoq0gf
         gxCjoJlYJnHXAj31RLrc2a7J+G9maPzEMX1OGrGn31Y6YklpaBDU9iORtZV86yW5tBmH
         YtBak0kneL2vacgjvixlR2TKamT+awOBEHALIb8ztIXKJNx9gaxDy2Y40jzCobBHioSO
         iH3ypAVNswzh4X2faTeQDfa5nvilX6/gFe9443krEIWSZaVs9zOiBPWC0XJP1NRQJHE1
         w8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744536230; x=1745141030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogF7bq+4gbNME0bFWWKQY/eXM1M1dOqxVR1egj0wCSY=;
        b=qF6w6PQkp2oAADCU5oFDB9azlWFU3+yfyxSqVRSeqLVzYRZo4oWomJtCglW/6ufKX8
         qc9HzaJt9esoQCytZxoQOHtO7WM4iLSooWDLM5KOrLQ0xfs3OOzaAeBSbh+gRkSP3Pwz
         tOb4X2te383MblfUFUJTZ/RCSgFyC7bUCARx9p6pHp3cw+I5Pq7h5TIfDbJNMwZM2Wgp
         nyOclZHJpiU8ddSTSX3oPMcqAv6nn7a9HhuPg5t88PQBFtV2Hp6p6Ig2xt1cJbsgyjZt
         CAa1c6eBNpw5ee7yBueJJIF3aT//0rk7ezRAFjsMvYc1wH7gjlbSpCa7qpuklpW+XuMC
         iwVg==
X-Gm-Message-State: AOJu0YyRlI+P/+CE9Z0JPSZfPzuZtKIQUBeaI0a2qMy217ZeGK8SwlRk
	p83xSMZpqrRa8hDpi0GLtVjJAIEF7kIq/FA9nr1JmuOWysMVx3BsPm9+ZQ==
X-Gm-Gg: ASbGncsCRg6Jq9A1u+Bp3qxy5YNbchOO83dHmtaAOOsf4GLh8wpw6xr8jC9No+Q/JfT
	InKWhhZON7HRV+65ga1Cjvnpx7FcSOWaV6yf8UfQ8sCBAy+X/uINzLc1BdTMSt4TwRL7kqLUJgQ
	96FT9bcNbdGh6tyISKGiH2i6LTZiAO7bWfwYrOCwmtoz/lOD2R3SLlZX6jrC806/UeXKVK162l7
	q9atrooCKeI8efvqtAzM5Xs/CC/4gfRHDCK386O4bYdCcoEVs2Nejpjq2HrBVZJ95bKuW/njl30
	jIPR0P1UXcXXyECf9U6DXJMg0i7P+ZynWqd3iN/P/u6UiWPOKMIv7AWW8N8rYI5m3grzWqrYCkC
	0+cSJKDjIj8BRNY6Elgribh3wQIqx+oeiC1JNcZDtzDoIchM=
X-Google-Smtp-Source: AGHT+IEslKNWNVmjB6S9w4Qt0xbt0zU292loTyS5ihNWQYk4tktbYDTE59izZsdf5bH/oWqfDdGDAg==
X-Received: by 2002:a05:6000:4287:b0:39c:1257:cd41 with SMTP id ffacd0b85a97d-39eaaede3a4mr6622882f8f.59.1744536229542;
        Sun, 13 Apr 2025 02:23:49 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96403dsm7249086f8f.4.2025.04.13.02.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 02:23:49 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-mdurl: new recipe version 0.1.2
Date: Sun, 13 Apr 2025 11:23:42 +0200
Message-Id: <20250413092342.802441-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116826

Markdown URL utilities

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-devtools/python/python3-mdurl_0.1.2.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
new file mode 100644
index 0000000000..b5b3c2ad50
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mdurl_0.1.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Markdown URL utilities"
+DESCRIPTION = "URL utilities for markdown-it (a Python port)"
+HOMEPAGE = "https://github.com/executablebooks/mdurl"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aca1dc6b9088f1dda81c89cad2c77ad1"
+
+SRC_URI[sha256sum] = "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5



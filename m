Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95215CA1002
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:06:29 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.48450.1756724787249104694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jaZf0T+O;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b00a9989633so351377866b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756724785; x=1757329585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxvYPUjHoaz0U++rMzAqAj6ySd+pa6svSq7HddlQ12o=;
        b=jaZf0T+OQe0ehpaZavEm/iCQLNwO+ViDFdmgPQbHFcdSGz4RhQdOWJwZeqiAjTpS6V
         Q95P0D08IDtT2dEbg7pI7G61xEHXvVzZXjNPao8RqMoB5EsJMj87CKLnyW48/3bE11Z9
         MkU00ZmdTX5ous5+p1a/P2ZYmbbOYLRo8sua4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724785; x=1757329585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxvYPUjHoaz0U++rMzAqAj6ySd+pa6svSq7HddlQ12o=;
        b=pI2MCCGWVztsEZOvtg50+VL74/QPHeYDe85req4A90vPnQn7j17LzWU47/wZmTFYYx
         DKvmkogR58BnvsbH9DHkEdizAfILygOqMjiGDYe49xx7jhH89lEx2GiXUOwxuI0dkli4
         vbFrJ9obUYwTSuzfYK9eHFDv29rux18GjxapAw05YrXhAEvTOVYKMPNevX8fPxfo/b4j
         y80O82pHwP8nwMYRNOiF+h4CH99YiSEgcefxXmcYe35ieWxu3nZYhh6KSjHN7SRIN/by
         P8CSK2gpPDZTO5TxQJsSN85aqJthIsTQMwopMvgv+PYBSWagefx6V+jq6sBFZjpN0Tjk
         Kasg==
X-Gm-Message-State: AOJu0Yw0MUCb3ZqSg76g1gF65xp7jAIq/ipGnvgIvhQBku2wrhhIMczU
	gfmxpmK2uqDlr8MNzLasTOA05wo/O1CllE4bsDP9hHcTIM4Q6QDhB25k+4myeeSL0Od79AqivRO
	YsPsW
X-Gm-Gg: ASbGncsTUObrzoWy9ku/3M4eVnZX/usycIA4p7yxVi6eQQ8R294VlX+bupSJtnsGidG
	/EPMGBiobNN0RIbeeaoGm3aLyn8bqmRjA/rTSj97WzkiQKlj5gWxqNyEM3Jz+r6SQ6BQ9zr2SxX
	YLmNu3MzhDaTH0n6QYXYt3KtZDqpg95SZsagS05SHHdqlnjBv6oBRvyqbY3tK4RQIsxoY6oTcJK
	dAEK94ILvQN8CmZD04M4BNWEwzzz213joR4Dr9BVitnz7Cj3BdWVokBx8eExs8Ld2cIM+r+6ilG
	fBw017YWKIVf9uAfFFrWYoLAz36P5uoX94/P1pogYSS0y2oJ6DZxFWhzuY/OQF+We4d5WOWcoE7
	b520G2gh/6sbWbrt6IdtlmZWimQsSU52xSTqy
X-Google-Smtp-Source: AGHT+IHGYoF8tqZpuuVoCzJ8TZPAlu9ACwtgjJirr5yFy5C7lZsf+8ch410tYQ/2vZtk4WLQzh/ong==
X-Received: by 2002:a17:907:3fa2:b0:b04:3623:aa10 with SMTP id a640c23a62f3a-b043623b1c6mr216547466b.2.1756724785366;
        Mon, 01 Sep 2025 04:06:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm825856166b.69.2025.09.01.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:06:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-behave: Upgrade 1.2.6 -> 1.3.2
Date: Mon,  1 Sep 2025 14:06:20 +0300
Message-ID: <20250901110620.158572-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901110620.158572-1-leon.anavi@konsulko.com>
References: <20250901110620.158572-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 11:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119157

Upgrade to 1.3.2:

- Recursive discovery and import in steps directory is now disabled
  by default. An expert user can enable this feature again (if
  he/she knows what he/she is doing).
- RTFD: Enable PDF output format again (for download).
- Improve command-line option descriptions (show: value).
- Use "confval" directive for config-file parameters.
- api: Add "Configuration" class description.
- Include changes from pull
- Fix more deadlinks in docs

License-Update: Update authors and years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-behave_1.2.6.bb             | 17 -----------------
 .../python/python3-behave_1.3.2.bb             | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-behave_1.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
deleted file mode 100644
index 97b59358f7..0000000000
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "A behavior-driven development framework, Python style"
-HOMEPAGE = "https://github.com/behave/behave"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
-
-PV .= "+git${SRCREV}"
-SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
-SRC_URI += "git://github.com/behave/behave;branch=master;protocol=https"
-
-
-inherit setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-parse-type \
-    python3-setuptools \
-    python3-six \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.3.2.bb b/meta-python/recipes-devtools/python/python3-behave_1.3.2.bb
new file mode 100644
index 0000000000..02bd8ae925
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-behave_1.3.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A behavior-driven development framework, Python style"
+HOMEPAGE = "https://github.com/behave/behave"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1fca0a9c7e4e4148d675b4dafd5c1e80"
+
+PV .= "+git${SRCREV}"
+SRCREV = "c7ddf9aedf4d525a87f0be57dd83f2a3f63dd497"
+SRC_URI += "git://github.com/behave/behave;branch=main;protocol=https"
+
+
+inherit python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    python3-parse-type \
+    python3-setuptools \
+    python3-six \
+    python3-cucumber-tag-expressions \
+    "
-- 
2.47.2



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8047C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 05:52:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.45574.1711345929835346712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 22:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mD5X+JJV;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dffa5e3f2dso24005575ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 22:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711345929; x=1711950729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aul71IcVtJVraXyaSK8L/gSgjYQUrTQHHBWWAKejMAs=;
        b=mD5X+JJVz4VFgJ2uil+AowCYjQebMvj8XdkrBQFvTqSQ7Zk+1PO2V3UtYvxYzl/HOZ
         3NhoF0dxB/xGeapZnldv7A/X9juUt3x6Mg5tnfSVXOynKR7HoZbp6uhZBPWkHEWC3MWC
         lYQ0mjfk/kEQ5g84tONVaQuiPdZwgdbKC1j6G76nhD5WFyJog8MOvXkieW+p4PdFMWi3
         37wdipY9Rog2JMG8nw2hqbTgPX2X7R+/ZdlHZCUQfA43bU2wJ7hAXKgnZstEanZN0sLA
         FuI2gy+HOfaFfZu/pbBOqtsOxoAaS/Y2c/eWSlg8ys2/KBGjFuYsu1F6jLw239VmPk6o
         wDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345929; x=1711950729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aul71IcVtJVraXyaSK8L/gSgjYQUrTQHHBWWAKejMAs=;
        b=s42doNoci2dkwxHXxHrTm1Msz0h2N2UEE9WE6pWbM0XMRvrd37CykYAuP8kK3Ftzlc
         4OvWCYjcuc6Vcv9FB6r75pWvc4gsU+IUi6RltllVO/4TsUZCNnOv/M5WqSEUEBO22MDa
         A6cxNzePyqsxbwlRJHrLNPeFH98bzyu8Z2Wjfy5RxppjeQ7pnGx+awgqYgVQaDx2iJPQ
         COlV+j2Cs0MHYbox3lqa7eYzQabp/cxUiWJnVkPlZK5qCkfsbXoyFeaVZJQVY7QffbTG
         86OhFOzWPDHvPA2GpbPmYrLV/aVj1NH2URfJFRx/jDQ56034IL/3NTFAyrFa6xAxYano
         FgZg==
X-Gm-Message-State: AOJu0YzwRa1v/PSLe4Ld2hCcsyxzk1fFK5fMrGetzAC4jzEZYE33hp6W
	NVksfDtr3H2wKjdq+HYK9RKGQQcLuzrDT+TPkBgriaf853KEb/y7FOLhVR3a
X-Google-Smtp-Source: AGHT+IFOJaqQgcMWlA0geczGz9cTezOGeCxTJD0fwUU+7+El5JSAXnZU0EldozNUF4ZDc75tpXZrZw==
X-Received: by 2002:a17:90a:6006:b0:299:4cc5:aa25 with SMTP id y6-20020a17090a600600b002994cc5aa25mr4094439pji.25.1711345928966;
        Sun, 24 Mar 2024 22:52:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id x17-20020a17090a531100b002a03da6286asm5096971pjh.35.2024.03.24.22.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] wpantund: Update to latest
Date: Sun, 24 Mar 2024 22:52:02 -0700
Message-ID: <20240325055204.150628-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055204.150628-1-raj.khem@gmail.com>
References: <20240325055204.150628-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 05:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109571

Add patch to support portable basename

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openthread/wpantund/basename.patch        | 19 +++++++++++++++++++
 .../openthread/wpantund_git.bb                |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/wpantund/basename.patch

diff --git a/meta-networking/recipes-connectivity/openthread/wpantund/basename.patch b/meta-networking/recipes-connectivity/openthread/wpantund/basename.patch
new file mode 100644
index 0000000000..30bd9e59cf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/wpantund/basename.patch
@@ -0,0 +1,19 @@
+include libgen.h for getting prototype for basename()
+Newer musl has remove prototype from string.h [1]
+which renders a compile error with newer compilers like
+clang 18+ about missing prototype.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/third_party/openthread/tools/spi-hdlc-adapter/spi-hdlc-adapter.c
++++ b/third_party/openthread/tools/spi-hdlc-adapter/spi-hdlc-adapter.c
+@@ -32,6 +32,7 @@
+ #endif
+ 
+ #include <assert.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stdint.h>
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index b75d686e58..6a84897426 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7820bc7f7d1638a6b54fc2e8d7fb103 \
                     file://third_party/pt/LICENSE;md5=dcd598b69cad786beea33da7b1ae14b7 \
                     "
 DEPENDS = "autoconf-archive dbus readline boost"
-SRCREV = "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
+SRCREV = "8b5ce64c2f5bbf106cabfd015bcb3bdb2e0248d3"
 PV = "0.07.01+git"
 
 SRC_URI = "gitsm://github.com/openthread/wpantund.git;protocol=https;branch=master \
+           file://basename.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.44.0



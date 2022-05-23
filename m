Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBEDC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 18:26:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.30996.1653330387733961414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f1/Lo6/P;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id b5so6797997plx.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuU29tEipdITFDRIX0jBqEh2NKb4VtWnFAhDn+8HsyI=;
        b=f1/Lo6/PmiMoOKpwmoB/iIeC9S5qkBDHkjPXdBrNzpCUY4jKfFjMneJAmUxeSTcylS
         6AVQ1txxXWQS/DMfQ+pnGQ2ajXLMI0SuheBTZGXO1HXn4OhWYgL79OnIvAzUBYHoSMy9
         hY1a7NZ5oKoBm6VvDGnz2QgZkJRUGohz/gytJ/b2Ax96+VrIhf0QE9R3HiEhxBTcw4nM
         NvB/HvggkIfW1xb8EoE5IbtnrdiY1VMS8GFLdHdAtSl21T08OiGg6kzSLuBGJwuCqUPn
         clAdrTvxRME+z82WHOpncQcSZiudGbJ+iBRjRJ0ssvK+iv9qyJsxvSul2v+P6oVAwvD9
         0weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuU29tEipdITFDRIX0jBqEh2NKb4VtWnFAhDn+8HsyI=;
        b=iUJpuHUNeX6gRhxi2BavTS5Ec+9Q+QAHRHl0A1tPwdm2ZLud1jwYeJrsI1r3tp4YnI
         hGW8dcl09EhN2q3mbst+VWDBizKSpAqxUg3LkpHK9R+WVuHckPs5of/yycJ1kbFzR/hy
         ygRiD00LAtlVX29J9wfaY8y7p6XPAMfvPyx+8XDvYyppw+x/ZxX49K9Ip/niQQRkDVKe
         QLJ4MUxMxBd91Kd54Ud0ZsdKEne+dnojp2tNQsokrLit+Bokw/RVMCMbVwgGGIpJMqu5
         1wK948O5SkUjO2WwiT+BTcwMsfA0W1bypAQ9qeoMLjWyV1dZgeA3n5j5EhmQX3PU0/TP
         7Yyw==
X-Gm-Message-State: AOAM530Nj8JnSrqAros7E5qHeSLd8Evx9e7GpZqZpkuA3ilRWp+TSoUc
	OSleKvNtBAuDcFS5biYFLO4Ohyj4HDOd0Q==
X-Google-Smtp-Source: 
 ABdhPJw706956cDKgyWy08o5pezsKNOXoRmWdu0Vuy4BESpuntcqMcb8A+zGVA3NKkmD4C+GgKPxuA==
X-Received: by 2002:a17:902:f144:b0:15e:cd78:e36e with SMTP id
 d4-20020a170902f14400b0015ecd78e36emr24180346plb.144.1653330387126;
        Mon, 23 May 2022 11:26:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a63be06000000b003c66480613esm5046688pgf.80.2022.05.23.11.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:26:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] unattended-upgrades: Disable auto-detecting
 modules
Date: Mon, 23 May 2022 11:26:24 -0700
Message-Id: <20220523182624.13685-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 18:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97239

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...up.py-Disable-autodection-of-modules.patch | 28 +++++++++++++++++++
 .../unattended-upgrades_2.6.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
new file mode 100644
index 0000000000..ec70dd6570
--- /dev/null
+++ b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
@@ -0,0 +1,28 @@
+From 8fd80ead718ffc53d7182b9df6f49974113ff8fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 May 2022 11:23:58 -0700
+Subject: [PATCH] setup.py: Disable autodection of modules
+
+This helps to fix build with latest setuptools
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index 932bf01..fd5a092 100755
+--- a/setup.py
++++ b/setup.py
+@@ -12,6 +12,7 @@ if __name__ == "__main__":
+         name='unattended-upgrades',
+         version='0.1',
+         scripts=['unattended-upgrade'],
++        py_modules=[],
+         data_files=[
+             ('../etc/logrotate.d/',
+                 ["data/logrotate.d/unattended-upgrades"]),
+-- 
+2.36.1
+
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 1ec205f8b8..d4f5b8d0cb 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=master \
            file://0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch \
+           file://0001-setup.py-Disable-autodection-of-modules.patch \
            "
 
 SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
-- 
2.36.1



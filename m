Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FEECCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:28:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.16371.1760448511430182485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXJkqzlX;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so54445495e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448510; x=1761053310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9BV2Sob3Yaj8KKCPKUceBtrf+3oS+RxenkrrFCZinU=;
        b=nXJkqzlXETOd3AL2LPr8kXxO/E7/p3ZAdDUQZCUyWixga4s9MX/FquJZr77xtTxyCv
         7d80/4fGvZRukwwgk65SVhq1BzxjtYlbcwanr1qR2w152c9UNocI5iCMgw1exCVC9gYw
         Ef9ZSgCBRwnvJ8Qf7+tB76CfJGrMRiA5FTu1WVqFHe4dsbgWnArB/J3KAX/ocQKo19VJ
         o7xx17JRSmxUtvdC+dGV21skrEhLlkOBFdjIk9uAwOm3FMqp1EXGMVwroWniFv7KtzP1
         g4ce/wCboydQmbFde7ansVrE+Ox0JvdjEpAv/3KldcygHLn+iCIDtsaPkH/uISjcXPSf
         IHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448510; x=1761053310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9BV2Sob3Yaj8KKCPKUceBtrf+3oS+RxenkrrFCZinU=;
        b=ct+cJgFJhBpilrvzYY6KzIS7Q/k/tfOMwSZuYALxOFOvnbNcdcOYrQmDv4Ga0hwuhi
         o9tminfIr6oTKhJ80dsJhqq0hG6JbgwRsL6nlN8o1HiJ5YjZGXzs4KML8I1ah/HxUh5J
         OdnpNbcMMLw7SctnnzHcXUGxm7huk7GQfMMt0yrF9uScwoK122g8QI5SnONFtth2LBLU
         eweVpFZ5mz4/JZvCA/dO3iZUXqDcw/EELQXXdk7+1wFEhRJhFJjDPHYBks3oQWOMamR1
         maQ++zqSKuKT1cnYpSF9+a6o3B4w3g8he3iTIGWa2ZHA4Oqgt5gA1UORW+5x7PPLbAwc
         wFgQ==
X-Gm-Message-State: AOJu0YwVKcpGwYfeuA4mZ6TtsRGekfXqBm/eYZcZPzcQ1uG1YGkhRVfp
	vEslT0qOp13pzgmmiDs5BZPZXpT6fpuG06k4uhKD0YcTXPB6hjbSEBQvZ8+a9A==
X-Gm-Gg: ASbGnctHh/HEG2WMv6Kv76FnMMihVGFs1GRS4HWT//CvS5dl2NOaBOiPeCLGhvF7EOz
	l2I0x7xgERfctEfWIYDx+UVaFFvcr/lXVqKg7lDpJi/MDunmwrfY4l44w10y7XmsBF2fd6qoUI6
	8nRTqCaMDuxeQ4QonoYYWDAFmZj9OQccBD+nDXdH0xkzTGyHsiV6hy7eBhmlg9q88717asudP3Q
	Z/NZfuZdQljAlZQv/e03y51cVhHn2CVzc56nfgw/yFs3/oUYG2wbqjAkjY/zNY9nwinHcEfWe+R
	IFC7c0JDgaCURqdBRNyEqnmUPio+ZucIb/OViNZdqgrCklqe/Xwnw8P6YjShzsKP1+JqUYglpxu
	d0xspc/ZJMVzMba2t7xBgwHAQCP5MPS7f/t4l2hU=
X-Google-Smtp-Source: AGHT+IG7cmzYlFuz54r3yceDB0tTkhO23k+B9f42aVSnJTir+Y2kYMXWXRYMtz6jtG8QsuEX9ThdmQ==
X-Received: by 2002:a05:600d:41c2:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-46fa9a8f156mr167030645e9.1.1760448509547;
        Tue, 14 Oct 2025 06:28:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm247833025e9.1.2025.10.14.06.28.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:28:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] webmin: patch CVE-2022-0829
Date: Tue, 14 Oct 2025 15:28:25 +0200
Message-ID: <20251014132825.1052635-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014132825.1052635-1-skandigraun@gmail.com>
References: <20251014132825.1052635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120608

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-0829

Pick the patch from the nvd report details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...issions-check-when-saving-allowed-cr.patch | 25 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch b/meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch
new file mode 100644
index 0000000000..a1ab677bc9
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/0001-Add-missing-permissions-check-when-saving-allowed-cr.patch
@@ -0,0 +1,25 @@
+From 15dd0e4e55579671c01e4808236beb4fe23e9eef Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Sat, 19 Feb 2022 13:10:36 -0800
+Subject: [PATCH] Add missing permissions check when saving allowed cron users
+
+CVE: CVE-2022-0829
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/eeeea3c097f5cc473770119f7ac61f1dcfa671b9]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cron/save_allow.cgi | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cron/save_allow.cgi b/cron/save_allow.cgi
+index 87bbe453..73df9a84 100755
+--- a/cron/save_allow.cgi
++++ b/cron/save_allow.cgi
+@@ -4,6 +4,7 @@
+ 
+ require './cron-lib.pl';
+ &ReadParse();
++$access{'allow'} || &error($text{'allow_ecannot'});
+ 
+ &lock_file($config{cron_allow_file});
+ &lock_file($config{cron_deny_file});
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index d553c7530c..78ab19601f 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://0001-HTML-escape-command-description.patch \
            file://0001-Object-names-cannot-contact-special-characters.patch \
            file://0001-Foreign-module-may-need-a-check.patch \
+           file://0001-Add-missing-permissions-check-when-saving-allowed-cr.patch \
            "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"


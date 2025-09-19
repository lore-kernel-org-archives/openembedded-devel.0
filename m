Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ACACA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 03:36:14 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.7623.1758252970307357943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 20:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pp9Mlq5G;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ea669836e8dso728997276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 20:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758252969; x=1758857769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QKkXKZvXO9QB5D7LEkNzvaJ6794Uw4GkxCKDfV9xM0=;
        b=Pp9Mlq5GlkbbaxizD7/lwoSgmDBiBmytIsOLZ8J8KqrS6Ph4r4CMq8epnAqHVMqP9e
         +0Xg+Vs8pGdsXZURfJ70dbZuOPEVXI5W6FF9QaVtnvWyhsPHQscvVstWcT3Zi9bVZZfQ
         zlDNkk7r7Qu6etwqcT666rbz6/jJByn/c62NQtlqt7BLvffSyY/nXGjhv9h2CFmRSjwU
         D4YIayxEluO7/OAMFAOcroIHScqd0Yz7wDA8C51ewsoxyb0CWbRn5FGQXEdgoQhKiuH7
         yZ8zI8SZHMx6BcDIpCG0P0XkDs8Qt9DuwV+wK4rQjod/A/dn71YsU22zRB5d/jZE88cH
         6ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758252969; x=1758857769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QKkXKZvXO9QB5D7LEkNzvaJ6794Uw4GkxCKDfV9xM0=;
        b=thDtnKBLhn/Km/dfLMPcwJXKRFJyi4LQPZICc+vY3HsZsZ/YvgnrNnNMTIdp2s93Bx
         1zmqca3goKH3/Gxq4M/C4da0s3kizhknZZTPNYSn6UegBJCUYve4BQj2cmKZXCl/Np4A
         4D5ed+O69b4jUVQjGCFCvlp1mLj5PrshPoY5rNUEHmn3ZLHYheHn5h9MPduG5HryOFF+
         I2AuFvZo2DLLZftJBqs1rbhRm6PQGj6Qwqs2KxSIJz5fFE2PC9iITkGEeRONoQcYeS74
         D2Cnp53LJ4sbjaQVyklwtwGAMJ99QhyPUgjCycWbli0oDWYJ+u4nKJcdgLm7x6kTXztG
         ToNg==
X-Gm-Message-State: AOJu0Yzhta0t/jGS3i+pLt2SskuTtd5+r47cGxwquWHHpVN/mz7ZRH38
	XP+1OoZNsk2+e4QVvi7oFlxhmaOix9fkt64deJaobW2cOx12jv7Vav5qGDGPjdiu
X-Gm-Gg: ASbGncsbk4T4YX+jw/V07d7dvCmdGxEYmC6kk27SNGW6gWVomEb3n2RUsBnuAtlmo0k
	qI7mmIcWQjBpgP3S9OK6HWLtEOWSONoohXiNN/h37HfzvTHLBWpEHAsEj8DqLIPiIhJtmtOWXa3
	4LrZkM/5nFkPDIo4LrIMxQbfum26ljwuUaH2PdZglPDrjIu3Oxu383eYiYrNM+DB7KWvM89knxl
	o4eyCqRCKwtDVk03m+uAyebbv7c1v7aVWwImOTGdmgeX4FEnoWU7ICLPARi85nBhwjU/eiC4PDi
	WAIN2UhpTXwyS7V8A2DQGVfcjg7ASxivxTuThyNlcV2D82TkEDFPXxxABrSFtwNHGeQEso/G/Yg
	+eAhkwXxjGbezr1GaBU6rdf72H6KtDIgeRehLeMU=
X-Google-Smtp-Source: AGHT+IG4rD1xDRXKgIhEhAXy87VwpaxZjyvOdnWGpSANqH4k9IzhhaMoAq1gGroYKbSnuEipGZ8uXA==
X-Received: by 2002:a05:690c:a08d:10b0:723:89bb:7c63 with SMTP id 00721157ae682-73d32849e04mr15043807b3.14.1758252968790;
        Thu, 18 Sep 2025 20:36:08 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7397188d10csm11471297b3.55.2025.09.18.20.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 20:36:08 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.202 -> 2.300
Date: Thu, 18 Sep 2025 23:35:53 -0400
Message-ID: <20250919033553.1455565-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 03:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119586

Modified net-generic.patch to update a hardcoded version number to avoid
patch fuzz.

Changelog: https://github.com/webmin/webmin/releases/tag/2.300

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-webadmin/webmin/files/net-generic.patch           | 2 +-
 .../webmin/{webmin_2.202.bb => webmin_2.300.bb}               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.202.bb => webmin_2.300.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index f1965a7887..65e1d77629 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -6,7 +6,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 --- a/net/module.info
 +++ b/net/module.info
 @@ -1,7 +1,7 @@
- version=2.202
+ version=2.300
  longdesc=Configure boot time and active interfaces, DNS, routing and /etc/hosts.
  name=Networking
 -os_support=solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin windows pardus-linux
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.202.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.202.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb
index 18082149b6..1e46384465 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.202.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.300.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Web-based administration interface"
-HOMEPAGE = "http://www.webmin.com"
+HOMEPAGE = "https://www.webmin.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=0a6446108c96d0819d21e40b48109507"
 
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "4f1c467aeda0ded546e69f332c768665b6a0537d6a69e609221f9465121f775e"
+SRC_URI[sha256sum] = "1405dfd1f452c502169e07f00fb856fe31af122e484df03e1ac549a7eeec3001"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0



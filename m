Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF00CCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6156.1763445052582507393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ja2SCIf3;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-295548467c7so59873235ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445052; x=1764049852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c88eWzE2hoYPZLiHYxXYgg2De+qrWsHGh4XO46SfNU=;
        b=Ja2SCIf39SRwhUS/RPS7+X/dT6YiYjYkAL/p79hHfrFr32/C0uyBdsbUTcChZDnsQX
         t0WZksK/nRbZBpg1xVwR4WnK3aPeDmofkM/1JW94EFiJEaX1/MxAAFEEZWEFuSh6+bVb
         iKaCNdfIgXkgkOefKLteQ9D7iAbFCRmWDRG84OiA8iVXp0+Ghb8SOCkwtwt4rWlc+lD4
         PV1+D0MerDM7sxR/mZoYkwqhl5SWVHS8xLw8EoM27CwcBVIVsATrg0wQhhDfLKJr6qNs
         4O6Kt8ODUH3+IhS2HWgnXdv2/I8ir7YvW2F28iu3LIcRNjQ3+7YcxsALpnIWBOtXQL1o
         HPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445052; x=1764049852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+c88eWzE2hoYPZLiHYxXYgg2De+qrWsHGh4XO46SfNU=;
        b=K3fjXBvaLxbBmmb5yVgnNW9hSesKJblwWUbDjZXd0SCqrKwAn40KEKBMv6iCuhM6I6
         YmxgQ/gvd3DMWE/B3hl1TodJ/6eZoF+wPBWGIyEVE1NVdG6MGXN7BENSdquIKgQN+nuA
         Cfh33FrI6wcXX7sOKfLly7esYyIduqwDZ7McU1BDRtWqrytOcWuuHyE7SxHwX4h96gNK
         RbZoUXpj4pc2/ipKtpuznsAutS+Z3cI607UNiNj/EeABME/FOBTmzzhwqRl2fB727neY
         biiA93sUXBr5OIJIKQuHiXwaKxAOUb3uSL2UB72oJ/ev7OVovZONbIP6LVrgLZde00e1
         3k3g==
X-Gm-Message-State: AOJu0YyRU83hsTgYRmPsCdMNWwfkEnPTDaFBVr++a8D4PaYwMGIT2Htr
	Ulr87VEZbEfnYSonp89UYO4pvpSiRJEjBRdmQde/bOdGQAkgJ3MnZCmHHtFSqg==
X-Gm-Gg: ASbGncvylZv7jCHI6MBGPB1BKG06j752H98vZWtlGlFgji36nsw0a3z91pMWiR7Mrfj
	i5In87dRZ5YWzYzl21t1QKJ0BeMavFNOLxx64eSPcWLYo8p51Qpm1xGro6yNCeSL3mV5iakBT7d
	h3r8poTZDpFfYmKouheR9bvjeZn2zffpSNyb0uTqxSdqyMNP+AeDWM6JBTcJF+Hvewm6D8PNIEG
	g9NdMEyxzRKOx3z9udskoq04VD1upidd7+0UJOmC16kTl7ycPNtk/bDHa7NcVatvzEUM+DrMVdQ
	u7pF0DuTQorTsGNTBloTOOBmQy/NnLpTCdLugyOCZLxWkg6Xe4fGPxKLlbS+j4HxPh5Du0gUaU0
	LoTjyM7m6zjfUVfJM7sZgzGHi55cN1Vl6gNwFidM4YzvLSU2C95XSHyo7Dlog2eU0tCvw2e87Kx
	SMtC6s1Ehhht5qII2/4UUfcK0r
X-Google-Smtp-Source: AGHT+IGoGM8VKop0APeqJkxc1hpvbtqpfl9ahCwZds5Tj0Rb36YHDWut3hVgBlSLCc8iin1A/4yOrA==
X-Received: by 2002:a17:902:f60e:b0:295:9d7f:9296 with SMTP id d9443c01a7336-2986a74333fmr189004535ad.45.1763445051899;
        Mon, 17 Nov 2025 21:50:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 6/6] webmin: patch CVE-2022-0829
Date: Tue, 18 Nov 2025 18:50:27 +1300
Message-ID: <20251118055027.1334922-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
References: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121809

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-0829

Pick the patch from the nvd report details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 80b536578028e4f6d0e5d13d133d1d88764f7445)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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


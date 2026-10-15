Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D62CCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32801.1792043003359187641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fTVncurs;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95b3b52f2so2109295ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043003; x=1792647803; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z6G3hWoaPVvm3Lrf1oJtBmflGYOH700fa9YsIuo/mA=;
        b=fTVncursXqfaBnOACjyJK8qm/DUjX/a1J40AZ4d9EpgL8Qaj5eBZAQ9ZsyR15eUL37
         A1ljePo3TS8p8U2Eq80T3/aBLxUpg6nIzc8lrPGeuTm/uLZBw6hfjNkzhn60r9j+JULL
         0ZKkOl0GzzO21CJPjFDwjQdP7qfz6SCQE32fPp890PjB7qWAzEsxHWG5i9NH3ZW1e3uy
         3GMJoH4egeEcicoKf8XVo+QYztoG+IMoNbtH4UBNKq6uH3m3QGZwH51INFSUda+GQTDg
         rlpPPqoEXhadU2BZZUywqZk4t9u3g/OkEMZEkV5aNGCBeF5bmxfMDG6wJ02clct5ZzUC
         ATFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043003; x=1792647803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Z6G3hWoaPVvm3Lrf1oJtBmflGYOH700fa9YsIuo/mA=;
        b=PbIlD7uT+liQ/7Np2BQDgn38clybSoujVLNDJkX9dGV/FT+UOcBah9sQYkeAHRtj0P
         5XVJ6tmL2AUO7c99rELUNb/LWAL3hdY34wfcLlhbHlkYdKK2lVuw+pPWiFi/b5TCRWtm
         CNwZKHTARC9KqCPBgJqU4hfMJHwM5WwDnJLoIu76sSbG55U6ikVNuhDiZwTgNuMDBl+o
         AQnoxgZ+8OTb0f05q0ehqffaPUKMVycq5t7SrFvlph/rjyFLIR9J2Vrl43C6+IrjGuyY
         7G9U82EG1n4PFRkH8XcV7TyWZnOmBg5Ypf8l72pzQqkeyL52JfycPpEuiUZ949NB+iHX
         eN+Q==
X-Gm-Message-State: AFq9FYKDNEEimAr2on1Bvh9jekFz65+0RLEosW+6NvbFEcjNqrsFBQlS
	wg3d6nh6VDUm5y9IfoSfKtClazUtpmvFF8aULRlWySJNkSeaFdeRiCn29P5zbg==
X-Gm-Gg: AYBFou20gL6vEZU53F3TIrs+rVkewKwr85NuC4itAAYR6SekE+z+LzwEviQw8bEk1X/
	DBkb84vFOJ3uXvTUxxipNXUqtndf8tVdwoOc2eWqSBeIqFi2a+7i/74cDqcqd8sxWWcDIn2Cnwd
	fSu/tpRQ1RiWeE5K0qSmpOgFWIpbkxiark74QYUW2iQCAix2dh1bOv1CmFHjD4PFvVNyu94HZyF
	DC+2JaZi9TkpviV1BWPEzcA0mWz56hGJ/R+fFlL05uyymRXjgisN6oH7lOXNi2+9PIW+QA70LYo
	v9eK/0JhK8P0mgrSn0rFpV4OQly3ReHXUuMrWkOqFw1cPKwflWrRx5BOKpQeeGa7v8NADe/YyfG
	PZ1IPjw/Gl1Ux+Xk5Ytt2o/rHsZ61TUCe/I1M0T02YqZOcfOe7ogf/pAYDj47MpPdYc/9VlYfWd
	N1sUUpDX54NP3p1jOn0FYhKARKD8pcct6wui9KHEJJ+/gfU5zRC4t0k7BQAqMsmu7mtz5oWSCLV
	tu70bUS6eQOa1UqBYvcFak=
X-Received: by 2002:a17:903:26cb:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2e93f414356mr35565745ad.13.1792043002656;
        Wed, 14 Oct 2026 22:43:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/82] dool: patch CVE-2026-56651
Date: Thu, 15 Oct 2026 18:41:04 +1300
Message-ID: <6dc6984b6cae7f2c469886c6b8c67ff9cd09252c.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130936

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56651

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 2e1445decda0c68cc6889777c6f648cdaaef082c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dool/dool/CVE-2026-56651.patch            | 47 +++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.3.8.bb    |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch

diff --git a/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch b/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
new file mode 100644
index 0000000000..e367884ca9
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool/CVE-2026-56651.patch
@@ -0,0 +1,47 @@
+From f5eb4fbf3977d919a2e9da8b73985a29d2878e56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Majchrowicz?= <sectroyer@gmail.com>
+Date: Thu, 18 Jun 2026 10:52:27 +0200
+Subject: [PATCH] Neutralize formula-prefixed CSV output
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Michał Majchrowicz <sectroyer@gmail.com>
+(cherry picked from commit d5aa93b3d1939a83b2b10a7cd8af3c819930aea1)
+
+CVE: CVE-2026-56651
+Upstream-Status: Backport [https://github.com/scottchiefbaker/dool/commit/d5aa93b3d1939a83b2b10a7cd8af3c819930aea1]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ dool | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/dool b/dool
+index 634ed9d..fc1015d 100755
+--- a/dool
++++ b/dool
+@@ -3030,7 +3030,10 @@ def perform(update):
+ 
+             # Prep the line for the CSV file
+             if op.output and step == op.delay:
+-                oline = oline + o.showcsv() + o.showcsvend(totlist, vislist)
++                csv_cell = o.showcsv()
++                if o.type == 's' and len(o.vars) == 1:
++                    csv_cell = csv_quote_string_cell(csv_cell)
++                oline = oline + csv_cell + o.showcsvend(totlist, vislist)
+ 
+         ### Put the output in the csv file
+         if op.output and step == op.delay:
+@@ -3170,6 +3173,12 @@ def file_slurp(filename, size = -1):
+ 
+     return ret
+ 
++def csv_quote_string_cell(text):
++    "Quote free-form CSV string cells and neutralize spreadsheet formulas"
++    if text and text[0] in ('=', '+', '-', '@'):
++        text = "'" + text
++    return '"' + text.replace('"', '""') + '"'
++
+ # Make human readable device names that are shorter
+ #
+ # Example mappings:
diff --git a/meta-oe/recipes-support/dool/dool_1.3.8.bb b/meta-oe/recipes-support/dool/dool_1.3.8.bb
index 8a057effdf..5118eadad6 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS += "asciidoc-native xmlto-native"
 RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-unixadmin"
 
-SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV} \
+           file://CVE-2026-56651.patch \
+"
 
 SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"
 


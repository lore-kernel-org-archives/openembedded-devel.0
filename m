Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D5CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:44 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5088.1791839435232568215
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rCVxGkN/;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso943124a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839434; x=1792444234; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KhP7I524Ik2T7MERZuAYHCRsypN597paxCkLUXVEfc8=;
        b=rCVxGkN/3kGPHUW3fpYsGJUzl4UM1nsp/cEt8zApmqqCJJ1nZkXvOL44PApdiG986R
         Yv4aQR2o3FQGxtXlAmpKAXvzK2jcI3OIUQ0Mt+G7c9KGQK+RAGT/hbIIwsrl6cZB4VN0
         3BgV5xQdHvRpoN/IXShXJz88tLtaOyL7mR3oZ4xmF6ndNtz4tP9uRxrhG3me32RGgxEO
         57rrcVYR11gI5YjpOqXZ7mL/v+hpOKOozem0LpJhhy44+5Cd5r5Gixm76YaeuljNeifM
         JO2QdkBET/tWrCJX/lnReY3IO8ZRqM6dxw1jc/I3g79G1yXCY5mfoln6aHfNNTiFU/8U
         NSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839434; x=1792444234;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhP7I524Ik2T7MERZuAYHCRsypN597paxCkLUXVEfc8=;
        b=GhhiCIdNhWz6PxsQ6dvx+Ym/ok9891tx1MtAtYdcMSb5P95KhduYikqQp7qmBf9R8y
         Otnxzr+YxsW9ds35DmaqCPDmZ8h+Mi5hvwjkcXiv6fgG/KltW5FLXhjXJQWPyG85nnVp
         PcnoBca7BAJ0T4Y7pYdYzzIOs66F60k2sCXQ+Ajd6GTiUQlZngfaODJTlnqiQQNrEODT
         +MrajZoA1tkQsgcz23/12WJxFcaqGFW/3GC6J8Xwa2J89gRuUqctDTQqsUzV/3Cyt79z
         MI1m0DfUkb6Pve6Zk0tqlqmg3JyhxiGzifDZUfG5zGOCaD20FMOgEQia/CzLdPOV87G1
         idPA==
X-Gm-Message-State: AFq9FYJ3EmBJwU3vKBny32zfev47pw1rtaMZUwbrYoWg2yziubTyxLt/
	ruZlQybtg0+dyoCxIT8UtShZw2pLwOg+e1byn0xfUeukhZn7Z1HkLjZA8UpeUPrJ
X-Gm-Gg: AYBFou0GBh/pkWeoEqdiGZJ5WRLOkrkAJlYDmWUIhBZWjKyhQCFPBtaeLlW6bZnGjSi
	0Tc+mEEug8qVgyL7lxYLZ8jYPbyWOVi1EkXoJ5QLqYOy1bo0bdZO2PKRu7FIuOfBWKWRCdlyMgu
	kQHIWtvYkS4X0RqrLzlTHZysIZUk5acUlGXpZiHplduevcN1h8Jf3d0gz+OSa88qENi38L+s2Jt
	HiEyInTTNcH7vG7vDUhBq5HZLT6pdk1XzYR9v6Tjr/gN2kkD+Vdz7fO2DFEkuRTKpWF8ChbF/vG
	juLWUgcqOkHjYoRU/8gb6bODkNzwMmifkeDPcLvH9weFwapYS8KP9mKEcKNlUclnl+UxKlAJajw
	/bk/lwoVoLRT0UoTds5SJ00IzDWwlFs6KnbIlWbDQF+ANALYp5Apt2WMS2EAplm0bflvaV8IBG/
	R+ol2uy5Y+m4WguXUmnbJY2FPJBKVzEAyVK6+C8XoJOjMLbo+CoXl4t9SPTvzTowsKPmfJTLwUu
	q0Eh2HDQbA8xOe0hkUDNmbmXmlbym/H7S5Hmz0=
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr7956095a91.33.1791839434446;
        Mon, 12 Oct 2026 14:10:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 7/43] dool: patch CVE-2026-56651
Date: Tue, 13 Oct 2026 10:09:31 +1300
Message-ID: <20261012211009.3352822-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130777

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
index 00000000000..e367884ca90
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
index 8a057effdf3..5118eadad69 100644
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
 


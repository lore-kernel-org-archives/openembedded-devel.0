Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57004CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3507.1791763833564802267
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KBSBUjbp;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so1523711a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763833; x=1792368633; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KhP7I524Ik2T7MERZuAYHCRsypN597paxCkLUXVEfc8=;
        b=KBSBUjbpu2APSCAbwMYzgBC9uW3ZKrde+iXCJTlGX5pDiQL7YA1WlM7+PDnq2oTtYo
         oyk0mLUAPa13u3rycQBAXB8j9ac9QRFHsurMUJuEww5wNPzOgG7rgfhpWa47p9dR9H2B
         kmB6rxKPHi5271s9Pq9oCFK94xp3nte9yVpfZMM1N55SOIwfrejD6u9RienDkIzLgStz
         XXbj0Ps1+pLmfivETnTL8rFFnmCVSAekbt1Sya7jsGZLPSD2fvqwVWC7AlBwMyiDkN+z
         aTofpjVefgEhwCl8C/T9oJYHVON2QF0knEuWJWWHZ9jdY2DEBljGbSrtKHvlQQCZmQ63
         w2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763833; x=1792368633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhP7I524Ik2T7MERZuAYHCRsypN597paxCkLUXVEfc8=;
        b=srfr5ACmCtFqEjWTtgN2u5dUxgYKsBQX9X0opcr59CU256Y0dh2WIDJgub8PBpSBxV
         lPHNgFc2Q2m1TjszxYeKRW0CD2OvCku6Iq8FE4iSZsounLvwRm2L9iVwiiZXkmDDRsPv
         ouFUQLmni0S3Fr+j5JFegBTMcEREljhrs/+cHwmXpBqHL97aaDvHwRDZ7vY67KA3Ziuk
         JgwI5MxDtCtSjo3wB3u3yam7hlAAGDOgaruuY3lb/Z0svB+5ZnEQFQWHxxZXbNkjakT+
         2S4G8KfIGt3Uxc1IPgN+8RN6MKOYcrN8NBDY6W2CEZzmSxpsLrw0BM2B//pr/cAAxZfL
         SYgg==
X-Gm-Message-State: AFq9FYKEdTJunKvxoX7Cxk2OxGRSQ8tSTr0G0fiK5dwdJ02lKPW6LneN
	n6edk1Gw91gWvlMF4G1nIYTpp0whXoDRWgB5pDlZ5QL6TUudpJPmMIvdAlPovg==
X-Gm-Gg: AYBFou2aLwGE6T2cb3V7Xn5m4WGynYn0uEqgKlPVpGYqgM4tNWhbkOPturMDkgH0Ypt
	tiAjXpYtkYHFP7tZud/c/ro+htgsv/w1++5Z8DG1IsRbZ1Ncy9HadGvcis/rmVmDmAj2LDeuA1s
	uESIkltA4zQofcTYULVtP6w7WJresjnaXKhLsOgFykEgMdMhz7YudABgpL2XjUfGkq83wyN6sHz
	Vt6o5eowo60GN37GJ3WXaQN7Y6N0PTrw1M2aHEzOZexfaeaJ0AgwxGa8pn+FwQa2y4OK1RAz1lb
	8m0Sa2xprYvaE5LvRqxC/NqoDlYrB+XZKlaxlpzxViF1DGZN0HU77nL+ln5L4PE1w5IJ1KDaR1+
	5a5Dm6wdZ+ayP095S6UHUaVXIq9IlRmjbMiVclbcYuYEXBD0pzY9UHrGiBcazEMLitDJVA4u5Ku
	I+n9Etm0QVHRzJ89quWKGDNtmDMxhnHe6NTvCVGlYwQPnSHHFVNniBR/HiWtYLlCEOk1x2wDbG7
	/EWINi/3gLdIvcBT2JHGAmWRUChKKwlnw6TPKo=
X-Received: by 2002:a17:90b:3a48:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ab3ac65f7dmr6893175a91.37.1791763832885;
        Sun, 11 Oct 2026 17:10:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 7/28] dool: patch CVE-2026-56651
Date: Mon, 12 Oct 2026 13:09:45 +1300
Message-ID: <20261012001007.2541673-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130732

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
 


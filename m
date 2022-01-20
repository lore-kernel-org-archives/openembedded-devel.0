Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1A3C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:47:08 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.8900.1642664827370611666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20K7l5vV018944
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:47:06 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20K7l4qM026190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:47:05 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 19 Jan 2022 23:47:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 23:47:04 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 19 Jan 2022 23:47:03 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-lxml: check the return value
Date: Thu, 20 Jan 2022 15:47:02 +0800
Message-ID: <20220120074702.17884-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94955

From: Mingli Yu <mingli.yu@windriver.com>

Check the return value in subprocess to guarantee the subprocess
execute successfully or not as after [1] introduced to limit the
netowork, there some difference during do_compile phase as below.
Before the change
 # python
 Python 3.8.10 (default, Nov 26 2021, 20:14:08)
 [GCC 9.3.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import subprocess
 >>> cmd = "pkg-config --modversion libxml-2.0"
 >>> p = subprocess.Popen(cmd, shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
 >>> stdout_data, errors = p.communicate()
 >>> print(stdout_data)
 b'2.9.12\n'
 >>> print(errors)
 b''
 >>>

After the change
 # python
 Python 3.8.10 (default, Nov 26 2021, 20:14:08)
 [GCC 9.3.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import subprocess
 >>> cmd = "pkg-config --modversion libxml-2.0"
 >>> p = subprocess.Popen(cmd, shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
 >>> stdout_data, errors = p.communicate()
 >>> print(stdout_data)
 b'2.9.12\n'
 >>> print(errors)
 b'do_ypcall: clnt_call: RPC: Unable to send; errno = Network is unreachable\n'
 >>>

[1] https://git.openembedded.org/bitbake/commit/?id=0746b6a2a32fec4c18bf1a52b1454ca4c04bf543

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-setupinfo.py-check-the-return-value.patch | 46 +++++++++++++++++++
 .../python/python3-lxml_4.7.1.bb              |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch

diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch
new file mode 100644
index 000000000..7d9121846
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch
@@ -0,0 +1,46 @@
+From 057872fa40e061100d61117cee5c3413ef2e40fc Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 20 Jan 2022 15:18:20 +0800
+Subject: [PATCH] setupinfo.py: check the return value
+
+Use the return value altogether to check the subprocess execute
+successfully or not as in some case it will print some noise
+message though run successfully as below.
+
+ # python
+ Python 3.8.10 (default, Nov 26 2021, 20:14:08)
+ [GCC 9.3.0] on linux
+ Type "help", "copyright", "credits" or "license" for more information.
+ >>> import subprocess
+ >>> cmd = "pkg-config --modversion libxml-2.0"
+ >>> p = subprocess.Popen(cmd, shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+ >>> stdout_data, errors = p.communicate()
+ >>> print(stdout_data)
+ b'2.9.12\n'
+ >>> print(errors)
+ b'do_ypcall: clnt_call: RPC: Unable to send; errno = Network is unreachable\n'
+ >>>
+
+Upstream-Status: Submitted [https://github.com/lxml/lxml/pull/336]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ setupinfo.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setupinfo.py b/setupinfo.py
+index 8c2a36fb..c1247c6d 100644
+--- a/setupinfo.py
++++ b/setupinfo.py
+@@ -365,7 +365,7 @@ def run_command(cmd, *args):
+                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+     stdout_data, errors = p.communicate()
+ 
+-    if errors:
++    if p.returncode != 0 and errors:
+         return ''
+     return decode_input(stdout_data).strip()
+ 
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
index cb33fcc3c..43f071281 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
@@ -20,6 +20,9 @@ DEPENDS += "libxml2 libxslt"
 
 SRC_URI[sha256sum] = "a1613838aa6b89af4ba10a0f3a972836128801ed008078f8c1244e65958f1b24"
 
+SRC_URI += " \
+           file://0001-setupinfo.py-check-the-return-value.patch \
+"
 inherit pkgconfig pypi setuptools3
 
 # {standard input}: Assembler messages:
-- 
2.17.1



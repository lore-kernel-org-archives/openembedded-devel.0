Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92838C3A5A7
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 06:44:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.124043.1670136282036416048
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 22:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fMMeSMyK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9337ef6b4b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B46ien5020888;
	Sat, 3 Dec 2022 22:44:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=8rJpvar3srCuAX35aRhnrmpKh9VyyocFzFsJt/C3cog=;
 b=fMMeSMyKXABgBORTJEP5awjMOuH9wpiTiv2A+FtM0MzGcjZW5eM4yri1MntUJiy+nJyp
 C2secO+TNPlwzD/gCo0pgN2mX6uXJU+7IfvOqvnz58rVKiRIlwXQrC5XfwArMgueZfef
 3kPNCFJ9vNogI5bWrpMhovMb8nXH+IYc+CWOGaek7eQF78OuhsE3jQMrfKgG75tPJNiq
 vJutJ0UcByIKNLV1tBrSG0kpqxHZye4gQMy1NdzesvntnYl9PwdkYMBDq/ZFs7AaAaTH
 K52JhtDlkxoVUE3wwDt10sM8KEt5EUr4lF+Rh75D7hE0kuPvRd0Yi0REdKgnCf3nt704 bA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqrdfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 03 Dec 2022 22:44:40 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 3 Dec 2022 22:44:38 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 3 Dec 2022 22:44:38 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2 1/1] python3-wxgtk4: replace deprecated inspect.getargspec
Date: Sun, 4 Dec 2022 14:44:33 +0800
Message-ID: <20221204064433.5377-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221204064433.5377-1-kai.kang@windriver.com>
References: <20221204064433.5377-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gCaaXo_gS7DkoUvLiwyNfII688y3m55J
X-Proofpoint-GUID: gCaaXo_gS7DkoUvLiwyNfII688y3m55J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-04_05,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212040062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 06:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99943

From: Kai Kang <kai.kang@windriver.com>

Backport patch to replace deprecated inspect.getargspec in lib pubsub.

And add python3-pip to RDEPENDS which is required by utils wxdemo,
wxdocs and wxget provided by python3-wxgtk4.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
new file mode 100644
index 000000000..9bec4c5ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/9986a0d5]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 9986a0d5c24b5d45ddf571d60351f68765a8a9be Mon Sep 17 00:00:00 2001
+From: Scott Talbert <swt@techie.net>
+Date: Mon, 8 Aug 2022 22:35:58 -0400
+Subject: [PATCH] pypubsub: Replace deprecated inspect.getargspec
+
+inspect.getargspec was removed in Python 3.11.  This is a backport of:
+https://github.com/schollii/pypubsub/commit/089c7a73f85c76a3aa22e4b10c71db1bf65a8637
+---
+ wx/lib/pubsub/core/callables.py | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/wx/lib/pubsub/core/callables.py b/wx/lib/pubsub/core/callables.py
+index 65eb1ebe..7e798c54 100644
+--- a/wx/lib/pubsub/core/callables.py
++++ b/wx/lib/pubsub/core/callables.py
+@@ -12,7 +12,7 @@ CallArgsInfo regarding its autoTopicArgName data member.
+ 
+ """
+ 
+-from inspect import getargspec, ismethod, isfunction
++from inspect import ismethod, isfunction, signature, Parameter
+ 
+ from .. import py2and3
+ 
+@@ -133,19 +133,26 @@ class CallArgsInfo:
+         self.autoTopicArgName = None."""
+ 
+         #args, firstArgIdx, defaultVals, acceptsAllKwargs
+-        (allParams, varParamName, varOptParamName, defaultVals) = getargspec(func)
+-        if defaultVals is None:
+-            defaultVals = []
+-        else:
+-            defaultVals = list(defaultVals)
++        allParams = []
++        defaultVals = []
++        varParamName = None
++        varOptParamName = None
++        for argName, param in signature(func).parameters.items():
++            if param.default != Parameter.empty:
++                defaultVals.append(param.default)
++            if param.kind == Parameter.VAR_POSITIONAL:
++                varParamName = argName
++            elif param.kind == Parameter.VAR_KEYWORD:
++                varOptParamName = argName
++            else:
++                allParams.append(argName)
+ 
+         self.acceptsAllKwargs      = (varOptParamName is not None)
+         self.acceptsAllUnnamedArgs = (varParamName    is not None)
+-
+         self.allParams = allParams
+-        del self.allParams[0:firstArgIdx] # does nothing if firstArgIdx == 0
+ 
+         self.numRequired = len(self.allParams) - len(defaultVals)
++        assert len(self.allParams) >= len(defaultVals)
+         assert self.numRequired >= 0
+ 
+         # if listener wants topic, remove that arg from args/defaultVals
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
index faea43777..df23037fc 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
@@ -13,6 +13,7 @@ PYPI_PACKAGE = "wxPython"
 SRC_URI += "file://add-back-option-build-base.patch \
             file://wxgtk-fixup-build-scripts.patch \
             file://not-overwrite-cflags-cxxflags.patch \
+            file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
             "
 SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
 
@@ -29,6 +30,7 @@ RDEPENDS:${PN} = "\
     python3-image \
     python3-numpy \
     python3-pillow \
+    python3-pip \
     python3-pprint \
     python3-pycairo \
     python3-six \
-- 
2.17.1



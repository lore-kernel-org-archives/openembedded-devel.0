Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53394C28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:58:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4243.1741683487501150522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165f24d54=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B4gg1v016058
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:58:06 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4136up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:58:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 01:58:05 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 01:58:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][scarthgap][PATCH] python3-pykickstart: fix options parse error
Date: Tue, 11 Mar 2025 16:57:56 +0800
Message-ID: <20250311085756.1136319-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cffb1e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=2bt-VXkB6UH8ak-U0kAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: blWU5JyLY7up62bUtby9phZEvhfGgrTV
X-Proofpoint-GUID: blWU5JyLY7up62bUtby9phZEvhfGgrTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115888

From: Kai Kang <kai.kang@windriver.com>

Backport a patch for python3-pykickstart to fix option parse error:

    File "/usr/lib64/python3.12/site-packages/pykickstart/options.py", line 185, in _parse_optional
      option = action.option_strings[0]
               ^^^^^^^^^^^^^^^^^^^^^
  AttributeError: 'tuple' object has no attribute 'option_strings'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...o-behavior-change-in-upstream-_parse.patch | 71 +++++++++++++++++++
 .../python3-pykickstart_3.48.bb               |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch b/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
new file mode 100644
index 0000000000..e2b34ab937
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
@@ -0,0 +1,71 @@
+From f753d4d6ad1f4846d14735beb3d1b157b9914b51 Mon Sep 17 00:00:00 2001
+From: Adam Williamson <awilliam@redhat.com>
+Date: Wed, 2 Oct 2024 09:48:39 -0700
+Subject: [PATCH] options: adjust to behavior change in upstream
+ _parse_optional
+
+In Python 3.13 and 3.12.7, the behavior of _parse_optional has
+changed. It used to raise an error on multiple matching actions
+itself, and only ever return None or an option tuple. Now the
+"raise error on multiple matching actions" code was moved out
+into consume_optional, and _parse_optional returns either None
+or a *list* of option tuples, which contains more than one if
+multiple actions match. See:
+
+https://github.com/python/cpython/pull/124631
+https://github.com/python/cpython/issues/58573
+
+This adapts to the change in a way that should work on both older
+and newer Pythons.
+
+Signed-off-by: Adam Williamson <awilliam@redhat.com>
+
+Upstream-Status: Backport [https://github.com/pykickstart/pykickstart/commit/f753d4d]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ pykickstart/options.py | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/pykickstart/options.py b/pykickstart/options.py
+index 2e3a0721..ca0e18af 100644
+--- a/pykickstart/options.py
++++ b/pykickstart/options.py
+@@ -177,9 +177,23 @@ class KSOptionParser(ArgumentParser):
+         self.lineno = None
+ 
+     def _parse_optional(self, arg_string):
+-        option_tuple = ArgumentParser._parse_optional(self, arg_string)
++        # Before 3.13 and 3.12.7, this returned None or a single
++        # option tuple. From 3.13 / 3.12.7 onwards it returns None
++        # or a *list* of option tuples
++        option_tuple_or_tuples = ArgumentParser._parse_optional(self, arg_string)
++        # all we want to do here is a custom warning if the action is
++        # deprecated. we can only safely do this if there's exactly
++        # one matching action
++        if isinstance(option_tuple_or_tuples, list):
++            if len(option_tuple_or_tuples) == 1:
++                option_tuple = option_tuple_or_tuples[0]
++            else:
++                return option_tuple_or_tuples
++        else:
++            option_tuple = option_tuple_or_tuples
++
+         if option_tuple is None or option_tuple[0] is None:
+-            return option_tuple
++            return option_tuple_or_tuples
+ 
+         action = option_tuple[0]
+         option = action.option_strings[0]
+@@ -191,7 +205,7 @@ class KSOptionParser(ArgumentParser):
+                             "kickstart. Please modify your kickstart file to remove this option.")
+                           % {"lineno": self.lineno, "option": option}, KickstartDeprecationWarning)
+ 
+-        return option_tuple
++        return option_tuple_or_tuples
+ 
+     def add_argument(self, *args, **kwargs):
+         if "introduced" in kwargs:
+-- 
+2.47.1
+
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index 953068f7c3..657d0df539 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
+           file://0005-options-adjust-to-behavior-change-in-upstream-_parse.patch \
            "
 SRCREV = "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
 
-- 
2.34.1



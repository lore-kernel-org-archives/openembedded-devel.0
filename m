Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43397C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 07:55:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.25613.1658735703842108017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 00:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QaT6lWyu;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4205e3d8d6=yue.tao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26P6jKMw010203
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 07:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=goGOfAQ1/eqQVBx9iFPssprjdE8YT2Nfeie4XLwZR5Y=;
 b=QaT6lWyu5S/OTCWomUt95rXFzH3gFmldY3oebijO5zmPC/gsYyKbftg1nERa6W8NluPk
 7HQ+uzl9FK36YwNWXYnyZfzR7/n78sr515oFS1LowSv5z54pmogfiKfXcVt0OUiPGTck
 ZzW7nJLqSkNlfZxt0Ip3o6/3YjsZHU7U3XNTmLrCrbB6cwBQEIt3euXRgQ+ls17h4kON
 AbKbba2auRJRnFA/EoYrZJY6A5uc3pUUlGh8fLPwG/PD+4V2Lzb3gVsZuPOVgFUKbQAq
 w5uksuciNlWrp1I3fndGqCPb7aDNnYeMGz0M8aXVws1WaQmQEiG8Qt5Yc/RqlgDkNjOX PQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg6719ebv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 07:55:01 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Jul 2022 00:55:00 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Jul 2022 00:55:00 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Jul 2022 00:54:59 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [meta-python][kirkstone][PATCH] python3-lxml: Security fix
 CVE-2022-2309
Date: Mon, 25 Jul 2022 15:54:57 +0800
Message-ID: <20220725075457.22479-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JO5hs4rUfRG7udTrtISbftiIf0ptf4d2
X-Proofpoint-GUID: JO5hs4rUfRG7udTrtISbftiIf0ptf4d2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=957 mlxscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Jul 2022 07:55:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97968

From: Yue Tao <Yue.Tao@windriver.com>

CVE-2022-0934:
lxml: NULL Pointer Dereference in lxml

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-2309

Patch from:
https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../python/python3-lxml/CVE-2022-2309.patch   | 99 +++++++++++++++++++
 .../python/python3-lxml_4.8.0.bb              |  3 +-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch

diff --git a/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
new file mode 100644
index 000000000..5ec55dfd2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
@@ -0,0 +1,99 @@
+From 86368e9cf70a0ad23cccd5ee32de847149af0c6f Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Fri, 1 Jul 2022 21:06:10 +0200
+Subject: [PATCH] Fix a crash when incorrect parser input occurs together with
+ usages of iterwalk() on trees generated by the same parser.
+
+CVE: CVE-2022-2309
+
+Upstream-Status: Backport
+[https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f]
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ src/lxml/apihelpers.pxi      |  7 ++++---
+ src/lxml/iterparse.pxi       | 11 ++++++-----
+ src/lxml/tests/test_etree.py | 20 ++++++++++++++++++++
+ 3 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/src/lxml/apihelpers.pxi b/src/lxml/apihelpers.pxi
+index c1662762..9fae9fb1 100644
+--- a/src/lxml/apihelpers.pxi
++++ b/src/lxml/apihelpers.pxi
+@@ -246,9 +246,10 @@ cdef dict _build_nsmap(xmlNode* c_node):
+     while c_node is not NULL and c_node.type == tree.XML_ELEMENT_NODE:
+         c_ns = c_node.nsDef
+         while c_ns is not NULL:
+-            prefix = funicodeOrNone(c_ns.prefix)
+-            if prefix not in nsmap:
+-                nsmap[prefix] = funicodeOrNone(c_ns.href)
++            if c_ns.prefix or c_ns.href:
++                prefix = funicodeOrNone(c_ns.prefix)
++                if prefix not in nsmap:
++                    nsmap[prefix] = funicodeOrNone(c_ns.href)
+             c_ns = c_ns.next
+         c_node = c_node.parent
+     return nsmap
+diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
+index 138c23a6..a7299da6 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -420,7 +420,7 @@ cdef int _countNsDefs(xmlNode* c_node):
+     count = 0
+     c_ns = c_node.nsDef
+     while c_ns is not NULL:
+-        count += 1
++        count += (c_ns.href is not NULL)
+         c_ns = c_ns.next
+     return count
+ 
+@@ -431,9 +431,10 @@ cdef int _appendStartNsEvents(xmlNode* c_node, list event_list) except -1:
+     count = 0
+     c_ns = c_node.nsDef
+     while c_ns is not NULL:
+-        ns_tuple = (funicode(c_ns.prefix) if c_ns.prefix is not NULL else '',
+-                    funicode(c_ns.href))
+-        event_list.append( (u"start-ns", ns_tuple) )
+-        count += 1
++        if c_ns.href:
++            ns_tuple = (funicodeOrEmpty(c_ns.prefix),
++                        funicode(c_ns.href))
++            event_list.append( (u"start-ns", ns_tuple) )
++            count += 1
+         c_ns = c_ns.next
+     return count
+diff --git a/src/lxml/tests/test_etree.py b/src/lxml/tests/test_etree.py
+index e5f08469..285313f6 100644
+--- a/src/lxml/tests/test_etree.py
++++ b/src/lxml/tests/test_etree.py
+@@ -1460,6 +1460,26 @@ class ETreeOnlyTestCase(HelperTestCase):
+             [1,2,1,4],
+             counts)
+ 
++    def test_walk_after_parse_failure(self):
++        # This used to be an issue because libxml2 can leak empty namespaces
++        # between failed parser runs.  iterwalk() failed to handle such a tree.
++        try:
++            etree.XML('''<anot xmlns="1">''')
++        except etree.XMLSyntaxError:
++            pass
++        else:
++            assert False, "invalid input did not fail to parse"
++
++        et = etree.XML('''<root>  </root>''')
++        try:
++            ns = next(etree.iterwalk(et, events=('start-ns',)))
++        except StopIteration:
++            # This would be the expected result, because there was no namespace
++            pass
++        else:
++            # This is a bug in libxml2
++            assert not ns, repr(ns)
++
+     def test_itertext_comment_pi(self):
+         # https://bugs.launchpad.net/lxml/+bug/1844674
+         XML = self.etree.XML
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
index c4d4df383..0c78d97ab 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
@@ -20,7 +20,8 @@ DEPENDS += "libxml2 libxslt"
 
 SRC_URI[sha256sum] = "f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23"
 
-SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI += "${PYPI_SRC_URI} \
+            file://CVE-2022-2309.patch "
 inherit pkgconfig pypi setuptools3
 
 # {standard input}: Assembler messages:
-- 
2.17.1



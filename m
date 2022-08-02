Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A82DC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 04:16:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.2460.1659413775125708650
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 21:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hpwPCnX9;
 spf=pass (domain: mvista.com, ip: 209.85.215.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id bf13so11333272pgb.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 21:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4oyunl/xnCVK084i1UTVYr7LMLQX7xFoM2o0ruRaq8=;
        b=hpwPCnX9J1jOOYcIXJRWtrus6ij67bor4B5paIvDPgjSyebElRNkAd8mTZeNNL9rch
         QJQg1lX873JVjWZdjzFCfgqDCAMzTFGJElWrdgYXJmuAY1yl3neKAzJRNU2E+tfY3dIk
         AyubJWHKgNHSUVGvPXRgh89XAFBxK4fcbwuQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4oyunl/xnCVK084i1UTVYr7LMLQX7xFoM2o0ruRaq8=;
        b=ic8ezPKniST6dv2mLj/hBoCUsecN5If3QAaa0HKcL3DTwjyX0Eb6KB6p5j/cpS+RKS
         eZ4kreC4DXfK+8pjxgrHBB/RbunnANCkqYfw0IrX7Thk8ZZiufJk1dczYo6OvXQMHLGk
         JGLROkjGrvJNShoQXlEdweqfGnD1U7QJUtvNq6whJ3FvlbN6PthpscnSLHLTur/s8imI
         46oD2dgySvqicav6maiXeKzuK3mV1bqGTEd2tg1enY8DFhsp/7dV5seLrVfZdqkaah7O
         YCU1Kfr6YWCE8FCskiLXsJ6jfWZLK3xBRiwiOnOBBfJHvqJeVv5097Kb0TgaKwkLxte2
         /lYA==
X-Gm-Message-State: AJIora9zSRN7EnYje1V+U5dGvdIdL2r+nSFH2XUBweAAbF1+Jur1EZIt
	X9LRDOLbDl3s0to3e0AJzxTUY749s2o30lOD
X-Google-Smtp-Source: 
 AGRyM1t+fNT1nCsS7NwJ34kEOdDiZoRPaAGQVCnwD3BrMkgkm4iQ+LukbKOksRoBPo7rA3cr9dugKA==
X-Received: by 2002:a65:498b:0:b0:412:8e4:2842 with SMTP id
 r11-20020a65498b000000b0041208e42842mr15713999pgs.71.1659413774265;
        Mon, 01 Aug 2022 21:16:14 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.182])
        by smtp.gmail.com with ESMTPSA id
 r18-20020aa79ed2000000b0052ad49292f0sm3654344pfq.48.2022.08.01.21.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 21:16:13 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 02 Aug 2022 09:46:08 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] python3-lxml: CVE-2022-2309 NULL Pointer Dereference
 allows attackers to cause a denial of service
Date: Tue,  2 Aug 2022 09:46:07 +0530
Message-Id: <20220802041607.5732-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 04:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98076

Source: https://github.com/lxml/lxml
MR: 119399
Type: Security Fix
Disposition: Backport from https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f
ChangeID: 0b1ef4ce4c901ef6574a83ecbe4c4b1d2ab24777
Description:
        CVE-2022-2309 libxml: NULL Pointer Dereference allows attackers to cause a denial of service.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../recipes-devtools/python/python-lxml.inc   |  2 +
 .../python/python3-lxml/CVE-2022-2309.patch   | 94 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 05b5eae462..0276a3e81a 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,6 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
+SRC_URI += "file://CVE-2022-2309.patch"
+
 SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
 SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
 
diff --git a/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
new file mode 100644
index 0000000000..ff3fcee6e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml/CVE-2022-2309.patch
@@ -0,0 +1,94 @@
+From ccbda4b0669f418b2f00c4f099733cebe633eb47 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 29 Jul 2022 10:16:59 +0530
+Subject: [PATCH] CVE-2022-2309
+
+Upstream-Status: Backport [https://github.com/lxml/lxml/commit/86368e9cf70a0ad23cccd5ee32de847149af0c6f]
+CVE: CVE-2022-2309
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lxml/apihelpers.pxi      |  7 ++++---
+ src/lxml/iterparse.pxi       | 11 ++++++-----
+ src/lxml/tests/test_etree.py | 20 ++++++++++++++++++++
+ 3 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/src/lxml/apihelpers.pxi b/src/lxml/apihelpers.pxi
+index 5eb3416..88a031d 100644
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
+index 4c20506..3da7485 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -419,7 +419,7 @@ cdef int _countNsDefs(xmlNode* c_node):
+     count = 0
+     c_ns = c_node.nsDef
+     while c_ns is not NULL:
+-        count += 1
++        count += (c_ns.href is not NULL)
+         c_ns = c_ns.next
+     return count
+ 
+@@ -430,9 +430,10 @@ cdef int _appendStartNsEvents(xmlNode* c_node, list event_list) except -1:
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
+index b997e4d..69e1bf1 100644
+--- a/src/lxml/tests/test_etree.py
++++ b/src/lxml/tests/test_etree.py
+@@ -1448,6 +1448,26 @@ class ETreeOnlyTestCase(HelperTestCase):
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
+2.25.1
+
-- 
2.25.1



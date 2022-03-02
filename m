Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE2CC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 23:06:47 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web10.4475.1646262406979673617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 15:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 7436528025C; Wed,  2 Mar 2022 15:08:43 -0800 (PST)
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 7A672280197
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 15:08:38 -0800 (PST)
Date: Wed, 2 Mar 2022 15:06:39 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] gyp: fix for compatibility with Python 3.10
 (part 2)
Message-ID: <20220302230639.GS661312@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 23:06:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95719

The patch for python 3.10 compatibility was missing an update to
'import' line.

Fixes the following problem encountered making use of gyp:

|   File "[...]/usr/lib/python3.10/site-packages/gyp/common.py", line 497, in <module>
|     class OrderedSet(collections.abc.MutableSet):
| AttributeError: module 'collections' has no attribute 'abc'

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
index 2b88023fe..184865440 100644
--- a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
+++ b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
@@ -14,6 +14,15 @@ diff --git a/pylib/gyp/common.py b/pylib/gyp/common.py
 index b268d229..4f9cb0ec 100644
 --- a/pylib/gyp/common.py
 +++ b/pylib/gyp/common.py
+@@ -4,7 +4,7 @@
+ 
+ from __future__ import with_statement
+ 
+-import collections
++import collections.abc
+ import errno
+ import filecmp
+ import os.path
 @@ -494,7 +494,7 @@ def uniquer(seq, idfun=None):
  
  
-- 
2.20.1



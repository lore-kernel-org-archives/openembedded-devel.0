Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 0B874707C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 00:14:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140723001444804
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 00:14:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [64.134.185.139] (port=58304 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X9kCc-0000vB-GX for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2014 20:14:38 -0400
Date: Tue, 22 Jul 2014 20:14:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407222013280.24982@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [meta-oe][PATCH] Correct spelling of "BBFILES_PRIORITY" in comments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 00:14:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 64a0a44..bfecb8c 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -4,7 +4,7 @@
 # search the directories from first to last as specified in BBPATH
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
 # the recipe contention so the order of directories in BBFILES does
 # not matter.

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2a5a428..9d7a60a 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -4,7 +4,7 @@
 # search the directories from first to last as specified in BBPATH
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
 # the recipe contention so the order of directories in BBFILES does
 # not matter.

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index f3fc45d..d8faf21 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -4,7 +4,7 @@
 # search the directories from first to last as specified in BBPATH
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
 # the recipe contention so the order of directories in BBFILES does
 # not matter.

diff --git a/toolchain-layer/conf/layer.conf b/toolchain-layer/conf/layer.conf
index ca81eb1..9289a8f 100644
--- a/toolchain-layer/conf/layer.conf
+++ b/toolchain-layer/conf/layer.conf
@@ -4,7 +4,7 @@
 # search the directories from first to last as specified in BBPATH
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
-# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# of BBPATH. For bblayers bitbake will use BBFILE_PRIORITY to resolve
 # the recipe contention so the order of directories in BBFILES does
 # not matter.


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



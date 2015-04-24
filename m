Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 74DB06E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:59:32 +0000 (UTC)
Received: by wizk4 with SMTP id k4so35696025wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=3YH/guSuWs5/PdozJ20SZhmex3GAe7uWURXsyh2/WT4=;
	b=tUEVrfOcKtPTa5JZEnAefC+nopHk1JvYUciB4IIHdISAUarp7OSxd9Am5Rp2J4FiyG
	JKlzhjr15uEPZBg8VUtSYJXq3mkALRVqX+45sMo2Fg1ar2JNpXcGLXhBCstDQGf4KaPb
	butsbb3j+Kn0Q7um06ElzQLmR2LV/gtr1jt+wlYnGZBtnymxVLfEZQiD0h7a7dboKa0L
	VIpVSs2jQWVD5IuAY29cuqqTqitmK0y+rlequyaSLMU4m2vZ4/mdE33pda/jGLfLeXyT
	m7hFSetLNxDv8KYMhuIWwuKSQmHGmkbSO+27slOJlWT4XEAEXyXkJEmpdVmS69RycXyg
	QtJw==
X-Received: by 10.194.237.34 with SMTP id uz2mr404826wjc.157.1429909173533;
	Fri, 24 Apr 2015 13:59:33 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id e2sm643447wij.5.2015.04.24.13.59.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 13:59:32 -0700 (PDT)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 23:59:15 +0300
Message-Id: <1429909159-8425-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-opie][PATCH 1/5] layer.conf: add layer dependencies
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
X-List-Received-Date: Fri, 24 Apr 2015 20:59:35 -0000

opie layer depends on oe-core, meta-oe and meta-networking. Add
respecive dependencies via LAYERDEPENDS.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0040434..f765ece 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -11,6 +11,10 @@ BBFILE_COLLECTIONS += "meta-opie"
 BBFILE_PATTERN_meta-opie := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-opie = "8"
 
+LAYERDEPENDS_meta-opie = "core"
+LAYERDEPENDS_meta-opie += "openembedded-layer"
+LAYERDEPENDS_meta-opie += "networking-layer"
+
 # Some basic definitions
 OPIE_GIT = "git://gitorious.org/opie/opie.git"
 
-- 
2.1.4



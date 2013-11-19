Return-Path: <daniel.mcdougall@liftoffsoftware.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A68D26CFF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 19:14:21 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id a41so3854098yho.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 11:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZmASTcIZkqRmDTliBPVBT4XLsVADGEaRMc4tbKi2hbg=;
	b=ihyh1aPWad4Ga70vfNcg2nMqYswtAZYQWeWatFGYvYU+Qg2LvMJMTnhCo+0JM+slvQ
	auo/i/BFTt8RwB3DAvJIya4jsWhTz9LnawB+SxYNLHOmRKsrNBE8Jppm9z8moZW13+kO
	4qbxAX56YVcrMrpbLwSwbBQ+iKckzVU7Rv8L57qSxXcGZkNHZTxFWfVyF4SzbiDjLlhb
	yTjSGFMklg5gLIdk2lgf2/ZeHFLHZq9SyT9k0WG3Hk0nqM1gcIVGqug0tiaioyqlQ79e
	EaS3IWyaHyLAnMisSXKKIVruivSHA+jMRlvBXnzLflUIwcOmJHygavE8gG7H+fz+bOP3
	w2qg==
X-Gm-Message-State: ALoCoQlgQSxjbCVZLViKn3K33YPxqoUmjqdgQpku6f81DK3KNRjdRJPV1Qre4NhSooowUejhqPA8
X-Received: by 10.236.173.164 with SMTP id v24mr27773yhl.155.1384888463060;
	Tue, 19 Nov 2013 11:14:23 -0800 (PST)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPSA id
	m68sm37358066yhj.22.2013.11.19.11.14.21 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 11:14:22 -0800 (PST)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2013 19:13:54 +0000
Message-Id: <1384888434-21526-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] python-pip: Fixed description in .bb file
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
X-List-Received-Date: Tue, 19 Nov 2013 19:14:22 -0000

The DESCRIPTION was the same as the Tornado package which is incorrect.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
index 7ab3bd8..76b8c67 100644
--- a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "A tool for installing and managing Python packages."
 LICENSE = "MIT & GPL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
 
-- 
1.8.1.2



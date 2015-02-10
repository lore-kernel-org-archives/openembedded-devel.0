Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 71BFC601A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 01:20:57 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id l13so20501509iga.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Feb 2015 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P/kAJUJVasGG+1Uijo2xIiP8LdgR8w5f4mBiN5l7QIc=;
	b=ms8pS4iUk+cGDLjFO6WVstid3Z9AyBXXjun5W1r19KHvkEzKeIYXwqrAsTSM2DPZLk
	3/BY1hXFGwE9XAHDCe5O30CD/14g8JF8tWlzx/4b2v2Mkk36VWt7ZiaMZ/fC8VKlWiPh
	iE4MrS4c+ArS3MXK+KFqQE6oxoZWgeWLi5VI/IJ216KoFVnGe68kIu2f38hxdexRp7r6
	bGB2/F6F9ytEtsDEM4SQHZJYhSxva0OglVlWQsEQsMsoOwKnD+GktbAFvF/sNEr1/Mx0
	YkE7xc7yjFwn8uCqUgSe21eGYIdLgKlSQmMbrkz/+kejbqVQUkmpbmHefX1raIkA1pDl
	3zUQ==
X-Received: by 10.50.30.202 with SMTP id u10mr20392572igh.35.1423531258266;
	Mon, 09 Feb 2015 17:20:58 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id 19sm7559522ioo.24.2015.02.09.17.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Feb 2015 17:20:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Feb 2015 17:20:47 -0800
Message-Id: <1423531247-14774-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] zram: remove bash dependency from init script
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
X-List-Received-Date: Tue, 10 Feb 2015 01:21:07 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-extended/zram/zram/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/zram/zram/init b/meta-oe/recipes-extended/zram/zram/init
index d126169..7b6cbf4 100644
--- a/meta-oe/recipes-extended/zram/zram/init
+++ b/meta-oe/recipes-extended/zram/zram/init
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides: zram
 # Required-Start:
@@ -26,7 +26,7 @@ start() {
     #default Factor % = 90 change this value here or create /etc/default/zram
     FACTOR=90
     #& put the above single line in /etc/default/zram with the value you want
-    [ -f /etc/default/zram ] && source /etc/default/zram || true
+    [ -f /etc/default/zram ] && . /etc/default/zram || true
     factor=$FACTOR # percentage
 
     # get the amount of memory in the machine
-- 
1.9.1



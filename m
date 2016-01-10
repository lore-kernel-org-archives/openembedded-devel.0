Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20527760A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:08 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yy13so23099814pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/LhiSo7J7nonMqKYO+aTmtWXqzVIBQMVrAW00v87L9s=;
	b=vtCiBhnhW3Kq9TXTmABSoyc573Edys2Lx8cuI/2hx99En7c93JBzfCSWzP/S0jKWVT
	kuPl4FCUzkIZmUJ3J8zZ+KLq3crgIOsbI3MfS2bSpsqVpExYgMWv5pB7JZarGbAqZVuI
	oaCT+Hob8/IS3x6QfI0j4+orJfEQIW1kSL5/RhhW6XisLlPkaTeoNUFqCf3By1LzA0lT
	n+5NWP6vR5mLiaS6xfcyfM2/M5Z3esp9k1iSoIEmV5++mS82C6e2qlCqWm244fymyr7Q
	vRgqCXdxJzrEvvqPWVEKkZXBHDOTWXU9cxBkO/rZIDUsokCywy49HIK5wcaKyCo9BsH6
	SkTA==
X-Received: by 10.67.6.1 with SMTP id cq1mr169159416pad.78.1452387609746;
	Sat, 09 Jan 2016 17:00:09 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	n84sm13755110pfa.45.2016.01.09.16.59.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 318CEFCC848; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:39 -0800
Message-Id: <492e14f4218845b2d045006d51c2d61d7be8399d.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 16/22] contrib: print oldline within single quotes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jan 2016 01:00:09 -0000

From: Jose Alarcon <jose.alarcon@ge.com>

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 7bb310d..db8a363 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -311,10 +311,10 @@ def follow_rule(i, line):
         # if the line still does not respect the rule
         if not rules[i][0](line):
             # this is a rule disgression
-            print ("## Disgression: ", rules[i][2], " in:", oldline)
+            print ("## Disgression: ", rules[i][2], " in: '", oldline, "'")
         else:
             # just remind user about his/her errors
-            print ("## Reminder: ", rules[i][2], " in :", oldline)
+            print ("## Reminder: ", rules[i][2], " in : '", oldline, "'")
     return line
 
 
-- 
1.9.1



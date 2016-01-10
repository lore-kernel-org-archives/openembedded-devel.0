Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE2E760AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:05 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e65so2226102pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=+AnFoUOF3nQuAk807/D5GBvmYyFib6TuC7CLZnAc3cw=;
	b=NA4Wq/A4BwsaBxskAqyIWQyyT3piKNAselnWdRgwq9G7qBXLeJel6xg0dkYZr9OMhG
	E2f+U8k1m6rDUZ3Mn7BEqQOSUOBOMRWPUjgDDgyUhBjLzLYPFUW48/SmrJz87CKSqX1u
	MR5JxzGLi/dScWRTgSxs3aHvGdJmRQrNvf+t0hd4GmgWgyAJ7Brj5cW92ipEEfGbeBW4
	19prTmVmY4uD74lQR+OypZRmXFwQIYWwsqLjNJqsmECpcouMJkZmG9bK4XCilREivwyL
	hTG8nIURHCrI2vxQ+VQYUOBW7kapZPR9UKA63Syi68G958HPuHlJDN+j4PgZ03uzY1nj
	1VdQ==
X-Received: by 10.98.93.24 with SMTP id r24mr11627062pfb.23.1452387606592;
	Sat, 09 Jan 2016 17:00:06 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	sv8sm176264980pab.13.2016.01.09.16.59.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 191CBFCC846; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:37 -0800
Message-Id: <b2340265ef16bfe667c89ccb62ad5042af6dcc5f.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 14/22] contrib: ensure that oe-stylize.py works with python versions < 3.0
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:05 -0000

From: Jose Alarcon <jose.alarcon@ge.com>

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 712557d..a2fcde1 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -19,6 +19,7 @@ TODO:
  - count rule breaks and displays them in the order frequence
 """
 
+from __future__ import print_function 
 import fileinput
 import string
 import re
-- 
1.9.1



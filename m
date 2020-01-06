Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 495867FCC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:50 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id b137so27085212pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sHHC5spCdMcHMA8SiX5GYtNvF19WVafzS8tfmK/YS/4=;
	b=nDwWasIQHKBsDXkp+zbSqo6Vmv8+4g/0EvF0YlE1GbZLGWoVfwHzASIPJG/+LfJDRk
	JIJL8J3TtWj8eqi2bArQZrz4f8Lwrn3MJg6xVIpQKcS+vFYT73k9TJ057l71f5ekGe80
	26D8KAkIAPaDl/61zyJ3bE99L/dAcngRgQF6DZzCSBUsqTr249WMTs6bk0d80oERXicx
	fTyco+W9jiGhb+J84h969mRtimTmCxbUwYQLSB3qAK48ehecmyvBcAyFiQ9zA0+PO8QE
	Ad/xOSpa1TPKZdyuUNOSz+ixgK3XGasGbruJ2tkwx4kCe7pNBZ7DDkK9JE44vOLRlHNq
	zwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sHHC5spCdMcHMA8SiX5GYtNvF19WVafzS8tfmK/YS/4=;
	b=pQyV7+vsKs5HMOHJgzx40PJVg1iDonqUdhjo9WD74lv6XFd6+c5h6r4kJ20QPkmcp0
	I2tICFuI1MT435fPeAI9JGU45SpS5j+ELUN/oFQYOI0ScCmGDUi7lpihoO8NURxYzkRb
	u+q5vF1VDxtZf/sEJoqZAalSgBDKaMKjvZI/wTonQJD0ua9IpY6uVjatrBXZ0h1eeh2A
	iEOfdGCMqQzxzLhv/l9xk3NBCXVCJSAqBa0OF1/aVphKmxBJZ4FfPHiHdAn4neDm+V3A
	S6vPqfd0XTTHK3WGcYN7q1wN9fKe7chWBpCGlJq5pFl/R2DIN3WQwcQt+px/HhRq/Op3
	liGA==
X-Gm-Message-State: APjAAAUljLZNOxaE8AdTqbeAkGQgO7Ak5jtTH7ma+ADHFQDuUGrIJaOU
	tBL2hiJF88DEjbJCDX/guvKQ+aqq
X-Google-Smtp-Source: APXvYqwfAeBBTa/yNtH3GqgG4CJfAEibiBUceDEorQ/W40g7O5ndrvO0WS7yjhz1F7wjcA5/g3MSZA==
X-Received: by 2002:aa7:9aeb:: with SMTP id y11mr112124177pfp.63.1578327651346;
	Mon, 06 Jan 2020 08:20:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:22 -0800
Message-Id: <57df7f191755dd887827d51b125d246c1af3e1b6.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 14/25] runqueue: Optimise task migration code slightly
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Move the calls to difference_update out a code level which improves efficiency
significantly.

Also further combine the outer loop for efficiency too.

These two changes remove a bottleneck from the performance charts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e28ec69356f1797de3e4e3fca0fef710bc4564de)
---
 lib/bb/runqueue.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 2ba4557f..6da612b7 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2268,15 +2268,16 @@ class RunQueueExecute:
 
         # Work out all tasks which depend upon these
         total = set()
+        next = set()
         for p in toprocess:
-            next = set(self.rqdata.runtaskentries[p].revdeps)
-            while next:
-                current = next.copy()
-                total = total | next
-                next = set()
-                for ntid in current:
-                    next |= self.rqdata.runtaskentries[ntid].revdeps
-                    next.difference_update(total)
+            next |= self.rqdata.runtaskentries[p].revdeps
+        while next:
+            current = next.copy()
+            total = total | next
+            next = set()
+            for ntid in current:
+                next |= self.rqdata.runtaskentries[ntid].revdeps
+            next.difference_update(total)
 
         # Now iterate those tasks in dependency order to regenerate their taskhash/unihash
         next = set()
-- 
2.17.1



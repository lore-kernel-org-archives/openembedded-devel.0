Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id A25707FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:49 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s64so27075248pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rlc1OF0Phsi+GUzKQVF5KBH54uMrUokL0zzu3ychQow=;
	b=prIdBdUr5bFhCYvM0HaJx0lXAAlxp52iFhilFPd9mxMBKVGTJ2Hod/4uabV8jhQVO7
	qapdwJuo896atNF0uOA7nw1E4B1kpMY/q2e/ptnVWStNjdmL3OwbIfdlm/La2CGHYm38
	vpDUl4bY+YgEa8G+kXSknHSLWkrYnx/EJUIOxCqPy8WzhoLY4cefg7qd2lLBifiN2gMI
	Jx9p+IrtgG/xbn7M4yp40ennRnsf7UBvAbRfFdH+oIKWPza4uJnkTRsBPg4q/tY/EQQ4
	KrpdAWAj7FSRwudGT0/KjQ2ryqBYs/3jhkQ9kv8P8ROKp9UOjfjtUGhV97NiuFuVfs/x
	choA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rlc1OF0Phsi+GUzKQVF5KBH54uMrUokL0zzu3ychQow=;
	b=UsSmw9leFUFxUwSzoee16Ep+sYPD8r7DTp05WKCpDjDZgLMpyMn+RSAUufzzHtEwU2
	3A5lvk9lpH88Ez/pLSwznAxK9T5v0HBETiM9GzW08+17RhQjt8TAEqb2I49GxqIktSiU
	2sJc4mhmLIcdM1kR1NT49+n9702SsdQ4auN0VjJnZNDCzUWoF6cP9x6OqpeNBBcwJoo9
	90Rtlyp/DzRdG6wwdiz5updGTgQNT+swEghliRSWzwmMK8wxUvJ3Cs4WCxhQTLgdsu9f
	sKQMlgX8WAtyjjyRPtO9GsQEVxcgbhdZWyXJaCUZO7oOj6L3inkAgoTXgcKIgFsVRrFU
	nVYg==
X-Gm-Message-State: APjAAAX7Sioa0F0gbIM3B7rbVth1dvHlCmZf/nBNt78JSHDTxZdBkoIo
	JAP1BMa1BRNWn4xBmBmMIQfs/Lpl
X-Google-Smtp-Source: APXvYqzqSuhJ1zl+hbYSugGFf5uMGy0N62yBxV0N5OycnxkK/oPocohzOT8Vjeocl73rL1rHl6O+9Q==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr110038472pfn.62.1578327650510;
	Mon, 06 Jan 2020 08:20:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:21 -0800
Message-Id: <a80024a4397485f96693c4df108b40f6b1bdf32b.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 13/25] runqueue: Fix sstate task iteration performance
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Creating a new sorted list of sstate tasks each iteration through runqueue is
extremely ineffecient and was compounded by the recent change from a list to set.

Create one sorted list instead of recreating it each time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de18824996841c3f35f54ff5ad12f94f6dc20d88)
---
 lib/bb/runqueue.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 515e9d43..2ba4557f 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -1965,10 +1965,14 @@ class RunQueueExecute:
         self.rq.read_workers()
         self.process_possible_migrations()
 
+        if not hasattr(self, "sorted_setscene_tids"):
+            # Don't want to sort this set every execution
+            self.sorted_setscene_tids = sorted(self.rqdata.runq_setscene_tids)
+
         task = None
         if not self.sqdone and self.can_start_task():
             # Find the next setscene to run
-            for nexttask in sorted(self.rqdata.runq_setscene_tids):
+            for nexttask in self.sorted_setscene_tids:
                 if nexttask in self.sq_buildable and nexttask not in self.sq_running and self.sqdata.stamps[nexttask] not in self.build_stamps.values():
                     if nexttask not in self.sqdata.unskippable and len(self.sqdata.sq_revdeps[nexttask]) > 0 and self.sqdata.sq_revdeps[nexttask].issubset(self.scenequeue_covered) and self.check_dependencies(nexttask, self.sqdata.sq_revdeps[nexttask]):
                         if nexttask not in self.rqdata.target_tids:
-- 
2.17.1



Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 93CAC7FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:43 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bg7so7963867pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nRRdQRKmh9ijSCjVPXxTOLx9VYr3CQs/WC+XIihr5XM=;
	b=jC1ozM8yDdwEzV4EmNXAQaCB3vdZF1hCdUw/CPMhZFHM8OwOUB67/JyDcwZ99Pc4fL
	uNTxr2sNSrWzWGjD/FfehzTM7rRGhPls3eLHN3xt3ewPZ2WC9+vVgpWAIXy/yjPEb2CQ
	T6R5A61+6n8oxYvzkDTurUhdRLnZelNLey2MokQmjWfNO7OVT9UhB5WMhTXlJjWh8olt
	LLs/vb1HK3YR7hSNXZEHQEemuzWvGtZACOUsvHRv7i3bOinbgDfkWWmiKoKGlTJJa4ag
	q6FQTwco62W2jAxhM6d48xz+zQGGB3Govjt3o/sMh7zyALFC53EZqiDJiU5uQ+Mvi3qm
	w2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nRRdQRKmh9ijSCjVPXxTOLx9VYr3CQs/WC+XIihr5XM=;
	b=Z1v86q5/1qC+NAvLQRV9fd+uhEi9YO/KByrSGtvyH8Sls+DGTuFUkQ8gEST5bTz+fR
	Icqu4lRj+4i9KE13adk4Ps0ntfPrbNSGMtI8caaFxcQeVw3sZWtjM28FRwNmPcAtlDv9
	nZGUiHt/5NXCDV53DAXYJltc3JfzoySDZO1H970SUXmyoZnm+933E/N1X8OThJN4o4Qt
	RbFMHcEoonNiMHx3TFhgyhkZqFltl8pvxO3dVxpLqB50TKiiDpCn0jvI0koP20UY2eKv
	lndX6fXhyAQgWLUgeP4abGRR3EMfTsZamJ2mii4L/MZZNyV0ZCDowPLYQGkbkbtJoGSe
	j0BA==
X-Gm-Message-State: APjAAAVzVr4sOz1XLs1X/6sm5VF6GBYYTQLDD7Ex4W5kAuP9vwDRpIZu
	9ULGDiJQ8eAzptWDnqhH6EjUxjsS
X-Google-Smtp-Source: APXvYqzbfjVGPuCwHVyM1oRSonJM4cpHkGDxbekpkW56/7GdfT1qF2HMpi5cC1jiLA4FoBL7e+uJOw==
X-Received: by 2002:a17:902:a706:: with SMTP id
	w6mr103880468plq.79.1578327644552; 
	Mon, 06 Jan 2020 08:20:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:15 -0800
Message-Id: <a7426c73a8e9fae468414a2c32a533d9c3729405.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 07/25] runqueue: Batch scenequeue updates
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:43 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Batch all updates to scenequeue data together in a single invocation
instead of checking each task serially. This allows the checks for
sstate object to happen in parallel, and also makes sure the log
statement only happens once (per set of rehashes).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db033a8f8a276d864bdb2e1eef159ab5794a0658)
---
 lib/bb/runqueue.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 246a9cdb..cb499a1c 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2320,6 +2320,7 @@ class RunQueueExecute:
             if tid not in self.pending_migrations:
                 self.pending_migrations.add(tid)
 
+        update_tasks = []
         for tid in self.pending_migrations.copy():
             if tid in self.runq_running or tid in self.sq_live:
                 # Too late, task already running, not much we can do now
@@ -2379,11 +2380,13 @@ class RunQueueExecute:
             if tid in self.build_stamps:
                 del self.build_stamps[tid]
 
-            origvalid = False
-            if tid in self.sqdata.valid:
-                origvalid = True
+            update_tasks.append((tid, harddepfail, tid in self.sqdata.valid))
+
+        if update_tasks:
             self.sqdone = False
-            update_scenequeue_data([tid], self.sqdata, self.rqdata, self.rq, self.cooker, self.stampcache, self, summary=False)
+            update_scenequeue_data([t[0] for t in update_tasks], self.sqdata, self.rqdata, self.rq, self.cooker, self.stampcache, self, summary=False)
+
+        for (tid, harddepfail, origvalid) in update_tasks:
             if tid in self.sqdata.valid and not origvalid:
                 logger.info("Setscene task %s became valid" % tid)
             if harddepfail:
-- 
2.17.1



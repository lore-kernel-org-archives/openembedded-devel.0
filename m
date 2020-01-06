Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD517FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:59 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id q127so27098035pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rg2aUlKmyk1Wq73V3NdktdULv2/Nq/lk0pdlVAb/jXg=;
	b=R1J7mNUgaqIaooNztAhYbL3aBPdkhItoGuJzh1eJrYo4qSwD8X0ON8sFt41FdXvtaw
	kn4C4VpjEZepjUBd8tU/hWcuaB+DjdsLzdSQUOUEISNdT0fd1dzeevrP0VWc0Oaw6zWu
	KwHsRg5GbL/N91lZ42phU2yIds7oTgRtxNlMerficP8hp3LggKYmWfJ3zBmezg57YmlU
	AYwRhUSn8cGO5Z8YTkDgmj9mPBRC2INzlg3+97abbogSWCo1NR/kmp/irk43nIqdHHjG
	fpx3tw6wEHl9mJoD8KG8LGk9nUBqSiIL87a4r739h0Sv0reRx5LbS0Cjjw1Zr/aS0nZ0
	nvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rg2aUlKmyk1Wq73V3NdktdULv2/Nq/lk0pdlVAb/jXg=;
	b=BSBXsDFkDMEbrpXZO0rBzH69Z3TW4wfxfSGX+0JV21O/BBLeED5o9AHDIX853A1ogM
	KM1V2VP3cEMdzuTaIWgGv7o6+LzIjtpDLRjkgK9JYGbwTtmi8JonmZ9bqrakA1bjK5we
	9oOTUw00VRcEF0v6etjtqle5T6QzpII2iQCucXju5YTSHIO1igQMnYgfhyzy98aMAP6T
	eSeX9AZlDw0FFAlZLfOsBJbQsfy3BjzpCRhXZFadGjmF15DXpv32FWbXCm8n54p2+Kp4
	StG2bkMHHZwyToirbfuiOc6K6uPdSeulJBfNXPND30IvHRB9FhsbYJLFfdmfwNrwia6U
	U9aA==
X-Gm-Message-State: APjAAAXe+PkOmMy81bvI1kSPARbp8gdPwKUhmlzUNOPoSe4LCRUr+si9
	ayyCR7doideqhmmAIxepDM4SLPuP
X-Google-Smtp-Source: APXvYqx/0G6nD10NqK1EHd1piU8StSFIMPsAounaFIo2dJnkduYeu4ClI54/wRAdpaeX1GIVXUT7xg==
X-Received: by 2002:a63:b005:: with SMTP id h5mr108498213pgf.67.1578327660533; 
	Mon, 06 Jan 2020 08:21:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:21:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:31 -0800
Message-Id: <39cc4930676970b2e51b99a778f5d5d9b5259991.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 23/25] runqueue: Fix task dependency corner case in sanity test
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:59 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A corner case was identified where tasks with valid stamps from previous
builds need to be accounted for in the new sanity test in the migration
code. Add a variable to track such completed tasks to ensure the sanity
test works correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d517b1ef13ca7ab2fb4d761d3bd3b9fb7c591514)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/bb/runqueue.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 56ca2529..6e3a91b8 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -1708,6 +1708,7 @@ class RunQueueExecute:
         self.runq_buildable = set()
         self.runq_running = set()
         self.runq_complete = set()
+        self.runq_tasksrun = set()
 
         self.build_stamps = {}
         self.build_stamps2 = []
@@ -1893,6 +1894,7 @@ class RunQueueExecute:
         self.stats.taskCompleted()
         bb.event.fire(runQueueTaskCompleted(task, self.stats, self.rq), self.cfgData)
         self.task_completeoutright(task)
+        self.runq_tasksrun.add(task)
 
     def task_fail(self, task, exitcode):
         """
@@ -2092,6 +2094,7 @@ class RunQueueExecute:
                 logger.debug(2, "Stamp current task %s", task)
 
                 self.task_skip(task, "existing")
+                self.runq_tasksrun.add(task)
                 return True
 
             taskdep = self.rqdata.dataCaches[mc].task_deps[taskfn]
@@ -2353,7 +2356,7 @@ class RunQueueExecute:
             if tid in self.tasks_scenequeue_done:
                 self.tasks_scenequeue_done.remove(tid)
             for dep in self.sqdata.sq_covered_tasks[tid]:
-                if dep in self.runq_complete:
+                if dep in self.runq_complete and dep not in self.runq_tasksrun:
                     bb.error("Task %s marked as completed but now needing to rerun? Aborting build." % dep)
                     self.failed_tids.append(tid)
                     self.rq.state = runQueueCleanUp
-- 
2.17.1



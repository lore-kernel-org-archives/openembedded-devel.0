Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id BA7A27FCDD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:58 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id z16so27189244pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=llXd6aAwYHSZBYXhHIeDmAte9+8AzMM7Vh5eFaUubpI=;
	b=R1V81xy7qXnD1N/daGzgOXbKjBFYwuCaTWZOuqYCdq40viGF3EadQzkkPHJk0j0PGT
	Y6t1EuyWDdXuLAh0nexOMdZKHUQCrWA5+aZGyCz0bVW5RDF7TUqMZGQSZOh9F4xWiOa4
	pHXhwZqMqRCg9e39IG4KnSURDtNIq1p9r3vRg8YpJ9kgDNVx5sdstcS1DxQTXZ9rwTwI
	6Vx9ompqZdxIegvMIEltWKzWHGAI68ysRxJ4WI1Za8auc/uc/hDlHw7KCY5yc0PhUpfV
	mz5TXshfjyMTk/xu6I/OaPBYZ10UJy4FRtWeI2TCiODOdb9+4igmwmRXU22C+BlSVQ2Z
	IuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=llXd6aAwYHSZBYXhHIeDmAte9+8AzMM7Vh5eFaUubpI=;
	b=NQtM/aI8R9miQL8xoAsTzlNFAmAm5KeW8icZZFMqf+LzNBimp5s8fTuT78FBkxbq5g
	D2R2+RlxLbG/QUg5CJRI7v+mJwmCOXbO03cvLz9ABSo7D0yZhWS3WRQ1m25ZHh96WIyk
	8Bfq010ZBYJNfePH+wcdiBG9etKExfodOJPG52ftsig7+O07JfImYrPugDdIKy047FbQ
	nHXTTLP/B7TpSwMLzJBHfzk4ErTM/xyjTMpJI9ZGqY1XiFKyG/T9Rnf4VUWExqkP7sEq
	Mu+rC+t9yl10r3fRuWFk6oWke/IT+fiIVWPhBVGIvBjqTh/aAa53j5+sDNw+FnGptuuz
	tu4w==
X-Gm-Message-State: APjAAAXVQTqN1IAAIWVbyvt5ULyIWyFRaYEqBA0rDTPLSSKq93EqSf4j
	XcLwQxytqFpiONf8Ae0P4p4dawIu
X-Google-Smtp-Source: APXvYqzRsKgxh8Lg38SApcMmG+RmUqllxPhU+0YZdeG9/2ait3Aop2kuW9PBS76YUQi2atuQVghAQg==
X-Received: by 2002:a63:fd10:: with SMTP id
	d16mr109988003pgh.177.1578327659530; 
	Mon, 06 Jan 2020 08:20:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:30 -0800
Message-Id: <182b2ae7bab4a943978154be3a65c018aaf21fdc.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 22/25] runqueue: Ensure task dependencies are run correctly
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

We've seen a number of mystery failures where task B would run despite
task A, its dependency not having run. An example would be do_compile
when do_unpack didn't run.

This has been tracked down to this code block. In theory it shouldn't
trigger however it can and has due to bugs elsewhere. When it does, it
causes significant weird failures and possible build corruption.

Change the code to abort the build. This avoids any chance of corruption
and should ensure the issues get reported, putting an end to the weird
build failures.

There may be some cases where this triggers and it shouldn't, we'll work
through those as they arise and are identified.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a92b7f58ab187eddfe550bd6fb687240c7b11bb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/bb/runqueue.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index f8279980..56ca2529 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2353,6 +2353,12 @@ class RunQueueExecute:
             if tid in self.tasks_scenequeue_done:
                 self.tasks_scenequeue_done.remove(tid)
             for dep in self.sqdata.sq_covered_tasks[tid]:
+                if dep in self.runq_complete:
+                    bb.error("Task %s marked as completed but now needing to rerun? Aborting build." % dep)
+                    self.failed_tids.append(tid)
+                    self.rq.state = runQueueCleanUp
+                    return
+
                 if dep not in self.runq_complete:
                     if dep in self.tasks_scenequeue_done and dep not in self.sqdata.unskippable:
                         self.tasks_scenequeue_done.remove(dep)
-- 
2.17.1



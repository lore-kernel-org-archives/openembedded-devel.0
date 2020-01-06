Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 32EE17FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id a6so21298430plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0ViN4eew048vW/phfY2G2OZGq0yL+x9DncJgy3Y4PCk=;
	b=ts1DRX9rOGI6hwWxBwnY9GSfvJt310OBy/IuTdrT82i8U9un9w7NgZTnEFLgXWJNLm
	bgWUyJiEoc/gJHiEFoN09gmxapAvLd6ItMy840pfvz/zwzapqYmFO9bnJonfl3c+Qjnj
	YTyH1va/KZkDDo4PDl2PStnUlweLcK+xc0Al4LJhJ70B72C+DjsPsko5zhhCSO76ZL1+
	86P2uBsnc+/nc6qx/+vaqtpzqjndkY3ed2/KnTu4dc+tK65mjPzZ7ZqnCJQY35ZlS08i
	cVMAOheZQ1mVUdilndGB3zJN6XWrBF6NMt8W5JFZ6nbhBZFPrVz434Dt+L4VmT9TFO8F
	1bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0ViN4eew048vW/phfY2G2OZGq0yL+x9DncJgy3Y4PCk=;
	b=dVvv+IRF5E7PEFIvfugBKbMARiT7ar22su0CycHxZfrSwdTVNoTmTJHghwV3qMNpdS
	YNxwWuJHqRTKKCbJrbp3/hU1T1W8qMk2jLkoXZDotQaozDwWTCCpFLcoXQJdoKMRrI0S
	GZnGYRSavdiRN7ROWtOmxchdyAHrX9HH8Do75uGZpxNV/kg1igIDRRuOQMOb5n/mIzwR
	sR4HplZm4VGvR4EXK4NhAye1XOnrrHofmt/mikzNNd0gIt32poKV41b+bCTCTzEsLzfS
	Jziro4hwOBnLZxntHJhzLW4hLDfR6xPlfpMlQUYccjUdOQ+/p0xjH150kSiOdZ+sRqKT
	0Dow==
X-Gm-Message-State: APjAAAXzFeEbKtiW/NbUXX0mTxZmB9gCwyQalETi096q/wynE0GdW7/5
	ZMERtzTi8VNc/mLwMehmtGGpgn1L
X-Google-Smtp-Source: APXvYqyT6wlWPg9tRa+nOgCeqofw9R6a+XODH0kuNyyDmoZi4oSgqUKbaBLX72p74+G5VmjZNH/fPQ==
X-Received: by 2002:a17:902:a503:: with SMTP id
	s3mr101612336plq.274.1578327653049; 
	Mon, 06 Jan 2020 08:20:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:24 -0800
Message-Id: <7fa3ede953971f761d8cafafa37d1bcb65ad6a77.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 16/25] runqueue: Optimise task filtering
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:52 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We were seeing this running thousands of times with hashequiv, do
the filtering where it makes more sense and make it persist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2cfeb9998a8ad5b1dcda0bb4e192c5e4306dab17)
---
 lib/bb/runqueue.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 73775d97..b90ac875 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -148,8 +148,9 @@ class RunQueueScheduler(object):
         """
         Return the id of the first task we find that is buildable
         """
+        # Once tasks are running we don't need to worry about them again
+        self.buildable.difference_update(self.rq.runq_running)
         buildable = set(self.buildable)
-        buildable.difference_update(self.rq.runq_running)
         buildable.difference_update(self.rq.holdoff_tasks)
         buildable.intersection_update(self.rq.tasks_covered | self.rq.tasks_notcovered)
         if not buildable:
@@ -207,8 +208,6 @@ class RunQueueScheduler(object):
 
     def newbuildable(self, task):
         self.buildable.add(task)
-        # Once tasks are running we don't need to worry about them again
-        self.buildable.difference_update(self.rq.runq_running)
 
     def removebuildable(self, task):
         self.buildable.remove(task)
-- 
2.17.1



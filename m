Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id BE7507FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 4so27166610pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=egtj2JNCgGA1/P6JWQPprbElBWgo/PQYNInZEE79R5Y=;
	b=a4RN3cR3Ye7k8LpHVg8EB23J2tXM5QjXcY7/C3otO9QVHGcPC8hTSeLsqLJBEyeywa
	xiQM0QCqBuOKIe5WZYLx/t6qDnq2LljjDptGRcMCZuNgUhM6A2jfncCCeg4LQwiiPrOY
	zZSzDjxzbhs+bEUVRV0YJiOwbLe4fd4rB1nOmS7of6ZjlohgtaZacT0vCkme44ae8Qdy
	eklqp8Nx9wNqJVlJ/jru72zBjRiflFFfnUnx3yGADEeEqq8Uk3Fp9s0zTWteYnWwzAUM
	gSV1VJQmdvuTnRpjXS8d8xeLYjvtiy31Me3ghr1xlWe1j2h20XlrMrmM41q/o3h2JZZh
	R5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=egtj2JNCgGA1/P6JWQPprbElBWgo/PQYNInZEE79R5Y=;
	b=T+CRnAwvMbVJ8IYEY9xAljrGc+nQbYsUVUDwZUuniDGs7ZWy1lEsNUBJwi6kCFgB1b
	FcuyPa6K6inivjUstOpyg/rcXzTaYx7EwZvWEO6qt4n8qj4e6FPNCZSfmY6ZHiEZPzq2
	EBWMggGSho7JfNmIzTbsoxvdlbkLdgstJMSblvLU+V+OhawNw3KC5yAH2vW6QJWOSBwa
	bRCzqEHy0iqORnn8p7SErcD4JvaG1d6SVtM1vz0XA42SuSDNNh70SYFf8KCLMARbqNcE
	LpcllABEfKsSXewQUwo52FfGPL7JoOG/TMQ6GQ/bthBN+KdDM01kktG7mLOqWhoaA7fQ
	xPwg==
X-Gm-Message-State: APjAAAWtquQHgnykPKX8x22fnKRa7yUs6Nb8Omysvw0Qhajzg/d5zk6t
	y8icJ6Qlnt/14WYr7tObotrB4ULN
X-Google-Smtp-Source: APXvYqzvRv+s/qkkq0fP25+FIsj21wNaSdybNjjFpXFVARyyiaHtq2F3WxzM53wxLQkAEQtYOzIupg==
X-Received: by 2002:a63:d157:: with SMTP id
	c23mr111653857pgj.242.1578327647592; 
	Mon, 06 Jan 2020 08:20:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:18 -0800
Message-Id: <c9ab598f6f1ea3ae3a0713dc6692b4c4bafbfb50.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 10/25] runqueue: Rework process_possible_migrations() to improve performance
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:46 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The looping over multiple changed hashes causes many calls to get_taskhash
and get_unihash which are potentially slow and then overwritten.

Instead, batch up all the tasks which have changed unihashes and then
do one big loop over the changed tasks rather than each in turn.

This makes worlds of difference to the performance graphs and should speed
up build where many tasks are being rehashed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9c68d898985cf0bec6fc95f54c151cc50255cac)
---
 lib/bb/runqueue.py | 103 ++++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 47 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index cb499a1c..a45b27ce 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2248,6 +2248,7 @@ class RunQueueExecute:
     def process_possible_migrations(self):
 
         changed = set()
+        toprocess = set()
         for tid, unihash in self.updated_taskhash_queue.copy():
             if tid in self.runq_running and tid not in self.runq_complete:
                 continue
@@ -2258,53 +2259,61 @@ class RunQueueExecute:
                 logger.info("Task %s unihash changed to %s" % (tid, unihash))
                 self.rqdata.runtaskentries[tid].unihash = unihash
                 bb.parse.siggen.set_unihash(tid, unihash)
-
-                # Work out all tasks which depend on this one
-                total = set()
-                next = set(self.rqdata.runtaskentries[tid].revdeps)
-                while next:
-                    current = next.copy()
-                    total = total |next
-                    next = set()
-                    for ntid in current:
-                        next |= self.rqdata.runtaskentries[ntid].revdeps
-                        next.difference_update(total)
-
-                # Now iterate those tasks in dependency order to regenerate their taskhash/unihash
-                done = set()
-                next = set(self.rqdata.runtaskentries[tid].revdeps)
-                while next:
-                    current = next.copy()
-                    next = set()
-                    for tid in current:
-                        if not self.rqdata.runtaskentries[tid].depends.isdisjoint(total):
-                            continue
-                        procdep = []
-                        for dep in self.rqdata.runtaskentries[tid].depends:
-                            procdep.append(dep)
-                        orighash = self.rqdata.runtaskentries[tid].hash
-                        newhash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
-                        origuni = self.rqdata.runtaskentries[tid].unihash
-                        newuni = bb.parse.siggen.get_unihash(tid)
-                        # FIXME, need to check it can come from sstate at all for determinism?
-                        remapped = False
-                        if newuni == origuni:
-                            # Nothing to do, we match, skip code below
-                            remapped = True
-                        elif tid in self.scenequeue_covered or tid in self.sq_live:
-                            # Already ran this setscene task or it running. Report the new taskhash
-                            remapped = bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
-                            logger.info("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
-
-                        if not remapped:
-                            logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, newhash, origuni, newuni))
-                            self.rqdata.runtaskentries[tid].hash = newhash
-                            self.rqdata.runtaskentries[tid].unihash = newuni
-                            changed.add(tid)
-
-                        next |= self.rqdata.runtaskentries[tid].revdeps
-                        total.remove(tid)
-                        next.intersection_update(total)
+                toprocess.add(tid)
+
+        # Work out all tasks which depend upon these
+        total = set()
+        for p in toprocess:
+            next = set(self.rqdata.runtaskentries[p].revdeps)
+            while next:
+                current = next.copy()
+                total = total | next
+                next = set()
+                for ntid in current:
+                    next |= self.rqdata.runtaskentries[ntid].revdeps
+                    next.difference_update(total)
+
+        # Now iterate those tasks in dependency order to regenerate their taskhash/unihash
+        next = set()
+        for p in total:
+            if len(self.rqdata.runtaskentries[p].depends) == 0:
+                next.add(p)
+            elif self.rqdata.runtaskentries[p].depends.isdisjoint(total):
+                next.add(p)
+
+        # When an item doesn't have dependencies in total, we can process it. Drop items from total when handled
+        while next:
+            current = next.copy()
+            next = set()
+            for tid in current:
+                if not self.rqdata.runtaskentries[tid].depends.isdisjoint(total):
+                    continue
+                procdep = []
+                for dep in self.rqdata.runtaskentries[tid].depends:
+                    procdep.append(dep)
+                orighash = self.rqdata.runtaskentries[tid].hash
+                newhash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
+                origuni = self.rqdata.runtaskentries[tid].unihash
+                newuni = bb.parse.siggen.get_unihash(tid)
+                # FIXME, need to check it can come from sstate at all for determinism?
+                remapped = False
+                if newuni == origuni:
+                    # Nothing to do, we match, skip code below
+                    remapped = True
+                elif tid in self.scenequeue_covered or tid in self.sq_live:
+                    # Already ran this setscene task or it running. Report the new taskhash
+                    remapped = bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
+                    logger.info("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
+
+                if not remapped:
+                    #logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, newhash, origuni, newuni))
+                    self.rqdata.runtaskentries[tid].hash = newhash
+                    self.rqdata.runtaskentries[tid].unihash = newuni
+                    changed.add(tid)
+
+                next |= self.rqdata.runtaskentries[tid].revdeps
+                total.remove(tid)
+                next.intersection_update(total)
 
         if changed:
             for mc in self.rq.worker:
-- 
2.17.1



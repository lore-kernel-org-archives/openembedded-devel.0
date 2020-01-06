Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A40B37FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:48 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q127so27097836pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fKX7d5X/cvw+75ZMjBFcuvTYPTHQ86Z8fEA7fwiH1bg=;
	b=qRM1uGBgOcZpjxCZIF9epbWh450mLJDb7lmb4nZMb1Z0YHAZ7FvxWsjZ1g9rzC78RQ
	Fyu355EZuHPo8ei9ZPAeu4WH6TbVh3xJsdrPkOJVQMXEH58Vcxs/L0y5aW7GGEvkDm9c
	AuXtOKKq0cV+BWDgCAaJFNiEjV18fZOzX4udo6B1i0eizGHe1Uzf2Kyi6ZhMqO84u7d0
	9msIqZjBwOITEJyIlMOFQLasNRLa8OIWqMiQZ9IRNorc23cWBQo6zfPfM7byXWO7tgsK
	t4ANVllnNsCepegg0Id7YcocIsY6Bq6EAC1Efid2aL4RmOOYvctsSTLnf6LA1P0kezC7
	eSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fKX7d5X/cvw+75ZMjBFcuvTYPTHQ86Z8fEA7fwiH1bg=;
	b=mKvJb3Yd/+3hUwOXZcpvE1rLuEtsGOVrTLvJEh3ttHKwLj0qaY0DAL3sTFg4TDUXBb
	1Ej1YMpc2Lirxd1Vzru7iIg9aiIhhmLup6aftw6DGJlf5aWo/vFEduWuC8iex3s1F2YP
	krftu6x27PrVQqbyQ1Iu2hQruhWs45IIWPeRtpesl7fvgSgmPScGI8jcGTByNq3iybwa
	5dNkhTAFDJwORNghDzTC1/aHpS30wKliqtHkDBquDWsqETwqKhEdJcEDTS97bo4bfH2i
	Ou3pC1Hv2NABfs9HCMxxQZmDe4SxE0gAu/Lm6KZLA6D+kD+WKQdTL948vREzFSZGyjs3
	23Rw==
X-Gm-Message-State: APjAAAWLz58MNyAZmZCjjlar6iJ643lVZrf9EtpXXGiCYhTruEB8Pe0q
	wAZVB+SOYQfaMij/hI/+a2XRdi/W
X-Google-Smtp-Source: APXvYqzfleBXnTbtVGLEeVp8GwXBGwVCPHoVmQ/AzKgNjhzHpyGgXfnx5VTtmd91CikraTLr9J4SIg==
X-Received: by 2002:a65:4203:: with SMTP id c3mr110600228pgq.368.1578327649564;
	Mon, 06 Jan 2020 08:20:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:20 -0800
Message-Id: <c4ce216b4c5a1626764752edd21005750d05a0c2.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 12/25] siggen: Split get_tashhash for performance
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are two operations happening in get_taskhash, the building of the
underlying data and the calculation of the hash.

Split these into two funtions since the preparation part doesn't need
to rerun when unihash changes, only the calculation does.

This split allows sigificant performance improvements for hashequiv
in builds where many hashes are equivalent and many hashes are changing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a32af2808d748819f4af55c443578c8a63062b3)
---
 lib/bb/runqueue.py |  1 +
 lib/bb/siggen.py   | 33 ++++++++++++++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index b3648ddb..515e9d43 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -1185,6 +1185,7 @@ class RunQueueData:
         procdep = []
         for dep in self.runtaskentries[tid].depends:
             procdep.append(dep)
+        bb.parse.siggen.prep_taskhash(tid, procdep, self.dataCaches[mc_from_tid(tid)])
         self.runtaskentries[tid].hash = bb.parse.siggen.get_taskhash(tid, procdep, self.dataCaches[mc_from_tid(tid)])
         self.runtaskentries[tid].unihash = bb.parse.siggen.get_unihash(tid)
 
diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index 2fec8599..e484e5e3 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -52,6 +52,9 @@ class SignatureGenerator(object):
     def get_unihash(self, tid):
         return self.taskhash[tid]
 
+    def prep_taskhash(self, tid, deps, dataCache):
+        return
+
     def get_taskhash(self, tid, deps, dataCache):
         self.taskhash[tid] = hashlib.sha256(tid.encode("utf-8")).hexdigest()
         return self.taskhash[tid]
@@ -198,12 +201,11 @@ class SignatureGeneratorBasic(SignatureGenerator):
             pass
         return taint
 
-    def get_taskhash(self, tid, deps, dataCache):
+    def prep_taskhash(self, tid, deps, dataCache):
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
-        data = dataCache.basetaskhash[tid]
-        self.basehash[tid] = data
+        self.basehash[tid] = dataCache.basetaskhash[tid]
         self.runtaskdeps[tid] = []
         self.file_checksum_values[tid] = []
         recipename = dataCache.pkg_fn[fn]
@@ -216,7 +218,6 @@ class SignatureGeneratorBasic(SignatureGenerator):
                 continue
             if dep not in self.taskhash:
                 bb.fatal("%s is not in taskhash, caller isn't calling in dependency order?" % dep)
-            data = data + self.get_unihash(dep)
             self.runtaskdeps[tid].append(dep)
 
         if task in dataCache.file_checksums[fn]:
@@ -226,27 +227,41 @@ class SignatureGeneratorBasic(SignatureGenerator):
                 checksums = bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task], recipename)
             for (f,cs) in checksums:
                 self.file_checksum_values[tid].append((f,cs))
-                if cs:
-                    data = data + cs
 
         taskdep = dataCache.task_deps[fn]
         if 'nostamp' in taskdep and task in taskdep['nostamp']:
             # Nostamp tasks need an implicit taint so that they force any dependent tasks to run
             if tid in self.taints and self.taints[tid].startswith("nostamp:"):
                 # Don't reset taint value upon every call
-                data = data + self.taints[tid][8:]
+                pass
             else:
                 import uuid
                 taint = str(uuid.uuid4())
-                data = data + taint
                 self.taints[tid] = "nostamp:" + taint
 
         taint = self.read_taint(fn, task, dataCache.stamp[fn])
         if taint:
-            data = data + taint
             self.taints[tid] = taint
             logger.warning("%s is tainted from a forced run" % tid)
 
+        return
+
+    def get_taskhash(self, tid, deps, dataCache):
+
+        data = self.basehash[tid]
+        for dep in self.runtaskdeps[tid]:
+            data = data + self.get_unihash(dep)
+
+        for (f, cs) in self.file_checksum_values[tid]:
+            if cs:
+                data = data + cs
+
+        if tid in self.taints:
+            if self.taints[tid].startswith("nostamp:"):
+                data = data + self.taints[tid][8:]
+            else:
+                data = data + self.taints[tid]
+
         h = hashlib.sha256(data.encode("utf-8")).hexdigest()
         self.taskhash[tid] = h
         #d.setVar("BB_TASKHASH_task-%s" % task, taskhash[task])
-- 
2.17.1



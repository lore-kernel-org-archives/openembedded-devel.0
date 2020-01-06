Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC257FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:38 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r11so27109906pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k9ZyNUuiC36uAN/Sng+356HGD2srYnobKKWY+SqLtBg=;
	b=AuxykZ73rtV6fRPcGZMC0KNQVbH0PcwmFHhrvq255tUzJ6jqVW9FsiPHyuageiuS8w
	1vxohnthjjfpj+/H32Q77yL7BY8xkD+medpO/2ibCWZO+gYFi8ciRZhst35TnMsmPo/W
	xFwkvfXJ6v9OPZaesTC5Mbdxy8Ihn4/Yro+whNogtFO6pBx9raiU8Cj6uEzF2mVIAl7X
	hTVvQsTNlVfvDOkjilbi23axFiMyTFlJDg5//c8acr4v0D1W45F5WfnRTWewroGm+6Ul
	YPwiyDNew66PDHuobNgc1OWGDIhD1r5S1YCCyyhE1yCpiJ8fIyDf7Cm8bzGwNUcTHfmw
	cDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k9ZyNUuiC36uAN/Sng+356HGD2srYnobKKWY+SqLtBg=;
	b=nqFkbh671Uj2kN4wylyA4Zt2r7+60YbyNziO7+fWT5jbv9fPeGKiA6LBGhgP8pMHb8
	PhRX/ul1+kQWfFCwMiTMcXv8cNeSZQsxAzF+kI+mL50EdTggnSCeOzFLDpGl+kYaUGRo
	vFdlVX6lq0gNcNaGwATZrHEaW1KXUJUwITPaWM7udWU6gIr3EJ/YB2vkO58pah7fURzS
	5PmdGgsxhbfmur+m92pYiPrCCcmLPdUX2CxmYmb1u5LQ2v+97mlP7qZbPvGquOCy5sVf
	HlfSv3lHIHa8ai+wTULuwwDUeVDQle5Bsoa9WxV2rafo5E96/TqdZ7wDFccMlSau//Wc
	MM7A==
X-Gm-Message-State: APjAAAWPj7I0KO3+lenvHquQMz/vsTcofSgUf2w5vDyTEggJsykXj1lc
	zPOWkiGM1NZczAOb4tV+cY9SzRQW
X-Google-Smtp-Source: APXvYqx8QIkcnSr6BLwm++yco68ZwwIKH/isYVWWX8GvanczXTMZR8yVeG0OR90lqRKPQo3K8UfegQ==
X-Received: by 2002:a65:4d46:: with SMTP id j6mr113997633pgt.63.1578327639439; 
	Mon, 06 Jan 2020 08:20:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:10 -0800
Message-Id: <222df6d6b832868c6e87334f8acdd74b730a91d6.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 02/25] runqueue/siggen: Allow handling of equivalent hashes
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Based on the hashserv's new ability to accept hash mappings, update runqueue
to use this through a helper function in siggen.

This addresses problems with meta-extsdk-toolchain and its dependency on
gdb-cross which caused errors when building eSDK. See the previous commit
for more details.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39098b4ba2133f4d9229a0aa4fcf4c3e1291286a)
---
 lib/bb/runqueue.py | 31 +++++++++++++++++++------------
 lib/bb/siggen.py   | 26 ++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index bd7f03f9..a869ba52 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2283,12 +2283,26 @@ class RunQueueExecute:
                         for dep in self.rqdata.runtaskentries[tid].depends:
                             procdep.append(dep)
                         orighash = self.rqdata.runtaskentries[tid].hash
-                        self.rqdata.runtaskentries[tid].hash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
+                        newhash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
                         origuni = self.rqdata.runtaskentries[tid].unihash
-                        self.rqdata.runtaskentries[tid].unihash = bb.parse.siggen.get_unihash(tid)
-                        logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, self.rqdata.runtaskentries[tid].hash, origuni, self.rqdata.runtaskentries[tid].unihash))
+                        newuni = bb.parse.siggen.get_unihash(tid)
+                        # FIXME, need to check it can come from sstate at all for determinism?
+                        remapped = False
+                        if newuni == origuni:
+                            # Nothing to do, we match, skip code below
+                            remapped = True
+                        elif tid in self.scenequeue_covered or tid in self.sq_live:
+                            # Already ran this setscene task or it running. Report the new taskhash
+                            remapped = bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
+                            logger.info("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
+
+                        if not remapped:
+                            logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, newhash, origuni, newuni))
+                            self.rqdata.runtaskentries[tid].hash = newhash
+                            self.rqdata.runtaskentries[tid].unihash = newuni
+                            changed.add(tid)
+
                         next |= self.rqdata.runtaskentries[tid].revdeps
-                        changed.add(tid)
                         total.remove(tid)
                         next.intersection_update(total)
 
@@ -2307,18 +2321,11 @@ class RunQueueExecute:
                 self.pending_migrations.add(tid)
 
         for tid in self.pending_migrations.copy():
-            if tid in self.runq_running:
+            if tid in self.runq_running or tid in self.sq_live:
                 # Too late, task already running, not much we can do now
                 self.pending_migrations.remove(tid)
                 continue
 
-            if tid in self.scenequeue_covered or tid in self.sq_live:
-                # Already ran this setscene task or it running
-                # Potentially risky, should we report this hash as a match?
-                logger.info("Already covered setscene for %s so ignoring rehash" % (tid))
-                self.pending_migrations.remove(tid)
-                continue
-
             valid = True
             # Check no tasks this covers are running
             for dep in self.sqdata.sq_covered_tasks[tid]:
diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index e19812b1..edf10105 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -525,6 +525,32 @@ class SignatureGeneratorUniHashMixIn(object):
                 except OSError:
                     pass
 
+    def report_unihash_equiv(self, tid, taskhash, wanted_unihash, current_unihash, datacaches):
+        try:
+            extra_data = {}
+            data = self.client().report_unihash_equiv(taskhash, self.method, wanted_unihash, extra_data)
+            bb.note('Reported task %s as unihash %s to %s (%s)' % (tid, wanted_unihash, self.server, str(data)))
+
+            if data is None:
+                bb.warn("Server unable to handle unihash report")
+                return False
+
+            finalunihash = data['unihash']
+
+            if finalunihash == current_unihash:
+                bb.note('Task %s unihash %s unchanged by server' % (tid, finalunihash))
+            elif finalunihash == wanted_unihash:
+                bb.note('Task %s unihash changed %s -> %s as wanted' % (tid, current_unihash, finalunihash))
+                self.set_unihash(tid, finalunihash)
+                return True
+            else:
+                # TODO: What to do here?
+                bb.note('Task %s unihash reported as unwanted hash %s' % (tid, finalunihash))
+
+        except hashserv.client.HashConnectionError as e:
+            bb.warn('Error contacting Hash Equivalence Server %s: %s' % (self.server, str(e)))
+
+        return False
 
 #
 # Dummy class used for bitbake-selftest
-- 
2.17.1



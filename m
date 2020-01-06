Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 51CA07FCB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:51 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c23so22033181plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=paei4CsarOQgVjzqiWvlqV27K2XKAO4q3wav2K/ryz8=;
	b=N0k0PqSv8GXGIKLx+sW+E2tSAGpjJuNXQqdePCGepk/tKHWvXPvKwP0Da/62uuHv0G
	mHXdNiB3+Rh+aXwzfewRcy1hdT4j+zy9hF+/Ip3SOgmzcZGzOg6bjtSKC62oNFRjH5wG
	txe59vQrgTJmUmzzcDuZOttcK1J61o68+2AwJW8wsxyFS9fgsbelq/pMGC/xi84evC6Y
	YDUK8dXQUarfel8NCRa3pHDJHVPTn2UoSGXVbSzrURj5mGy/jlodZcg26NCVTl5CnHub
	lBkfyh7FFgxLdiTqfe+Ll9H1JfQnVM4t36B1ydJ8zuKvsKZSLsrcaj4OtmlADK4DAd71
	57AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=paei4CsarOQgVjzqiWvlqV27K2XKAO4q3wav2K/ryz8=;
	b=EfCwBJnYeVnysHukaxuTU45iJ4Fp9ZQrAPLCsKHOD84JJznIARFASVXvVVhw4UmVq3
	TjeYqBJwyr32nJ/scAt/39oTDX3P0Xlf9kqtVtj8ibJFjd6n4HyeRDFkycHuV76F0ocf
	0Qz8VPEmBAeskVT6sqTyuGI/ryvAchK0ToWqyF1THtR2nGDIGBCV1X2nsH10AJlq4kYK
	qtoepHBn+cb3kHk7cF0N6ItSE0jXJVPWR774Or+7qkI+qzVnJ5m2BlwfNDpqeSFD/juE
	jTGnrqPG5b94GHjl3IOeZqnck4g+35QPcz9YzNSe8w+ggEHvI6+4+B/y0wz04DscpSak
	LXBA==
X-Gm-Message-State: APjAAAVfz13u5LrqobWNIlQF3I5HQxFnVquLEoirArUc+4OUxEJ5cSAV
	P2lDFSHz5f7FpbvCSi7MSNQP7iZC
X-Google-Smtp-Source: APXvYqxaWoYGQh+zeEruxtrSgqRM4GnYOO+JfWJD/6VLweKWzCPgG+2XU3VhJXgh3mCJo7kfUC2thw==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
	z15mr44362032pjt.131.1578327652335; 
	Mon, 06 Jan 2020 08:20:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:23 -0800
Message-Id: <14babbf0a32637db640e0494b0331397dcb0f715.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 15/25] runqueue: Optimise out pointless loop iteration
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:51 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 105d1f0748edde7753a4063e6fdc758ffc8a8a9e)
---
 lib/bb/runqueue.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 6da612b7..73775d97 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -1182,11 +1182,8 @@ class RunQueueData:
         return len(self.runtaskentries)
 
     def prepare_task_hash(self, tid):
-        procdep = []
-        for dep in self.runtaskentries[tid].depends:
-            procdep.append(dep)
-        bb.parse.siggen.prep_taskhash(tid, procdep, self.dataCaches[mc_from_tid(tid)])
-        self.runtaskentries[tid].hash = bb.parse.siggen.get_taskhash(tid, procdep, self.dataCaches[mc_from_tid(tid)])
+        bb.parse.siggen.prep_taskhash(tid, self.runtaskentries[tid].depends, self.dataCaches[mc_from_tid(tid)])
+        self.runtaskentries[tid].hash = bb.parse.siggen.get_taskhash(tid, self.runtaskentries[tid].depends, self.dataCaches[mc_from_tid(tid)])
         self.runtaskentries[tid].unihash = bb.parse.siggen.get_unihash(tid)
 
     def dump_data(self):
@@ -2294,11 +2291,8 @@ class RunQueueExecute:
             for tid in current:
                 if len(self.rqdata.runtaskentries[p].depends) and not self.rqdata.runtaskentries[tid].depends.isdisjoint(total):
                     continue
-                procdep = []
-                for dep in self.rqdata.runtaskentries[tid].depends:
-                    procdep.append(dep)
                 orighash = self.rqdata.runtaskentries[tid].hash
-                newhash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
+                newhash = bb.parse.siggen.get_taskhash(tid, self.rqdata.runtaskentries[tid].depends, self.rqdata.dataCaches[mc_from_tid(tid)])
                 origuni = self.rqdata.runtaskentries[tid].unihash
                 newuni = bb.parse.siggen.get_unihash(tid)
                 # FIXME, need to check it can come from sstate at all for determinism?
-- 
2.17.1



Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4E87FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:39 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a33so27086983pgm.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wDhez4FOQrjDQe/uissBn+DwjmpfDNLJAdRh1VG2LLw=;
	b=qiXj1f6dT7vz0S031d9c02EzFYfEpzPNKcbLPSU9KvX+hngM2vYXcw6rLZbyu7Zmee
	Yysy+8PBUrgbicH8zGEtgxB9SHshaSxGERSdjuTt2qePW59Nsbko1Ha9SszyTBfe0K3t
	e8m1JISYTmXVAr5EATYqk66rYm5S5lqck2kJYXFaLrVS27FalnATMrc/JoispOrWp4jv
	iwhRmR2sqw6NVB6Trh2wM3QhUwTCUGlpV/e9II1Rp2YAv2uA47AXIR0vxzFJShoiNIbA
	hLy+SfNplzGyj+TFkjAvktq+DPaDeQ0QYqteCgPiky/9nbrvJ0bwYE1dsSnJXX9Stnw6
	kH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wDhez4FOQrjDQe/uissBn+DwjmpfDNLJAdRh1VG2LLw=;
	b=p/0axfLsQgLoPigXxMDAJRxhii+3oUMEsuySUja3l+QZfGaP/ywjWCiXzJjEpbZDSH
	SkDGa/8qT5EGCjEshlPxrMvKH7FxXQukpffFJCupRXBDLKe5Y4jUAOE1ftjjR9kaaCY6
	krbZMRbAMHEbJDeaIZUO7N5P39KfmUzrtcfHDAL8hC0jkJ7qok9jDHIWg5/glXt92ul8
	GiWEgmB+/TjcV8hGYCHvSa0MxyhZXWsFpHeQMHnNQTn8Vavtn2UDLeePIQY51QdwITHN
	ICx5VKGtf36jFhq3xp5LUbvKeP/gWkltTACN7vUYqnox3S2qtrPr7y5Gl62W5LMk9ubS
	fN5A==
X-Gm-Message-State: APjAAAUX/rdqIy7vzYiMZns783n2wIyjAtTRMo8JxMiykPY9zPfLVwsA
	Xn8W+tUqF+p311TsCmIu47dpsZNn
X-Google-Smtp-Source: APXvYqx0tnUb7WXf/qq3U/g8Rs6//3RQnsoqTYfHF/46x6JHxNT/GKTqC1vom3Z1RDS8JAn0rVhooA==
X-Received: by 2002:a63:c652:: with SMTP id
	x18mr112412147pgg.211.1578327640415; 
	Mon, 06 Jan 2020 08:20:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:11 -0800
Message-Id: <6f0b82627edc82601f80f0f096bf96db43afefa8.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 03/25] runqueue: Add extra debugging when locked sigs mismatches occur
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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3aad9978be2a40d4c535a5ae092f374ba2a5f627)
---
 lib/bb/runqueue.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index a869ba52..246a9cdb 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2524,6 +2524,8 @@ class RunQueueExecute:
                 msg = 'Task %s.%s attempted to execute unexpectedly and should have been setscened' % (pn, taskname)
             else:
                 msg = 'Task %s.%s attempted to execute unexpectedly' % (pn, taskname)
+            for t in self.scenequeue_notcovered:
+                msg = msg + "\nTask %s, unihash %s, taskhash %s" % (t, self.rqdata.runtaskentries[t].unihash, self.rqdata.runtaskentries[t].hash)
             logger.error(msg + '\nThis is usually due to missing setscene tasks. Those missing in this build were: %s' % pprint.pformat(self.scenequeue_notcovered))
             return True
         return False
-- 
2.17.1



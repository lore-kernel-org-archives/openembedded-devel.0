Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id B017A7FC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:41 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i23so21755982pfo.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yJENfPE4I8gLB+2D2ASqpt9NY2UteBRBavTqjS3xgl4=;
	b=SZaMTW+EnGGGYeAmb05QXoTjX/wy2xoRE/WY1hPiEo/3Sak9I5xlHmNfmDB2JY5+y3
	4++9oC/znXDWnR+tSbcggsjtHBoXdffiaz9z1QA3IsyppTlSehJbUgzY7oCAN4fhtfxq
	abxsvQd5+L3+ckoD1+sfsx+DcmSLs//1qFSP/KzOp+zlcrul6EcIZ7IEFaOg4IEy4TPZ
	Xh83KOtQVq2fq8k+JwtSz7LPqOC5LLgaI8m+TnBPbS+XgnUapU+T6yo0cfTJvaK/sBdj
	lmxZqNZGgGl+uKl+V1BmWRTZNUtLALGjYCWTQPb98SIQQM5kSWyTXL1Vsz/udQXAY77+
	BKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yJENfPE4I8gLB+2D2ASqpt9NY2UteBRBavTqjS3xgl4=;
	b=Upwdcu2hiedQrn4bgXmQrV8thO3VF4sfRqJEt+aRxFesu2iOl4vYeAmDyTwbDHFzSS
	Qq7wumG1oQ81U2oXL6UB15ss915WTIQg8nzy+uUPBFKOWPj2ywBBffH2WmESoH33ZszJ
	K3gKB2auN9LdF0HO6NEBklFyTXIkdO0bD8ZxNe1aIpbxmg8pCVaEEw8uXYPlEdNT1oEr
	uuvE8fO+vhN59jKOb9nemSgBb2sbu0BFqHcWImWbCbJLkZOm0/e8leVsmMcK/CFUxhNu
	Qk/Q4DXPMJkMA4oY0pnUamlZMRpDrUKuuhrzBjPXfZ1YAjDHvrDPtw2aobAXvpju5EU3
	h2Ig==
X-Gm-Message-State: APjAAAUL1pGQ74v3OYaJBHoxRftgemcjAu+TR1Ka1dT/voygH9FY2jVn
	TVlxPmSQyxHCMqc1nlIxgRYzPoRp
X-Google-Smtp-Source: APXvYqwSI4n/XYhkYPVWwkMoRr2lH3P5PNsXeV5Nf2wpH/gJ9J7QesODxrNWB40B4bbwzwQHfJrhNw==
X-Received: by 2002:a62:cece:: with SMTP id y197mr112890407pfg.9.1578327642721;
	Mon, 06 Jan 2020 08:20:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:13 -0800
Message-Id: <c42d00ff293d0538cad1b84c108bf7f5f49d4d84.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 05/25] siggen: Avoid taskhash mismatch errors for nostamp tasks when dependencies rehash
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

An example:

NOTE: recipe binutils-cross-testsuite-2.32.0-r0: task do_check: Started
ERROR: Taskhash mismatch b074da4334aff8aa06572e7a8725c941fa6b08de4ce714a65a90c0c0b680abea versus 17375278daed609a7129769b74a1336a37bdef14b534ae85189ccc033a9f2db4 for /home/pokybuild/yocto-worker/qemux86-64/build/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb:do_check
NOTE: recipe binutils-cross-testsuite-2.32.0-r0: task do_check: Succeeded

Is caused by a rehash in a dependency happening somewhere earlier in the build
and the taint being reset.

Change the code so that nostamp taints are preserved to avoid the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61624a3fc38e8546e01356d5ce7a09f21e7094ab)
---
 lib/bb/siggen.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index edf10105..de853268 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -232,10 +232,14 @@ class SignatureGeneratorBasic(SignatureGenerator):
         taskdep = dataCache.task_deps[fn]
         if 'nostamp' in taskdep and task in taskdep['nostamp']:
             # Nostamp tasks need an implicit taint so that they force any dependent tasks to run
-            import uuid
-            taint = str(uuid.uuid4())
-            data = data + taint
-            self.taints[tid] = "nostamp:" + taint
+            if tid in self.taints and self.taints[tid].startswith("nostamp:"):
+                # Don't reset taint value upon every call
+                data = data + self.taints[tid][8:]
+            else:
+                import uuid
+                taint = str(uuid.uuid4())
+                data = data + taint
+                self.taints[tid] = "nostamp:" + taint
 
         taint = self.read_taint(fn, task, dataCache.stamp[fn])
         if taint:
-- 
2.17.1



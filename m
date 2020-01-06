Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id CB76D7FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:57 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b22so22020229pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IvhnibPf7wk7NMAZFV7DWk1mZ2+rPRNABc7gaTRrVq8=;
	b=DADYfMiD/BJWg/o8CX2zIuiV2jHuCm0um85OyVnhlOobvLsXo7JGPLw3+QQtuVxytw
	i/4Xmm74x7oqawJQhYwsY94QHyqLfoRY7SAdXr2LDjttJbgljT97KbwZKaROLI/t8L8h
	Zf9fxgXX5XpqX0LcwcqYtO/EeAVHQaf0C4tzfqmZkvm60xsmBjPOuaT3fgDDRTBLbhgY
	BCcYkT2awXPcqehXr0ZCMH05v/NQPTAnCat7uhOz66xi5bgChayIH8f1htZ6AA7h7R4J
	905gYhIEio8cTyCriYG6a0/RGcajQ6qq20ELpEMJb/IyQ9xeEAPaXXj66smPOs2fY29/
	Np3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IvhnibPf7wk7NMAZFV7DWk1mZ2+rPRNABc7gaTRrVq8=;
	b=cJHfjF3LD8lHpdfXdlF/UGyAjSoPZfV9+adBjNk9Eb0i5UU/9ceyoktYam6bt/mUPU
	OhdwSdtP99Gv3Ts2EeiXcuXTxQzh7Rn7YLWgpK1vSbTzyzRRiEfq08apLLNzcMDqmLsc
	ob10Tbi/rw+vmMAv8x5CtKStJcX9QZCB+gseWMysKWx8iTfyUiu108k5sEOWpgEdta+P
	Xo720ze4TfZz9rsw7cNpmbBijQkYueYfXcZ/SPv5GCa4CZr+xKPKDK+v4egpDk3Zzds0
	o1PMG5QJHZtBxyS2GMKP/CQZpqKakM0w8vcApNskK3nRxwBo+paccKUru7gEyL2Dya8P
	fFpg==
X-Gm-Message-State: APjAAAXt/yKOp1mrNuV++wNSYaPGAk4fP6BFtyLj+8H3Pp7POQxm/Xby
	ua34EIJQrEu9gab6lM3XvXuMJzxD
X-Google-Smtp-Source: APXvYqyGtdD0w1Y/2D6ArF9Y6WoEerzw+9hT7or9IBF3UL2OVR8hwCTHTZOC82Q/YaPvlvU/R3JoOQ==
X-Received: by 2002:a17:902:26a:: with SMTP id
	97mr12387504plc.74.1578327658589; 
	Mon, 06 Jan 2020 08:20:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:29 -0800
Message-Id: <10058fe590c56ee3b4d2136b6e247c2d29ae47e6.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 21/25] runqueue: Fix equiv hash handling build failures
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Regardless of whether we remapped the hash on the server or not, we need
to have bitbake work as if we did as we need to match how the stamp files
look.

This change resolves build failures where tasks were rerunning when they
shouldn't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40928f6991436cf687821015324483b205abfcb1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/bb/runqueue.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index 729439ef..f8279980 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2302,8 +2302,9 @@ class RunQueueExecute:
                     remapped = True
                 elif tid in self.scenequeue_covered or tid in self.sq_live:
                     # Already ran this setscene task or it running. Report the new taskhash
-                    remapped = bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
+                    bb.parse.siggen.report_unihash_equiv(tid, newhash, origuni, newuni, self.rqdata.dataCaches)
                     logger.info("Already covered setscene for %s so ignoring rehash (remap)" % (tid))
+                    remapped = True
 
                 if not remapped:
                     #logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, newhash, origuni, newuni))
-- 
2.17.1



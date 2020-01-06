Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 87F147FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:44 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id x8so27081643pgk.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S2V9pTvvMwwDjaApifsadvDyNlY9W74XCGwyO6ZgOjQ=;
	b=LHuuZHyBmk0S//CFWOzlM2Bzm/bKxWaXVvKYzJs9/XJVW1FEikuLiAcBhiRkgHem8k
	AepWQ9/XxDqIF+0v7kBLQwKisDZB5H+cwIqpQf89X5TAkYzCVJC7yiefQpC2ui1LYTVQ
	ZrW/hoYMf6sECSjgYFi+OQ106WznTZEtTCo8tUPM5D3mvoZVt8d3J7mamlLYjZDUMYKs
	Hnz6lf/SguNpPTuK01PVvJCqAPHbdn8LXrOg7CRJljK/xFHYIkCoK3FKqeNRWwxK+pxB
	rUkD3oO7wzPe0MQJXa6n2uHKSqp2zHP8y50gH63EvyTL9hN0jBAVWPEufuZjFVe3G0/a
	7CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S2V9pTvvMwwDjaApifsadvDyNlY9W74XCGwyO6ZgOjQ=;
	b=I+tgJKm/icKopHMsOVmfOz0TK0VgZt+mDjb4hzehjHn853Ls6lceBFoxAS7JX9Pdgq
	Xo24FLbNe/JvLfVTDydFXYdlMCYZIpALjZAQFFaS8Th5LYjHt6SPaRFK2NbnuQJB0bJq
	GaV1CUM09ftbeO9T7GUrYkGm7CYFkoC+99lDzbw1hbsqfEZcpnCyfMu0CfegrD4e+QkT
	G6Kzl3H1cg0XjuNhBm6X1DLrGUazVaWMVH1UCLlrXi7w1D3M4L3PqiVhX3UKP3nizPJO
	aI3xWL0mjXKWm4YYIFskx6hk07+ZjpbcvKDocNHGgsL5R2k8xRdGb+fgWrc8WxNZtt8v
	O73g==
X-Gm-Message-State: APjAAAVovcu5gmFqH1RRx4l7jV8zcAR+ebUtzrQoFJjZfyFnKs0tobw3
	SvzmBwHNJpfPQaHbk2l/L3eBzgHF
X-Google-Smtp-Source: APXvYqwx5i3f/UVl2hsX4jUbRDtQA21/TVfklt+S2CszLMDXvSEUhvreeVx5QYgP9WvSJhFj4czK8A==
X-Received: by 2002:aa7:8088:: with SMTP id v8mr110712922pff.142.1578327645506;
	Mon, 06 Jan 2020 08:20:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:16 -0800
Message-Id: <5afad266f2ce55db2038c36f2e49a3c80be9bbfc.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 08/25] siggen: Fix performance issue in get_unihash
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:45 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is a significant performance issue in get_unihash(). The issue turns out
to be the lookups of setscene tasks. We can fix this by using a set() instead of
the current list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e561672d039ebfb8cd0e0654a44dcf48513317c)
---
 lib/bb/siggen.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index dbf51023..2fec8599 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -44,7 +44,7 @@ class SignatureGenerator(object):
         self.file_checksum_values = {}
         self.taints = {}
         self.unitaskhashes = {}
-        self.setscenetasks = {}
+        self.setscenetasks = set()
 
     def finalise(self, fn, d, varient):
         return
@@ -110,7 +110,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
         self.taints = {}
         self.gendeps = {}
         self.lookupcache = {}
-        self.setscenetasks = {}
+        self.setscenetasks = set()
         self.basewhitelist = set((data.getVar("BB_HASHBASE_WHITELIST") or "").split())
         self.taskwhitelist = None
         self.init_rundepcheck(data)
@@ -157,7 +157,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
         return taskdeps
 
     def set_setscene_tasks(self, setscene_tasks):
-        self.setscenetasks = setscene_tasks
+        self.setscenetasks = set(setscene_tasks)
 
     def finalise(self, fn, d, variant):
 
-- 
2.17.1



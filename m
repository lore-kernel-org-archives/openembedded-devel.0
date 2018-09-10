Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5713D796CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:43:02 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id o18-v6so22586550wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uWKeWu3UhaKWoclGC70JWd9DHzZaHl4R9wlw1I5DLDU=;
	b=vJGD3w4dP661dscv2vwgcFTN6EbK4+6x6VcsiRw7gvxLxLi3TZc1LBVlm0Angse8X7
	GJkRLoBx2X7T467xEq10XOtQPBeqmQIQDJjzfOY1y7XUm4zDl3g6F7XDwvCZ7FWonV3d
	f+BKXv9gWFKcXvDaOOmlLudH8kqvpIwdnAgSVZq7burgtKJ7RN1pbGLqPIzKnHc923P4
	dN9H+M4US+n747JsukXTLfPEnp9mAEcPvx66XSXkBIV35yX3XjG3Lhp+xBe5utKSWOwr
	JGxW+dWIEbOIigTr7LAn23VwITeOWeeZpHkM5rvFzGY8FiYbhG7PHvIqzCC+cPwzX9SZ
	iozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uWKeWu3UhaKWoclGC70JWd9DHzZaHl4R9wlw1I5DLDU=;
	b=f2SKF7viA3kCQeiZZVmi+fNaaQ7CkUTeAv6qksAvhIMsVr1dXG+cQbtRfi56V1H89x
	BsKWApFD7Nbysh+PBEAQ9dPrj9HSRNOIigUm5TlBUbDAJitk3mZKeCrkyVhtT244Boeg
	ldCE5ASRBfpa2pwP50/hk9gpI2spsXZFllPuzxxfDdsD3XeVLzGCorxDnxqiirnxo2e0
	nuLarQ2lgIkML+jxuzDpGYy9jsIxWzvDZRcjZEGwdE60xi+sZoJ+4qzlEQqW04F4p+Ge
	//Oqcfbz3kWyvd5KP8iwIinUbhn70Vu5wKjuPrMwAJyiDXDSKBo+mK/SodU9ls/rVgc8
	cdDw==
X-Gm-Message-State: APzg51BaFPb6YZLwsuEqFfjgu00f2OVaz7RRxuB9JsAFPO8YYINOzBa2
	SsdoT5eL3s8oGRhhcE3+uYRenc+T
X-Google-Smtp-Source: ANB0Vdax6BQjzEI4R9H3AFrUUTqy/VZHZ+u9iiQMDfPSLU3AYjkpZXoWLWfsjz8OpM8JuCTiBBJL/g==
X-Received: by 2002:a1c:85cb:: with SMTP id
	h194-v6mr1728249wmd.54.1536604982808; 
	Mon, 10 Sep 2018 11:43:02 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r66-v6sm31409566wmb.37.2018.09.10.11.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 11:43:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 18:43:04 +0000
Message-Id: <20180910184304.8068-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
References: <CA+chaQcY0TXd5ZpsaV-pOn-zO+kMQ8=_2hK3OOKbOEF-CFWEBg@mail.gmail.com>
Subject: [meta-python][PATCH] python-pyflame: skip for aarch64 as well
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
X-List-Received-Date: Mon, 10 Sep 2018 18:43:02 -0000

* fails with:
| ../../git/src/ptrace.cc: In function 'user_regs_struct pyflame::PtraceGetRegs(pid_t)':
| ../../git/src/ptrace.cc:127:14: error: 'PTRACE_GETREGS' was not declared in this scope
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:127:14: note: suggested alternative: 'PTRACE_GETREGSET'
|    if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_GETREGSET
| ../../git/src/ptrace.cc: In function 'void pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
| ../../git/src/ptrace.cc:136:14: error: 'PTRACE_SETREGS' was not declared in this scope
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
| ../../git/src/ptrace.cc:136:14: note: suggested alternative: 'PTRACE_SETREGSET'
|    if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
|               ^~~~~~~~~~~~~~
|               PTRACE_SETREGSET
| Makefile:524: recipe for target 'ptrace.o' failed
| make[2]: *** [ptrace.o] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyflame.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index 3914028ec3..340aab74ef 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -12,3 +12,4 @@ inherit pkgconfig autotools
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 COMPATIBLE_HOST_mipsarch_class-target = "null"
+COMPATIBLE_HOST_aarch64_class-target = "null"
-- 
2.17.1



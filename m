Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 74D5A6E688
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 04:30:36 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so771681pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6uABJd7GulNsY+pGkpOGoQySXW87eUfDaCI5u4tPVZ0=;
	b=qMYbSeTFsIx1Kty0QxBTpS6ATUU+8iNLF07bVumBUIOaSIUAaOWQ51MalJqoH1k9C+
	a8BovOG8mLcx/9LKXnVhT73feP/mNyuQevJioWBNBhzRku1CStGaN64cZ8HyH1EuqDYq
	pqdUnOeO7LYrgrGhkA5ac7qexvQGkejjarZAI3yGASJRVXYmQxSYnb3n4o6/droED9kn
	RN3i4g0c5aum3wSIfqG4Gv/VNNdS/B8dS9hwDoBl4F5x9bQ0wpxAd0sOnIWy++bjsYyv
	iBvK98rCptk26SoreHhcrsLRlrSqBRIo7nLHrjjyDUstO99dXryrb/hAkzXDDkSAyu6o
	GCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6uABJd7GulNsY+pGkpOGoQySXW87eUfDaCI5u4tPVZ0=;
	b=DBNh0SFPM2ns+4zVJBRaN77L6UxfQg7fbZuTbXwmGZoPR6rTn3/gTcLYhC7pLwrg4X
	e336zrZUTjlDnQLHJWkowcg+PjQMYCkfpuBXPQVmNQbgqKfMYdcPY8ANmlXVYiIbzFWR
	zB5HagUWX0/oNcU7tZ9zXZj2Eukj2F5MABivY35tVxjHAbnjFm7Z1S/d3ifj4ACjhbuw
	QH/tAajECPmQezOqR3r2vmNML5eTFLOb2zU09gDaDAdAT2ge2YRH7TVxJ0Kv+KOU8YAz
	XnqkeGmE7uOKTY1o+MYenKdKmp2Kr3Kp62vzQp7FfnleS06yts0znwt1d7Yz9YIYSCie
	Jiyg==
X-Gm-Message-State: ALyK8tJKaqxDXWQaKzjJ5N/uwr3zc0dq2qleSmu7tlniX9w24cO+e2FkLgAuXOTEGl5U3g==
X-Received: by 10.66.63.98 with SMTP id f2mr3575132pas.123.1464064236944;
	Mon, 23 May 2016 21:30:36 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	c82sm9921753pfd.42.2016.05.23.21.30.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 21:30:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon, 23 May 2016 21:30:34 -0700
Message-Id: <1464064234-12783-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] netkit-rsh: fix build issue.
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
X-List-Received-Date: Tue, 24 May 2016 04:30:36 -0000

glibc deprecate union wait and remove support from wait functions
https://sourceware.org/ml/libc-alpha/2016-02/msg00342.html
change rlogin.c accordingly

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-rsh/fixup_wait3_api_change.patch        | 34 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
new file mode 100644
index 0000000..cd6df62
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
@@ -0,0 +1,34 @@
+Fix build issue do to Deprecate union wait and remove support from wait functions [BZ #19613]
+
+| rlogin.c: In function 'catch_child':
+| rlogin.c:463:13: error: storage size of 'status' isn't known
+|   union wait status;
+
+https://sourceware.org/ml/libc-alpha/2016-02/msg00342.html
+
+Upstream-Status: Inappropriate [ no upstream maintaner ]
+
+Signed-off-by Armin Kuster <akuster@mvista.com>
+
+Index: netkit-rsh-0.17/rlogin/rlogin.c
+===================================================================
+--- netkit-rsh-0.17.orig/rlogin/rlogin.c
++++ netkit-rsh-0.17/rlogin/rlogin.c
+@@ -460,7 +460,7 @@ writeroob(int ignore)
+ void
+ catch_child(int ignore)
+ {
+-	union wait status;
++	int status;
+ 	int pid;
+ 
+ 	(void)ignore;
+@@ -471,7 +471,7 @@ catch_child(int ignore)
+ 			return;
+ 		/* if the child (reader) dies, just quit */
+ 		if (pid < 0 || (pid == childpid && !WIFSTOPPED(status)))
+-			done((int)(status.w_termsig | status.w_retcode));
++            done((int)(WTERMSIG(status) | WEXITSTATUS(status)));
+ 	}
+ 	/* NOTREACHED */
+ }
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 66bb4cc..4803d7b 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -15,6 +15,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=
             file://rsh.xinetd.netkit \
             file://netkit-rsh-0.17-rexec-ipv6.patch \
             file://fix-host-variable.patch \
+            file://fixup_wait3_api_change.patch \
 "
 
 SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
-- 
2.3.5



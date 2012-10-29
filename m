Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlp3-0006u1-Dw
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 10:39:53 +0100
Received: from localhost ([127.0.0.1]:45750 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlbv-0006kj-QB; Mon, 29 Oct 2012 09:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=W
	URsAI/2x0w5dkJ7YT/8QGKF4dQ=; b=mMAbS4uHVEOv8gEsxi48F8XmCpMUWRsLH
	IkVbIz+7b4/7VJQxMQeQH5dO6tau35JjT+34NwhFMlXR0p9xn483dRvChdRIMdQO
	IOJ1M0ZRKRAH3zwej0p17BLfrtSFv2CKf62O+jCx4IFkgdlNZ5Nqo27Tlr1gHXRI
	7+t9a16mWA=
Received: from [195.171.99.130] (port=64174 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlbv-0006kF-LD; Mon, 29 Oct 2012 09:26:19 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:28:14 +0000
Message-Id: <1351502894-2303-4-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351502894-2303-1-git-send-email-ml@communistcode.co.uk>
References: <1351502894-2303-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 3/3] babeltrace: fix depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 09:39:53 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
index 95d65f5..e699712 100644
--- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
 
 inherit autotools
 
-DEPENDS = "gtk+ util-linux"
+DEPENDS = "glib-2.0 util-linux popt"
 
 SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
 PV = "0.12+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
 
-- 
1.8.0




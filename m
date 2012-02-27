Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1za0-0007yP-4s
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 13:21:24 +0100
Received: by eekc1 with SMTP id c1so386258eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 04:12:58 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.17.203 as permitted sender) client-ip=10.213.17.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.17.203 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.17.203])
	by 10.213.17.203 with SMTP id t11mr4090791eba.127.1330344778011
	(num_hops = 1); Mon, 27 Feb 2012 04:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iWwyH/SXsoNgbiB+3ub26XiLmeHW50csnQQU5XZZ6Gk=;
	b=e6FNNmu8hV7sjk19wuk6rFYU458wgKTxN+bVUKxdMkFirru1utJW93/BDqj6cDkNwM
	7wEbKZxrqQy+H144djgAdWaJyPWoAH/ToNgkT4IDv7T9x1tPV0V2DSiIbhk7uc80N3co
	bvvb9uV06Ona75d/xYgTHFFIgj2k/fMHdsM08=
Received: by 10.213.17.203 with SMTP id t11mr3048860eba.127.1330344777869;
	Mon, 27 Feb 2012 04:12:57 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm57343122eef.10.2012.02.27.04.12.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 04:12:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Feb 2012 13:12:49 +0100
Message-Id: <1330344769-29374-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] meta-oe: add fbset-modes to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Mon, 27 Feb 2012 12:21:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2fd7eac..6f05871 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,4 +28,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   systemd-serialgetty \
   mplayer-common \
   task-x11-server \
+  fbset-modes \
 "
-- 
1.7.8.4




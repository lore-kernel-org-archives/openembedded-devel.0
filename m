Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZBL-00083C-Ap
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:10:11 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so160716eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:01:48 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.120.209 as permitted sender) client-ip=10.14.120.209; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.120.209 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.120.209])
	by 10.14.120.209 with SMTP id p57mr5170173eeh.55.1330243308989
	(num_hops = 1); Sun, 26 Feb 2012 00:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LDXOFpTrPzv+V+Ao8Vdj6HFOpdb6ZpPogdZVhyD5qNc=;
	b=NyGgknHLBhHTldFVm9KCZrnBdQS+IotGpw/gNstP4ZbhrHXGQbka1mM5OIQHX5pvCs
	+b2/lZnnLtettxIMn53sLVajnGROGLL6TMS+z7Tq1QDvn6+snTUFjXGEWeyyPCupUerV
	U2kMQbCCogoJ6CPUXopK2Im7tHcBWSTA8w6nI=
Received: by 10.14.120.209 with SMTP id p57mr3927410eeh.55.1330243308896;
	Sun, 26 Feb 2012 00:01:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm34554873eeb.1.2012.02.26.00.01.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:01:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:31 +0100
Message-Id: <8abd9550311d6ed8918b735c3886d2e5b5e8e3dd.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
References: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330243124.git.Martin.Jansa@gmail.com>
References: <cover.1330243124.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/5] layer.conf: add task-x11-server to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sun, 26 Feb 2012 08:10:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 7369df1..2fd7eac 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -27,4 +27,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal-xinput \
   systemd-serialgetty \
   mplayer-common \
+  task-x11-server \
 "
-- 
1.7.8.4




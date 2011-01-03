Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc5-0004XM-Cz
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:41 +0100
Received: by fxm17 with SMTP id 17so12728011fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=+nX54XuGnjp5pr2yN2FlBVXDEbb6Z0ZpW+OazGC5C2Y=;
	b=d+JhOMdCo7VALyrGiLJTO1WzcilzeQJ7RTUe5fVsBA5eiS9ooOfU1T+5/5D3ebCB4N
	mSGllCnB5PqK26ncObpciXEm9/ME14d1R64M6ABB29DUrlgovSDgXPSjR7WXtIZt+vuv
	rsTf7a7hTEdOKtjgT8F49Z97NMXUIvzGMjaNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LUt60EOXghnl0QTVrnFa2xjM9PxMh4VsZA1bESFFHfC+L3eao3nOjN2JCaNIYH17ED
	svAr6btI6zWZDbfkk+/LiZk2A1vf+zTqERftmyvhBge4wlGzH2/Has0GjShq+RhmUycc
	fJNY3VgzfcRViSy3jrwakROaeTFQdBFN/Jr/A=
Received: by 10.223.79.67 with SMTP id o3mr590065fak.129.1294084939689;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id k6sm4880877faa.30.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000ox-Nw; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:00 +0100
Message-Id: <1294084926-3115-6-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 06/12] busybox: remove superfluous newlines from mdev init script
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:41 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/files/mdev |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes/busybox/files/mdev b/recipes/busybox/files/mdev
index 4eed51e..4eba619 100755
--- a/recipes/busybox/files/mdev
+++ b/recipes/busybox/files/mdev
@@ -1,11 +1,7 @@
 #!/bin/sh
 
 mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
-
 mkdir /dev/pts /dev/shm
-
 mount -t devpts devpts /dev/pts
-
-echo "/sbin/mdev" >/proc/sys/kernel/hotplug
-
+echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
-- 
1.7.2.3




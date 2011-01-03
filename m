Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc5-0004XL-31
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:41 +0100
Received: by fxm17 with SMTP id 17so12728005fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=mWDgiR4ReBZoZkZyIx+T/GKQPYRfd5fy8/odZOUSVj0=;
	b=AWpWVWR5mspPtMZaHJQhPzOw510PCcNs0r8nMuP6wYnd7h4Aty1ThK6oHhJD8wCMgG
	X4VapNZ9Karrho8cDVQysjoQFdDqD+DKTClshZcvi74SQS0/mIrI8N+b49fRt7VmYipG
	LZJiGVEPzukq8zNwWV3aKSImXO5qcuhfHWx3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hJIH+7DSNvX79MADx3lj0yqEVvxfE0dcQHd7RiWijscFroQ6zKWj0t0536T4kRjuwC
	qhBGlckBVMQYbq6OMB1QINff0zBVejhotUpxrTQMnZeabbeL05EPv3tCyLSQoRp+QZEH
	dzwqYzxvgXXI5uXYzOiUVe00gUIJC6pSxJonU=
Received: by 10.223.104.147 with SMTP id p19mr1173191fao.6.1294084939370;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id 17sm4881914far.43.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000p6-Pv; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:03 +0100
Message-Id: <1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 09/12] busybox: provide postrm for package mdev
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

Remove the mdev runlevel entry on package removal.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox.inc |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 97d6f78..59653e0 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -361,16 +361,16 @@ PACKAGES =+ "${PN}-mdev"
 FILES_${PN}-mdev = "${sysconfdir}/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/init.d/mdev"
 RDEPENDS_${PN}-mdev += "${PN}"
 
-PACKAGES =+ "${PN}-linuxrc"
-FILES_${PN}-linuxrc = "linuxrc"
-RDEPENDS_${PN}-linuxrc += "${PN}"
-
 pkg_postinst_${PN}-mdev() {
-if test "x$D" != "x"; then
-	OPT="-r $D"
-else
-	OPT="-s"
-fi
+	[ -n "$D" ] && OPT="-r $D" || OPT="-s"
 	update-rc.d $OPT mdev start 06 S .
 }
+pkg_postrm_${PN}-mdev() {
+	[ -n "$D" ] && OPT="-r $D" || OPT="-s"
+	update-rc.d $OPT -f mdev remove
+}
+
+PACKAGES =+ "${PN}-linuxrc"
+FILES_${PN}-linuxrc = "linuxrc"
+RDEPENDS_${PN}-linuxrc += "${PN}"
 
-- 
1.7.2.3




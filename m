Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc3-0004XH-Rk
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:39 +0100
Received: by fxm17 with SMTP id 17so12727982fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=l75+E/pdZb28hE6Xb2ROBivjeJ1L2IuSPtmqVJ/9Mxk=;
	b=EAzVGNR50rOy1NWnqCLwIBZriMWaOihY7rcmKIKDn1YXKGUo3ADMSa93NhQdnxSUBC
	dH0MHCrY6IRs62u55xYUgxhFi0eKXyB7TacBpT2FJYNkPfkqRFm7RbpDiL7HIc+GAhoN
	gg/trpx7J3lG4ueZp2B6VGQphez8ji5eCxiKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kmLLQBFT/hLn4Fc19MVEtyoZCa4KyhTZ2uOyIX9aUvGe544tTtHQOo2d6dIzl8hQRZ
	SzA12Hy2QIevQ1eTdqFg8haXP8YGRV3WfiFNl3RGMOrsB2om/zj3uRp96+qP09N+6Ywl
	vbtyUh2EMkymBBSoZI8lRRexLs6Ebi4QPf//0=
Received: by 10.103.241.5 with SMTP id t5mr217712mur.41.1294084938244;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a6sm3129309fak.1.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000p9-Ql; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:04 +0100
Message-Id: <1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 10/12] busybox: simplify update-rc.d OPT handling
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:40 -0000

style-only change

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox.inc |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 59653e0..b105337 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -291,11 +291,7 @@ pkg_prerm_${PN}-shadow () {
 pkg_postinst_${PN}-syslog () {
 	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
 
-	if test "x$D" != "x"; then
-		OPT="-r $D"
-	else
-		OPT="-s"
-	fi
+	[ -n "$D" ] && OPT="-r $D" || OPT="-s"
 	# remove all rc.d-links potentially created from alternative
 	# syslog packages before creating new ones
 	update-rc.d $OPT -f syslog remove
@@ -313,13 +309,9 @@ pkg_prerm_${PN}-syslog () {
 }
 
 pkg_postrm_${PN}-syslog () {
-	if test "x$D" != "x"; then
-		OPT="-r $D"
-	else
-		OPT=""
-	fi
 	if test "$1" = "remove" -o "$1" = "purge"; then
 		if ! test -e "/etc/init.d/syslog"; then
+			[ -n "$D" ] && OPT="-r $D" || OPT="-s"
 			update-rc.d $OPT syslog remove
 		fi
 	fi
-- 
1.7.2.3




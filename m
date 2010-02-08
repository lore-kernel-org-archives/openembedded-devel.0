Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax7-0004ML-DM
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137666fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=zbC2WqW3h/kaaTA1WfEZX6R6Dwb2hFLL8QXVEIGzTdQ=;
	b=kwHMk6RcY9QDceOhPt6lKVVc3e9hgp6eOyUgfSIIvFSvzkIa5P6w7i9q1zQ7cSXbLw
	7k9vt2ZkB/9ZXqDrj4iP3aNrp3PulSSIGjruLAySr62khzjhXBd3i8ljqecNU1Y4mehM
	cIC+xNTVr51C3LlUWb7279UMkeX70zzNMssvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ARfNu9Y+hxfy2OdXjiHuBB2LY2LEAB2y62V9kM+dLMG0+QtggUXCKjec1QH7/ST1yr
	XcoX4nbyju7EOmQbi4D/p9dzBmC2g3aC+VjEOu00HiwrDW+R7eUhFF5up/WLI3zKy3X3
	pQO/UB24rDPeN+cqSAqJ2xotEWRqDNH/QhwxA=
Received: by 10.223.94.201 with SMTP id a9mr8579065fan.78.1265663577046;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 18sm249049fks.34.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GD-EO; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:26 +0100
Message-Id: <1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 05/12] no need to set LD nowadays
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 7f67f47..c80b3bd 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -66,7 +66,7 @@ RDEPENDS_${PN}-syslog += "${PN}"
 RDEPENDS_${PN}-udhcpd += "${PN}"
 
 # Use gcc for linking so LDFLAGS actually makes sense
-LD = "${CC} -nostdlib"
+#LD = "${CC} -nostdlib"
 
 inherit cml1 update-rc.d
 
@@ -78,6 +78,7 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS
+	export EXTRA_CFLAGS="$CFLAGS"
 	base_do_compile
 }
 
-- 
1.6.5




Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax7-0004MM-EG
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137664fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=aShrp7EBjUwlF+aOSfP64/MfvhZVusdnNM/8hwSenP4=;
	b=k/uHTjMO+BUYMvht9TDachrCqrI7KiIVam8Oaq/W3k8HcYS1UEDr6kolV8YjCEu0zB
	MTyy1u2O0psMFRXx0dESn4rXm6GefgDqDCOB09+DtGmJflJPvkEPkHA5Eub29EDMStky
	QHnR1HZSY0Y/BuXBT2Mib1wc2NssRCiT0QsiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RIAUMe7CbtJvZc0b/s89JnS0lwvMpke7mS5FCPkCs0HZyulsGEmH9gxZn3935+ALXn
	tzUmno8ol0THNOVIfQxiQ7Jk1ZMa3rfDutd3KQ76L8YS5UCtpOz5Lxt9ixW9PikQ8jJ1
	vEUv7VmuC0ngycuer+fkK85NZg/dvxMj5XUnk=
Received: by 10.223.144.207 with SMTP id a15mr316477fav.70.1265663577369;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm7225139fks.15.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004G5-Br; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:22 +0100
Message-Id: <1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 01/12] trim superfluous trailing whitespace
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
 recipes/busybox/busybox.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 519fcd6..7f67f47 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -55,7 +55,7 @@ FILES_${PN} += "${datadir}/udhcpc"
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
-INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
+INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf"
 
 # This disables the syslog startup links in slugos (see slugos-init)
@@ -137,7 +137,7 @@ pkg_postinst_${PN} () {
 	# (update-alternatives have no problem replacing links later anyway)
 	test -n 2> /dev/null || alias test='busybox test'
 	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
-	
+
 	# This adds the links, remember that this has to work when building an image too, hence the $D
 	while read link; do case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; bn=`basename $link`; update-alternatives --install $link $bn $to 50; done <$D/etc/busybox.links
 }
@@ -167,7 +167,7 @@ pkg_prerm_${PN} () {
 			/*/*/*) to="../../bin/busybox";;
 			/bin/*) to="busybox";;
 			/*/*) to="../bin/busybox";;
-			/*) to="/bin/busybox";;		
+			/*) to="/bin/busybox";;
 		esac
 		bn=`basename $link`
 		sh /usr/bin/update-alternatives --remove $bn $to
-- 
1.6.5




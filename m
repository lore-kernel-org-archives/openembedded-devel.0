Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NnWAC-0006mK-8v
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 12:57:53 +0100
Received: by fxm20 with SMTP id 20so3761044fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 03:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=vDR+6nEL32WqR1GiPjb8hFC6zC+pACpG7e+Dmvvk3yQ=;
	b=dSz/d4OrXeA2YIkF0ZIeXinC1byHwAqTDENtTAr2r8KASsGPZOwgcv2x62UcfvYaJ5
	xlFtpS0zEAqSzYAyXsbEpxHOuKq5YTS+vpQ3iw1fxMNMCQedP0WD2+/V4pMKoENfpDPi
	kp1nPdbNnExMuVAQoydn5OGeFPHeCN+TkqQdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=G24x+ff79hyc0AjgIajBjri03HX3gnpvAqyBYP2f/Ql6OcnRVlroktR3Nl4B+Jp0yN
	lQdFuHmVFZlHCMSPx+OU4P2s5+XIn5rSlXIGU26yxdMuyHExE/1ZgJjAcKQXouE+zYtF
	yDPfAwmL+WTDWb4r3mIzk6CYFoZP0Bb/S5Wvo=
Received: by 10.223.5.70 with SMTP id 6mr967338fau.18.1267790098961;
	Fri, 05 Mar 2010 03:54:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1112027fxm.4.2010.03.05.03.54.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Mar 2010 03:54:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 12:55:31 +0100
Message-Id: <1267790132-25931-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
References: <1267790132-25931-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] busybox: use u-a for /etc/default/mountall (collision with util-linux-ng-mountall)
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
X-List-Received-Date: Fri, 05 Mar 2010 11:57:53 -0000

---
 recipes/busybox/busybox.inc |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index b165d0f..d1904a6 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r25"
+INC_PR = "r26"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -39,7 +39,7 @@ PACKAGES =+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
 # listed in the NEEDED field.
 RRECOMMENDS += "libgcc"
 
-FILES_${PN}-mountall = "${sysconfdir}/default/mountall"
+FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
 RDEPENDS_${PN} += "${PN}-mountall"
 
 # Make busybox recommend busybox-syslog for those images that expect it
@@ -128,7 +128,7 @@ do_install () {
 	fi
 	if grep "CONFIG_FEATURE_MOUNT_FSTAB=y" ${WORKDIR}/defconfig; then
 		install -d ${D}${sysconfdir}/default
-		install -m 644 ${WORKDIR}/mountall ${D}${sysconfdir}/default/
+		install -m 644 ${WORKDIR}/mountall ${D}${sysconfdir}/default/mountall.${PN}
 	fi
 
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
@@ -145,6 +145,13 @@ pkg_postinst_${PN} () {
 	while read link; do case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; /*) to="/bin/busybox";; esac; bn=`basename $link`; update-alternatives --install $link $bn $to 50; done <$D/etc/busybox.links
 }
 
+pkg_postinst_${PN}-mountall () {
+	update-alternatives --install ${sysconfdir}/default/mountall default_mountall mountall.${PN} 50
+}
+pkg_prerm_${PN}-mountall () {
+	update-alternatives --remove default_mountall mountall.${PN}
+}
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
-- 
1.7.0




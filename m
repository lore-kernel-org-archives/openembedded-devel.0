Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1MuSWS-0006P5-5y
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2009 16:57:19 +0200
Received: by fxm3 with SMTP id 3so2226214fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2009 07:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer;
	bh=8WvwTIGuaqGVx7wj44ULNTWfgzZs9ywb5aNzV/NsULQ=;
	b=twwDNR7Co+SHOdyCB2ZZJfrhGYd5hJx2cn2xXeBt7tG5/fWSG7jzGgA031oHYH6hM6
	bI758e0szmoVIhYvJAwE8HbUMYXyOCOcYFBvZtx/ea/rMucBJkjcD4jtdBfyrUkfsVOy
	dGOnIyvJIzRWfbo/fNVqgYfXRV/4eGO8Ej04A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	b=UxjpjPb33I7pHKjPNFGvWKlm1YPxz5LbOsy03+afAcqefVCL+dh/M1nAESX984L7Cd
	u5P3AaPCGZruMY1EH+jxKPliKNU9llt7t7CqWq/1NhOsXegc98e483Ey0/P/Oc+mkeEc
	SuB8mdaA1hr47Q3MM2fuUrJnb4waKPpZguXPQ=
Received: by 10.204.23.203 with SMTP id s11mr3140706bkb.17.1254668188894;
	Sun, 04 Oct 2009 07:56:28 -0700 (PDT)
Received: from ?192.168.1.2? (d86-32-77-106.cust.tele2.at [86.32.77.106])
	by mx.google.com with ESMTPS id 28sm5046643fkx.1.2009.10.04.07.56.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Oct 2009 07:56:28 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 04 Oct 2009 16:56:33 +0200
Message-Id: <1254668193.18167.4.camel@leeloo.somedomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: ralink/rt3070 driver patch
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
X-List-Received-Date: Sun, 04 Oct 2009 14:57:19 -0000
X-Groupsio-MsgNum: 13319
Content-Type: multipart/mixed; boundary="=-NmlzVlMhwujVn7NCddlJ"

--=-NmlzVlMhwujVn7NCddlJ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hej all,

In order to get my Ralink usb/wifi stick running I needed the
ralink/rt3070 kernel-module recipe.

This recipce was missing a statement to copy the required driver file
(needed by the kernel module). Wifi stick works fine now.

git diff is attached (+ some minor tweaks to the recipce)

Regards,
Michael

--=-NmlzVlMhwujVn7NCddlJ
Content-Disposition: attachment; filename="rt3070-driver.patch"
Content-Type: text/x-patch; name="rt3070-driver.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/recipes/ralink/rt3070_2.1.1.0.bb b/recipes/ralink/rt3070_2.1.1.0.bb
index d7709fa..07c453f 100644
--- a/recipes/ralink/rt3070_2.1.1.0.bb
+++ b/recipes/ralink/rt3070_2.1.1.0.bb
@@ -1,18 +1,21 @@
 DESCRIPTION = "Ralink 3070"
+SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 
 inherit module
 
 SRC_URI = "http://www.ralinktech.com.tw/data/drivers/2009_0525_RT3070_Linux_STA_v${PV}.tar.bz2 \
-           file://makefile.patch;patch=1 \
-		   file://config.patch;patch=1 \
-"
+		file://makefile.patch;patch=1 \
+		file://config.patch;patch=1"
 
 EXTRA_OEMAKE = "LINUX_SRC=${STAGING_KERNEL_DIR}"
 
 S = "${WORKDIR}/2009_0525_RT3070_Linux_STA_v${PV}"
 
 do_install() {
-	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless
-	cp ${S}/os/linux/rt3070sta.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless
+	install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless
+	install -m 0644 ${S}/os/linux/rt3070sta.ko ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless
+
+	install -d ${D}/etc/Wireless/RT2870STA
+	install -m 0644 ${S}/RT2870STA.dat ${D}/etc/Wireless/RT2870STA
 }

--=-NmlzVlMhwujVn7NCddlJ--

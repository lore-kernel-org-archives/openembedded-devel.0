Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TylCt-00038e-AW
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 16:28:44 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so211912dac.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nP+u5iXBHBoj3u1idrMPXiwrRnpeBkctvrw/w3PxZuA=;
	b=PambxA1ywPN6+NSbkp0g8q4Di55HMJ9j78YtYtl+V+q+peL/EhnH+ETeeWQVvb94s4
	hrRYAmGYpok7DkZ8cn8qKOOMbmpyVIzyjI51yfXdRWtacgNz65vHkOmTwfvq10t/Sd9d
	4zNxn60/14nuaNXtH+X14KfRpm6y3t5EsPSThVyRLgcZ1jj17IK05Mh/ApXmzZnLGVDn
	WGXiNIKAVOw93T+uRj4sTV1L+OTpiWlwBuZivaA3WbaHf/9syZgjUwgNQge4DfJbIuRU
	pS1s/5kDFkZjTOizxidu6wgHZBv/SJZ1bdB0ITTPf1A8u3gFHOd1qAdT3a0bAFy9AaU1
	3JPQ==
X-Received: by 10.68.132.10 with SMTP id oq10mr15172213pbb.18.1359126788313;
	Fri, 25 Jan 2013 07:13:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oc8sm823654pbb.39.2013.01.25.07.13.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 07:13:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 16:13:02 +0100
Message-Id: <1359126782-31113-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <1359126167-30599-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359126167-30599-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2][meta-systemd] meta-systemd: remove wpa-supplicant bbappend
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
X-List-Received-Date: Fri, 25 Jan 2013 15:28:44 -0000

* oe-core now has wpa-supplicant 2.0, but also installs wpa_supplicant.service to PN
* feel free to add new bbappend with only systemd inherit and updated SYSTEMD_PACKAGES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend            | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
deleted file mode 100644
index 609a1f3..0000000
--- a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "wpa_supplicant.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-do_install_append () {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
-}
-
-# systemd.bbclass does not catch all multiple-instance-service-files
-FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.8.1.1




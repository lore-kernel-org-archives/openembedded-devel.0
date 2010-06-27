Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OT0FD-0001B5-3e
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 00:22:33 +0200
Received: by fxm7 with SMTP id 7so362848fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jun 2010 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZA46BktYjHvKz/FSm7f0IMgNpt2jnVllCraMLinFrc4=;
	b=MnHpWAJkoBPUJpCbEujvb2FywZc9mj7R2e7Q0EpUiJCmv35PxTUr+TYZVacibAdHFF
	ln+Hb1peCVhQG1AVETaZiLTsmbEiDN6znyFplCMgthn5M1pUlXn+4UYQrjQq+tJ5Q9sq
	w0z2exrxUCSsPgMmayO+wMdX6SCw+/EIoEfK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dpDR2soeG2JCabO7EuUJxsOO+HKWS1F5wGPfrTuig+HK23Q7mQDn7Qm8fLzJ07PgCP
	UnSIKAVbpiMIYjb5pFsIUOrIJKK/dHzav0ddnk3OzQleZD9BAo3/M6FHHjsbJYh6xk6N
	+PWtmq11Csr3DrfJlvFbXq4kJT0AKD6ksdqbs=
Received: by 10.223.144.79 with SMTP id y15mr3065889fau.22.1277677070347;
	Sun, 27 Jun 2010 15:17:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm49378279fah.9.2010.06.27.15.17.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Jun 2010 15:17:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jun 2010 00:17:12 +0200
Message-Id: <1277677032-20016-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
References: <1277675827.4745.311.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opie-taskbar-images: fix RPROVIDES
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
X-List-Received-Date: Sun, 27 Jun 2010 22:22:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/opie-taskbar/opie-taskbar-images.inc |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/opie-taskbar/opie-taskbar-images.inc b/recipes/opie-taskbar/opie-taskbar-images.inc
index 9f73d31..3e1a8c8 100644
--- a/recipes/opie-taskbar/opie-taskbar-images.inc
+++ b/recipes/opie-taskbar/opie-taskbar-images.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Opie Launcher and Taskbar"
 SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RPROVIDES_${PN} = "${PN}"
 APPNAME = "qpe"
 
 S = "${WORKDIR}/pics"
@@ -61,3 +60,12 @@ python do_package_prepend () {
 
 PACKAGE_ARCH = "all"
 PACKAGES = "${PN}-dbg ${PN}-320x480 ${PN}-480x320 ${PN}-480x640 ${PN}-640x480 ${PN}-800x600 ${PN}-600x800 ${PN}-320x240 ${PN}-240x320 ${PN}-320x320"
+RPROVIDES_${PN}-320x480 = "opie-taskbar-images"
+RPROVIDES_${PN}-480x320 = "opie-taskbar-images"
+RPROVIDES_${PN}-480x640 = "opie-taskbar-images"
+RPROVIDES_${PN}-640x480 = "opie-taskbar-images"
+RPROVIDES_${PN}-800x600 = "opie-taskbar-images"
+RPROVIDES_${PN}-600x800 = "opie-taskbar-images"
+RPROVIDES_${PN}-320x240 = "opie-taskbar-images"
+RPROVIDES_${PN}-240x320 = "opie-taskbar-images"
+RPROVIDES_${PN}-320x320 = "opie-taskbar-images"
-- 
1.7.1




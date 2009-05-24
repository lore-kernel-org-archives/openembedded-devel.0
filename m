Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8IdX-0004kQ-Mr
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 20:41:39 +0200
Received: by fxm20 with SMTP id 20so2715269fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=F48fhHBvbrDW6lP5W8pemMgTUjoSIXySXpod6g58f4Q=;
	b=P9BxDn2yLl1LcSQnX9u2Zf1Yukux+F5DjNP7NLhoHVh9/Cf2unblAW0LWmh4zruMYs
	YtfhBtnjHVw47O3WMO2QsXOqWeUsA95n2NU2lvV2d6vV6VE9WvrT8AA7tOZpqSqUkn6U
	cCpUo472uRAV27iOwGiNhK0s9rv63dbdpAquc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gKzTmOY3vR9GBaDfL76JcU3if+BQf35hhnfyCIPd7tRabxZBvZ6wfYGC1ERZ0i+k+w
	Gk/CnRnHcDHBJOpJkS5noQKabwYg2Wngc6b2PXoHqRqjqtFxgVuS/T7yICQgdfmurprW
	0ySgsfPZF5S/s7lmq8H2q8VpnnclPYKol309I=
Received: by 10.103.105.17 with SMTP id h17mr3207403mum.62.1243190014569;
	Sun, 24 May 2009 11:33:34 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id n10sm7352552mue.17.2009.05.24.11.33.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 11:33:34 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 21:33:05 +0300
Message-Id: <1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Sun, 24 May 2009 18:42:04 -0000

The reason for the move is that udevadm binary is executed from udev
init.d script.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/udev/udev_141.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 7e26798..42b96e4 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
@@ -41,11 +41,11 @@ INITSCRIPT_PARAMS = "start 03 S ."
 PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
 
 FILES_libvolume-id-dev = "${includedir}/libvolume_id.h ${libdir}/libvolume_id.a ${libdir}/libvolume_id.so ${libdir}/pkgconfig/libvolume_id.pc"
-FILES_udev-utils = "${usrbindir}/udevinfo ${sbindir}/udevadm ${usrbindir}/udevtest"
+FILES_udev-utils = "${usrbindir}/udevinfo ${usrbindir}/udevtest"
 FILES_libvolume-id = "${base_libdir}/libvolume_id.so.*"
 
 RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
+FILES_${PN} += "${usrbindir}/* ${sbindir}/udevadm ${usrsbindir}/udevd"
 FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 FILES_${PN} += "${libdir}/udev/* ${base_libdir}/udev/*"
-- 
1.6.3.1




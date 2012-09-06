Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNT-0002QD-2X
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:07 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1269535wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=RYoq4vH+l/87OGKVCAA7Kulzbmd3h4W4slcgRR9zbTQ=;
	b=aIRjT5948mkhnS2gX9A2AOonDfFrp0/RG2eIJPzxfL34enjbPRPQoAWzZ+RcMl0Z5v
	nS3BWaAppWZzjCcXsv1+7oPzKBo7QSZudrJWDLj1NGQZSqd1FQX0nrn+OOUOUaKGbUKE
	Uoshfha9pOvsd0sQyNEc1A7ItOIg1mJfYOuqCYirry5M0aZbaj8SrHbQ5oDRt0Qho/1U
	Y+v9LdsyLekpDvDAMe6y3A8xaof3kZmXB9kWTX9Ka76pTRyi1R00CCHUf/DhgGRn3l8D
	Ig5mLNx4x9/dYtEoYbHgH7nIMhz3XsEZASTxswG3al7DxmR6EPc6pAoE+xuX5fXvOfJZ
	7P2g==
Received: by 10.216.196.94 with SMTP id q72mr1024590wen.149.1346930625112;
	Thu, 06 Sep 2012 04:23:45 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:30 +0200
Message-Id: <1346930610-2977-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmlbjRQaaEdLSw8I2lLtcDaHqjN3eMZltMuffxLGeLS4/UDGtbqVqJ9HsSzx/3JByzPAaSJ
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 8/8] kernel.bbclass: add non-santized kernel provides
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
X-List-Received-Date: Thu, 06 Sep 2012 11:36:08 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

If the kernel version string uses characters or symbols that
need to be santized for the package name, we can end up with a
mismatch between module requirements and what the kernel
provides.

The kernel version is pulled from utsrelease.h, which contains
the exact string that was passed to the kernel build, not
one that is santized, this can result in:

 echo "CONFIG_LOCALVERSION="\"MYVER+snapshot_standard\" >> ${B}/.config

 <build>

 % rpm -qp kernel-module-uvesafb-3.4-r0.qemux86.rpm --requires
update-modules
kernel-3.4.3-MYVER+snapshot_standard
 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

At rootfs assembly time, we'll have a dependency issue with the kernel
providing the santizied string and the modules requiring the utsrelease.h
string.

To not break existing use cases, we can add a second provides to the
kernel packaging with the unsantized version string, and allowing the
kernel module packaging to be unchanged.

   RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"

 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-MYVER+snapshot_standard
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 19fc4c6..7b80e9a 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -265,6 +265,7 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.7.6




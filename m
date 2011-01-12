Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PczC5-0007yY-JX
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 12:48:49 +0100
Received: by fxm17 with SMTP id 17so436764fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=/8+haQG5Txl2LPE+HK83Kve4mjv7ZuYDoJi8cZ4sNyA=;
	b=d7OA/oVpF7hlzvRmz5QMAIXbv0kpVc4iBUKvMx1gW5SMMfjcdFMkmSxxs8ZEvic8IA
	L2zuKagbH+SNAHyNznwvYO/Vr8qPJ76MpOn8CCYUG7SLpv1lk+AwJtrHh1YNFn6zkds3
	0nhXu6YYNmtH8FmsvCl6vWjn4OoU1QlrEVAJE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LSdqCjgBP1QDyYm7XsbUMu0ZPa59OVzSZBPg6eJEhA5Vkd2vh0andI/GXdZsIkf3Z2
	d0KE1gHiKtIi1GNwnizGNx4LbopB55rvESObeWySfdzT/90oUnrHOhdwbfLqvk0UWmW2
	0TAOEtt3HGMUneFUU5MTQ5/oNciZsXiH2Zu00=
Received: by 10.223.101.140 with SMTP id c12mr902924fao.16.1294832898156;
	Wed, 12 Jan 2011 03:48:18 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm161604fax.31.2011.01.12.03.48.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 03:48:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 12:48:17 +0100
Message-Id: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
Subject: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
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
X-List-Received-Date: Wed, 12 Jan 2011 11:48:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/webm/libvpx.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
index 9913d5b..9d40945 100644
--- a/recipes/webm/libvpx.inc
+++ b/recipes/webm/libvpx.inc
@@ -1,11 +1,15 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "git://review.webmproject.org/libvpx.git;protocol=git;tag=v${PV}"
 S = "${WORKDIR}/git"
 
+# ffmpeg links with this and fails 
+# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
+ARM_INSTRUCTION_SET = "arm"
+
 CFLAGS += "-fPIC"
 
 export CC
-- 
1.7.4.rc1




Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9A74465D58
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 15:27:28 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so11835355wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2014 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=tETFWPa16lqnf1j0Xk12t7XgN+fyxMpomw7qc0pvtD4=;
	b=urR/cVpuG/QCxTDZNu/2dzYirNUBLttCObnnBfOYqwsvzlPu8NdCPCXmB9h+WyHVkq
	Ocen+46EOFRdiI2jNno4X17YVtYaGGcPVHlFMM0F14q8U+l9UhsDow7nthQCDHYqHSlQ
	5ZAE792KfQoNPG2SwYtqt6t1+9RYBTDgkno9Zn8mRwv5gEN1scnYbN9/lPwN6Ud7e22p
	qRhRbGIZJFre8ilbPkAYZO3TtuAh5lfpulzf9O23tr5rQS0kqTGmzN3Ofjlj1KLaZ2CD
	B7lglLmtL0vRvvYkfWowQgMyvHd+rQMolIZgDJqAOtuIVQIlLxvrBx6uL3IKtMmDUtB8
	I9OQ==
X-Received: by 10.180.75.170 with SMTP id d10mr12054181wiw.31.1412782049904;
	Wed, 08 Oct 2014 08:27:29 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id cy10sm448983wjb.21.2014.10.08.08.27.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Oct 2014 08:27:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Oct 2014 17:27:20 +0200
Message-Id: <1412782041-10532-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] thunar: add udev to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Oct 2014 15:27:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: thunar requires libgudev-1.0.so.0, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
index 3feb242..36c5ed0 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
+DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel udev"
 
 inherit xfce
 
-- 
1.8.3.1



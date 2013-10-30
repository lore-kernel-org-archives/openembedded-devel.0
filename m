Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id CBAE06B0F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 20:04:32 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1148287eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=5N040DptfjfwXq2hlEpweoKMrwWFzRBZOk0sr+VO4A0=;
	b=NZbJb100dwr5aVN/TJnbI9OuiC+PbA/ELMGpcqSGo4xe80fixD/l2F/vvlv7IKs/05
	/vzl5YTceg9yyDeEGmP3P2hlM7+L/8cM7PBzvSlmcAU22jU5c1r9sNwV5BP/+edDBXLQ
	u4Ja3Zo/w0msKd+3cELq8olmSmgwXRS09S04ZC49BSYbUfQUwhEPqhIRHZGMFLAo/Tk7
	PL2iYo3mQ9FVqJSziTgleprNJnATdZZtTF+zsV5kPcjWfB99g6KZyrciJwL4PCax7P9a
	ylmCNygzL1Gs73oJtGYZpcWBu75H3gOmcQ5GIyxDe/t8zhwQB8nqX468QZw6fsvWdBNc
	YGOQ==
X-Received: by 10.14.6.134 with SMTP id 6mr3989176een.66.1383163473166;
	Wed, 30 Oct 2013 13:04:33 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59]) by mx.google.com with ESMTPSA id
	x47sm87541429eea.16.2013.10.30.13.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 13:04:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 21:04:25 +0100
Message-Id: <1383163465-9250-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] gnome-disk-utility: create an extra package for gdu libraries
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
X-List-Received-Date: Wed, 30 Oct 2013 20:04:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some environments only libraries are required and the deamon
started at X-session is an unusused feature.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 58beb63..f2f3790 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -27,8 +27,9 @@ do_configure_prepend() {
     sed -i -e "s: help : :g" ${S}/Makefile.am
 }
 
-PACKAGES =+ "${PN}-nautilus-extension"
+PACKAGES =+ "${PN}-nautilus-extension ${PN}-libs"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
+FILES_${PN}-libs += "${libdir}/libgdu*.so.*"
 FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
-- 
1.8.3.1



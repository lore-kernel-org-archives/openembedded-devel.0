Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD00705A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:43:35 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id z11so4017461lbi.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=zmvWeiJP9GP5U4mP+c9RXs2rY5/vtxueVZgcNRCKLgY=;
	b=WRVbYRTTl9pJKT6d02Z+y8au9SfyGs+Xi05qiV8UDcwT48hgW2uO++ukzfIjYWQfJM
	yidc+2lTHe0DjKWIwp44zTyb/vWSds7TfAAtxKiP38Dq+2pBEKTkf/g20IVQ4ZxWk4Zw
	zQn2orDEKDD7V5QvUQMWh+hYraflrach7w+SmatgVFRpgsVvN3IK0bNAGmtB9bORzhvE
	8qFiazPzClJeF/0I8EGdOpG9DFL6SY6HJTr9CMNtSvuV7nvgihuS6GG1OvOPB8+bMiRZ
	W2IG8RGyPBjAEjNpwus+BpMd9CsPtcdFzyrho46mOFn402JWIQML5PhwITeSPat8a26C
	9RQQ==
X-Received: by 10.152.198.195 with SMTP id je3mr18265807lac.59.1405853016234; 
	Sun, 20 Jul 2014 03:43:36 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id t3sm3448934lby.22.2014.07.20.03.43.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 03:43:35 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 12:41:54 +0200
Message-Id: <1405852914-4175-2-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405852914-4175-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1405852914-4175-1-git-send-email-jacob.kroon@mikrodidakt.se>
Subject: [meta-oe][PATCH 2/2] gnokii: Fix floating runtime dependencies
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
X-List-Received-Date: Sun, 20 Jul 2014 10:43:38 -0000

Add PACKAGECONFIG for bluez, libical, pcsc-lite, readline and usb.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 356d5bd..4826452 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -9,6 +9,11 @@ DEPENDS = "glib-2.0"
 X11DEPENDS = " libxpm gtk+"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[bluez] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
+PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+PACKAGECONFIG[usb] = "--enable-libusb,--disable-libusb,virtual/libusb0"
 PACKAGECONFIG[x11] = ",--without-x,${X11DEPENDS}"
 
 inherit autotools pkgconfig
-- 
1.9.3



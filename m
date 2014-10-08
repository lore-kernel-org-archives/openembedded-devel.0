Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 04B5A65D58
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 15:27:30 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id d1so10915643wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2014 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=iOEDS78hh6bUVeKJB7zgoMc0PTq2CBfpWegLJVbXV7w=;
	b=BBDxzevRlUeFAdhYhg3ajRNdqGpRC+ybAEMk+7BI/kD8QJ8YFtkLMXFkjLxiI63dbH
	QUyyqNhBEk2ttgQXUnzoa/pJIhPeZ1mWg4CskAFvu9mUtTU5COC3liKitm3WtRM1sLQ2
	eS6N/rh94jEUrc8bd2ZQPeWAMa/Ysp/gOhkkUVLOHuA+cKzIk9Tq/HZzBsYcl6NH21VM
	u9AOCsXXcKB5XuGHDaWoIIMT8idgbqA8/p4DtqnW1b9le5wSM1MGRN7gSIwCN870zCWG
	ibpNn+Xq3048lQrgje6etobtf8BP2+sBn/7pfLTZOCmBbxPU0eeZOqLxw36553mbCWaq
	d72w==
X-Received: by 10.194.58.108 with SMTP id p12mr11574178wjq.71.1412782051176;
	Wed, 08 Oct 2014 08:27:31 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id cy10sm448983wjb.21.2014.10.08.08.27.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Oct 2014 08:27:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Oct 2014 17:27:21 +0200
Message-Id: <1412782041-10532-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412782041-10532-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412782041-10532-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] network-manager-applet: do not delete config.log - it contains useful information
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
X-List-Received-Date: Wed, 08 Oct 2014 15:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.10.bb            | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index e3c7663..ca05866 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -23,7 +23,6 @@ PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth
 PACKAGECONFIG ??= ""
 
 do_configure_append() {
-    rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
     for i in $(find ${B} -name "Makefile") ; do
         sed -i -e s:-Werror::g $i
-- 
1.8.3.1



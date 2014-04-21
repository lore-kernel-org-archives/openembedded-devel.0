Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id AEF33607FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:56:18 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so3567926eei.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=NcifKLXxwF+C+Yf42mElkjbcRLGdrlRoDdwdHbHq6Z4=;
	b=eXVrovwbAXQtjVLC0IwXhNiM6L/Jodrwn/TS9BaQPFdhesYL0+MQ4vqJzDOgQLTNFB
	9KR7dMfjrS1P+K5zGEXPoLDcBt2C8VkbFvhE4NwuycuQe3zT9gUWT1PcWPnxejD6+7Tv
	EZE3iP2gyVgLuvNu/Ah6ICjuNDHvuDHIjzzX5/HbKCAfrVJO2Qcxdxq+XJOY1rB7kRJ4
	+DmCGNw1rFc7ZI206GKB+hGf9EGUtCNpsTpycocm/L/t3KypK5vQFtIck3uDB58knUBn
	5tAltzscCweoK3XV2P5adzJhUELz1NkH7qwd4RTaO6qGWQQNuHkNMTPkInbB17RjBmLh
	bTnQ==
X-Received: by 10.14.201.1 with SMTP id a1mr2284443eeo.71.1398077779246;
	Mon, 21 Apr 2014 03:56:19 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0582.dip0.t-ipconnect.de.
	[91.10.5.130]) by mx.google.com with ESMTPSA id
	t44sm102566260eeo.6.2014.04.21.03.56.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 03:56:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 12:56:09 +0200
Message-Id: <1398077769-31007-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] gnome-disk-utility: set correct nautilus configure options
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
X-List-Received-Date: Mon, 21 Apr 2014 10:56:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| gnome-disk-utility-2.32.0: gnome-disk-utility: configure was passed unrecognised options: --disable-nautilus-extension

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 37c5046..bd5d945 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -21,7 +21,7 @@ SRC_URI += "\
 EXTRA_OECONF += "--disable-scrollkeeper"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[nautilus] = "--enable-nautilus-extension,--disable-nautilus-extension,nautilus"
+PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
 
 do_configure_prepend() {
     sed -i -e "s: help : :g" ${S}/Makefile.am
-- 
1.8.3.1



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id E8F676B41A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:16 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1285612eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WWzhhiE8tnneyHTeix/vPauGr+iikxAfuQGGtDbkjig=;
	b=QQ5JN9OUzulBlpywjIs42Gyd+np9PRReOqFPw1AONmPg1h1Vb1d7ZQreIXKM/BHpOW
	Qzy8Ou4YwJfS1DP/qnZd+m1GOrGvTE+6u50Yj5ra22qhvHHdz47CyqlptLkkGWKq+qnO
	Twbc/VHpfqztMp7uxyIXGRsvV09SlSplL8n5ggBtxYIyw/ImXRxr9jHLpD/k1dMkeh35
	yQhHwT3YgrsBrKKMzxvOiyIJMqoDWJUFaxLnQCiV7sVnUOHQ2RVbGrdNIef1Is2IC415
	gWiuU/0Vr1ekFLL68KDf4hDgVUrs+8oGzoelf6aZetfqPGykZFuXV9zoQybg3NU7BpBw
	GslA==
X-Received: by 10.14.104.69 with SMTP id h45mr3676898eeg.127.1375652837411;
	Sun, 04 Aug 2013 14:47:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id a1sm2587127eem.1.2013.08.04.14.47.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:38 +0200
Message-Id: <1375652867-10498-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/15] epiphany: add libgnome-keyring dependency
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:17 -0000

* configure wails without it:
  No package 'gnome-keyring-1' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 495172d..00d51f9 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME default webbrowser"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates"
+DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "0c566b3ffd428d2135e3c8cb65352d64"
-- 
1.8.3.2



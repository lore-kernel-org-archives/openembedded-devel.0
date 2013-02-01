Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U1Hf5-0005eL-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 15:32:22 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so2294529pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2013 06:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=LZX4WUkB/0aD17s9UgmJRcjD0d9Fl4LjqsKmX1EFYBg=;
	b=SMin085spwubRPhn47nSi2td66muohYW9YBHIJA00nby0jRkXUTOI+EUZl0iI3ADPu
	nk0jsEcmeHSfu7ElQ7nTqlUXb3CbstplcDGSUCPt3868wynQFs7ueRFqSKFE9WaEmAYo
	KvHgyeqqzSrvU+ZlXaAsQWyXcr8l4A4yY7L6RbyxJVEqEVKHhatqIr3MgfU4dUTybY4O
	u5bQ1jRCJrwtmwWZ9PRIzq9j6JklJzlH6TpbR8h9UBMqSif1kQmDnJaoIEcnbh8YPl3K
	MvDiu68NpOtRkNXbLym1O4Iddu6ytlSiXwBADTpXKj4+fqL9d/5n7b1l91fcdyA3PcmU
	KNfw==
X-Received: by 10.66.78.1 with SMTP id x1mr30423930paw.2.1359728190588;
	Fri, 01 Feb 2013 06:16:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi2sm9276737pab.18.2013.02.01.06.16.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 06:16:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2013 15:16:27 +0100
Message-Id: <1359728187-19227-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-oe] xchat: add libsexy to DEPENDS
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
X-List-Received-Date: Fri, 01 Feb 2013 14:32:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index 3346e18..70dc150 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Full-featured IRC chat client with scripting support"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://www.xchat.org"
 SECTION = "x11/network"
-DEPENDS = "libgcrypt zlib gtk+"
+DEPENDS = "libgcrypt zlib gtk+ libsexy"
 DEPENDS += "gdk-pixbuf-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-- 
1.8.1.2




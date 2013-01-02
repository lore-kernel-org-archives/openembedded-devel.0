Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQHx-0000Xn-7r
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:29 +0100
Received: by mail-ee0-f44.google.com with SMTP id b47so7121519eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=QlyuMAitibu9auNfl5FShVjYlZ1fDMW2r6lprOvuTvM=;
	b=hXWaJs8rwu66/OOIVcwEiI3fAlC8J2O7PjlJPvZKWDB1G2eVdGA4ZFYtuRezIT/3bE
	Il6hx+ardBX2Xp08MmmpHMnYPoTIeH/5MVfQSWmjLdsRBJuudq+T43sesdX90iTSqQTe
	yjMX6z74yyQbpV9PI/5fgSYe2mGtDDJMrosFgAi+jihdnZiiEmxmelZlJF0n18cZ9Jqp
	G6GsC2I9D243FiW3XiiQsOvQPQu2ZWeT2UCMNW5tocP2Z7NTn5KDO1mOAlmmb6nJLytA
	00TcjZl8EXCRsLGPiHn4ryIodkRtmcqYBjqc92vZ8Al8+BXUnd17nZy0BoAnMgFF6jEw
	B9cA==
X-Received: by 10.14.204.198 with SMTP id h46mr126681407eeo.1.1357139786948;
	Wed, 02 Jan 2013 07:16:26 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:05 +0100
Message-Id: <1357139774-4364-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 01/10] exo: update to 0.10.2
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo/configure.patch     |    4 ++--
 .../exo/{exo_0.8.0.bb => exo_0.10.2.bb}            |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.8.0.bb => exo_0.10.2.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/recipes-xfce/exo/exo/configure.patch
index 2ccfcfc..ef27e42 100644
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
@@ -1,5 +1,5 @@
---- exo-0.3.4/configure.in~	2007-12-02 10:37:06.000000000 -0200
-+++ exo-0.3.4/configure.in	2008-06-05 17:21:42.000000000 -0300
+--- a/configure.ac	2007-12-02 10:37:06.000000000 -0200
++++ b/configure.ac	2008-06-05 17:21:42.000000000 -0300
 @@ -127,22 +127,24 @@
  dnl ***************************************
  dnl *** Check for strftime() extensions ***
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index af9103f..4fdfd48 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -13,8 +13,8 @@ SRC_URI += " \
     file://gnome-mount \
 "
 
-SRC_URI[md5sum] = "189bd19210e1d7d8601be1cdf27bf259"
-SRC_URI[sha256sum] = "6e21aa30692affcb45fc8283d034da4a02221d26e3e1facb968d04fed4ba05b0"
+SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
+SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
 
 # see http://wiki.xfce.org/gnomemount-replacement
 do_install_append () {
-- 
1.7.4.4




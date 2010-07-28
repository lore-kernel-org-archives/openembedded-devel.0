Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oe7Ke-0003BQ-2n
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 16:10:23 +0200
Received: by gwb15 with SMTP id 15so997723gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=HryEUjzckqnpSrAm5U6T7KCyB4+pHtQ7WBTQCZ8YfDY=;
	b=GI7ceFsYnsifVy3+ofZ4jngTzlOoeULL52astBpNT4TjZgUGg8vv622WraNPuw2LRQ
	Pc+i2obF3wZgU2XT4+1Qh4O/rRqvstEE00c79miL/4KBJU2INDjjQly4Og3U8adLHi+d
	ZQpJON3QkDoSxcjFMnH+fGIbV8NKiVk5PTkgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EXIU0vUSAW61ij0xzfgOdCSTyPgVqAj2KKZNpg5Ozbd4Q+NLgaGuR698HMw8a3RW04
	odfWURUIxjDs0Kt8bdAoOl9uFUqiwqZ7IpabSYEagKvg+Zh61vG/+prStKguw4QyJdU4
	YJDvata34+e+0X+ir9j1HAtt+xlL7OC7vD/PE=
Received: by 10.150.74.8 with SMTP id w8mr12772105yba.418.1280326184984;
	Wed, 28 Jul 2010 07:09:44 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u41sm8364029yba.10.2010.07.28.07.09.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 07:09:43 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jul 2010 09:06:17 -0500
Message-Id: <1280325978-3507-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/2] sourceipk: add license to control file
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
X-List-Received-Date: Wed, 28 Jul 2010 14:10:25 -0000

* Added License field to the control file.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 classes/sourceipk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 5318a2c..9acd9a5 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -83,6 +83,7 @@ sourceipk_do_create_srcipk() {
         echo "Section: ${SECTION}" >> $control_file
         echo "Priority: Optional" >> $control_file
         echo "Maintainer: ${MAINTAINER}" >> $control_file
+        echo "License: ${LICENSE}" >> $control_file
         echo "Architecture: ${SRCIPK_PACKAGE_ARCH}" >> $control_file
         srcuri="${SRC_URI}"
         if [ "$srcuri" == "" ]
-- 
1.7.0.4




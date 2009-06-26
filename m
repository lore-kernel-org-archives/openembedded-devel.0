Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MKBTC-0004uv-D5
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 15:27:59 +0200
Received: by ewy21 with SMTP id 21so1153254ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2009 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5Jqn90BJKatmq+5oWxy/9GLXh8qMgM+WiBga10FLElo=;
	b=TQAb6gRO7TEFY7Xkp7/49Xf4Q5yU8o2vXpcJTeQ/EDM6LLNfDlBSIjtpxck/eUiQOE
	78Zi27X+/7IcUOQYzWiMmtKKIHqAs/owRv5jALoq3oTA5trRNySaYnyvgFeHhe0JwOKO
	DRRDBWecdfFXtr8+pNKIEBUP/8bL4zVvi+p1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ijyHFJp62mujJaxATK5BoBHzTHz6JMktmUEe0UkAt3n6S7pmnbGJaZQ6fkof2P2mdN
	tlMNqcxRwZVuWYM9BHK63CfldZmq8JkOQglxV5ZVBuAV3mGjGGsQrfVuZGj1EitTdZpV
	GPLrpHqMOXzbosEniWhqjjXZE84BYQQS23do4=
Received: by 10.216.3.70 with SMTP id 48mr1152165weg.74.1246022193193;
	Fri, 26 Jun 2009 06:16:33 -0700 (PDT)
Received: from localhost.localdomain
	(host56-7-static.30-87-b.business.telecomitalia.it [87.30.7.56])
	by mx.google.com with ESMTPS id q9sm8403610gve.17.2009.06.26.06.16.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Jun 2009 06:16:32 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jun 2009 15:16:13 +0200
Message-Id: <1246022173-32023-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [PATCH] file xserver-kdrive-common/xserver-kdrive-common/Xserver Added settings for Ronetix boards LCD tested with display TX09D71VM1CCA
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
X-List-Received-Date: Fri, 26 Jun 2009 13:28:00 -0000


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 .../xserver-kdrive-common/Xserver                  |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index 584cb0a..5603b79 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -155,6 +155,10 @@ case `module_id` in
         "Freescale MX21ADS")
 	# That's what /proc/cpuinfo shows as hardware on the chumby
                  ARGS="$ARGS -dpi 121 -screen 320x240 -hide-cursor -mouse tslib" ;;
+        "Ronetix PM9261" | "Ronetix PM9261/BB9261" | "Ronetix PM9263" | \
+        "Ronetix PM9263/BB9261"  | "Ronetix PM9263/BB9263")               
+                ARGS="$ARGS -screen 240/54x320/81@90x16"                      
+                ;;  
         "OMAP3 Beagle Board" | "Gumstix Overo")
                  ARGS="$ARGS ${PPM}"
 # 32bpp - we'll enable it once newer kernels are.. working.                 
-- 
1.6.3.3




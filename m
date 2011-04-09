Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8RC0-0000y9-M0
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 07:58:44 +0200
Received: by yia13 with SMTP id 13so1700278yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Tmh71jORvA+FMKlSiWFPF/UKFo9KGbAlqvfajbz3HG4=;
	b=RAtZ8rECDX27X8rAUlto85QvRErjEOCBpfh7Ffegc3mDPB6peWZLf6kNJxcAt/GNxv
	FtZj7478N4kR0wTQKGe0V5g4pqp7HViNZcN3Wfn2DQYNcG+GtXY/q+aOtX2uzgcofO83
	VlErgBPzgAt80j8Lv+eaJtEBL1OS7ya40XKz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=m33xR869PvwbKfzNbIWSevFlN3QQs9KNxoesCS0iDJMqBR4WDNQMHNQgaZ8Wr4NBeF
	OWI7Cujc9cvch0CP/BipsmYFNefe93daYcJ5kQVMWwtbmAo2WoWTfBfs4qTm01+N6Jcv
	16xo/7IYG9dLsBsXFKzw8lO0NljSU7z9UI9Ak=
Received: by 10.150.114.11 with SMTP id m11mr2569924ybc.426.1302328593506;
	Fri, 08 Apr 2011 22:56:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p28sm280822ybk.0.2011.04.08.22.56.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 22:56:32 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 11:26:20 +0530
Message-Id: <1302328581-30367-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302328581-30367-1-git-send-email-heroor@gmail.com>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/3] libgles-omap3: Correct libraries for TI816x.
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
X-List-Received-Date: Sat, 09 Apr 2011 05:58:44 -0000

From: Siddharth Heroor <heroor@ti.com>

* Explicitly set ES6LOCATION.
* Split OMAP3 and TI816x BINLOCATION. TI816x uses ES6.x libraries.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../powervr-drivers/libgles-omap3_4.03.00.02.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3_4.03.00.02.bb b/recipes/powervr-drivers/libgles-omap3_4.03.00.02.bb
index e4daa23..1e9d829 100644
--- a/recipes/powervr-drivers/libgles-omap3_4.03.00.02.bb
+++ b/recipes/powervr-drivers/libgles-omap3_4.03.00.02.bb
@@ -1,11 +1,13 @@
 # untested and huge change from 1.4.x
 DEFAULT_PREFERENCE = "-1"
 
-BINLOCATION = "${S}/gfx_rel_es3.x"
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 
 ES2LOCATION = "${S}/gfx_rel_es2.x"
 ES3LOCATION = "${S}/gfx_rel_es3.x"
 ES5LOCATION = "${S}/gfx_rel_es5.x"
+ES6LOCATION = "${S}/gfx_rel_es6.x"
 
 require libgles-omap3.inc
 
-- 
1.7.0.4




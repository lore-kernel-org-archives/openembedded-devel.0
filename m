Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylP-0001lE-HQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:59 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2Ej2umgIr4tyGSXEZrio141fGY5fuCbsAMO/42hDGFs=;
	b=WerSW/4xTcm4qx7UWvOAogfGdk1wNXQ9hc1TvL2UPbdR0bwWAaeD0NEIjbKQZAFT7i
	vvbCmssaNRVJyqAHvJFdWIZ2wPWrbAQws4tw/p7TFzWX+bWZ7zDBwrph5zBbOJ2lw6xF
	OYHSnjPrwyApcBw29G5WwVOYJnuXCAIlXVHXkwrAT0zzELKCkQb7JY6mPNZ2EXXbnbUl
	DE9NL/4SvFhgBABk0W67PayBUIE7Sr4NexnV5p20YKb7XNBV095aZYgw4nFVh9R8BPn/
	fNxGf64hs219BPbu69A6nYbi0kl+vKGYldu9jygBLkaKEDdTCbvdPLImhXLRc7JcSiJ9
	tigQ==
Received: by 10.204.129.89 with SMTP id n25mr24955bks.9.1347977661816;
	Tue, 18 Sep 2012 07:14:21 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:47 +0200
Message-Id: <1347977601-28665-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 06/40] garcon: update to 0.2.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../garcon/{garcon_0.1.10.bb => garcon_0.2.0.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.10.bb => garcon_0.2.0.bb} (53%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb
similarity index 53%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb
index 2e88b97..a384889 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.1.10.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
 
 inherit xfce
 
-FILES_${PN} += " ${datadir}/desktop-directories"
+SRC_URI[md5sum] = "301e7b8015060dd30407b68dd8c4bdb7"
+SRC_URI[sha256sum] = "02dea3edb9c0039eca4748e964c61b0e1cc10f2d7f9ce0c837287ac5fa9ef76c"
 
-SRC_URI[md5sum] = "e53514e79c4da2631dd74994452d3c96"
-SRC_URI[sha256sum] = "c2497a2991101fc1e621dc712ef72aba7c238f6e5f5a1733c9572f9b23761316"
+FILES_${PN} += "${datadir}/desktop-directories"
-- 
1.7.6.5




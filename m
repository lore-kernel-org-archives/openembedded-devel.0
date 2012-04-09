Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTH-0001du-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:35 +0200
Received: by wera1 with SMTP id a1so2626913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Fz6dKTCFFYkEr+FabsjDzlYTMM13JdINGpr7TQUqmXc=;
	b=ClEuk2V3zGtA9/oFbE6hEzqVSJeGG14FQSXu6fihNM9Kw8fWuv0QJirwKzhWwmPPB9
	iJUbVGgckTFMZkjIIgW3Nyk7XlOjhfcMIRPzNHOTNt0E28uGucfIAIUGkkFNWYoZj41+
	i1CQMIEYQtwvLDiFEO5GehQOlxpB+ee/N9wUTvvb3q0qke3HxuEnSlO9VDNrCnvy+D6n
	5W7sLsqH5toN/KyVeOFFesI+mgBKHQhXO+XHoYQn1rpQ2fH/v3iWkjMbmjreRE/L+AzM
	O6M3efqPqNBIsGnfmqBEK2jq4HF7hwsnkEFgzIoKpXQiAwUg7vzCZENvyK7Ra/lX6afV
	Ac2w==
Received: by 10.180.95.37 with SMTP id dh5mr16738367wib.8.1333984579005;
	Mon, 09 Apr 2012 08:16:19 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n8sm50073417wix.10.2012.04.09.08.16.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:05 +0200
Message-Id: <1333984573-28464-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQktVDjNKxjlSrl2ia7qsce+O/7Ksh0G0MBrxFvxYjSvj6/5kaVx/pNmxjrt7E+r1HCkAJa9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 02/10] nodejs 0.4.12: rename to node4 to make it parallel installable with 0.6.x
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:35 -0000

This is done to support running cloud9 using node 0.4.x but all other node apps with 0.6.x

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libev-cross-cc_0.4.12.patch                    |    0
 .../nodejs/{nodejs_0.4.12.bb => nodejs4_0.4.12.bb} |    7 ++-----
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs4}/libev-cross-cc_0.4.12.patch (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.4.12.bb => nodejs4_0.4.12.bb} (72%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
similarity index 72%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index b87b969..522b539 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -28,11 +28,8 @@ do_compile () {
 }
 
 do_install () {
-  DESTDIR=${D} oe_runmake install
+  install -d ${D}${bindir}
+  install -m 0755 build/default/node ${D}${bindir}/node4
 }
 
-RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
 
-FILES_${PN} += "${libdir}/node/wafadmin"
-BBCLASSEXTEND = "native"
-- 
1.7.2.5




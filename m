Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UU9Rq-0007Va-Ak
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 07:38:01 +0200
Received: by mail-wi0-f176.google.com with SMTP id hj19so3609330wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Apr 2013 22:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=F9cxEYMA1c1GAQiya5ZgIqnSqoG5d/t+VW2soMYlUBI=;
	b=ZaqYMnO2nJFPqJgszj9MtVkkA9VPSVEaRJ/cH4qyHd+Pt7PYxoVJA4pwIG7+f8VgTf
	xwF4zH9hPBPz/YZIQOhpsaieFU9P2GTtjbng0tl/1f0wUm0eH2oasWLqoUqNVEcrUDdz
	xBag1EB/SNwE/QYLo+/SScqt9pri5Kw8C5Se5C+wFf8Tr9/HnFUlmNs2Uxp6+ar/Pp0L
	vmv3aMF6g3BPNGkUJVxNPNA5HQNcWva6rg1y+nTnTlfMUt2ddqEdWAvX/xDpJddhqDnC
	RoG7k5IcKNFaPWdVbiuJPyGyIrJamjpJiuoWsnFgKbcckUUWGBHPLCq7rzyCTis4RopC
	YCXQ==
X-Received: by 10.180.21.193 with SMTP id x1mr24887221wie.31.1366608015791;
	Sun, 21 Apr 2013 22:20:15 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id n7sm914386eeo.0.2013.04.21.22.20.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 21 Apr 2013 22:20:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 07:20:07 +0200
Message-Id: <1366608007-15407-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlq2uBftY0yhL0+XZo+YCv09YKQQrf0Jm7GzsgRnTrFhO7JkL07tvSc9wtjVgH7+x0sPktE
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH] metacity: metacity will crash without the gsettings schemas being installed, so require them
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
X-List-Received-Date: Mon, 22 Apr 2013 05:38:10 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 3605201..75899d5 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -26,5 +26,6 @@ do_configure_prepend() {
 	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
 }
 
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
 FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
 
-- 
1.8.1.4




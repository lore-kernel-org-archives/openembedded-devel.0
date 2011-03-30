Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q4zqg-0004xk-I6
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 20:10:32 +0200
Received: by ywg8 with SMTP id 8so641797ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FUrRiMJakt7TzU20hXGghhS3eLlsVGxxOkiKUy3pRuQ=;
	b=s90fwu74OOlT5jDiA2abhQLz78XOzlTH/5MLB4Gvz4r6wD8mfiAQCWKlYB3IPPnGhK
	S6PXsOrUsKW01spQPkkOZ9pOXagbGuuMbdw9q1F8iVsp5AGOmOzxSJgdeQ4C5w6rQLhO
	H1VQGAlERelbX6Yl/8ORDUtgIZxNeemnLdrLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VzmMhjp2A2fh1yGleavKYohuxpK920hGvq+pzPUwibs2ItH2LcLh5S5KGHKs5gci4i
	wY7mn5K+GBWDJP3n//qevRyQ7YNlfV5b9CfKLggj+ztbEtabCxn+OqLEkuOrqQ+vIPAj
	jfOIAduGVQomXdMbHM8IFlOcS7ytZjwCaxiGg=
Received: by 10.90.234.12 with SMTP id g12mr1849912agh.183.1301508510254;
	Wed, 30 Mar 2011 11:08:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x32sm301049ana.38.2011.03.30.11.08.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 11:08:29 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:08:09 -0500
Message-Id: <1301508491-3062-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/6] sort: Add ti814x machine types
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
X-List-Received-Date: Wed, 30 Mar 2011 18:10:32 -0000

* Add support for am387x-evm, dm814x-evm, and c6a814x-evm
  machine types.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 contrib/angstrom/sort.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index b8d702b..b38be99 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -79,7 +79,7 @@ case "$arch" in
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
-			machines="am3517-evm am3517-crane archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am389x-evm babbage c6a816x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
+			machines="am3517-evm am3517-crane archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am387x-evm am389x-evm babbage c6a814x-evm c6a816x-evm dm814x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
 	"armv7a-vfp")
 			machines="ac100" ;;
 	"avr32")
-- 
1.7.0.4




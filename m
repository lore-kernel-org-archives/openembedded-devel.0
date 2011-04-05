Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q78QJ-0001DY-F8
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:44:07 +0200
Received: by gyf1 with SMTP id 1so185538gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=4u+/ZuZf22Xz/PmfgKGLhwg4WojkM8PJD8HGjJBkQ/M=;
	b=sCdrryIr1RUtFcN1d5RtRS1vGhwk0VnbJufs1VSQUQZyb+/nhpPfVbcjzysIBNFa+a
	zOJYJ7fFIJakAeMklhjx8Kohq0CBw5NgbuOh3ftTuK9sK8nOrOMaqJjbr3zgVYBV1vbD
	xz/t8233/liW8L8B+3jMBx/fiKSpOW8EEQi+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tjCYTNka09gitLY7I2gs/zF5dEGR9F2r1mQImqXk1NbX8XRztjFluhhERAUntTOxc9
	6xEnorKRR+l5NmZVyNhqwgT++qPanYD53dTUF1sY+M1AshpM9UYjOKxciZ2Kx6SGfbYY
	gyMU9Fyx9IUwEhuBpIEDSqC93BlMgd53oY/JI=
Received: by 10.150.69.30 with SMTP id r30mr664472yba.124.1302018121046;
	Tue, 05 Apr 2011 08:42:01 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm2737519yba.11.2011.04.05.08.41.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:42:00 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 10:41:49 -0500
Message-Id: <1302018111-20799-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 3/5] sort: Add support for am45x-evm machine type
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
X-List-Received-Date: Tue, 05 Apr 2011 15:44:07 -0000

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 contrib/angstrom/sort.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index b38be99..ca13ce2 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -79,7 +79,7 @@ case "$arch" in
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
-			machines="am3517-evm am3517-crane archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am387x-evm am389x-evm babbage c6a814x-evm c6a816x-evm dm814x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
+			machines="am3517-evm am3517-crane am45x-evm archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am387x-evm am389x-evm babbage c6a814x-evm c6a816x-evm dm814x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
 	"armv7a-vfp")
 			machines="ac100" ;;
 	"avr32")
-- 
1.7.0.4




Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrZpn-0000nf-Tw
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 17:37:07 +0200
Received: by ewy20 with SMTP id 20so271879ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/KDOgM/PA8b1PxeZtqd4TNqnIZhurKkDMjSrtcfPlu0=;
	b=eenpR6ho9fT9BR9F7unAEyL+qo0g62oZFIxd748M8KMpVKAqGpqGsv92xHEqk4r4Rz
	dwtj0fsPYJJOXsf97tog2iMkL7/2MFwxA02Oy/HWvig+LxV4c1fxVOX3DiBvj+nURmCw
	hH9cVyvKDa5KmjiBOYz6u6aFgNwAtVvsb1Jaw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KJxRKzdKlUhr51T64JWFEgpvYU/82knuw1TnPVH/PSpoepnsMiX+KognyFlW0wvA0r
	WxIivMAuFA5TlD3YzK1MMuw/WTwYEk7vy+gnOCE5e24EBrliVprPq57k8hH1hkz6Q9n8
	UdIawIOujwFoJdA3S66WOGSwEroo8Bx5j7g/c=
Received: by 10.210.57.12 with SMTP id f12mr3843329eba.97.1239204838550;
	Wed, 08 Apr 2009 08:33:58 -0700 (PDT)
Received: from localhost.localdomain (213.219.146.119.adsl.dyn.edpnet.net
	[213.219.146.119])
	by mx.google.com with ESMTPS id 18sm7940284ewy.21.2009.04.08.08.33.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 08:33:58 -0700 (PDT)
From: Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 17:33:57 +0200
Message-Id: <1239204837-28065-1-git-send-email-vhdirk@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pcsc-lite_1.5.2: wrong download link
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
X-List-Received-Date: Wed, 08 Apr 2009 15:37:08 -0000

---
 recipes/pcsc-lite/pcsc-lite_1.5.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
index 156e463..ba66b05 100644
--- a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
+++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 DEPENDS = "hal"
 RDEPENDS_${PN} = "hal"
 
-SRC_URI = "http://alioth.debian.org/download.php/2479/pcsc-lite-${PV}.tar.bz2 \
+SRC_URI = "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-${PV}.tar.bz2 \
            file://pcscd.init "
 
 inherit autotools_stage update-rc.d
-- 
1.6.0.4




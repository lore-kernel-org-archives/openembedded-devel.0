Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8XrH-0007Mx-9L
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 12:56:45 +0200
Received: by bwz19 with SMTP id 19so3014360bwz.12
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 03:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=w4RyW4zuuo9jky5fiqRjuSx0Qzd8dL5Oy1CYlRlr+gE=;
	b=MckqFWF3p7V5v0AE+NacP754T/D5kJe6xGpaT6wjTlQJScGzXzVZWhLHk4j2EFemLe
	hc/+pHm5ToDtnXN6q48ztEJUFgO2XzKsaLLbsHMlodS+buacbNnKca6BOv/Xa/uoVrb4
	hd3I+PRbGnehEt69tOvT+Kv8Nc2cMn+4v6rDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Oljc67neCeVbF6oNRkdL4S5NddTb86ibYxG62Pd6wN18yvyR/dxy0z1KlTnuYxWhBX
	ARLH4wY0ERrjWewFze93YPTt4K70k2OJMy3Jb5eArav1im3IkOhwMzPKJ7falt2x85lz
	Kj7cOEjxSE1f9OLGAeQT36DE/apCAgCM2HoIg=
Received: by 10.103.90.10 with SMTP id s10mr1280461mul.64.1243248519772;
	Mon, 25 May 2009 03:48:39 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id j10sm16950621muh.45.2009.05.25.03.48.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 May 2009 03:48:39 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon, 25 May 2009 13:48:35 +0300
Message-Id: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <gvdrl3$h2c$1@ger.gmane.org>
References: <gvdrl3$h2c$1@ger.gmane.org>
Subject: [PATCH] udev: include udev-utils into udev rootfs
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
X-List-Received-Date: Mon, 25 May 2009 10:56:54 -0000

The reason for the move is that udevadm binary is executed from udev
init.d script.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/udev/udev_141.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 7e26798..068d23c 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,10 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r7"
+PR = "r8"
+
+# needed for init.d script
+RDEPENDS += "udev-utils"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
-- 
1.6.3.1




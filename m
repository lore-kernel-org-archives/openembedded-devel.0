Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHUwK-0005Xb-IN
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 08:57:04 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so2493627eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=fBUAEAuDXBrqfDjwzthoNdOyjoiYVPnOKuQm7cqwZcU=;
	b=OIa2bFx++tGiw5dYp1hngS0sdPzO+FQpHdjWIYku74X5LCmVswQZrX5aXYx34mNz6F
	6lnoy2Tg15lQIggCD1n5FHnvrqIxWTlQ79nIb0BThltQs7pdRIb7Ar2BkGCI0nUeDeIw
	Kw1ubRcK8kTpPoMu8r1pTZVvBfI2vq80GxliebAyzmnNj161hlG4W4ln0P4ww+iO0yDM
	HRVI9Wp9HpYPJGPF6hrtL8wMuoiW9i5pGYRH2Ofp+YZet4YNdxzbI1A9ZDOeYFwWRfTK
	VLOc5QgeDHP6hiUIu5zeIekHw0z8ojtlyXND5vMmeYvjLPs/ovxQaWWzbBfxB0vAowKs
	jukA==
X-Received: by 10.14.211.65 with SMTP id v41mr46012577eeo.33.1363592416833;
	Mon, 18 Mar 2013 00:40:16 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id m46sm25421436eeo.16.2013.03.18.00.40.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 00:40:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 08:40:06 +0100
Message-Id: <1363592406-27335-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQk/z9aejsdjuYoAhcnVU1+GbGrJWMiPYbi8GvLIgoyWbg5Da+r1reE4IwQsuZ6MZalT6l0R
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] cifs-utils: add 5.9
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
X-List-Received-Date: Mon, 18 Mar 2013 07:57:04 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-support/cifs/cifs-utils_git.bb

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
new file mode 100644
index 0000000..c78527e
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A a package of utilities for doing and managing mounts of the Linux CIFS filesystem."
+HOMEPAGE = "http://wiki.samba.org/index.php/LinuxCIFS_utils"
+
+LICENSE = "GPLv3 && LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PV = "5.9"
+
+SRCREV = "353d491dcb5d69d31434abeb962c8e9a49c36867"
+SRC_URI = "git://git.samba.org/cifs-utils.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
-- 
1.8.1.4




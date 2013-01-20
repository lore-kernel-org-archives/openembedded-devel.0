Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNQ-00078a-Kr
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:55 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so2484916eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=paOKWNMtXhoLQskGjflRl8aeHVJdZNyYldBuTqYbF98=;
	b=QIcYKvhl7viJx2ZOktv8FuHwJuqZxlDQ3JuZtPSeDVY6NvJXDbXx3Xpx3rgnOvmwv9
	BPmRd1OO8D5MmcxejW1zppVAG35rxbW1j9duzJIzhjIyaxZFFOQs9aDKR4kIJ9L9WC+7
	G24Rne4kad5s0CBts4VJs63TSOgsOhS8MHcJPZhCnugR19nc3qXJ3n+fgjIBD6Y3L8kY
	cPw/tqz3CSPswaUiiL5DUp/EloSX55J2lZdQZqy0Sf5X/XiqN9V92pfdnKfrhGUMTehN
	MLQxF3u9dMhH4K7jtGvYWUPLYHo6xc9qhGnY1a9z3HVKqBgxL8KOB2PqBPfyGPk72l4D
	JpUg==
X-Received: by 10.14.207.195 with SMTP id n43mr47753154eeo.38.1358681545575;
	Sun, 20 Jan 2013 03:32:25 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:24 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:07 +0100
Message-Id: <1358681528-19761-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkhVkuEUHt/UC8EQHicE3p59rOMMjDxtZXF3iXd+zkwFLgRcsE+SgHkKcjL4zbSbbcUJqRs
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 6/7] accel-ppp: add 1.7.3 + fixes from git
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
X-List-Received-Date: Sun, 20 Jan 2013 11:48:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-protocols/accel-ppp/accel-ppp_git.bb   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb

diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
new file mode 100644
index 0000000..9eb9bf8
--- /dev/null
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "ACCEL-PPP is a high performance VPN server application for linux."
+HOMEPAGE = "http://sourceforge.net/apps/trac/accel-ppp/wiki"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+DEPENDS = "openssl libpcre"
+
+inherit cmake
+
+PV = "1.7.3+git"
+
+SRCREV = "4acfa46c321a344b9a6ce4128e72d1e02828d8a0"
+SRC_URI = "git://accel-ppp.git.sourceforge.net/gitroot/accel-ppp/accel-ppp;branch=1.7"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = " \
+                 -DBUILD_DRIVER=FALSE \
+                 -DCMAKE_INSTALL_PREFIX=${prefix} \
+                 -DCMAKE_BUILD_TYPE=Release \
+                 -DLOG_PGSQL=FALSE \
+                 -DRADIUS=FALSE \
+                 -DNETSNMP=FALSE \
+                "
-- 
1.8.1




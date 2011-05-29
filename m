Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1c-00039d-43
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 23:59:56 +0200
Received: by bwz5 with SMTP id 5so2809973bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=aHMmDU39PxTGQQWBEDwxILucOTKap+DA9lqL5efYjWk=;
	b=vQf+KxKqVnvpJyGTsykSDBIXN6dXCACq7hpIbXuHzWRtiBdyhADo/hmjHH8KbT1F1T
	gW5c/PV518/ytet7P3R3SFArA7h/NRS15v+OaMMdgbW06iZkzvGX+XpgwzAVnGFsAY1j
	NlowbvsWB/YxrqVrNgyCRCdvR+Xigg01QjW3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WvgsKJxGvBUN8bupJ9REje+uygSUDHM0Ee3+CBqd3VZYhGOJMD3MAKXCRsBdx8lZ+O
	Td57qjw/U76pBY8Fz3EO5EJhlDKvQGyYkStQIrAEFp7PpQQu1Wuz79Wc0pWlQ5vN2K1C
	fykgaPhA7+V5u8WGjwgwTOPFMeSYDRvqHgevA=
Received: by 10.204.153.20 with SMTP id i20mr3542915bkw.208.1306706206954;
	Sun, 29 May 2011 14:56:46 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm361766fak.1.2011.05.29.14.56.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:56:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:26 +0200
Message-Id: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/14] dbus-daemon-proxy: add LIC_FILES_CHKSUM and disable as-needed
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
X-List-Received-Date: Sun, 29 May 2011 21:59:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 32ed7db..03b510e 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -1,10 +1,13 @@
 DESCRIPTION = "dbus forwarding daemon"
 LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1cc22a5bf374cba"
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
 PV = "0.0.0+gitr${SRCPV}"
 PR = "r1"
 
+ASNEEDED_pn-dbus-daemon-proxy = ""
+
 SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy;protocol=git"
 S = "${WORKDIR}/git"
 
-- 
1.7.5.rc3




Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu39D-0002wY-ES
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 14:28:23 +0100
Received: by yia13 with SMTP id 13so1538165yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 05:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=ClA5u+z/lpggTzswkblJlTP76lWwb1A7L2XGkh/ligg=;
	b=xM8KFg1erJIA/tdjCZW2qDiRlnp0sLCl+G1MrCqmXc9SxyZxwNmf1O0nEXP6/yYaHy
	8W99Ao9BVg3YxWJ4Y2EOUEtQuQngbQJ8DJN2byqiVIKyHNEVfPt1xvX7ntMm9lxgChvj
	o3CiAKzD+gRRAjGwfe7blAs9OE45hMB6E6DA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=fczthV7mDmfiR+3Mw56Lu5ln6yNLGhby0n4pzumgwciSHOqIBU9rVjkSlJKNiaAesC
	dMp2K/rWMYee2F6j63UqvIlsDnnGvJCayZmd6uHWaAAvh57J/w0Zpwdm+j9RlSNd4vYt
	KtuzAhhQ3q3gojQtVpqiWn5B/9ia1pjqXmsXc=
Received: by 10.100.191.7 with SMTP id o7mr2304727anf.198.1298899618027;
	Mon, 28 Feb 2011 05:26:58 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b28sm117412ana.0.2011.02.28.05.26.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 05:26:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 13:26:45 +0000
Message-Id: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] freerdp: rdpepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 13:28:24 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/freerdp/freerdp.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/freerdp/freerdp.inc b/recipes/freerdp/freerdp.inc
index c75175e..d1375fd 100644
--- a/recipes/freerdp/freerdp.inc
+++ b/recipes/freerdp/freerdp.inc
@@ -4,10 +4,11 @@
 DESCRIPTION = "FreeRDP RDP client"
 HOMEPAGE = "http://freerdp.sourceforge.net"
 DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+RDEPENDS += "xprop"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 inherit pkgconfig autotools
 
-- 
1.7.2.3




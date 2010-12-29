Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PY0IH-0001iF-IL
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 18:58:39 +0100
Received: by fxm17 with SMTP id 17so9801403fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=/Gsq1r+j4ctZ6QB3LoJS1pTcX6/+uHt5ri6fq5koAfU=;
	b=igPy3dJDOZjwU7BmZM6BJ7bLPFejyNrXvYal4aMdrlFPR/pF4/rhSfEyGhPLl1/sVu
	TKl2E+YmBRal31ToO6sLzNvoqYAj9w9ba8ylcy86ehkQ2of7QOcrDGh91WbkLYaVfUvu
	AjVe8NK3ctW/s2qqmpomYu6S7UaGc0lCZPYUk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OgPko1qURC6gWHpEcwXIXFqbVTveF/UzDRT9jssUaDDwVHGyb8aNNHwMl7ZWZU7vSI
	X4N+5N8HYHo7lwd6ySGnrbOY9u2FW232Ms7KvnBLHWxnAWLqFhpOIdjymtHhVs+GaCi6
	FzrV8Oem6aHReQ4JiAcnKQsnNbA5wpNZR+B1o=
Received: by 10.223.103.6 with SMTP id i6mr133899fao.84.1293645500868;
	Wed, 29 Dec 2010 09:58:20 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 17sm3583133far.43.2010.12.29.09.58.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Dec 2010 09:58:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 18:58:17 +0100
Message-Id: <1293645497-22323-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1293644563.4238.7.camel@mattotaupa>
References: <1293644563.4238.7.camel@mattotaupa>
Subject: [PATCH 2/2] util-linux-ng: drop udev dependency to break circular dbus dependency glib->dbus->libsm->util-linux-ng->udev->glib
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
X-List-Received-Date: Wed, 29 Dec 2010 17:58:39 -0000

* see http://comments.gmane.org/gmane.comp.handhelds.openembedded/40368 for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index fa367d9..4ef917f 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
 SECTION = "base"
 LICENSE = "GPL"
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} zlib ncurses virtual/libintl"
 DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native"
 
 inherit autotools gettext
-- 
1.7.3.4




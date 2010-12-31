Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYhCc-0004om-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 16:47:38 +0100
Received: by eya28 with SMTP id 28so5464254eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=4z9cEkbDpeOr4akaJt/5zqTAJe0zklRn6mosfaeR/xw=;
	b=oqbLUkjv1w3M9xjEFdtfAK+19bbySHZyxoWdK3bBhayx36UALRU4mJp2ZCT8FgQwIn
	Bs96K0IErOESskqCfQ21tXVU/1xHcqPeHBjITSxyDEQPFT/iiu/qf8QrWIHCQ7lpqX6t
	UPMs6SHCX1uIQxFz5N9Epy0LtLQzlV5+d8k/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eEstEJe4C72dtJj+QunMWcuHiohUEyBAtzoVBrm04ZulXqvMme2POo7PIEo37oelDz
	rYQDKnFcAWPG5Y3Zbks5a0esoJQndsMftAHPoc2ks7sclN80M43MVA8crmswvxfqa/TK
	LQGQRKdQkzXd+5VjYdb/SwyEhowviJ3wXGhjo=
Received: by 10.213.22.66 with SMTP id m2mr14871127ebb.76.1293810438150;
	Fri, 31 Dec 2010 07:47:18 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id b52sm12381751eei.1.2010.12.31.07.47.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 31 Dec 2010 07:47:17 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 16:47:07 +0100
Message-Id: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 1/2] u-boot: added 2010.12 recipe (DEFAULT_PREFERENCE = -1)
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
X-List-Received-Date: Fri, 31 Dec 2010 15:47:38 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/u-boot/u-boot_2010.12.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot_2010.12.bb

diff --git a/recipes/u-boot/u-boot_2010.12.bb b/recipes/u-boot/u-boot_2010.12.bb
new file mode 100644
index 0000000..174bebf
--- /dev/null
+++ b/recipes/u-boot/u-boot_2010.12.bb
@@ -0,0 +1,19 @@
+PR = "r0"
+require u-boot.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+SRC_URI[md5sum] = "9024bbceabd176ae1d52df6db2e84bda"
+SRC_URI[sha256sum] = "1705772db7a18635693676abb8818542167cb131921c456a1edd0ed47e6b77fe"
+
+
+TARGET_LDFLAGS = ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}
+
-- 
1.7.1




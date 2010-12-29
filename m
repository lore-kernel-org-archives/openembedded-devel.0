Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PY0IF-0001i7-CT
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 18:58:35 +0100
Received: by fxm17 with SMTP id 17so9801381fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KlB3YezZvYrNGYrHMgecp00gKABfvpbhjqSkBEbhVtY=;
	b=lvQoaiqC9sjXzuKBzaHEA5saEX1PnDDqgDfS6ZO9O01KAi9wEng0U8aJzfarTBNHb1
	RcOHH1ua/V+aDXtwKKxb82UIWCzBG7bVAir6ELedD5E8cB+CgpePQ7tQdKfXOYYMsevt
	O5HJcr8stYIpJcDXtVhAZVqW4O9vMv4StHZD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=q6bGjHOcKVlQfT8UhRnQaKl9elZ71N1ydjuIXnnlw9miiygrre2Y3eas9eGsKJ/AWv
	Pu2kXwszqXiFEINTXXB0NlTeIhjSm6UI2OpTdRrZiDoZWMrFZFE6vX2fOGXNCyNusXFn
	vsn4lXKmKBf4Sh13sK43NPgbiA3l1qfNELs/k=
Received: by 10.223.71.200 with SMTP id i8mr6173682faj.142.1293645499234;
	Wed, 29 Dec 2010 09:58:19 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm3582111fam.11.2010.12.29.09.58.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Dec 2010 09:58:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 18:58:16 +0100
Message-Id: <1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1293644563.4238.7.camel@mattotaupa>
References: <1293644563.4238.7.camel@mattotaupa>
Subject: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 17:58:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/dbus/dbus.inc               |    2 +-
 recipes/glib-2.0/glib-2.0_2.26.1.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index 73fc426..c235f74 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A message bus system for inter-process communication"
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
 LICENSE = "GPLv2+ AFLv2.1"
-DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
+DEPENDS = "expat virtual/libintl libsm libice virtual/libx11"
 
 INC_PR = "r19"
 
diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
index d95f894..5f7dbce 100644
--- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
@@ -6,9 +6,9 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
 LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "glib-2.0-native gtk-doc zlib"
+DEPENDS = "glib-2.0-native gtk-doc zlib dbus"
 DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
-                            pkgconfig-native"
+                            pkgconfig-native dbus-native"
 
 PR = "r0"
 
-- 
1.7.3.4




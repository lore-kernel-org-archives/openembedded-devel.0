Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHl-0005Tz-Gy
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:04:13 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HXC4XbAwV25yY4daz6RHpVq9Ntz4AnlRiEQSM7r+ZUI=;
	b=Z/GU0O0M+8SwDrrcLl4dpuhIsc8dBoSHk4sr5O+tVgn1sN0yERLTr8+qK+PRHzHaO+
	AYlCKFgAjqXEpEvESFSmZ6FRgmQf1fZy2riPzCfS1gEVwJh4cqTNxQHTXEW/hKVMa1iZ
	Rzmd3oG9Z9ahfNI8Sd6IdWi1Xt95C1i1H2RBk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NmBckU4FLV9hITXipy+SIKlICfddDti6c1Di6ZZ9KuURu0P3gC1DskEWvtOLQhjgcI
	nXX6SwDdtOQ9UKqZImSefF0HcNkaI81A5K10bVVVzVR1wO9EP6t2ygMF4t9QCA6jj2C7
	3MVuHwlelYtMPk56AOj5oKK1Y//wVjDN/SKsE=
Received: by 10.204.46.34 with SMTP id h34mr51556bkf.19.1300456950148;
	Fri, 18 Mar 2011 07:02:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm2166924bkt.11.2011.03.18.07.02.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:02:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:28 +0100
Message-Id: <1300456829-25755-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 11/12] wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:04:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
index 7649038..0cf3b70 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -6,9 +6,9 @@ LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
-DEPENDS = "gnutls dbus libnl2 openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
+DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig \
@@ -20,11 +20,6 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
 
 S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 
-# We stage libnl2 header files not directly as they clash with libnl files. Once
-# we only use libnl2 and stage the headers at the normal place we can remove
-# this.
-CFLAGS += "-I${STAGING_INCDIR}/libnl2/"
-
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
 FILES_wpa-supplicant-cli = "/usr/sbin/wpa_cli"
-- 
1.7.4.1




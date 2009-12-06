Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSV-0001qF-G9
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:16:03 +0100
Received: by bwz9 with SMTP id 9so3028920bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sN00Nxct4J0jPLqjo3npykyg6k4DhWUCxwLJ23ppqvo=;
	b=u4+tr7RDaCzAo47u+23iaW3Kfa3oBOf/7dyC/Y2UQWVYd/1r6pwzc3PAILD/Ej3+7R
	KRZoZeBk7Pd5Qc41W7bZwc+R9Ga0KoWFjgfQFa43hBYeO6sV+1fBanl1A8HB/w9Qlxao
	z8Kgsvk0D9N9voRgXpLPIi+aVjs7BmCivq820=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GpyiZ0oRkmC9MvcndZQ+wAJgzCuBgbTwqfmU493XYL3f16mGw6U0o+9I1LbOHJoTVu
	NgPt6/P+hie5Y2nVVZbC41F0fBFM3VeHQuQuTeuzRb6Qyg53tX/CSCBQSgGKiT9SoBlX
	3z8abFk2mDryFl+HBoCiGZaOReBPTFdOUgeus=
Received: by 10.204.24.17 with SMTP id t17mr6172676bkb.142.1260134060498;
	Sun, 06 Dec 2009 13:14:20 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1750365fxm.3.2009.12.06.13.14.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:49 +0100
Message-Id: <1260134030-3658-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-5-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-4-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-5-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 5/6] shr.conf: remove preferred providers set already in compatibility-providers.conf
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
X-List-Received-Date: Sun, 06 Dec 2009 21:16:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/shr.conf |   28 +++-------------------------
 1 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 833eb09..2c1e751 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -156,34 +156,12 @@ require conf/distro/include/sane-toolchain.inc
 #############################################################################
 # PREFERRED PROVIDERS
 #############################################################################
-PREFERRED_PROVIDER_qemu-native = "qemu-native"
-PREFERRED_PROVIDER_gconf = "gconf"
-PREFERRED_PROVIDER_virtual/shr-splash-theme = "shr-splash-theme-logo"
-PREFERRED_PROVIDER_frameworkd-config = "frameworkd-config-shr"
 PREFERRED_PROVIDER_gpsd = "fso-gpsd"
-PREFERRED_PROVIDER_e-wm-menu = "e-wm-menu-shr"
-PREFERRED_PROVIDER_openmoko-alsa-scenarios = "alsa-scenarii-shr"
-PREFERRED_PROVIDER_virtual/alsa-scenarios = "alsa-scenarii-shr"
-PREFERRED_PROVIDER_libfribidi = "fribidi"
-PREFERRED_PROVIDER_bluez-libs = "bluez4"
-PREFERRED_PROVIDER_bluez-utils = "bluez4"
-PREFERRED_PROVIDER_classpath = "classpath"
-PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
-PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
-PREFERRED_PROVIDER_virtual/gail = "gtk+"
-PREFERRED_PROVIDER_opkg = "opkg"
-PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
 PREFERRED_PROVIDER_atd = "atd-over-fso"
-PREFERRED_PROVIDER_qt4x11 = "qt4-x11-free"
-PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
-PREFERRED_PROVIDER_avahi = "avahi"
-PREFERRED_PROVIDER_gtk+ = "gtk+"
-PREFERRED_PROVIDER_libgpewidget = "libgpewidget"
-PREFERRED_PROVIDER_virtual/db = "db3"
-PREFERRED_PROVIDER_virtual/db-native = "db3-native"
-PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
+PREFERRED_PROVIDER_opkg= "opkg"
 PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
+PREFERRED_PROVIDER_virtual/update-alternatives-native = "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 #############################################################################
 # PREFERRED VERSIONS
-- 
1.6.5.4




Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aH5-0005Tz-PY
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:03:32 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=0lSlQXo9Aa5qfNoUOW0/t1fdlpoRnME8Ncly0EGzhBw=;
	b=bGeHrLEqo3QPxKM5kawxz2semkS9bw7i86SuJ1T1Wl8Uxnh18l5gv0HGaOCSupNCOc
	owsW/egwIGKFE69W1PuXfLFh5BoMVWikVoASZG7DkErC4x6h/LuuAw3aoTRcA6Lmxj7z
	If8aYVJowzmCxwDVSZ1WM5LxHgEhlxq3on/wM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WoG40WBlNL/xxJeFfhUxvSTxt6WcoAdEpw0+hGXVl6SfDOilOsfMK/0rlsfiy5vv/i
	IK8BeQmfX984ZDFz7UGYyMQ2ubzfHjaNEX5JHhaF6EElDll6rgEiwdBdYK6Z3KINnIAn
	5wj+4rkw897vroYSQh34bH083t0PhBMJ+c9lQ=
Received: by 10.204.10.21 with SMTP id n21mr1014654bkn.77.1300456908346;
	Fri, 18 Mar 2011 07:01:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm2165560bkf.20.2011.03.18.07.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:01:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:23 +0100
Message-Id: <1300456829-25755-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 06/12] SHR: drop blacklist entries for libnl, now when libnl2 is used by default
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
X-List-Received-Date: Fri, 18 Mar 2011 14:03:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/shr.conf |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index e8fd844..be5904e 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -59,7 +59,6 @@ ANGSTROM_BLACKLIST_pn-xserver-kdrive-1300 = "xorg-server is preferred"
 ANGSTROM_BLACKLIST_pn-bluez-libs  = "bluez-libs 3.x has been replaced by bluez4"
 ANGSTROM_BLACKLIST_pn-bluez-utils = "bluez-utils 3.x has been replaced by bluez4"
 ANGSTROM_BLACKLIST_pn-atd = "atd has been replaced by atd-over-fso"
-ANGSTROM_BLACKLIST_pn-libnl = "libnld has been replaced by libnl2"
 ANGSTROM_BLACKLIST_pn-update-alternatives-cworth-native = "update-alternatives-cworth-native has been replaced by opkg implementation of u-a script"
 ANGSTROM_BLACKLIST_pn-update-alternatives-cworth = "update-alternatives-cworth has been replaced by opkg implementation of u-a script"
 ANGSTROM_BLACKLIST_pn-qt4-x11-free-gles = "qt4-x11-free is fine even without gles"
@@ -85,7 +84,6 @@ ANGSTROM_BLACKLIST_pn-linux-jlime-current = "strange kernel, spank maintainer"
 ANGSTROM_BLACKLIST_pn-linux-ml403-mvista-2.6.x = "strange kernel, spank maintainer"
 ANGSTROM_BLACKLIST_pn-linux-davinci = "strange kernel, spank maintainer"
 
-
 CVS_TARBALL_STASH += "http://build.shr-project.org/sources/"
 
 #The shr-mirrors.bbclass repleaces this
-- 
1.7.4.1




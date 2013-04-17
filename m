Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UST2j-00078Z-Tp
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:09:12 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so765430ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=slrqelobCz5hoJiKeXXyN0qUI+rLCOiyizBuqU5Og3A=;
	b=TM2DOWMuAejaHDN94lCqZnGpndmH4R3XdKu9RMIcYAJhWr+ww+EgUIDbZfNLH8IcAK
	fNVPVKSMzkaU1Jh1oCuZHpO265Duj/tLl1OunLciNR9UArEdMXIJvvm7tMdnojti9oA2
	BzHvw8qEJ+P1aW/sZpPdX+0c90A9h8jpmpqlH8D2FF5nZymaWcDuRHceIXPVkrhvxTwa
	LyIPSc97vLu1bqhQkfF9cc2q15WVLtLGYln3WzTtQUMa6fZD9GmYp6S1aDee21ZzgQy2
	zYYF6uHBZ1F1OqQqdGv0XS8h19GgAZtTIaamj6en1PDsOaqUL1x0RKpOCwD+AyVruLmu
	1wTw==
X-Received: by 10.15.98.66 with SMTP id bi42mr18304525eeb.39.1366206690384;
	Wed, 17 Apr 2013 06:51:30 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPS id 8sm9148961eeg.15.2013.04.17.06.51.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:51:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 15:49:11 +0200
Message-Id: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome 1/2] gnome-desktop3: add gnome-common to DEPENDS
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
X-List-Received-Date: Wed, 17 Apr 2013 14:09:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:

ERROR: Function failed: do_configure (see /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gnome-desktop3/3.0.2-r1/temp/log.do_configure.15134 for further information)
ERROR: Logfile of failure stored in: /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gnome-desktop3/3.0.2-r1/temp/log.do_configure.15134
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| cp: cannot stat `/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/share/gnome-common/data/omf.make': No such file or directory
| ERROR: Function failed: do_configure (see /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gnome-desktop3/3.0.2-r1/temp/log.do_configure.15134 for further information)
ERROR: Task 251 (/home/andreas/data/oe-core/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb, do_configure) failed with exit code '1'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-desktop/gnome-desktop3_3.0.2.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
index 9694a88..4aacd5f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r1"
+PR = "r2"
 
 BPN = "gnome-desktop"
 
@@ -12,7 +12,7 @@ inherit gnome pkgconfig
 SRC_URI[archive.md5sum] = "e2fd9d545d4d7ff66525f10364ab671e"
 SRC_URI[archive.sha256sum] = "0ac9b4a358c6d92d20283cf56a9817262ff3ce038013cbb5d98e4ab97aa2c9a3"
 
-DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils"
+DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
-- 
1.7.6.5




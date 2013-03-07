Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDZWU-0001A4-Sp
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:02:15 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so218000eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=IuvlT3iClsP2iBa5l7oqJRHpqCyUYQ7ERUcONIUd0A0=;
	b=tjRBv7uOzB/F+yvY875tfXSnUZZWCiH7Vf1Hka8qwTr7LnGhKB7+k2ugsZphU0rice
	JuG66wmAiIZbK8JVupmnrNMrlEU3rEy+KU87orPXj1eKkwHDkBDy9lJCQKiFtMI/cHOy
	/nILUWs3/B7xxZm9s5ESze0Kn07pf/buZFw2cSJjhaaH/jvBhmZEE3OaCf54SpxHPOk1
	HRP8EtHmrbkUcsXrYCT5hJTCOzFXHdOdBIpX92hNiZpdT+XL6E3+BuucrGjp5LQH9fGu
	oUu9qgMylImIyl3z0VRFYRrtGjvJsTgr+s1PzYtAOEXNni8tqyHd02UCpk/2gKsfMoUm
	7jXw==
X-Received: by 10.15.101.204 with SMTP id bp52mr92582948eeb.31.1362656738930; 
	Thu, 07 Mar 2013 03:45:38 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q42sm1778870eem.14.2013.03.07.03.45.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 03:45:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 12:43:31 +0100
Message-Id: <1362656613-10357-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
References: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce/meta-gnome 2/4] geany: fix build on perl-less machines
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
X-List-Received-Date: Thu, 07 Mar 2013 12:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

while testing this patch a hidden configure error was detected [1]

autoreconf: running: gnu-configize
Can't load '/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/Data/Dumper/Dumper.so' for module Data::Dumper: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/auto/Data/Dumper/Dumper.so: undefined symbol: PL_charclass at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/XSLoader.pm line 71.
 at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/Data/Dumper.pm line 36
Compilation failed in require at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/autoconf/Autom4te/C4che.pm line 33.
BEGIN failed--compilation aborted at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/autoconf/Autom4te/C4che.pm line 33.
Compilation failed in require at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autom4te line 37.
BEGIN failed--compilation aborted at /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autom4te line 37.
autoreconf: Leaving directory `.'

but this seems unrelated to geany.

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/036745.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.22.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recipes-devtools/geany/geany_1.22.bb
index e0b5df5..f56c8f3 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.22.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.22.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 DEPENDS = "gtk+"
-PR = "r1"
+PR = "r2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 SRC_URI = " \
     http://download.geany.org/${PN}-${PV}.tar.bz2 \
-- 
1.7.6.5




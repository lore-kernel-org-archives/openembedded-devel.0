Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TED1L-0005hC-4Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Sep 2012 07:40:23 +0200
Received: by pbcwy7 with SMTP id wy7so1544994pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YKBKtvnga2AbHqAWxpfSjapJk5xSC4C8v8+VzOEza5w=;
	b=HjrKyiaqXokoVVQCsjC4We5iXLyId+447+Eyj8QPJqwMooLF7JwRofqcy1nKpdjoGo
	urjJqmejsApftuN/9DBDatV/Bk10xA9kR+m2RrA8C2XTemxoEPzu2pGYttsEQm4SbRQ6
	wfPvfTWeI/LW55OudDjgrJHdGVeZd0vydugxT4tDcycvoQl7VKQegtX3OJo4hvzescOJ
	sUZLE1FbeZl8QUVItK3YIHQW7DbO2hVbasgeI6FAXfPpia6yYJUEMuHaG9xWzGu8OVmw
	f7fZfmI1P/9+Af2IyH2w+p9YJ810ycto/y7Kjd0z9bMmZe14oE0EMun6FNlx5ascs8LN
	iNjg==
Received: by 10.66.81.231 with SMTP id d7mr4118252pay.50.1348032461533;
	Tue, 18 Sep 2012 22:27:41 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id lb1sm1208780pbc.47.2012.09.18.22.27.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 22:27:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 22:26:28 -0700
Message-Id: <1348032388-11021-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gnome-themes: inherit perlnative
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
X-List-Received-Date: Wed, 19 Sep 2012 05:40:23 -0000

It needs perl module libxml-simple-perl for icon-name-mapping
secondly inherit perlnative since it may not be available on build host

Fixes errors like below

| Can't locate XML/Simple.pm in @INC (@INC contains: /etc/perl
/usr/local/lib/perl/5.14.2 /usr/local/share/perl/5.14.2 /usr/lib/perl5
/usr/share/perl5 /usr/lib/perl/5.14 /usr/share/perl/5.14
/usr/local/lib/site_perl .) at
/home/kraj/work/angstrom/build/tmp-angstrom_next-eglibc/sysroots/x86_64-linux/usr/libexec/icon-name-mapping
line 12.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index f40d355..9cc091f 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "GNOME themes"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "x11/gnome"
-DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native"
+DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 RDEPENDS_${PN} = "gnome-icon-theme"
 
 EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check"
 
-inherit gnome
+inherit gnome perlnative
 
 do_configure_prepend() {
 	sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libexecdir}:g' configure.in
-- 
1.7.9.5




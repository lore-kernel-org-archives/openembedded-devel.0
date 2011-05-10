Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJkS3-0003yY-LJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 12:46:03 +0200
Received: by fxm19 with SMTP id 19so4726798fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NzGz0ITfmJ4ZKl0GAGiMOaeETIpoD20nlT+me8vZCpU=;
	b=UMoo/KT4Z3MpzSENqL8B80KljbRt3igwk2EankIwRoY4+bqWyHtX4BtoeNKQAlC7Od
	E1cpu3mMl5r6bv/7Q2EqfaP1uozqW3oJSqvKBTOMs8YujqJzHK01vVNugwu2ia7YFe2m
	3myZ9BlvLrDfxjruHUc1jdtK2cn9CHT7H1fik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Y6rsT8KZQmCfUuhQQDKQvzsMu0/Gs0bFijTnApcRRTdS155ZjXmfelgUQhHMpJVAt+
	n8SVMOimjIvs2fXRCbiPMZvaivy0+3lo2ex6V9tPto7i+xy4mEIcbd3AsAJQRz30KT2L
	R8bbKCOfydZILwrVEsUnaEFiyPI6fuq/jZdFw=
Received: by 10.223.73.139 with SMTP id q11mr284851faj.56.1305024198388;
	Tue, 10 May 2011 03:43:18 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c24sm2328262fak.7.2011.05.10.03.43.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 03:43:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 12:43:10 +0200
Message-Id: <1305024190-24481-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] gnome-desktop-2.32.1: disable desktop docs
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
X-List-Received-Date: Tue, 10 May 2011 10:46:03 -0000

* we don't have gnome-doc-utils-native in DEPENDS to provide xml2po and it calls
  `which xml2po` -m docbook -e -t "${mo}"
  which doesnt work on host without xml2po
* if we add gnome-doc-utils-native to DEPENDS then it still fails:
  | xsltproc -o fdl-C.omf --stringparam db2omf.basename fdl --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in "/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/gnome-desktop-2.32.1-r0/gnome-desktop-2.32.1/desktop-docs/fdl/fdl.omf.in"  `/OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` C/fdl.xml || { rm -f "fdl-C.omf"; exit 1; }
  | warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
  because pkg-config returns xsl path without sysroot prefix
  /OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils
  /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
* feel free to fix gnome-doc-utils-native/gnome-doc-utils if you care about desktop docs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gnome/gnome-desktop_2.32.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/gnome-desktop_2.32.1.bb b/recipes/gnome/gnome-desktop_2.32.1.bb
index be055c9..e2f5c57 100644
--- a/recipes/gnome/gnome-desktop_2.32.1.bb
+++ b/recipes/gnome/gnome-desktop_2.32.1.bb
@@ -8,6 +8,8 @@ inherit gnome pkgconfig
 SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
 SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
 
+EXTRA_OECONF += " --disable-desktop-docs"
+
 do_install_append() {
 	sed  -i 's:#!.*/usr/bin/python:#!/usr/bin/python:' ${D}${bindir}/gnome-about
 }
-- 
1.7.5.rc3




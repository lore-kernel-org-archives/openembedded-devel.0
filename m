Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJy2-00009O-PC
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3067516eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=//h+tcvISPyRAOay65pQQPvFBrfyIZRhME5t6ex3h/s=;
	b=mmFKhpZqRJK6l9HfyHONfgMKfZHLIvJvsfxYZR+PNJLyJidSO48i1yT9OLdqhFPydQ
	JcQUA5XEt8Vcn2XWpmyUQol+wcSN0eEHY11yrz9MfjzO7M8CFf9rjwnVxhKRni9CzbXB
	8YagzcNhlbtukyD7lkodq/DvEhbiDXjq40IQUjhKV3lfvRJYVKP+so/sybPQdSv8vtz0
	+8dBT1VKvJH0mdX2YtrKVuB3yQb6+7ZlOV/Qg1CUFVwgPeGlBiWxwh499drIcCQ91nTN
	zkZaCZVdl1af44wsq7nABMaoL48VxzqH/rbbXe/H1Y7SaFuy2CYpXE4aBIiGQnQn53ZO
	k19w==
Received: by 10.14.213.134 with SMTP id a6mr63413957eep.45.1354732246825;
	Wed, 05 Dec 2012 10:30:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm10689897eeo.7.2012.12.05.10.30.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:30:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:24 +0100
Message-Id: <66c43de67ed507ac407eee7689a1cc2feb84bb2a.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 66/77] gpm: include /usr/share/emacs/site-lisp in PN
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
X-List-Received-Date: Wed, 05 Dec 2012 18:45:14 -0000

* fixes:
gpm-1.99.7: gpm: Files/directories were installed but not shipped
  /usr/share
  /usr/share/emacs
  /usr/share/emacs/site-lisp

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index bd42de3..38cd2c3 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -5,6 +5,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://gpm2/core/main.c;endline=19;md5=66d3c205c4e7ee5704b2ee351dfed72f"
 
+PR = "r1"
+
 DEPENDS = "ncurses"
 
 SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
@@ -41,3 +43,4 @@ do_install () {
 SRC_URI[md5sum] = "9fdddf5f53cb11d40bb2bb671d3ac544"
 SRC_URI[sha256sum] = "6071378b24494e36ca3ef6377606e7e565040413c86704753a162d2180af32ee"
 
+FILES_${PN} += "${datadir}/emacs"
-- 
1.8.0




Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjdxo-0003hE-7q
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:05:52 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2390408fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6v4rKaIV9nh+qteAt+IxoJBWTxhtzuRtVkRCiDoDW6g=;
	b=dASLlWZUACbd/SZn38rVqKd4mukT8unSMh4Df+E1ECcERGtTqIm2Sxzmcc37V6q1zE
	UOao9TvObcjXXbWmustLLDW50kjb5rl1ybB2cO7O6unqeEwGBLkKajJ0etjsTmH3ChlH
	uNImenAboZO6EQ3JfT/Z2JcI3g5GbDTEXEPB8=
Received: by 10.223.161.80 with SMTP id q16mr1520482fax.36.1311195707884;
	Wed, 20 Jul 2011 14:01:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 12sm430484fad.16.2011.07.20.14.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:01:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:01:31 +0200
Message-Id: <9889a654eb742dc18ec8d859312899510b5de15e.1311195655.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <5b1d75d8c68175e831c7b3ba7d2d9d056be9bffb.1311195655.git.Martin.Jansa@gmail.com>
References: <5b1d75d8c68175e831c7b3ba7d2d9d056be9bffb.1311195655.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195655.git.Martin.Jansa@gmail.com>
References: <cover.1311195655.git.Martin.Jansa@gmail.com>
Subject: [meta-gnome][PATCH 2/2] gconf: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:05:52 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
index 8f64638..1d5a857 100644
--- a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
+++ b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
@@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] = "46030c09422603dbb72f13b5dd592dcc01fbc13562b9e94daf
 EXTRA_OECONF = " --without-openldap --disable-gtk-doc --enable-gtk --with-gtk=2.0 --enable-gsettings-backend=yes POLKIT_POLICY_FILE_VALIDATE=true"
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
-inherit autotools gettext
+inherit autotools gettext perlnative
 
 EXTRA_OEMAKE = 'ORBIT_IDL="${ORBIT_IDL_SRC}"'
 
-- 
1.7.6




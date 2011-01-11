Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgae-0000ZF-UC
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:56:56 +0100
Received: by mail-ew0-f47.google.com with SMTP id 28so5818761ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Q1KvnMGr58C30cihQHKwKNekl8EH9B35QNNiHK0aTZM=;
	b=j+WgioqQ3q1rHlqymdmt6n6PwX+oY54HxBX4q3Ms9KbQxRB6DlKmbLRIy0I71bkLAX
	hWN2vgEocwYzORQD+2kunzJWkT8P3fMLse2r7MzlvMRNjpLwflRyNDlbjOvZEf3VdIjt
	/dj5Gq/c+RSRK9hn2xOgIVDHs9cDRAwsqXgGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RvXm9D9kWgxmkXHyJUbb7eXEg34Reo5j82KzOAzCNsy7WGueZcVeOlGAJjE4BYD9PI
	g+/qSaTfPlVYEnaZXcqBibTboWPEYbLW7E99FYLSQMUb1rM36BZd9KBppfZbGJL24e9q
	Itpu6ad3op9+NJFbKAEldG/NgSgjMxec4zN9Y=
Received: by 10.223.114.203 with SMTP id f11mr163742faq.20.1294761388391;
	Tue, 11 Jan 2011 07:56:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm7446414fam.4.2011.01.11.07.56.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:20 +0100
Message-Id: <1294761389-13634-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 03/12] xorg-doc: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:56:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-doc/xorg-docs_1.5.bb         |   13 +++++++++++++
 .../obsolete/xorg-doc/xorg-sgml-doctools_1.3.bb    |    8 ++++++++
 recipes/xorg-doc/xorg-docs_1.5.bb                  |   13 -------------
 recipes/xorg-doc/xorg-sgml-doctools_1.3.bb         |    8 --------
 4 files changed, 21 insertions(+), 21 deletions(-)
 create mode 100644 recipes/obsolete/xorg-doc/xorg-docs_1.5.bb
 create mode 100644 recipes/obsolete/xorg-doc/xorg-sgml-doctools_1.3.bb
 delete mode 100644 recipes/xorg-doc/xorg-docs_1.5.bb
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.3.bb

diff --git a/recipes/obsolete/xorg-doc/xorg-docs_1.5.bb b/recipes/obsolete/xorg-doc/xorg-docs_1.5.bb
new file mode 100644
index 0000000..8d59c4f
--- /dev/null
+++ b/recipes/obsolete/xorg-doc/xorg-docs_1.5.bb
@@ -0,0 +1,13 @@
+require xorg-doc-common.inc
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+DEPENDS += " intltool"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "359ac83ad27eecd5588914ba8715301d"
+SRC_URI[archive.sha256sum] = "62cc63582e97ad76a02acdb409123ff0e2cf33df25c9977e3b8a7606be75eafc"
+
+EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
+
+FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/obsolete/xorg-doc/xorg-sgml-doctools_1.3.bb b/recipes/obsolete/xorg-doc/xorg-sgml-doctools_1.3.bb
new file mode 100644
index 0000000..c0c5fde
--- /dev/null
+++ b/recipes/obsolete/xorg-doc/xorg-sgml-doctools_1.3.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1e3ee108688d1df91049a565813c973d"
+SRC_URI[archive.sha256sum] = "d5c0279fa84dc4a61ba2a6a9a892b34b7e9266f9562721b529b0296f5b75dbb2"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-doc/xorg-docs_1.5.bb b/recipes/xorg-doc/xorg-docs_1.5.bb
deleted file mode 100644
index 8d59c4f..0000000
--- a/recipes/xorg-doc/xorg-docs_1.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-doc-common.inc
-DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
-source tree."
-DEPENDS += " intltool"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "359ac83ad27eecd5588914ba8715301d"
-SRC_URI[archive.sha256sum] = "62cc63582e97ad76a02acdb409123ff0e2cf33df25c9977e3b8a7606be75eafc"
-
-EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
-
-FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.3.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.3.bb
deleted file mode 100644
index c0c5fde..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1e3ee108688d1df91049a565813c973d"
-SRC_URI[archive.sha256sum] = "d5c0279fa84dc4a61ba2a6a9a892b34b7e9266f9562721b529b0296f5b75dbb2"
-
-FILES_${PN} += " /usr/share/sgml/X11"
-- 
1.7.4.rc1




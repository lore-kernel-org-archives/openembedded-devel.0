Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJc-0005cc-6h
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:28 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=q5n555eWXVLMOzqzGuX6RBbgK4AQaq5O4h6wFjhQoNE=;
	b=wKbhl5HruOAqt/edQDyFu+brav8gKb8V2U7GJYBEwEQq1QMjK1KCSNTwPlLRp5ayL8
	ABvxl/NM2JCrlmG49hFK9aRQCfSK8jaiPCJ42OeR3feqMfSrOvwbCv/R3WjVqQbNrAis
	sdtFqRpp+Y1kXqtzIJyTM0YbrUmQpgs1fPxs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Yc/QmUAmElBIPNdIQHSBAmvI6Tygr5cGjvkMKee88c9sVyNnPvOappAlgkKncCToeb
	crydCspwIytvQDdhBcn8jFR5OsHAyV2lKzWJZ+fsckZTtAyp/x+eIV3BlDPz7QGJUleF
	4a5ljs+5sVG99fy1T901MbUlUHJv0SnP3g7Ho=
Received: by 10.103.171.6 with SMTP id y6mr1048136muo.110.1242873596610;
	Wed, 20 May 2009 19:39:56 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id n7sm1824115mue.28.2009.05.20.19.39.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0E1626103C4; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:38 -0300
Message-Id: <1242873578-17444-24-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-23-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-23-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 23/23] cups: use INC_PR due cups.inc being used in many recipes
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
X-List-Received-Date: Thu, 21 May 2009 02:47:28 -0000

To be easier to update the recipes we use a INC_PR in cups.inc that is
included in all PR fields in all recipes. Since currently the oldest
revision was 'r6' INC_PR starts in 'r7'.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cups/cups.inc       |    3 ++-
 recipes/cups/cups_1.1.23.bb |    2 +-
 recipes/cups/cups_1.2.12.bb |    2 +-
 recipes/cups/cups_1.2.7.bb  |    2 +-
 recipes/cups/cups_1.3.8.bb  |    2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
index 56450f7..cbec781 100644
--- a/recipes/cups/cups.inc
+++ b/recipes/cups/cups.inc
@@ -3,6 +3,8 @@ SECTION = "console/utils"
 LICENSE = "GPL LGPL"
 DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
 
+INC_PR = "r7"
+
 SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
 	  "
 
@@ -89,4 +91,3 @@ FILES_${PN} += "${datadir}/doc/cups/images \
 		${datadir}/doc/cups/*.css \
                 ${datadir}/icons/ \
 	       "
-
diff --git a/recipes/cups/cups_1.1.23.bb b/recipes/cups/cups_1.1.23.bb
index d6f0de8..bc1053c 100644
--- a/recipes/cups/cups_1.1.23.bb
+++ b/recipes/cups/cups_1.1.23.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An Internet printing system for Unix."
 SECTION = "console/utils"
 LICENSE = "GPL LGPL"
 DEPENDS = "openssl jpeg libpng zlib fakeroot-native"
-PR = "r6"
+PR = "${INC_PR}.1"
 
 SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
            file://strftime_fix.patch;patch=1"
diff --git a/recipes/cups/cups_1.2.12.bb b/recipes/cups/cups_1.2.12.bb
index 4f7d0d4..773f97e 100644
--- a/recipes/cups/cups_1.2.12.bb
+++ b/recipes/cups/cups_1.2.12.bb
@@ -1,2 +1,2 @@
 require cups.inc
-PR = "r2"
+PR = "${INC_PR}.1"
diff --git a/recipes/cups/cups_1.2.7.bb b/recipes/cups/cups_1.2.7.bb
index 8559bfc..7084032 100644
--- a/recipes/cups/cups_1.2.7.bb
+++ b/recipes/cups/cups_1.2.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An Internet printing system for Unix."
 SECTION = "console/utils"
 LICENSE = "GPL LGPL"
 DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
 	  "
diff --git a/recipes/cups/cups_1.3.8.bb b/recipes/cups/cups_1.3.8.bb
index 79cbc32..c921133 100644
--- a/recipes/cups/cups_1.3.8.bb
+++ b/recipes/cups/cups_1.3.8.bb
@@ -1,7 +1,7 @@
 require cups.inc
 
 SRC_URI += "file://use_echo_only_in_init.patch;patch=1"
-PR = "r2"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.6.3.1.54.g99dd




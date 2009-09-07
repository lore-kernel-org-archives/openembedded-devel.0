Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlMKr-0006XC-PD
	for openembedded-devel@openembedded.org; Wed, 09 Sep 2009 14:31:44 +0200
Received: by bwz6 with SMTP id 6so3195343bwz.12
	for <openembedded-devel@openembedded.org>;
	Wed, 09 Sep 2009 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0ESvrU/1q3je+JQS8X2/TiBwSdJ/MyvQ418rFZ6nme0=;
	b=PBQg/sntFn9BPO48l9zB4BL7lKpiQSSLUAa3jyt/Jv3CEWBgXhdZWpBlGmFWvX6VLE
	uR0mkR42C3gC9sqx9qNM/uwktg3mSMR3O+0vEE4dgPEei/Euo+EZRBovQjlbmClelQVv
	+yQ8vY+LmXMSqyCzk7Y44dKG6mcMAsxv+q55s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GMVwDAKIEwrfBv5bs19ajJ6mt46uQYWobljtzscIzSOG+5fe3aRZCDUNtvm3/32u3e
	YluIwyOLLc9xQobrxCgXRDZOeF05eSpRTJe/c0fNEJKQXaoT9y0w5dAmjmSFtiWQhZb1
	9/7TF+V7Q6Im8DHDF16e9P1Hel+zl3tljbNzg=
Received: by 10.103.125.36 with SMTP id c36mr6103589mun.126.1252329039139;
	Mon, 07 Sep 2009 06:10:39 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id n10sm15238126mue.7.2009.09.07.06.10.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 06:10:38 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon,  7 Sep 2009 16:10:16 +0300
Message-Id: <1252329016-10848-4-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.210
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Use NEED_UNZIP_FOR_UNPACK variable for some recipes.
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
X-List-Received-Date: Wed, 09 Sep 2009 12:31:45 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/misc-binary-only/tda1004x-firmware.bb |    3 ++-
 recipes/mozilla/firefox-l10n.inc              |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/misc-binary-only/tda1004x-firmware.bb b/recipes/misc-binary-only/tda1004x-firmware.bb
index 1e4d685..ff60717 100644
--- a/recipes/misc-binary-only/tda1004x-firmware.bb
+++ b/recipes/misc-binary-only/tda1004x-firmware.bb
@@ -1,9 +1,10 @@
 SECTION = "base"
-DEPENDS = "unzip-native"
 
 SRC_URI = "http://hauppauge.lightpath.net/de/nova-pci218c.exe"
 FILES_${PN} = '*'
 
+NEED_UNZIP_FOR_UNPACK=1
+
 python do_unpack() {
 	import re
 
diff --git a/recipes/mozilla/firefox-l10n.inc b/recipes/mozilla/firefox-l10n.inc
index 31555e3..cecd53a 100644
--- a/recipes/mozilla/firefox-l10n.inc
+++ b/recipes/mozilla/firefox-l10n.inc
@@ -11,13 +11,14 @@ def get_language_name(package):
 
     return lang
 
-DEPENDS = "unzip-native"
 RDEPENDS = "firefox"
 LANGUAGE = "${@get_language_name('${PN}')}"
 
 SRC_URI = "http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
 S = "${WORKDIR}"
 
+NEED_UNZIP_FOR_UNPACK=1
+
 do_configure() {
 	unzip -o -q -d ${LANGUAGE} ${LANGUAGE}.xpi
 }
-- 
1.5.6.5




Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OhcTR-0008Pe-5W
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 08:02:11 +0200
Received: by pzk2 with SMTP id 2so3138484pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 23:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0/ri2l47FX8fXgpl/9kpCWcAMeb3HsUz1pKoAmg+Gno=;
	b=Wg9tpAk16cJQIHY8T5AktLbESq+d4PNXvux2KMcIkUN8hWG6DpZjJ/xqERYGbz8US/
	1u0wxG+nlTYzMp6km6bA18cTEDscU7LGLu/zs0yPVZcrsnd4WkqflIzwn/tkY1HC7pWV
	nNj21s+lKL/PIantJ8SFK62tCIIJqdcJSbnKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DemC1gcWWXKB15psFSKrD1n+lADmRY79wdkfMVKnG6zoQYW1hbRsSr9Xl4x7aAtXmz
	jGsx6v63O9GDCfojDffFdJn/+FwSyKzA+mVtBD95DvnqUCrJcfg/Y0AociEtlRang0v+
	XBvCZzKp8liMZI4LJDulpbe37t7jYp8AeuGFk=
Received: by 10.114.113.5 with SMTP id l5mr15209774wac.53.1281160889086;
	Fri, 06 Aug 2010 23:01:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x9sm4412587waj.3.2010.08.06.23.01.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 23:01:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 23:01:22 -0700
Message-Id: <1281160882-3811-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	TVD_SPACE_RATIO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] preferred-om-2008-versions.inc: Update PREFERRED_VERSION for libftdi confuse and ftdi_eeprom
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
X-List-Received-Date: Sat, 07 Aug 2010 06:02:13 -0000
X-List-Received-Date: Sat, 07 Aug 2010 06:02:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/preferred-om-2008-versions.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index c2e68a9..92bb71d 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -172,8 +172,8 @@ PREFERRED_VERSION_cmake-native ?= "2.4.7"
 PREFERRED_VERSION_cms92init ?= "0.1"
 PREFERRED_VERSION_compositeproto ?= "0.4"
 PREFERRED_VERSION_comprec ?= "0.02"
-PREFERRED_VERSION_confuse ?= "2.5"
-PREFERRED_VERSION_confuse-native ?= "2.5"
+PREFERRED_VERSION_confuse ?= "2.7"
+PREFERRED_VERSION_confuse-native ?= "2.7"
 PREFERRED_VERSION_connect ?= "0.1"
 PREFERRED_VERSION_connman ?= "0.15"
 PREFERRED_VERSION_conserver ?= "8.1.14"
@@ -401,8 +401,8 @@ PREFERRED_VERSION_froot ?= "0.7.1"
 PREFERRED_VERSION_frotz ?= "2.43"
 PREFERRED_VERSION_frozen-bubble ?= "1.0.0"
 PREFERRED_VERSION_fsi-client ?= "20040803"
-PREFERRED_VERSION_ftdi-eeprom ?= "0.2"
-PREFERRED_VERSION_ftdi-eeprom-native ?= "0.2"
+PREFERRED_VERSION_ftdi-eeprom ?= "0.3"
+PREFERRED_VERSION_ftdi-eeprom-native ?= "0.3"
 PREFERRED_VERSION_ftpd-topfield ?= "0.7.4"
 PREFERRED_VERSION_fuse ?= "2.6.5"
 PREFERRED_VERSION_fuse-module ?= "2.6.5"
@@ -869,8 +869,8 @@ PREFERRED_VERSION_libfontenc ?= "1.0.4"
 PREFERRED_VERSION_libfontenc-native ?= "1.0.4"
 PREFERRED_VERSION_libfribidi ?= "0.10.4"
 PREFERRED_VERSION_libfs ?= "1.0.0"
-PREFERRED_VERSION_libftdi ?= "0.9"
-PREFERRED_VERSION_libftdi-native ?= "0.9"
+PREFERRED_VERSION_libftdi ?= "0.18"
+PREFERRED_VERSION_libftdi-native ?= "0.18"
 PREFERRED_VERSION_libg15 ?= "1.2.1"
 PREFERRED_VERSION_libg15render ?= "1.2"
 PREFERRED_VERSION_libgalago ?= "0.3.3"
-- 
1.7.1




Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsgA-0000eP-Rm
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:47:02 +0200
Received: by mail-bw0-f219.google.com with SMTP id 19so72910bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=eyECqiRyFsD4KjgtAcDW9NR4w+J4dlQ5792slKs1BA4=;
	b=fm58MjRJaLHvxxcGmXNcvniB8Ad5jZbW6noj9nx+ft/VV2YBQZoavwkEKdL57PfdQb
	2Jyfqbk/rhuih0wm8xmlvK/7H++5jjbMvLe02bp7QjhSdWBNECUL6R9szcR0dzAfg4OA
	nBGxYxYBOeQm4kASGaz61YSG4ZuvV2xTnp6S8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BgyqKsBTS8RYWxTQuiydT/Be01twWsE/OchTZ+m2ziUZZTreXzeW8nuK6BjTbGzuir
	/FdSq9wxldJW8oKAtqfKVGll5mEH74TdBMG59vamKs1lIm7t7myN+kEVa16xti3vJvUM
	uHAjABQStI28zJiwOh2UVmFdYKLKZgy3iwhNs=
Received: by 10.103.213.19 with SMTP id p19mr726059muq.9.1244043485816;
	Wed, 03 Jun 2009 08:38:05 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id s10sm5701593mue.38.2009.06.03.08.38.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:38:05 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:21 +0300
Message-Id: <1244043442-3868-12-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 11/12] pkg-config: migrated to INC_PR
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
X-List-Received-Date: Wed, 03 Jun 2009 15:47:03 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/pkgconfig/pkgconfig-native_0.23.bb |    2 ++
 recipes/pkgconfig/pkgconfig-sdk_0.23.bb    |    2 ++
 recipes/pkgconfig/pkgconfig.inc            |    2 +-
 recipes/pkgconfig/pkgconfig_0.23.bb        |    2 ++
 4 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/pkgconfig/pkgconfig-native_0.23.bb b/recipes/pkgconfig/pkgconfig-native_0.23.bb
index 24497a9..da728d3 100644
--- a/recipes/pkgconfig/pkgconfig-native_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig-native_0.23.bb
@@ -1,6 +1,8 @@
 require pkgconfig.inc
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-${PV}"
 
+PR = "${INC_PR}.1"
+
 S = "${WORKDIR}/pkg-config-${PV}/"
 inherit native
 DEPENDS = ""
diff --git a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb b/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
index 3b20371..47a5b46 100644
--- a/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
@@ -1,6 +1,8 @@
 require pkgconfig.inc
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pkgconfig-${PV}"
 
+PR = "${INC_PR}.1"
+
 S = "${WORKDIR}/pkg-config-${PV}/"
 inherit sdk
 DEPENDS = ""
diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfig.inc
index 939199b..495403e 100644
--- a/recipes/pkgconfig/pkgconfig.inc
+++ b/recipes/pkgconfig/pkgconfig.inc
@@ -5,7 +5,7 @@ It replaces the ubiquitous *-config scripts you may have \
 seen with a single tool."
 HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
 LICENSE = "GPL"
-PR = "r7"
+INC_PR = "r7"
 
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
            file://autofoo.patch;patch=1 \
diff --git a/recipes/pkgconfig/pkgconfig_0.23.bb b/recipes/pkgconfig/pkgconfig_0.23.bb
index 10ce0fc..8e75adc 100644
--- a/recipes/pkgconfig/pkgconfig_0.23.bb
+++ b/recipes/pkgconfig/pkgconfig_0.23.bb
@@ -1,4 +1,6 @@
 require pkgconfig.inc
 
+PR = "${INC_PR}.1"
+
 DEPENDS += "glib-2.0"
 EXTRA_OECONF = "--with-installed-glib"
-- 
1.6.3.1




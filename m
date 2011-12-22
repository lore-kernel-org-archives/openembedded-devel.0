Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdiUx-0003Ah-Su
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:15:53 +0100
Received: by yenm12 with SMTP id m12so4974036yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=tF05JZsyNQywDb+c6VPknRmuYqyxNguDxA21dycng2M=;
	b=EdEwPTdFARC4q/aHbrlQ94YSJQR0KrwIW2k08ZWDMpXbEF5WerHktehqiKNQSaaKpk
	wqTN3yfSgj1pXH7kpZZA7+2oefvJ4TLU7BUgnl+/0JnAPjZUP/mB5mklmQp5SzYXTCVz
	jnqcYbHGrNBiQQIJWMObKVcv2ZTxw5EAa6P7M=
Received: by 10.236.201.196 with SMTP id b44mr14709295yho.48.1324559325462;
	Thu, 22 Dec 2011 05:08:45 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm14603838yhk.1.2011.12.22.05.08.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:08:44 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2011 13:08:24 +0000
Message-Id: <579f9ddb93f5f73114b8dfb45639a65d4eeb3307.1324559278.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324559278.git.otavio@ossystems.com.br>
References: <cover.1324559278.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] systemd: depends on intltool-native
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
X-List-Received-Date: Thu, 22 Dec 2011 13:15:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 228e0e4..2548d10 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "docbook-sgml-dtd-4.1-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
+DEPENDS = "docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline udev dbus libcap libcgroup tcp-wrappers"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r6"
+PR = "r7"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-- 
1.7.2.5




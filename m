Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1SpLSu-0000XR-96
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 17:38:04 +0200
Received: by pbbrq2 with SMTP id rq2so3625127pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=E8FlPY+LayyqUXVvMzHGaLYgZGuKHCvwWFr7mktamms=;
	b=UIhSnJkebi2B7pA9pbFtIxtckGNozHeYQzmnTkXwngsagVLXhJ6YKRrHWPTvVb0FAu
	8O4ufT0WSKHzzvsGh9+CgcloZXyoFZtfQfoegBqgWPHtLF27BTJfXNgt33BtaMG6UgnU
	+9pTWH6vSg+eYOFn16TVgVxv5rM/gUXqPMY78ol3mc9sx+dgbA/x3RxGlubbl37JiB8f
	SPDX3o2/Wz1jLWcFodzxtIo3ykpu3N5q34Cp2SRpwjQhvVM8gIzVfDIkG2G74G87VgmZ
	24VhIoBblT51mLKI/fMLNk0C4X2KrGRaVjMBUrGsT5D2IVIEU+jb67H1IudN8QioDmHJ
	8SQg==
Received: by 10.68.223.198 with SMTP id qw6mr6359647pbc.94.1342106810123;
	Thu, 12 Jul 2012 08:26:50 -0700 (PDT)
Received: from localhost.localdomain ([110.93.212.98])
	by mx.google.com with ESMTPS id oq4sm4049596pbb.21.2012.07.12.08.26.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 08:26:49 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2012 20:25:26 +0500
Message-Id: <1342106726-24050-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <fahad.usman@gmail.com>
References: <fahad.usman@gmail.com>
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] wpa-supplicant: fix for dso link change
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
X-List-Received-Date: Thu, 12 Jul 2012 15:38:04 -0000

* add lgpg-error to LIBS explicitly in order to to make it work with the
updated dso linking behavior in newer versions of binutils

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../wpa-supplicant-0.7.3/dso-link-change.patch     |   13 +++++++++++++
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    3 ++-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 3 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/dso-link-change.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/dso-link-change.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/dso-link-change.patch
new file mode 100644
index 0000000..1903d1f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/dso-link-change.patch
@@ -0,0 +1,13 @@
+--- wpa_supplicant/Makefile
++++ wpa_supplicant/Makefile
+@@ -768,8 +768,8 @@ OBJS_p += ../src/crypto/crypto_gnutls.o
+ ifdef NEED_FIPS186_2_PRF
+ OBJS += ../src/crypto/fips_prf_gnutls.o
+ endif
+-LIBS += -lgcrypt
+-LIBS_p += -lgcrypt
++LIBS += -lgcrypt -lgpg-error
++LIBS_p += -lgcrypt -lgpg-error
+ CONFIG_INTERNAL_SHA256=y
+ CONFIG_INTERNAL_RC4=y
+ CONFIG_INTERNAL_DH_GROUP5=y
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index 6c84202..430f7fa 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -14,7 +14,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
-           file://99_wpa_supplicant"
+           file://99_wpa_supplicant \
+           file://dso-link-change.patch"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 6f6378b..7521bbe 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.1




Received: from [209.85.216.192] (helo=mail-px0-f192.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MgD3p-00089J-Aj
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 09:36:50 +0200
Received: by pxi30 with SMTP id 30so6470541pxi.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=UmTMziE4aKjKUnjoOCo0YfG0ScvGkBB3IJfrqLqD/v4=;
	b=Fa4EKPorB7lO/S2rUuFgsjj+S0KwhUixTip2V9+P6fjJ8FG5L8SUoyiakoQC8RW1N0
	H4fZUVrP56oHwtQuJOEb+/RhF9+mB/Zx5RVgM/0vCE+al8w057+MMVhq4ik4LybC+SQB
	yvujRnJbjwaZOoyJhmT7/yeSeOCsTgQ7a6Ywc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=K/fRR5f08gHv/C/m77syAsTSlzbAd0ojUNKrxXmC2wpJxeeW7njrPh4OeR/LFbjwq2
	LqpFnbKNIa9RTgRM6We8YdIRucsLJV2B+8EMwK3dtJIR6cz+6YlwfIfM2b99bqM7tjvI
	UJ3C0D1X6m8zk0Psu96+i2PZqbkg9oQ44VTuU=
Received: by 10.114.69.13 with SMTP id r13mr10403755waa.16.1251271131414;
	Wed, 26 Aug 2009 00:18:51 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id k35sm149190waf.29.2009.08.26.00.18.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 00:18:50 -0700 (PDT)
Message-ID: <4A94E1CC.2090404@gmail.com>
Date: Wed, 26 Aug 2009 16:48:36 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] enca_1.9.bb: remove unused configure test which is bound to fail.
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
X-List-Received-Date: Wed, 26 Aug 2009 07:36:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Enca's configure will fail on everything not arm or ix86.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/enca/enca_1.9.bb |    7 ++++++-
 site/arm-linux           |    3 ---
 site/ix86-common         |    3 ---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/recipes/enca/enca_1.9.bb b/recipes/enca/enca_1.9.bb
index 548a824..dbffe1e 100644
--- a/recipes/enca/enca_1.9.bb
+++ b/recipes/enca/enca_1.9.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 HOMEPAGE = "http://trific.ath.cx/software/enca/"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2 \
 	file://configure-hack.patch;patch=1 \
@@ -15,6 +15,11 @@ inherit autotools
 
 EXTRA_OECONF="--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
+do_configure_prepend() {
+	# remove failing test which checks for something that isn't even used
+	sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac
+}
+
 do_configure_append() {
 	sed -i s:-I/usr/include::g Makefile
 	sed -i s:-I/usr/include::g */Makefile
diff --git a/site/arm-linux b/site/arm-linux
index 4212728..18dfb38 100644
--- a/site/arm-linux
+++ b/site/arm-linux
@@ -148,9 +148,6 @@ samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
 samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
 samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
 
-# enca
-yeti_cv_func_scanf_modif_size_t=yes
-
 # clamav
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
diff --git a/site/ix86-common b/site/ix86-common
index a5c4b60..b7a503f 100644
--- a/site/ix86-common
+++ b/site/ix86-common
@@ -104,9 +104,6 @@ ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 dpkg_cv_va_copy=${ac_cv_va_copy=no}
 dpkg_cv___va_copy=${ac_cv___va_copy=yes}
 
-# enca
-yeti_cv_func_scanf_modif_size_t=yes
-
 # ettercap
 ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
 
-- 
1.6.0.3




Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7264078279
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so17026945pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DNXZmCk5Jf6IrrQY5hLM5Q7dYqc/gklN/KmowmSgqhI=;
	b=MeLM+3SvmHzx7MwXtd3fp0ooYF6tjWbEbtPGQheN9pYtKYz/4kktg4Ko1U23PYiMnV
	lyGJgMYu289AC3llJnywesl6umOmlSeUVnmmI6Yo1uAMyaeynrphkWtksDI2nr8rKLat
	caoWnJUn3zErQBhLhDJpSFVPRreBQ61jvHpH04ZuuAKuYnZANMBOmpO+3caoL7buiKDy
	j6aib3i+e9dB2IWNXhkbPzt1tOaLkVgjZRxuRnVbJPG2ePJFBaBODnHx+twl48aN4Fb/
	odASC51VH7di2qfSBHMscyHUXvogoYPSSAoQhnUR+UVcrGjaRMSsEkoqzgEtJnxmtM51
	oKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DNXZmCk5Jf6IrrQY5hLM5Q7dYqc/gklN/KmowmSgqhI=;
	b=HP63uuD3I45En0mGKT6/3nBQepphmLbR4ltqc9teuO4N8GxLIuqa41h6TT1nzoDc6d
	DLbJvPhXhpJw4lrUy7EXekPHGGj14Y/AHalwsuzMNzIeDcMvvM6JRN8Mp6F6YyupSiaQ
	/W59ZMPa4aSeBSeD1gQS2D9iosDAxxG2V8gQmBa+eeOeVSBT5nLguVMS9PyEbnYmHGY8
	yvN2zvWb3vQZc6kvJwuLGaIpSTO9f6sVdO66JbW5VuCZBSkSvyml+OjuHcrFeIRKDHiv
	vviZBfmL6219AkZ/mMRApopdl7w3zhc1zHKzmZbpvkJnf1r0w4fUGrUCdZawZ0mLoVXW
	F/JQ==
X-Gm-Message-State: AKS2vOyMTUGqcBEzrcg49F7cnv96PBwYtL4e+WenKr8BEwOvxwOtBC92
	fCbrenBRpYc2pOI/
X-Received: by 10.99.227.81 with SMTP id o17mr20650303pgj.41.1498827630298;
	Fri, 30 Jun 2017 06:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:53 -0700
Message-Id: <20170630125957.3342-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 13/17] kodi: Update to 17.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jun 2017 13:00:29 -0000

link with libatomic on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 23f09af51..19806a12a 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -62,11 +62,11 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "661dd08d221f5b2bf509a696a6aca5ee7d45bb27"
-BASEPV = "17.1"
-PV = "${BASEPV}+gitr${SRCPV}"
+SRCREV = "6abeebd5ba371547c8f04272296433f5e4e28e86"
+PV = "17.3+gitr${SRCPV}"
+ADDONSPV = "17.1"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
-           https://repo.voidlinux.eu/distfiles/${BPN}-${BASEPV}-generated-addons.tar.xz;name=addons;unpack=0 \
+           https://repo.voidlinux.eu/distfiles/${BPN}-${ADDONSPV}-generated-addons.tar.xz;name=addons;unpack=0 \
            file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
            file://0004-handle-SIGTERM.patch \
            file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
@@ -130,6 +130,9 @@ FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O3 -
 FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
+LDFLAGS_append_mips = " -latomic"
+LDFLAGS_append_mipsel = " -latomic"
+
 EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # for python modules
@@ -145,7 +148,7 @@ def enable_glew(bb, d):
     return ""
 
 do_configure() {
-    tar xf ${WORKDIR}/${BPN}-${BASEPV}-generated-addons.tar.xz -C ${S}/
+    tar xf ${WORKDIR}/${BPN}-${ADDONSPV}-generated-addons.tar.xz -C ${S}/
 
     ( for i in $(find ${S} -name "configure.*" ) ; do
        cd $(dirname $i) && gnu-configize --force || true
-- 
2.13.2



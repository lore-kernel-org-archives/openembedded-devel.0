Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 777A56A441
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 15:36:05 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m3so8016133pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2019 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=juMEMxiIjeBNohHCt36HvN3aW56YYt5AFo7HAodNU5w=;
	b=HI146LF7mB9D6vEVgL6KmGcbz2uPaiCFcxb071yFwpMlSngaI3bi7JZxYNUeexKt9+
	qsUTSWtEmmrtkRBrhttbpUTfnI27/GnI7QNBCXSF5hwHTd2vvoQSnYf+71znMVqoxSla
	KODykSlxe3rGpZV0jm6ToPclZBGFO2UVGr/FacAyd2Gq83ZJ6eddY1X5M7gda+iXCBoc
	evLc5dYeob5flOpIPx+l1nTLubcmEUmdAjAegvM7j57DGSAWDZ621SPjpKgvzvkwyJ2K
	gZC0GSU3Cw4cWJXu10774UvYls40xE82Wh3RCZpqAZjJWrd3p/WsYd4WHg6j1xpCMMj8
	eVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=juMEMxiIjeBNohHCt36HvN3aW56YYt5AFo7HAodNU5w=;
	b=By+HldPjVlo/Q4UnAITvo3/ZjMLP60VCU+2JwhK16LelB/zuFIy87UOy0I3q+wZ5d5
	GI/+64SKB7GjdX9Y9J8SdbHv9OFKmiaHAdbPls8DtJx6WdBRvpSYdVkDy4SnDTBxHdLU
	qXuMeZ/xAAwZ9noEVo60cYhudb8xbZ0O31ncIEsHQzksc3wWgu/Qgk5fKnKfATtE1Qag
	2aVa9BGHwFMLvZt0k8QDEZ1Kvsg+ie+9NefRTuaXxQu+INA5XF+GmBuUSEOzOxtxPi3b
	cu00Q8nKkBM2qJ2mwpShsDVGNeTaguZabABKsw2qy+sWAgeRNAsdKFeq5ZIH8/DF30GA
	ib+A==
X-Gm-Message-State: APjAAAUbB073vv8tldGnQUp0s7qEVX1obJFAzxUTzHUUO45IlIWhbv1V
	wknEfbUdsAsEdfpvnsEI33krkhG74z0=
X-Google-Smtp-Source: APXvYqxudgOzmJRZv8NUQLC+bD3kCKD+1+4jA8wF0IENUvebfE+lNXxuutqoNh7bz7rsoINucom5gA==
X-Received: by 2002:a62:258:: with SMTP id 85mr26846556pfc.165.1568043366103; 
	Mon, 09 Sep 2019 08:36:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	w11sm18836564pfd.116.2019.09.09.08.36.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 08:36:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2019 08:35:57 -0700
Message-Id: <20190909153557.2455195-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openocd: disable werror when building with gcc
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
X-List-Received-Date: Mon, 09 Sep 2019 15:36:05 -0000
Content-Transfer-Encoding: 8bit

gcc 9.x warns more

TOPDIR/build/tmp/work/mips32r2-yoe-linux/openocd/0.10+gitrAUTOINC+7ee618692f-r0/recipe-sysroot/usr/include/bits/string_fortified.h:71:10: error: '__builtin_memset' offset [509, 512] from the object at 'buff' is out of the bounds of referenced subobject 'reserved7' with type 'mg_io_uint8[186]' {aka 'unsigned char[186]'} at offset 322 [-Werror=array-bounds]
|   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
|          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index df10177ae9..ab2fd7f721 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -27,7 +27,7 @@ inherit pkgconfig autotools-brokensep gettext
 BBCLASSEXTEND += "nativesdk"
 
 EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html"
-
+EXTRA_OECONF_append_toolchain-gcc = " --disable-werror "
 do_configure() {
     ./bootstrap nosubmodule
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/jimtcl/autosetup
-- 
2.23.0



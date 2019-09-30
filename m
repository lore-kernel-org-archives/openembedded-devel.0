Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B16B7997D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:37:43 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e5so3390949pls.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chcj5M/TjN/hAUTNDozSaETdYa3bdOTzj8GJ4HdGR9M=;
	b=bM+wyv7Myr8kZXIkivwQgy1TWfZ4Q53cWyzlA3OfovCsps2TP/lPW+k421V/JcC9u0
	b+lSyB6Uq9/JKATFdsCPB/03Pb88lyKbPQf6kKifMpz/MGv8kLGjlZ2/v62ZEWxRBi8E
	rYRK+MhUO+PXm7ApnHwcUN+QggHLq6pfk2M6tYdQUYCHCIGQ38GXRYPCL2CdQi3SKB1m
	V9mDvNSeB8epTptFyRzLY13xG9Cgbhqs3JdWumG/mnmDG505KQT13AMugEdeNfubJdnP
	TexkDmL4CwnVUMvuD4qEfkOl/v/pn3uUlsohvEKHVYWTkNyugubQ9YE5NfO8ps/PQr+G
	56ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chcj5M/TjN/hAUTNDozSaETdYa3bdOTzj8GJ4HdGR9M=;
	b=oaZBsDPtO2IWmohHzt7yFZ86WMTWGWxkdrDyK/fczvdxVjyNlYeRykQOuEyEBs1e+n
	Xjg/ElC3XosgvMeacoJD5deCB4Rm/J/gioST+rte/6+QkwubWXdY8mlFjv6T2SgZ+Osx
	gVgkZN87pbVJ+LCsLwsVFtbXN499iMmf9Kq5MSSAGYSyXJelWG3YeT6KrdAosT87Nu7W
	8rO1E8CJcC7u9Rb2Ryy/AJasDOjZQjiBrkJya7w43v59O9l2FfLDHL+u8lPFskCnGkKX
	zcSfIehZ6KNZsQgiKjr+/YWe8q7MOeuS1J+Tny+DmKYgjY52s74eWkZMxl4816wDPHrp
	3Kxg==
X-Gm-Message-State: APjAAAUZQGlB+GkExf/wrkspKDr0b60wHRIgEWL/sMeIt85z9bqlSgqx
	4qhatWr7CZgg+Cwe4i6WPgCMep9DWsM=
X-Google-Smtp-Source: APXvYqyDVZggwLQNgYq5CrL/chOgLq7uIpye33IYW6ucUhgbsGKpamUeMEWywRAc7o4qm0LOy249Ew==
X-Received: by 2002:a17:902:7b82:: with SMTP id
	w2mr980278pll.118.1569818264127; 
	Sun, 29 Sep 2019 21:37:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u31sm22513345pgn.93.2019.09.29.21.37.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 21:37:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:37:30 -0700
Message-Id: <20190930043733.2840975-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] ttf-gentium: Use OFL-1.0 version of OFL license
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
X-List-Received-Date: Mon, 30 Sep 2019 04:37:44 -0000
Content-Transfer-Encoding: 8bit

Add licenses/OFL-1.0 template

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/licenses/OFL-1.0                      | 99 +++++++++++++++++++
 .../ttf-fonts/ttf-gentium_1.02.bb             |  2 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/OFL-1.0

diff --git a/meta-oe/licenses/OFL-1.0 b/meta-oe/licenses/OFL-1.0
new file mode 100644
index 0000000000..2a36aea25d
--- /dev/null
+++ b/meta-oe/licenses/OFL-1.0
@@ -0,0 +1,99 @@
+This Font Software is Copyright (c) 2003-2005, SIL International (http://scripts.sil.org/).
+All Rights Reserved.
+
+"Gentium" is a Reserved Font Name for this Font Software.
+"SIL" is a Reserved Font Name for this Font Software.
+
+This Font Software is licensed under the SIL Open Font License, Version 1.0.
+No modification of the license is permitted, only verbatim copy is allowed.
+This license is copied below, and is also available with a FAQ at:
+http://scripts.sil.org/OFL
+
+
+-----------------------------------------------------------
+SIL OPEN FONT LICENSE Version 1.0 - 22 November 2005
+-----------------------------------------------------------
+
+PREAMBLE
+The goals of the Open Font License (OFL) are to stimulate worldwide
+development of cooperative font projects, to support the font creation
+efforts of academic and linguistic communities, and to provide an open
+framework in which fonts may be shared and improved in partnership with
+others.
+
+The OFL allows the licensed fonts to be used, studied, modified and
+redistributed freely as long as they are not sold by themselves. The
+fonts, including any derivative works, can be bundled, embedded, 
+redistributed and sold with any software provided that the font
+names of derivative works are changed. The fonts and derivatives,
+however, cannot be released under any other type of license.
+
+DEFINITIONS
+"Font Software" refers to any and all of the following:
+	- font files
+	- data files
+	- source code
+	- build scripts
+	- documentation
+
+"Reserved Font Name" refers to the Font Software name as seen by
+users and any other names as specified after the copyright statement.
+
+"Standard Version" refers to the collection of Font Software
+components as distributed by the Copyright Holder.
+
+"Modified Version" refers to any derivative font software made by
+adding to, deleting, or substituting -- in part or in whole --
+any of the components of the Standard Version, by changing formats
+or by porting the Font Software to a new environment.
+
+"Author" refers to any designer, engineer, programmer, technical
+writer or other person who contributed to the Font Software.
+
+PERMISSION & CONDITIONS
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of the Font Software, to use, study, copy, merge, embed, modify,
+redistribute, and sell modified and unmodified copies of the Font
+Software, subject to the following conditions:
+
+1) Neither the Font Software nor any of its individual components,
+in Standard or Modified Versions, may be sold by itself.
+
+2) Standard or Modified Versions of the Font Software may be bundled,
+redistributed and sold with any software, provided that each copy
+contains the above copyright notice and this license. These can be
+included either as stand-alone text files, human-readable headers or
+in the appropriate machine-readable metadata fields within text or
+binary files as long as those fields can be easily viewed by the user.
+
+3) No Modified Version of the Font Software may use the Reserved Font
+Name(s), in part or in whole, unless explicit written permission is
+granted by the Copyright Holder. This restriction applies to all 
+references stored in the Font Software, such as the font menu name and
+other font description fields, which are used to differentiate the
+font from others.
+
+4) The name(s) of the Copyright Holder or the Author(s) of the Font
+Software shall not be used to promote, endorse or advertise any
+Modified Version, except to acknowledge the contribution(s) of the
+Copyright Holder and the Author(s) or with their explicit written
+permission.
+
+5) The Font Software, modified or unmodified, in part or in whole,
+must be distributed using this license, and may not be distributed
+under any other license.
+
+TERMINATION
+This license becomes null and void if any of the above conditions are
+not met.
+
+DISCLAIMER
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
+OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
+COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
+DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
+OTHER DEALINGS IN THE FONT SOFTWARE.
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 6a6258add2..e030bd1907 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "Gentium fonts - TTF Version"
 HOMEPAGE = "http://scripts.sil.org/gentium"
-LICENSE = "OFL"
+LICENSE = "OFL-1.0"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
 LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
-- 
2.23.0



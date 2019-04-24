Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8557D688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:32:00 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h126so4945971lfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Kedb/3JA0E0REZLgUMViFlTZ3RU6oSVsk/cMnBwyZlE=;
	b=csyNbjDgGvQbkDYU89Qx7RwIcizUdDCAyOw5RzncRfhXYWqg1cBTY5QK2eOnxiWOKT
	PcI3pge9tAfYtc/9bW9porE34bT2CWjo996gl635kbAbbIpqR8fP3xoNPsat2pEnsgAi
	+PY674PyvWPOLcX8LtP4OUJEI1NeNnUtZZ3Sx8xbqsj1dAkYqY8XLD4KevrFQ9puqJuZ
	3a73DUJwowziThk1Bzp/l+C5+OFpA7D+YD2cTGWGc1+SvfHT/n2nP+m9eV/W/BpDAce8
	oPDwOLD+GyCq8mjQuFgot09PdDLxwnBEqvwDawqthWQJ6214Ly0qjml9Z+ud1f8guTkT
	tsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kedb/3JA0E0REZLgUMViFlTZ3RU6oSVsk/cMnBwyZlE=;
	b=Jw5mKkIiyTvAt/UGN47Hdt3QazQZFb5g/+tD3/vxcDw9ykrvpyezsQc0GHan+RCuEv
	VCCS7OWKICFO6lDV5IoVixvW/i4JotynW7jzRSaKkJM4+g+Ves0Y/PiNWMvpbAO53pwn
	8Lmikt/aij/VT8j76gI8fBUAiy75Q5kJtQAXzXu7fFniuYGxNam0+3CzLPxs5K5jXDNT
	J/PFtRZAdGKKqhRDAtjaxwrPpqSMRV/PklyurcFbFyzSXu/A56iJBEEniIRZwHF5fH4R
	CXrfC1Wa7MLn3GUu1j1CqFww0ywcmNrMQddjzZ/Ao+q/+oRWvATwHwajl1BcbvEvFlDY
	y0NA==
X-Gm-Message-State: APjAAAV5b6AKEVEWztG02WQLoyIDMf2VvoFiOgkBOqwmXHImzEEhFxFo
	kXglc8T1Wlv7uBvGd4nVOuQWqlxlWsg=
X-Google-Smtp-Source: APXvYqxRIf2rPk5eJllvCM3r1luyxcQOcfYR0odXCWk08hvx1MnIQt+jG33jP9LG1WGmWycsyd1Bcw==
X-Received: by 2002:a19:4f19:: with SMTP id d25mr9291470lfb.124.1556134321175; 
	Wed, 24 Apr 2019 12:32:01 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h6sm4398236lfp.1.2019.04.24.12.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 12:32:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 21:31:58 +0200
Message-Id: <20190424193158.31274-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] uftp: update to 4.9.9
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
X-List-Received-Date: Wed, 24 Apr 2019 19:32:01 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/uftp/{uftp_4.9.8.bb => uftp_4.9.9.bb}  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.8.bb => uftp_4.9.9.bb} (62%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.8.bb b/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
similarity index 62%
rename from meta-networking/recipes-support/uftp/uftp_4.9.8.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.9.bb
index 0bbdd6b1d..a64d081cf 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.8.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
@@ -1,13 +1,14 @@
 DESCRIPTION = "Encrypted UDP based FTP with multicast"
 HOMEPAGE = "https://sourceforge.net/projects/uftp-multicast"
 SECTION = "libs/network"
-
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "f7a5affd3000b5aafbb13df49719b6c0"
-SRC_URI[sha256sum] = "e98c6318e497124d777ca71eae752d213207c35de9f782c8bcaaf82ece20e599"
+SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
+SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
 
 DEPENDS = "openssl"
 
-- 
2.17.1



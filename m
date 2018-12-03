Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFD936C56D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:13:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q1so6934137pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5FaL11dTu/wbWNSaKDURPSCMySs9VFcFK0xK1oUCCGk=;
	b=LKBky1bxMbjoKTEz9CerMJVNiJoL0EOfF2XzinKghmH38VUr6l2ZrvmPWS4qahBNUF
	/o28NkkRT8zu2CnbsKkaH8qwt6wjYpuFFlGnx9Prx5WTdk9ycUpmAqvMC5B4tjY8+9r+
	mTpjajOHwLalPvOdoeCqFoUF1djOkFgT6bqGNXOWFEx3RGDfyq/FSv2XCmP9OcEYm8z/
	gtDqvlxcBAehkK76sKTCujAlBDyPGFO/ZtGLx4r1s9AJLtuR5S0Ig2ReifiqanxHojVn
	1pjwKDSoPbzrL1439MgjHVMlk+qG6mO5nX5RYje7iSS93tLw0Xjh+6po0Ird9F8efVeH
	J9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5FaL11dTu/wbWNSaKDURPSCMySs9VFcFK0xK1oUCCGk=;
	b=LGBz4EGF0FnD/+lyxXvt4O79QSkVT18AiFOL8cXV3zfUojXnkQXhR2iUtLBJeI6Zzg
	NIaX1UDntqbGoKSBTAjs8AoVwILlFX+ao0LibK7/jxrP4zvopMyYC/vntCRS6XGxGZ4i
	LjmutT7QnJXeE7nmfeDunkMbBHzLoqW+LKqO/8Q0ByteHKSn1j1vQWRqZvXNROaUqQQt
	XQz2k1HJ0yWoNl6x+Oe47Gjb2ISHjSfDpXj8lgCk8gbC1cJ6aEUdEnrlHLowibUANXUi
	D2G793gmhCIu1nRdXNCarQOZTLp33/+17rPtGVefig5WacmjZTrSVJ45yCFK9eFqNRa1
	zyQg==
X-Gm-Message-State: AA+aEWYZyOCMOT20Km2+/zZYIW+zPsjoCBaylbxPVqZTHP59NsK3zUUI
	7zfxmsD31xKCm9ADgi7z9mY/PRZZ0vI=
X-Google-Smtp-Source: AFSGD/UMPGhIToASoBZUUBb8NoAmuziqZr7jdg/6uRfoVytEM8vqsZsg8FaSrc2isOOrXLcjUXKT/Q==
X-Received: by 2002:a65:5088:: with SMTP id r8mr13990667pgp.15.1543867983439; 
	Mon, 03 Dec 2018 12:13:03 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	z191sm16769677pgd.74.2018.12.03.12.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 12:13:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 12:12:50 -0800
Message-Id: <20181203201250.23144-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181203201250.23144-1-raj.khem@gmail.com>
References: <20181203201250.23144-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] a2jmidid: Define own do_configure
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
X-List-Received-Date: Mon, 03 Dec 2018 20:13:03 -0000
Content-Transfer-Encoding: 8bit

waf script here does not support -o switch so define own which can
be run in B

Secondly, ensure to use python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index 59b73f8e8b..7dcaaf6828 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -23,4 +23,9 @@ LDFLAGS_append_libc-musl = " -lexecinfo"
 
 export LINKFLAGS="${LDFLAGS}"
 
+do_configure() {
+    sed -i 's|/usr/bin/.*python$|/usr/bin/env python2|' ${S}/a2j_control ${S}/waf ${S}/wscript
+    (cd ${B} && ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
+}
+
 FILES_${PN} += "${datadir}/dbus-1/services"
-- 
2.19.2



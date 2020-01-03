Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81A567F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:33 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so22778752pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H51H9lIdEkbzU2eTpu9llbfow7R0dBkPTVY42ZoNc9k=;
	b=t3ZoDd6viiPs/qOopXHoYgSnn78zKGATWa5nR8TVFL6zM+UpCsNTPoFClLN9nI5W+Y
	RTCDxgSNc6lEE/+GdZaF3tzu8tEjr40Gk39TUY2f1F7lTzKuQnCkM2WKsPWY/Wn36+em
	A1ObaOEJmVVJVgguMrlkEzvgahptVUqFxmA8rFbsFyzq85IdIgXHFNV4EZdnZo0nSRhk
	Zs8bMVxXLRYCBUUEreyc3k/orAKD6nkVE+KyaORGSQz4do11kuAo3FLDa2bAYxNk7iY+
	SHrMPGzefBQnb6lDL0XIra8WfprObhm+vHT+Y9vr4B8Bm7RiejrkjcSckAtk4McpBejD
	d3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H51H9lIdEkbzU2eTpu9llbfow7R0dBkPTVY42ZoNc9k=;
	b=d1Nxb3Ofkjk4GLW1d9SqeEwYupWUzJwaHMbNqpw+Tdzibbcp0zWnUm6c0AmDj5wVoK
	u4Uac8fqxLkqTpjfCq1bcll3QmyLAfXh3A02kOwBL/mkviy+0RCE3dEsinnnNflO35VO
	166Z7mTJ3UyKx7mPcLf87QqUubPAeliAeADNLkrcOMJ9gFI1oQfWKEpizG98zAP84RdO
	vCYWZQ/EyxwrKwonJesXP0kQpPRzSenl+RXNgC9lJFBMikXHxh5J52DG51P1hoCLoRoe
	DfA2pWAHFOoOl4q5OR8npe1wxW5UttV/YGMSZVAf2xgQbk2GqFMjehb4m7ZLkiqmt2br
	e7UA==
X-Gm-Message-State: APjAAAXTgYEMJIpBRCjGp5lnHivG28JR+HJfOCVUHV6xrNyonaO/A5C+
	gH9LuQSaYPMNGhkNSKux52Fs6uW5ws4=
X-Google-Smtp-Source: APXvYqxu+dc+NoB8GtOIbLlKdBc4/q9Yrpf+k5SoS5NRVU9cVESX7K+Bsc72RxZPE/m5N9Fc27D22Q==
X-Received: by 2002:a63:26c4:: with SMTP id
	m187mr94511749pgm.410.1578019774687; 
	Thu, 02 Jan 2020 18:49:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:00 -0800
Message-Id: <72be883fde3b707ab9bd20039c61c1296933fb28.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 03/17] libqb: Add --enable-nosection-fallback with mips64/clang
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:34 -0000

From: Khem Raj <raj.khem@gmail.com>

Same issue happens with clang/mips64 so extend the gold fix to cover for
this case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd69fafd7f2c51fb69df66dbeae7f5a4b092580c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
index b205186e0b2..82503a168b5 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
@@ -22,9 +22,13 @@ S = "${WORKDIR}/git"
 # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: error: conftest.ld: SECTIONS seen after other input files; try -T/--script
 # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: internal error in write_sections, at ../../gold/reloc.cc:791
 # collect2: error: ld returned 1 exit status
-EXTRA_OECONF_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' --enable-nosection-fallback', '', d)}"
+NOSECTION_FALLBACK = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-nosection-fallback', '', d)}"
+NOSECTION_FALLBACK_toolchain-clang_mips64 = "--enable-nosection-fallback"
+
+EXTRA_OECONF += "${NOSECTION_FALLBACK}"
 
 CFLAGS += "-pthread -D_REENTRANT"
+
 do_configure_prepend() {
     ( cd ${S}
     ${S}/autogen.sh )
-- 
2.17.1



Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD15D7FEB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:48:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so344409pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=R9gmQxaqli4c/cy2MeWSzUYbNDknSmhJCEpKwdniNxY=;
	b=magmKimnESBal0A7j+a3tEFoHgclYNk7Vwz5CP79L3yp6ZTNSGItxJVSn7j6OSYq9b
	C/6G1gFSYEyx5XgsVQWeQd8CWP+aEwGwhIgShzOuy/6Gqvb2yiKwQHuc4oumtJgs5sVT
	8zMhvjN87xesPtj+5TAbxJn8IZiRJ+E5Y8ShDzdRh7oAugf9LE+3TISm2xFVTO/bY/RC
	H3eGwmaQM3oDWJl2HRw5PnskyQlsxd74acMsNari+7BTH9J9mNC07DbYOigSicBMJbkF
	mBvi88ADNKo+P9JCtborVpgqhu+7OZquPLkVyH5Cnu7viF3mX1tRazagLxecEOwouPE5
	5ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=R9gmQxaqli4c/cy2MeWSzUYbNDknSmhJCEpKwdniNxY=;
	b=BIrj/6Y4PIbIVxw74mddyxMQiH1DqlINp5JgmtXbUTkgPpls9Fm8vox8oQ4+k35WCd
	dYwIZ1foIqT4V4Q8iW1iAdyEMpsNrDa+cb/OJzCdtousGf/t5iG/oVPlKwbNFmfmW30V
	5BbqYN2REI6hVlDnTgK4iOBH4e5XIcX6d+SQrwYp3qMj0GADu+zXU9XMNqDZGn6uC/oO
	7zb16dwpmszHoBkoETm05IwiKS+miTCqY7RF+ZWtRDDGwGD/FwnyWgjw+QmtK13bzw1f
	lQsv+hw10xeXAdPIs06DxcphTqiK4GwTyI3nqFxrKBn1r4VMkAqMD02ygswaxpQ5lf6u
	qiHA==
X-Gm-Message-State: APjAAAVvuRHEzklsqjyFn48yoJoJvpYkUzzJeWavurIQnMhgAqiIso1h
	91TquGppLj2gYHXuAOGGg2CbVEOGFTQ=
X-Google-Smtp-Source: APXvYqyoBlb7r9E3eN5n8/uhKI0+AiWeadJAKAWq2sEa3S5qXdpL1o0SHfhtW33ttYtEvcnWt/ccQA==
X-Received: by 2002:a62:7c58:: with SMTP id x85mr358694pfc.76.1576637301642;
	Tue, 17 Dec 2019 18:48:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id o7sm506370pfg.138.2019.12.17.18.48.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 18:48:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2019 18:48:09 -0800
Message-Id: <20191218024810.2874990-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218024810.2874990-1-raj.khem@gmail.com>
References: <20191218024810.2874990-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] libqb: Add --enable-nosection-fallback with mips64/clang
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
X-List-Received-Date: Wed, 18 Dec 2019 02:48:21 -0000
Content-Transfer-Encoding: 8bit

Same issue happens with clang/mips64 so extend the gold fix to cover for
this case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_1.0.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
index b205186e0b..82503a168b 100644
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
2.24.1



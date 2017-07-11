Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6404577EA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:23 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id c11so6720203wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b//SQC1O5UdI1Ev0HATWqfvnQRjSpiRDIyhgA+U8Lw4=;
	b=OB/ahA41Olb59yq88K/AEkLpPay2WibqWP5h4wJTfXi05dOBXcTRwCyj6yuzsyhCx1
	/dlrp6m88dsTbyFHcV78ndFisVvE1G6xFr8edp5f3sx4Vrgh0qYpPz+DaO0d5LNZvZl1
	YDHYHrf6fOuSe7os8D+ppl97DixFFDSA28qCx8hMlxdBo447LCHlly56KDkON6Lw6T28
	puYT/uR9mmwHkRMbY4jIiZ3dZNEAS+QBbl78NkrIoEiTiYu4lHLlG8KmcewfTu9+gy1h
	HVvsZd/s0MaIjeJCFv1Lh1YPW4NTjKJ98kR2rAIBDvml59c3s4Gi0Tseg2fWf4xJDKO7
	unQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b//SQC1O5UdI1Ev0HATWqfvnQRjSpiRDIyhgA+U8Lw4=;
	b=nD4eFEuMjvzi2LVaCe57V6SoUHKE18yowVA7samSSnzmOz1p6S0YGaKYOgZUFlmacC
	zpnpraasHXwaAAazGoYEAIt+bJnKkUEtpbs6MhDtM02pIzEIPJh1IujONChw40uPz7Iy
	ebSyWm9Cw0eOrpTMFosBE2zJq38O1INOdUuE7rINi4QBbqDaRjeBccjbzNarKNX7WJOV
	8sq3RJL/eZSQJJkQKrfa0j9CWoGoH8QLdX+BhXPFsuD7Ik+o//P/q87JOo3Xt79GDyOa
	lqlArvf/SdZt/CzoG5tXn5KdkPN170fS0+xlk55tJ0ZpSehEe/+7NA+0KDLPiMv/1hwo
	kHKQ==
X-Gm-Message-State: AIVw112KfJXtO/DYCm42FgEGlel+9XKXwcRutRr8QENnM/FMjKtAT7A5
	xV64IukkciYdXqW4JDw=
X-Received: by 10.80.210.197 with SMTP id q5mr3156274edg.147.1499791524979;
	Tue, 11 Jul 2017 09:45:24 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:36 +0200
Message-Id: <1499791478-2407-7-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 6/8] libtext-wrapi18n-perl: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:24 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Text::WrapI18N - Line wrapping module with support for multibyte,
fullwidth, and combining characters and languages without whitespaces
between words.

It's being strongly recommended by po4a.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libtext/libtext-wrapi18n-perl_0.06.bb          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb

diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
new file mode 100644
index 0000000..b2c239d
--- /dev/null
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Text::WrapI18N - Line wrapping module with support for multibyte, \
+fullwidth, and combining characters and languages without whitespaces \
+between words."
+DESCRIPTION = "This module intends to be a better Text::Wrap module. This module is \
+needed to support multibyte character encodings such as UTF-8, EUC-JP, \
+EUC-KR, GB2312, and Big5. This module also supports characters with \
+irregular widths, such as combining characters (which occupy zero columns \
+on terminal, like diacritical marks in UTF-8) and fullwidth characters \
+(which occupy two columns on terminal, like most of east Asian \
+characters). Also, minimal handling of languages which doesn't use \
+whitespaces between words (like Chinese and Japanese) is supported."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~kubota/Text-WrapI18N-${PV}/"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0799c16a00926e6c18d400c2e2861d5f"
+SRC_URI[sha256sum] = "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae1741d7941846a488"
+
+S = "${WORKDIR}/Text-WrapI18N-${PV}"
+
+DEPENDS = "libtext-charwidth-perl"
+
+RDEPENDS_${PN} = "libtext-charwidth-perl"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.7.4



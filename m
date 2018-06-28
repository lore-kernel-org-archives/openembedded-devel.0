Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE56E74D0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 18:48:31 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r16-v6so5651210oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=14Eg7IAol5hOJa4YbI6rIzRLstf4ZkIAryM/u/0xhyQ=;
	b=Kt+gi14HbUcEuEZF82WbdUJsmK4AzmXmH4hjxLHoPAlFj83EA4Ivy7g/+pggseP/XF
	NJSH+WovIWo4VT86u9P41P/1Tl/hh6p53RlJRa+VLYRTztJfSeQIOgR1zeJYHVlr3MXb
	eMbsAXhjd1XjKF+BFMLoyVtEVUX/qoT1J3ofAPPcHVu6Ab3Xx1SJNloR/Bnw6Ak1p4Vo
	iVPMkMdKI8jSAQaipAMKrpRfwDdMIMJY78FLty+3KQkutataIwwmU1J9TOxhWQIRNgUq
	A/gvWwxkGyI00jObDOPUeiDpLw/Jb/b0r5N/jLGe8BaTFZaI3rQdqa3NLlg8+tyl/Bo4
	40TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=14Eg7IAol5hOJa4YbI6rIzRLstf4ZkIAryM/u/0xhyQ=;
	b=jxEFqWzYfIv2vB9D99xp1F4ZEB7bSD40Nz4JHjMG5Q3/mctlYrWw/OJCixzVEcnXSD
	m3WpwQoMUJE5mY9Du0tg/TWFbFGUmdzrEm/3E/g+6p6ddugk7tIm/k9aV97h/5w1Vaj5
	GnZsNi1vEO5lN+USkZoElnGGMWUO9mw/pY/MITG3mVxt0M3QMbr3bLM0rVtKnJxeZA/a
	iQ5Dapo25Gt9DyC/+j2ibeumEWBdjKe1VEUywPbofLjWKKFf4MfCidpKEmi/LH+oIoGd
	3xs9tWMpV2PriLfxccdH6qTvIZ60TFxR0i2KtIHZs91xJOLRVtu7IPuga4m0hwKPXwtM
	hl8w==
X-Gm-Message-State: APt69E21Z75wtopP6bYoP2vHZ7XGLFHKyChpcL4pmz88/fXDszuh1IXc
	JZavjiIj4t8n8W3UJ3uuwxYNyg==
X-Google-Smtp-Source: AAOMgpf0TmtgG8S3YsLdBK1xUcqjwPGL3iezQZ8vyz4Jhf250JnkxkGrQfMQuVfF//eJ92agnPCBBg==
X-Received: by 2002:aca:d015:: with SMTP id
	h21-v6mr6283280oig.142.1530211712782; 
	Thu, 28 Jun 2018 11:48:32 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p2-v6sm3495681otl.63.2018.06.28.11.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 11:48:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2018 11:48:18 -0700
Message-Id: <1530211698-23398-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530211698-23398-1-git-send-email-armccurdy@gmail.com>
References: <1530211698-23398-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/2] protobuf-c: misc recipe cleanup
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
X-List-Received-Date: Thu, 28 Jun 2018 18:48:32 -0000

Re-order variables to align more closely with the OE style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
index fe1e6e5..9b69690 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
@@ -8,15 +8,10 @@ has been split out into the protobuf-c-rpc project."
 HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
 SECTION = "console/tools"
 LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 DEPENDS = "protobuf-native protobuf"
 
-PACKAGE_BEFORE_PN = "${PN}-compiler"
-RDEPENDS_${PN}-compiler = "protobuf-compiler"
-RDEPENDS_${PN}-dev += "${PN}-compiler"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
-
 PV .= "+git${SRCPV}"
 SRCREV = "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
 
@@ -26,6 +21,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
 FILES_${PN}-compiler = "${bindir}"
 
+RDEPENDS_${PN}-compiler = "protobuf-compiler"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1



Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 94D4074C06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:16 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id e20-v6so3653307itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZanyU0Ovr7FlZ7r8Vipx1pD+KwZ22Q+yQ5V481YCtK4=;
	b=EPp4DXZtkY3K6pkQjTWkBSAokNsWWTCUgi1T4+MLsVupM8o04xNYUmxlI+K6fn/u2w
	dSX9QfbdBnlKuQZkXxYNhNQfwMjxegyMbsFNuzwnmmctEJfrLw0BtoofxqLMeoNAA7D/
	YcNgf3wxB5vfcjCRfks0SP64gI7f4mooeaARkP90KIciDRigRNnIpdCRGO9/TezBeo+0
	z3E2mAd3RL3oh69gKMtJuD011n014HJTNXYoPk/oif80+pTALPoYo3+y/FReFPIglm6p
	JwvvrhyCvxPSRCHsXGVzNWzPLXATBAlWyRoqSWeAEOg45zX4CphrEaNO6qrO1KrWoDU7
	CAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZanyU0Ovr7FlZ7r8Vipx1pD+KwZ22Q+yQ5V481YCtK4=;
	b=NbIZtwgt2cdz6Zfy0zyEC2+r4JktEzkTJ6LASXv7V0zpfaJPcYlV7kIfPnu2HdxHCA
	ihhc5MoH96ZiywFzUYbMzcdKDijfGQ4SK/smHukkNGXtbArEp/c4qvuSBJoDNg1z9i9V
	JPXVAN/1spiVE/Qt3nTBYd22JlAhuHBfMmssQovnZjTAD9GQgOVZe43XjTGBdefpRg32
	43q9UrGjOkLITYFmxQKJclBm0P61GLhzGd1BsqjSvVj3VWditHoQRK+jnkqb71tL29Za
	DX1E4bc/ouOylM1vd3PO68I7wNef5ZNGtzvq2xSj/9daehFArtefJX1RS/RzSfy3sORM
	fa2Q==
X-Gm-Message-State: ALKqPwfJ8TBkW0GW4UIvFcHS2Fb7PTgHHhmm9sgB5YvCM1ZGGsetvbYK
	wxgfzG+oqDlwv28p/cvLCVSblyeS
X-Google-Smtp-Source: AB8JxZrgFmp9p0Izgsh0WzOZauAMZYNg1zMZk/og54Z5lIQBHs1DTI11zTJzoFcpLWsPWcA/HWlcDg==
X-Received: by 2002:a24:694b:: with SMTP id
	e72-v6mr10907926itc.38.1527186437067; 
	Thu, 24 May 2018 11:27:17 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:51 -0400
Message-Id: <20180524182659.19986-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 03/11] libftdi: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:16 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index a1576b5617..98c5995a5f 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -3,7 +3,6 @@ FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
 including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
-
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM= "\
     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
@@ -13,17 +12,16 @@ LIC_FILES_CHKSUM= "\
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
-
 SRC_URI[md5sum] = "0c09fb2bb19a57c839fa6845c6c780a2"
 SRC_URI[sha256sum] = "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74"
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
+inherit cmake binconfig pkgconfig
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=off -DFTDIPP=off,boost"
 
-inherit cmake binconfig pkgconfig
-
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c



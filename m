Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 400C27FC22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:50 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b9so5713635pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YyxFi+iBWMY6gpJpuizCNI+9SEoYmu1NQUzJGI9LYIo=;
	b=uVTZsYXenhbLoH/y+XmKMEmQP1wjM1uI0uyrgkdSqE4lJbXRD9YorejTVZmOavQv/7
	9BbsTcFrh/ygSvV6WRWMRW37VLGx81nYgwQ6EqjbM4/mpOaPXiUeogzppTT+SojqcsnW
	c77I+PjRPWzD/3bWisqcoBjf1el95fWOQovXtsiTIpdyPGxVzTWUmgsLYNr3DOd3xrrs
	WIf24Lw0yYMph0O0y65ELqZ+TeA9nFF8E0itOBhxVUGuBZKWT01NU/K+UN9fy1heKIlU
	hDKmQ62ja/7ju0C+LIRmuP43SpJ+dKUCCIW4qpH9tELut7MfUku5baTQZoOFtaPhb56e
	/E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YyxFi+iBWMY6gpJpuizCNI+9SEoYmu1NQUzJGI9LYIo=;
	b=k9vK8eh9ZIJxOzSnAHKmbp7HYfE1sXvcfYb56l+VHFZC4ctahgfpuXnbV+8/sgqjCW
	NGui/56lHaYikKyWjmp6N1JEA1JCOmGBqH6PvMpRlVSvG5ExYkHDwqKFOANCJrQjt5LN
	SLblqyDyzjaXMSoFQxY9lsIGPpQ/32i2LApqgcVLkSaYZwKN8yNKD66slrYMOsurHQga
	KGqRZM0wRtSA3Hox5HiKKhVD/SP0Wdex1IDWxMyqLcUeO2+XYqN466jfiIqIoLU4sdoU
	ZIOh78/RCLtBUVUxrpdU6o+yZt96fdRKoa/bHvXmYhW2wqU81zx8Mpe5uiEssh+IQ493
	r/Ng==
X-Gm-Message-State: APjAAAW7l2EWWuxFzB7jHOKyAIbzp3d5fNZbgYiH34xk7Bjwv+jpzXYZ
	xhYFFxZaCAFyV7XsmG1zd+jkk7M+KBA=
X-Google-Smtp-Source: APXvYqzsZHpJjL/8XO+VLDrDRT4VoO7IoGfrt1RSHrROptgSm1f246TMisYEX8grDP2LISbMugPd8Q==
X-Received: by 2002:a63:fd10:: with SMTP id d16mr17523544pgh.177.1576886810821;
	Fri, 20 Dec 2019 16:06:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:19 -0800
Message-Id: <20191221000635.1573390-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/23] mercurial: Add python scripts into separate python package
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
index 0fec4d1f17..6dedb02aa3 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
@@ -30,6 +30,9 @@ do_install () {
     oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
     sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/hg
 }
+PACKAGES =+ "${PN}-python"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
+FILES_${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
+
-- 
2.24.1



Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 47A777CDB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:55:08 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id u7so19549855qtg.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 09:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=ZRaqk/JUpz8p6y4sw0QH77bCmdlJtlsvrhTYOfzzau8=;
	b=UVC6yvQlmTWqGAP8XSUw3Kmqcs4yh9opRTgEyYV3XTtbugYK53dQ1GSHvLavGSCiRk
	tTn4xEdDDYGIZUoM8Zkrtcu2OcYRFN80L/iCX5Yr5QZOcLg4VKjqlFm00HxKPvhSiEtv
	K0kIJDsKYRXRRlsHXLtig8GQOGEO5EGaSE/XVywg65IxK9EDKXwphhjVLomNroCDmMsm
	ztJR0jXECuVvoeqIZ2e6DAu/1t5adBzfstnumgOWDs0CcQFik8ZH7+n9enC9nzOPVJkv
	KKwzeGB5rOlww8ll0dqMvfMqIrHJ0DR2NKp2mzcDhUpWZRIM33RmC7RMUnyDzQIJyxHv
	9h1Q==
X-Gm-Message-State: APjAAAW5GMwCJho9xsyhtI1EtPT0s4pVNrdPY6+ZrkddtyYW+UV1DhFe
	QE+xgWCuEcv1u9c7XUtDOvUenSig
X-Google-Smtp-Source: APXvYqxCDvoJUuOnamWaE4rOjK/QFL1oKcbqQHqMFj2xIMKBkVL1JL/NmSHnlHG+Nkuxt2lRzDqyYQ==
X-Received: by 2002:a0c:8698:: with SMTP id 24mr4856519qvf.188.1551462908775; 
	Fri, 01 Mar 2019 09:55:08 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	c12sm10467830qkb.86.2019.03.01.09.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 09:55:07 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Mar 2019 14:55:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Mar 2019 14:54:57 -0300
Message-Id: <20190301175457.12210-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301175457.12210-1-otavio@ossystems.com.br>
References: <20190301175457.12210-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 2/2] python-idna: Upgrade 2.7 -> 2.8
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
X-List-Received-Date: Fri, 01 Mar 2019 17:55:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-idna.inc           | 4 ++--
 .../python/{python-idna_2.7.bb => python-idna_2.8.bb}         | 0
 .../python/{python3-idna_2.7.bb => python3-idna_2.8.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.7.bb => python-idna_2.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.7.bb => python3-idna_2.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 519812ddc..13b0cdb62 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=782775b32f96098512e283fb5d4546cd"
 
-SRC_URI[md5sum] = "0e5bb69018ddef1b9d95f681182be82c"
-SRC_URI[sha256sum] = "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"
+SRC_URI[md5sum] = "2e9ae0b4a0b26d1747c6127cdb060bc1"
+SRC_URI[sha256sum] = "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-idna_2.7.bb b/meta-python/recipes-devtools/python/python-idna_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.7.bb
rename to meta-python/recipes-devtools/python/python-idna_2.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.7.bb b/meta-python/recipes-devtools/python/python3-idna_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.7.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.8.bb
-- 
2.21.0



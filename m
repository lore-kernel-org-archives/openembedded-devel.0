Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id DFFE37CBED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 21:19:38 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id y15so2007211qki.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 13:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=H1fXPImfB0A5mfuLYcsjQVlnKlgIwN/lXVcvbw7ONK8=;
	b=KQGO5ricqU96/Ca3l0K2N9oaUgYUL3PekL84DPUjkydQGNHfK/oEdLLvbuHNVF00DY
	8d5QRoCLi6xWDEctNG2kbIlZB82Entbv9q56vdyCQjpU3i1ufSxWIXQ86f4SBMvhWnz/
	+6xF0SG856zuK8raIJdo9AcZmpG1z8tf9YbnondhUa8flLr3hCCp9T9ktETB6lY6BPpn
	T2eDWFwrfyEa8fbrpllwtwKYwdkYt7t7250KCyUnoo74/CWFgKhBHGi7taOjeYHyBGsY
	ZMI+VIIYbXoyu8H0cxhMvzqGnUZ2Z7vAQxF5U3vNYhKJ/aY2J9mVlffmtCFr4eVTT2ts
	2VpA==
X-Gm-Message-State: AHQUAubvDeMF0m5sM91Qr3/S6x2NiSGTGIv299d3Cm6kTi7WVgMuU8Ij
	CNhWkSQMymgUr3vWJLYIu1sCKFb0
X-Google-Smtp-Source: AHgI3Ib+Q2j7O2FJ8YCeh309HGC/h06odv+QzhGDGI/LxxcxwuTdCNeKWjEho8rsQgHDS78cbr4NZQ==
X-Received: by 2002:a37:b482:: with SMTP id d124mr4656731qkf.168.1550870379510;
	Fri, 22 Feb 2019 13:19:39 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id 46sm1493611qty.59.2019.02.22.13.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Feb 2019 13:19:38 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 22 Feb 2019 18:19:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Feb 2019 18:19:26 -0300
Message-Id: <20190222211926.19877-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222211926.19877-1-otavio@ossystems.com.br>
References: <20190222211926.19877-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 22 Feb 2019 21:19:39 -0000
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
2.20.1



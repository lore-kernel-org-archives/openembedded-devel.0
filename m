Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7B57CA88
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:00:26 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id y4so10476459qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 06:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=H1fXPImfB0A5mfuLYcsjQVlnKlgIwN/lXVcvbw7ONK8=;
	b=btqNoQf3rm5TEeEoAqa2u+ElAeV0XMqpWz/9vJJJVhqVFrxOMxNMiDDaJJcDVf/tCc
	rcbthZgq5ULzTxtHTZ9JVbXzY7V3M4D4j48sH0kiSZ95vecykCTvls8WY+5lD6y7tNsC
	HUiUedmhsxo+lAVqJW3BPjJ9t8RoRyuGS1wJu+9eRf0ZO5gga38sHjFXjkmTZKhNjEX7
	7qFaKiOhZO+Nci6Bu7Vi2zjgTFkAlDIrtTcppICJ+SdwLdOvqf4RTO5gv1zASE4sJSX4
	sk/xHZNDLPojb1WuLUGP0llDU7J/vd9+vVyCaHS9wk3JoWG3wHPFaywn4JRhrDymwuMM
	ShEA==
X-Gm-Message-State: AHQUAuZuI3HiUpJY1VYKNak6jYxjLwy0sy+x2O2Pcgi2w2+Y6oNt7qVs
	3JYQ4lfPYAKtR0v6CMBx8NEj9Z44
X-Google-Smtp-Source: AHgI3IZhwzu4qSvz6TdUmNWEyOzQHzi27JsdKNU3b++n2oZalx/Dwj/gQy+7/t0QEylIQEvP02XQEw==
X-Received: by 2002:ac8:28a8:: with SMTP id i37mr14132495qti.215.1551103227479;
	Mon, 25 Feb 2019 06:00:27 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	y21sm6526071qth.90.2019.02.25.06.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 06:00:26 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 25 Feb 2019 11:00:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 11:00:09 -0300
Message-Id: <20190225140010.19025-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190225140010.19025-1-otavio@ossystems.com.br>
References: <20190225140010.19025-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 25 Feb 2019 14:00:27 -0000
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



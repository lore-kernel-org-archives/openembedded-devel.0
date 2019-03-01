Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id AC2FB7CD8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:54:46 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d2so28447869qti.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 08:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=ZRaqk/JUpz8p6y4sw0QH77bCmdlJtlsvrhTYOfzzau8=;
	b=ccwhSq4eWqvajFSYnyfNy80o0eOQjcxXKWPkVuxpLqvlhuFqhXIF8LB+tLZgnxDYC+
	X3ACa/ftUGNKhVQRpzXHuIZNcOP6aKA7Ut/OeQQhoSU6R+aZOuWZ/Af5jZ+ENWOHRzBK
	ILJjsc/NlGE/qFvJuahhA6wdnOJAeD1KM15xz0GwrZPo8Rk5w/OWmlAWK9PTYsj0g4/k
	Gw32tfqKMrocUd4o2Y4teKG91t4gyEIDtbNjWRR/WO2eaxWNx7/tPWo2ssPFysoJMYVs
	6t5ThFD7clRd5gL32Zxrk/v4OZAb5UcRqJCdA7OJE2mH1vt1ftruqxBukgaCeT3PqQIm
	h3vA==
X-Gm-Message-State: APjAAAWqsVOiauhINE1M33dbw3pE/cpWss9sLhzsDqC04/xoYTnNMsDm
	+qz/FLJfcVm0ilt1eno2w9A2pXfl
X-Google-Smtp-Source: APXvYqxt6oIz3WjGnfdFppWVsY8drmSUvcaK3/4tQnF4u5E1An0sw9Icuh40q09UdIgSm+U3Yuc85g==
X-Received: by 2002:a0c:b64a:: with SMTP id q10mr4506526qvf.6.1551459287310;
	Fri, 01 Mar 2019 08:54:47 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	h58sm15170793qtb.89.2019.03.01.08.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 08:54:46 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Mar 2019 13:54:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Mar 2019 13:54:35 -0300
Message-Id: <20190301165435.8367-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301165435.8367-1-otavio@ossystems.com.br>
References: <20190301165435.8367-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 01 Mar 2019 16:54:46 -0000
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



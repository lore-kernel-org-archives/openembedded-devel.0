Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 937F378CDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:12:12 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id c126-v6so3971814qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 12:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ptVa7yJtq9QvFXvQ6alZhpqNBfOoeC6B5pU/JmrfXsY=;
	b=KH7LCxmjqz/c+exIDEPZjASaWxYDQEjtgaepm4L7l+PAQjHTOtOwR9PRbBw4waRTGp
	XFSdKsjGCDM1VF37PNV0HBHZeqGEPdywAmA/6DHKE8BJuzgAJjgNWv11ibpsJGGgveUt
	sXi4DoUkeadwByAZUcN2ZvgArIX/3thDwTE0f8T5p4jDfGhjWjR6/sykj7XG4cQzgSLF
	YY/168pfvlS+VIPKjhQAiP1ppXVCd2K7aBtZzZH5QXBBpfZZUiuIo2XX7gCLN2zFLPMU
	PpypzKxOvg0+a3obsdBTWIjZkRu0BierszTyoKrz1j0OAeohuRLPRimKBrn+ieJJHqa2
	dWbA==
X-Gm-Message-State: AOUpUlGJYHUw/VbGYyRGrImJlMiS7McB1jFLhms/ENB2TEOyMeROMNDc
	8jojBfJatMDfSFZj0vAqjgqF+ip7OjE=
X-Google-Smtp-Source: AAOMgpcGxywjURN8SIFtqVDWsLatQTSAu7W2biO1o8dqIU4UDcEEKgBd8U4bsjUbBH+DwEGzeDFxYg==
X-Received: by 2002:a37:d942:: with SMTP id
	u63-v6mr7352435qki.165.1532718733134; 
	Fri, 27 Jul 2018 12:12:13 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm2643419qtq.93.2018.07.27.12.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 12:12:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 15:12:05 -0400
Message-Id: <1532718725-15312-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532718725-15312-1-git-send-email-derek@asterius.io>
References: <1532718725-15312-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 2.3
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
X-List-Received-Date: Fri, 27 Jul 2018 19:12:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_2.2.2.bb => python-cryptography_2.3.bb}      | 0
 .../{python3-cryptography_2.2.2.bb => python3-cryptography_2.3.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.2.2.bb => python-cryptography_2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.2.2.bb => python3-cryptography_2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 64192f8..dbbfe2c 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "17c4ed4b4d0f25adbc576d89071dc92e"
-SRC_URI[sha256sum] = "9fc295bf69130a342e7a19a39d7bbeb15c0bcaabc7382ec33ef3b2b7d18d2f63"
+SRC_URI[md5sum] = "a0f3f563ab1c5c3bc02fae8d4aa3ad16"
+SRC_URI[sha256sum] = "c132bab45d4bd0fff1d3fe294d92b0a6eb8404e93337b3127bdec9f21de117e6"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb b/meta-python/recipes-devtools/python/python-cryptography_2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.2.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.3.bb
-- 
2.7.4



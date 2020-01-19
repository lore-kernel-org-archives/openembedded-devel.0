Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5B07F896
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 17:25:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b9so14261474pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dOMm5CTCCg/nS07eb6dgUL2vZp3b/z6WfEA/IeE32f8=;
	b=dxU9hUmq90JYh3C0KiKsTdCrcxgPhXlwrgdrqJlPXCyfHpjpoA3HhDzEXuMxCuuPtk
	2TfLq3j01onAtLearIIcHyfATfhw2A15vwYav6p+L7SqoYLsdo9kyauPYtsjPMcA/yNf
	M1BX5H0KlScruUzGOshHLVwpgHAM6wxurUoWTlQCZff7lyr14saFXvfgpulIv5CrJWku
	eJDfc9ZywFNlr296roSmiG2l0kzKULvmSNztyZmBAMryLzSD6DBsb1z4HZCljnrlrAkm
	QCEruCbaGQEDzkCU0IEFqSsTV4179q/XKDKbalaj9AW5YLBPHb8GZWBHD4C5PUkoyJAQ
	ZDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dOMm5CTCCg/nS07eb6dgUL2vZp3b/z6WfEA/IeE32f8=;
	b=HbTk0PsIX8eV7e2ZS8LHRv2Sq+pSSk+R6rQd71r6GzlvSyRHRi0BtZ1gxRaUgRuaVI
	p1yjUsJ6yFvUskUE5cRvxOgPBHQ5k/jv4EkoMC/3tsj7Q2rHXCRATojdbyspvT2ZNYcl
	j+V7+EjP4msbGT4adk+WQlFg27fM9FCPRwveBAlRRhYHGnOtjazgpKIgV4ZLRKS2sqli
	9GUYu1NAtgI5Z8pAqd9RUmmvCS/6jRkLwIdtkNEDGmPBwEah0kCLN0IuQ0A2/S84Yy+H
	UOOFvzeV8Xb7h1CFAr74HjMgt6MzV0Mu/XQ0FzZV6ypORvCReTG2a7JpuUdpbGtypYNh
	aTgQ==
X-Gm-Message-State: APjAAAW1twigtyhmKE+8KqqP5yoNLRj3024beX1/UYy3g1G3IldU89qB
	c7HQt8TQ0MkNlgC8OKRG9ik36bLCuCM=
X-Google-Smtp-Source: APXvYqxq9d4N5nwkGVTgMHk4GdGh7xTMD40Bb7UUwxHXj2c6uTImH6IVaZ3Ewe2hCv98ahDPE/HtKw==
X-Received: by 2002:a63:1945:: with SMTP id 5mr57690600pgz.310.1579454740115; 
	Sun, 19 Jan 2020 09:25:40 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	g8sm35807933pfh.43.2020.01.19.09.25.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 09:25:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 09:25:19 -0800
Message-Id: <20200119172519.26681-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-humanfriendly: add missing RDEPENDS
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
X-List-Received-Date: Sun, 19 Jan 2020 17:25:39 -0000
Content-Transfer-Encoding: 8bit

Missing run-time dependencies:
  - python-html (humanfriendly.compat -> html.parsing)
  - python-multiprocessing
  - python-unittest (humanfriendly.compat)

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-humanfriendly_4.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/python/python-humanfriendly_4.18.bb b/recipes-devtools/python/python-humanfriendly_4.18.bb
index d91fa1c3..96f6f833 100644
--- a/recipes-devtools/python/python-humanfriendly_4.18.bb
+++ b/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -15,12 +15,15 @@ inherit pypi setuptools
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-math \
+    ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-unittest \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.25.0



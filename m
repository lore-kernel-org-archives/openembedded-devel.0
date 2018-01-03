Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 06F4D78276
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:24:27 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f2so2259420qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 06:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4+SHxJFge4roBH2c4QfUiD4sdYT6RKGqmrIrBhTIy0k=;
	b=bjHOWcyOhQDA4OSpDLvQeQr0321q3CCavb2j3spNk/6mbWbeqQgumse1xr0NfSYnml
	SvRfQLYSNBGp01+DLJEaYKPCwrvkb4X6p0EG7rbsT+Mna07bL7Jf8SdJCHNunWzC3Gff
	FsDrR8/jJrv+5q+UNiF/S+5tZfaTpmy9kOLMNeIwTl3qncP2edrdDAUjnRaozSPD4dGl
	lN7stm4zLXvVEvrh9pnDTU0Iu718bE3rAK1lITXQ6+uoq+uR8miNaBiNZaWvlCm9xJrI
	AI8R6R4O1+GOCqba+PBHdq8IGLdVtunwRekqAVYHRr5dn0fVBz/K4dTN7qwSMh8k0+S/
	dZCw==
X-Gm-Message-State: AKGB3mJ/KuPBf9sQaXe1RSXDByJjIEPCzjt3no/7LLLzMpBabt8z4ExR
	/sdloo9tQcA4+/oTaPAiRJo0/qW0
X-Google-Smtp-Source: ACJfBos2+p2A2l/t5lytOIt7NJJ67w8Bs0nXVy2hpo55+wmgyD5WFWSw+svl1foltynL7D90Ooq2FA==
X-Received: by 10.200.6.76 with SMTP id e12mr1817591qth.217.1514989468734;
	Wed, 03 Jan 2018 06:24:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id u4sm628916qtg.33.2018.01.03.06.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 06:24:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 09:24:24 -0500
Message-Id: <1514989464-10963-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] protobuf: update to version 3.5.1
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
X-List-Received-Date: Wed, 03 Jan 2018 14:24:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../protobuf/{protobuf_3.4.1.bb => protobuf_3.5.1.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.4.1.bb => protobuf_3.5.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
index 1407d08..1ffb79d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
@@ -16,11 +16,11 @@ RDEPENDS_${PN}-ptest = "bash python-protobuf"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
-SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
+SRCREV = "106ffc04be1abf3ff3399f54ccf149815b287dd9"
 
-PV = "3.4.1+git${SRCPV}"
+PV = "3.5.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x \
 	   file://run-ptest \
           "
 
-- 
2.7.4



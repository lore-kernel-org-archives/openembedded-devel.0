Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 005B67FBFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 04:01:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so14853060pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 20:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=trSDlm7gKhK5lZdAg3Uzemc34fyzhW/D+nGB1L9pFCM=;
	b=A+qP7aA2zs7TYlT63zHgMCiT4kt1V6x9rGY5OE/qWKrQw6aMKWccV4Em99ix/H030i
	YraL5d71cFBU9lQ2pN05ieYoEac9KXHNh9ZDxfiJQ4K1XpAoedKU+AUtvY44DNB1OSbk
	h/C996vFub1E8dTFRJGaXONdl1lflYw4N6apfISHn84vTTP56Qs0N10RTjQ2M7YTQC3f
	HszQlpvVAuSDcjdaMvtfPWU5xF5Y4Z+jEJF4fRSCD/3+hIzbOvRAmNiS9UMnskaFT7Y5
	CWLA4R+bqrjbYcDnjpZOCjdRB4J54tkM5s+dgNo0KGXhzuiPbZswQDdBOLb23x3hVlDB
	lWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=trSDlm7gKhK5lZdAg3Uzemc34fyzhW/D+nGB1L9pFCM=;
	b=IiPjmmMyVV18kwkbh2JnLeNgNe6jhBAVxKKWbk3TNWnEiVa4IvNOTMsQdbooiZ0kCh
	DJ1kyioaLISYemH3F/nLW3gSZSswDl8WQHbZHPOkas2NiSbS6DMx2zIQTCV4jtdIsiDD
	tRc2Mjm6CmmP+4smu+cpwoAeivWVblz0UDkoNLggEezx/gcquxPCYsXBwaMf8JotY1YG
	EQqsp2YgZ7K6V7UxArQ4oXX6qKg0guBuq1zNOT5xjQYovn3T3jX2JYkiD8jN2agXsT6V
	GffYUqw1Yv8FBBejjrPHG2mTvfa7CtsXC5+ERcL/cb1Vf55640//k5BqoJm95Hkv0B8j
	L9lQ==
X-Gm-Message-State: APjAAAWtvXzuqddtjeVdGCO8CFxw/SM1FQbBH1fftJoME8QqWv+wFNPy
	tFijVf/TwCwjmMIWv06ZjhOYtaUJYXQ=
X-Google-Smtp-Source: APXvYqzCpogKREyzoNn2EKWb99PyKBvpdY78xwj5u6H0tO/+7x+0GvX2vfSvfqT23Ww0C8Hh8JHB7w==
X-Received: by 2002:a63:d047:: with SMTP id s7mr56678620pgi.81.1579492865684; 
	Sun, 19 Jan 2020 20:01:05 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	v13sm38622107pgc.54.2020.01.19.20.01.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 20:01:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 20:00:25 -0800
Message-Id: <20200120040025.22144-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH v2] python-cmd2: downgrade to 0.8.9
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
X-List-Received-Date: Mon, 20 Jan 2020 04:01:05 -0000
Content-Transfer-Encoding: 8bit

* 0.8.9 was the last version with Python 2.7 support

* add missing RDEPENDS:
  - python-argparse

FIXME: missing dependency on python-enum, which is not
       currently packaged by python_2.7

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/{python-cmd2_0.9.21.bb => python-cmd2_0.8.9.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-cmd2_0.9.21.bb => python-cmd2_0.8.9.bb} (80%)

diff --git a/recipes-devtools/python/python-cmd2_0.9.21.bb b/recipes-devtools/python/python-cmd2_0.8.9.bb
similarity index 80%
rename from recipes-devtools/python/python-cmd2_0.9.21.bb
rename to recipes-devtools/python/python-cmd2_0.8.9.bb
index 992b95ea..74cc5d6f 100644
--- a/recipes-devtools/python/python-cmd2_0.9.21.bb
+++ b/recipes-devtools/python/python-cmd2_0.8.9.bb
@@ -8,16 +8,17 @@ eliminates much of the boilerplate code which would be necessary when using cmd.
 HOMEPAGE = "http://packages.python.org/cmd2/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=60bc6842001870a418935bd84570b676"
 
-SRC_URI[md5sum] = "0e1ce6a2fd8846c2a9e0de2ceb1fa461"
-SRC_URI[sha256sum] = "8880fea501bb45a42e8ddde18023d336ccf72f187c4b03e9ee9f13d719ecbd5f"
+SRC_URI[md5sum] = "878976772c305486dfbca3aff4b4e779"
+SRC_URI[sha256sum] = "145cb677ebd0e3cae546ab81c30f6c25e0b08ba0f1071df854d53707ea792633"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-pyparsing \
     ${PYTHON_PN}-pyperclip \
-- 
2.25.0



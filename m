Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 62604731C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 15:59:53 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j37so5116740qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 08:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MtQmVoRe2rugZVvRb8PN5gK1Mzq2fXDUTlzz1CE5Yjg=;
	b=Kl+CBrgpJ34CpAt/Nkiq+EjScG9YhUMO53IRdT80CJTzm+PiDJlgPurZWrGovCxJhm
	Cbjp8A8CtsgIbl0IY3KTN1cevt90GYydddLXB8kLVZuIXg4Z6MGQE7mDIp5qBjnv5bmP
	cjSmXmDYQkdVMNnWipDusqtvos9LBICvJrUnDIqIs3h8zdw0aMFLXXsN11owpYkMsHrE
	biWfFixrSFPKfMCm5bkW3DMQfkaa/RNyli70pYpYTUVvAVu//QYc1jzvv2IfI3oWS894
	mKgLmXkeTyDVJqvpzfuhklg7hCo41g/IhNMYbJ381uvBZdNBN4nHzIm1hn3+2qdIsTD4
	BF9A==
X-Gm-Message-State: ALyK8tIQgt3lH3FfSQYS9KXjg9/Q5tnWutljG6/lQxuLld7p19mNSeJHNPaILtu62NitUg==
X-Received: by 10.200.50.20 with SMTP id x20mr38270894qta.71.1468684794425;
	Sat, 16 Jul 2016 08:59:54 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	t15sm2520012qtc.26.2016.07.16.08.59.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 08:59:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Jul 2016 11:59:46 -0400
Message-Id: <1468684786-5400-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-feedformatter: add package RDEPENDS
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
X-List-Received-Date: Sat, 16 Jul 2016 15:59:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-feedformatter.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
index 1a02a4f..499bed2 100644
--- a/meta-python/recipes-devtools/python/python-feedformatter.inc
+++ b/meta-python/recipes-devtools/python/python-feedformatter.inc
@@ -9,3 +9,9 @@ PR = "r0"
 SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
 
 S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-xml \
+    "
-- 
1.9.1



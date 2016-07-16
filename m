Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4EED76067C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 15:58:31 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u25so5104044qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 08:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OnTGei3R/0WmCJO6JUgS/VpoPzdYk+XmQDyL0EQrxto=;
	b=kEsWOar3grI9N1XZnwhG8TE1Dfp7zE5sjqAlQRiHmja8Y3tbnJ4pCEuXxJb2N8lDtl
	2VarjLdFtMSLs8oDNZEl9lhK38pgfAWHieZtqmqPTSQEvHJRzxa22Qj441volZ+KVHcL
	GmXNbOVNFW7Gh+oQrm2x9922JM0fSo+EAmgSs7dcDnROK6EumBQLGfvNPoeD0iyHaAg9
	o73XsgwFX5HhyKfXHdjW7eSOIjFk+FMRQStShTNHk3lKVn+wT4gHhruVhHh4Bn1oBiKP
	af7Un84SOmEwxxdSHQciNurLYc506q9TrcKtVghbtgpLY6TY1gX8WhaxwpWBu7cQhIgx
	1iHQ==
X-Gm-Message-State: ALyK8tKr58frAC+oHbHLSJ/W6hBg1JcF+UTz7ZR9r/D0E2jS4nsyqBB+HmXJxfmHE6tSdw==
X-Received: by 10.200.47.39 with SMTP id j36mr28122404qta.10.1468684711649;
	Sat, 16 Jul 2016 08:58:31 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 130sm725884qkf.4.2016.07.16.08.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 08:58:31 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Jul 2016 11:58:25 -0400
Message-Id: <1468684705-5280-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-feedparser: add package RDEPENDS
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
X-List-Received-Date: Sat, 16 Jul 2016 15:58:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
index 3ac18b0..b8ee700 100644
--- a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -7,3 +7,11 @@ SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92
 
 inherit pypi setuptools
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-stringold \
+    "
+
-- 
1.9.1



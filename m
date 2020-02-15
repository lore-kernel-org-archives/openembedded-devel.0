Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3E1613C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:51:49 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 84so6661355pfy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SsHyZhQOF5pua8kvyxbenfNpUChnH71Kgqjs9sIl2pA=;
	b=dRC07nAd4UQRPO1SIGRPO1uHBOdABc02PQgxmOwNrGc8fuCkGiVWidrd3RC41ZtvJm
	UEycKJkIhuqW9xVO8cmqikJkVlSuRRKEjrYCE8VdFJdkoKOMV3MKA+DaYI15+Mh/7t4E
	qlWRoL7XDw/fmbCTNk9vNzBjpO/0ttTC89JFQFK1sKWKakzlvicpvKdQhKL9wSHP76NW
	4nD+3p8WLv7KntgXrZfcZGff3Pvci1mil+Qrt/TYPyWkw08BSndY4/4Lc48jUna7XqmS
	hfAADNMX0/C1gqTWYTQPfukEtkFZcy33bxVk5tfT8Hie9VAqtJxJxPacV5wjcHk0AabC
	JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=SsHyZhQOF5pua8kvyxbenfNpUChnH71Kgqjs9sIl2pA=;
	b=nPoj+A+4/1VRoUFxV6oFO+w26jY5ymEwG2lDhsPiYurXUeqRSVXlzWyn+9PuAc4Gxk
	u1BkUG5gaGAP/LH5hpJGbyFxdc3e1dcnfn0ZUdMmUmqN/XSUpNYplMhLin7AUwvvf4co
	/66Jw6Nqa7cQBxyj+Kui/qWJnWjXLkQut22iP+oPJcF+qmR/Ib2zG3T3cQDhLNrUbpQI
	sw8st3+fAp5PyN79l+vU1P6wS1TYOPoOZLSmQoy2jg3k9GHNiK47Q6fq9npAPyL/1owz
	27i/fSaWKFAd3kEjuNgTIEeipqz8bYeJP7+PVM6XkQBIJeMQPS9Ypi/zNw7kI3bHawRU
	2RhA==
X-Gm-Message-State: APjAAAWRioOC30YjCJO3ngBW9xycT/tujTIhbPX5f/2lU788ZkmY3qyH
	EXfl+68PbFAs74nFihioZmhKHOO7P3s=
X-Google-Smtp-Source: APXvYqxf1EA75fNnZal7yLMbvZh8ZhuragDORrYLeDyBp9pEN5pRt3cyB+YDTjIGbixcemyxjG5dPA==
X-Received: by 2002:a63:9358:: with SMTP id w24mr9994030pgm.207.1581789109986; 
	Sat, 15 Feb 2020 09:51:49 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	k1sm11641665pfg.66.2020.02.15.09.51.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:51:49 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 100742A04D6; Sat, 15 Feb 2020 09:51:48 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 09:51:43 -0800
Message-Id: <20200215175144.23550-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-python][PATCH 1/2] python3-ansi2html: add new package
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
X-List-Received-Date: Sat, 15 Feb 2020 17:51:49 -0000

Convert text with ANSI color codes to HTML or to LaTeX
---
 .../recipes-devtools/python/python3-ansi2html_1.5.2.bb      | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
new file mode 100644
index 000000000..8e586ea3e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.5.2.bb
@@ -0,0 +1,13 @@
+DESCRPTION = "ansi2html - Convert text with ANSI color codes to HTML or to LaTeX"
+HOMEPAGE = "https://github.com/ralphbean/ansi2html"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3000208d539ec061b899bce1d9ce9404"
+LICENSE = "GPLv3"
+
+PYPI_PACKAGE = "ansi2html"
+
+SRC_URI[md5sum] = "52d6085ad1c5970082ea5305a26af981"
+SRC_URI[sha256sum] = "96ae85ae7b26b7da674d87de2870ba4d1964bca733ae4614587080b6358c3ba9"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-six"
-- 
2.13.3



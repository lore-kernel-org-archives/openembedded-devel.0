Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA6F6E630
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:10 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id c67so8514828qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PDc/R3m9oXisyNXwnvKMN15iZwVKB1zuOemNTJ+ke+c=;
	b=DVghFfWsqWxN+aZoOC6Q82oIU/AB0d6n8VjdKVCJjRc/E4bbDazzfOMiralvDtiIB1
	vbnU2xJtQylfY/oN6E1P1WG4Bqa0G2+D+FWoDzGEeY/SwT90UpTuqoRlWWuJY4zgEMx2
	igv4HdA9u7WSqJwrlt4Rr+CoSoHZRoj90g9hL4pE3Q5A+t9NCx6iJnrkwtI4wro6pbpu
	Afrb7HNFLH8H+oZltlWVIvag6jfTE9HIsKHY2Q+jdK1JFKlwCdA8ro+M/TOISjZZ6A/N
	Ly43/F748OxUTTFzve1o6Oml9Bz/+Fc5yO0WAXVwXVeez5W+Hek6hl7/4JjTosFkn8a8
	/iCA==
X-Gm-Message-State: AD7BkJK2BuEZMPlp3ZRb3tON0iwOGAnfaT1E767ffE3rGRi5/QvlVoHUafHKKsbY6q845g==
X-Received: by 10.140.86.213 with SMTP id p79mr22921953qgd.76.1458997511558;
	Sat, 26 Mar 2016 06:05:11 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:24 -0400
Message-Id: <cee077fbe75cd44acff1e5dd1abb852c5345fc26.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 04/30] python-certifi: update to 2016.2.28
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb}   | 0
 .../{python3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index c9c3e2d..0fe8b15 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,5 +7,5 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "e04b512009401603f1485380ac879cf5"
-SRC_URI[sha256sum] = "30b0a7354a1b32caa8b4705d3f5fb2dadefac7ba4bf8af8a2176869f93e38f16"
+SRC_URI[md5sum] = "5d672aa766e1f773c75cfeccd02d3650"
+SRC_URI[sha256sum] = "5e8eccf95924658c97b990b50552addb64f55e1e3dfe4880456ac1f287dc79d0"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python-certifi_2016.2.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
rename to meta-python/recipes-devtools/python/python-certifi_2016.2.28.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python3-certifi_2016.2.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2016.2.28.bb
-- 
1.9.1



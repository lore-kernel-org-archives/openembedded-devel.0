Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3EC870031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:33 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id j35so4541270qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=zn5u+SqLtfjVStDcmIweFgrIW5T3sFicqa9fXRfCTlQ=;
	b=R0LYLafzaQzHlXyrsXvaaMlYjE+1K84nsIXy9wgV6FXJMDpKSJe4ortm0FQywV6hew
	/vqhQ++xvt1IJSE024kTUdMYiW/jBAETCwBigXcMfUKuvTLV4tZZ5Lg+fscbW61BYjyQ
	0ct0CVcuf1NUsPXDsUSLT3t4l7dqjxKX/AbVvoiaFk1Uz1jmg5FHxx7tLEMMD2MJOZpP
	y+3LyqMgYErD4FU33rsdrZ92+LjstGAyFeiOvAT0KGcZLQcGMNeQFz+7vL+UtQpG8Nrq
	aYOwLB/cg3NuWz0lGqH66n8++AhF5V2OJw3GqF3Orm/t7ibKq+5U24y1b8f+xrRQf6Gk
	YLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=zn5u+SqLtfjVStDcmIweFgrIW5T3sFicqa9fXRfCTlQ=;
	b=dN/2bFGri39oP2+g1K2CJRW4ZraVOsSUOz2xJNVR4mBPVi5rcX0F58aowYIvTw4hRn
	4lKLGsLdkAmtLDh8CLB3uPgKBVfxlFekPExxbvo75tntuOLrs5QfVMuG/DZ9uDCES4Ds
	sm2GfghGU17viPq/jBKSsaB4tsc+ulrs305UOm14c0m8gd9Af+1erOptdi+99V9o4W+E
	PnTD5SwKXQCUTunea2Yv69K0A4Motdxz+Ovci1DqdT30CFSjgP9myZRw5SpYzsd7YZww
	2mymcJEcguTqZaJC9+i0Z0lMHz6ulvDB+s9yt3W+ZeRv6JDSfa1EAdqqZVtcQYlFHvqK
	JfHQ==
X-Gm-Message-State: AOPr4FU+8qGDmPPlSE5sLWT7x++3ZDT9uk8c0QPcOF/9sZ3uuN7zHuutxYujvJrRGmwmwQ==
X-Received: by 10.140.238.76 with SMTP id j73mr11762490qhc.24.1460553453650;
	Wed, 13 Apr 2016 06:17:33 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:32 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:56 -0300
Message-Id: <1460553420-12533-5-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 5/9] python-flask-navigation: Add recipe for version 0.2.0
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:34 -0000

It's the navigation of Flask application.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-flask-navigation_0.2.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
new file mode 100644
index 0000000..8ff6abc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "The navigation of Flask application."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af2ec695dc1f3eb7bd74f79a68a0d789"
+
+SRC_URI[md5sum] = "d1075ee02a3f69da37e5cadad3395f31"
+SRC_URI[sha256sum] = "c42d30efa989ca877444a410e8a1cd2563546f9effe3d9fe388eedf7a6c69285"
+
+PYPI_PACKAGE = "Flask-Navigation"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-blinker"
-- 
2.1.4



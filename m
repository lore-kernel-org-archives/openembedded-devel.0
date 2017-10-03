Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB0CC71A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 16:58:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a12so3556611qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 09:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lCc5HkV6R2kXEZ6y6z/HCjZR8gctfG4Zb9T3GDRiXmg=;
	b=YnRmaEU+d+umEomv/Jth10biuWSbJs3CG6PXI/MUIDbMc64r96pC+sdG9v0u0XxFv5
	eBEyRIDaG0XSOzsZrX0h4B168pdDVyDcjNjvUGrYiaNKcPeIu2TBEkrGwqtJJJHioWKz
	Ly00TyqSovpVFgqBO6woBPs3XsiEgwDDu5pzi4B0d26pv8V8rG9cV05Abj8EDAjiF3f/
	YOPe3fzFFSukmbBe3vk770gk6+JvfolBahGSYPU9xeBN3Uw+ZqVL9k6kWwr1S2DdGwuT
	FifEFRkOaeQeMMCNV32W+PrriDzUq4MKtJHmISss6tFr0BrFEz9tHBsybnVYFvlNOybq
	nbBw==
X-Gm-Message-State: AMCzsaV9b4xJloGqDfJnGChOpEeBt/pt17g/QDMMLuviFIH4qAsUZbs2
	CZygq/JeWpYPKq6YCyBoOKjtSj4J
X-Google-Smtp-Source: AOwi7QC0brLKRRSVaJMv4RbqF37dzLwcTIdYymG3GnRJl00HA+doMYNSYIUZD/mdZUdReh0Xf1pFmw==
X-Received: by 10.55.26.90 with SMTP id a87mr18981338qka.132.1507049926348;
	Tue, 03 Oct 2017 09:58:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	s43sm9002731qta.31.2017.10.03.09.58.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 09:58:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 12:58:40 -0400
Message-Id: <1507049920-17421-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-sqlalchemy: update to version 2.3.0
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
X-List-Received-Date: Tue, 03 Oct 2017 16:58:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython-flask-sqlalchemy_2.2.bb => python-flask-sqlalchemy_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-sqlalchemy_2.2.bb => python-flask-sqlalchemy_2.3.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb
rename to meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb
index 1190f34..8799767 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.3.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
 
-SRC_URI[md5sum] = "a93e6af389afac6666733e369c06c798"
-SRC_URI[sha256sum] = "f0d8241efba723d7b878f73550f5d3c0fbb042416123b52b36640b7491fa208b"
+SRC_URI[md5sum] = "c86449f44e90e996142872ac4b97f7ee"
+SRC_URI[sha256sum] = "da19ff62e31f82825b5467811c76e2a1c60bba927e175fe091a6f739063dd829"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
-- 
2.7.4



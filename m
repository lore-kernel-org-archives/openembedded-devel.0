Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0415777FCE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:30:45 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id a72so140698162qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P058iJTaM3SLEpM0ARj0q0MadCmSUs7ydv6fNEtLnQU=;
	b=pUVqRnY87b0xuvsBaDx4U5aLf52eNVB4Dqxiv4fhtRgz8kxpE+UZ2os/J6E24mstMH
	jv6mvr47pTN0McBez9HQ4WpUzISXOr5I4UFjn0yJnXvMheGl2e5FcaQyvdxkxzYXUlDB
	jcbleKoSLKMG5r1hRPJ+Qrq4ctSKDAYMNsuJICKndH679JmphKNIO0L0eb1Z+iy2hNuf
	BgwT7VdWgWeCw/42nqvHWX3egdWbqQHjsAFVWMM6rfRAQwnVbmsRVhbwUd8AQsDqUv6i
	iwh+XpH6KRXIMDbal1CD6iGPx0CKWl9rLFYNUDuUBGvmBdo7OtbdkR0cHIHD9N9SGa06
	kq7g==
X-Gm-Message-State: AODbwcD+SZBl9mBO3d3oFcUmKgdDUirnFrNoGGfl5ewFiIGlZKj9x7g9
	rRIN5D4gu4DNoQ==
X-Received: by 10.55.40.158 with SMTP id o30mr29027879qko.210.1495575046614;
	Tue, 23 May 2017 14:30:46 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	w41sm1239882qtg.34.2017.05.23.14.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 14:30:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 17:30:38 -0400
Message-Id: <1495575038-16493-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libdbd-sqlite-perl: update to version 1.54
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
X-List-Received-Date: Tue, 23 May 2017 21:30:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libdb/{libdbd-sqlite-perl_1.50.bb => libdbd-sqlite-perl_1.54.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.50.bb => libdbd-sqlite-perl_1.54.bb} (88%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
similarity index 88%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
index 68bfd66..0b27b5c 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.54.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "d56eebfb5f2a14be9413b025e7dca9fe"
-SRC_URI[sha256sum] = "3ac513ab73944fd7d4b672e1fe885dc522b6369d38f46a68e67e0045bf159ce1"
+SRC_URI[md5sum] = "8f835ddacb9a4a92a52bbe2d24d18a8e"
+SRC_URI[sha256sum] = "3929a6dbd8d71630f0cb57f85dcef9588cd7ac4c9fa12db79df77b9d3a4d7269"
 
 S = "${WORKDIR}/DBD-SQLite-${PV}"
 
-- 
2.7.4



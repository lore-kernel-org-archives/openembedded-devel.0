Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5B236780A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:47:14 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id f55so66170620qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ak+MCC29SD5fYZ0gmH+4QrUI9IHviLjdJl9S/r377h8=;
	b=JjmWSOctJz7niw6W8j9IKlBFMHXQbH5W8Nlg+c910KddBs3y92Kvs15jkjEyn4UBVK
	QaVy4yAEYzpmFedHe+Weo1LWwOU7pPcaK9gEzGF707PX/7qyQm8RrfL83NvmSqYTlRd5
	kM+n3sqdYIxjpoSamHTdDHwquGCVGuzQ/bGC8Yfrm7BQ/SY/TzbXq1mTlD1qBorOedA7
	mJeIHe1xVb3+QuDS+SzsvB949saHzYCIshzjIVEmCNsW67rdzLk+GwQkNXxQN6aNvIsv
	azjo+hyZwYPRs+Rr+5hqmfy6rWcvI9MCCdTPOMJYr7h3Yv8ToGUBDwkRSaeHAgGKAFw+
	MoAg==
X-Gm-Message-State: AODbwcC0ArXSWkRCHqAFmR2yLgS2dDflMKHXxFC5kjfxEO65bO8j1grI
	/e3tv6j3K2Tdng==
X-Received: by 10.200.47.210 with SMTP id m18mr10394622qta.44.1495223236301;
	Fri, 19 May 2017 12:47:16 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 75sm4795536qkw.63.2017.05.19.12.47.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 12:47:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 15:47:10 -0400
Message-Id: <1495223230-15508-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libcurses-perl: update to version 1.36
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
X-List-Received-Date: Fri, 19 May 2017 19:47:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libcurses/{libcurses-perl_1.34.bb => libcurses-perl_1.36.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.34.bb => libcurses-perl_1.36.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb
index e7e9d91..782b973 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb
@@ -10,8 +10,8 @@ DEPENDS += "perl ncurses "
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "874c2103cc53552a0faa371c4d9119f6"
-SRC_URI[sha256sum] = "808e44d5946be265af5ff0b90f3d0802108e7d1b39b0fe68a4a446fe284d322b"
+SRC_URI[md5sum] = "389c70ee5530b887f8e5dc1303cb5294"
+SRC_URI[sha256sum] = "a414795ba031c5918c70279fe534fee594a96ec4b0c78f44ce453090796add64"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
2.7.4



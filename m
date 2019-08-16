Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id E870D7F307
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t16so1091782wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KMWiLKfmcgKKblOJ0zfNv+ypeIw0qxOAq5UnuBLYXsQ=;
	b=gJPsY87A0bHmg+EwZBdxV3YM9omAesLjkocI9+IamS3cQcW/9sHei9B2ZgJQxUJINq
	8Av2M6SA+ezDVUUG7tcxlgB3dYU/ZgvvjiCp5OtritttQyVGS1fdZNzFiqaGVFAd0ugr
	BA4PkDIQ83dbsP2jKyL9VBd2MPtzSFPnLhUoZoxEJydPi3mBIs1ndT9wO8R1/sy2rXtf
	fouRxuHRbw0b+ELx63Fu37YnsdZGNS5PpnTod7OYq6DWWY/F9mCKNisJgOubRhCrzY9r
	kOrOoAk1SQ0JLAHhhEdGqpN5cqFI3yhcUoaPp1Sa7hTOOhxAShPuMVKQ3epTvLIL+PQ6
	XCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KMWiLKfmcgKKblOJ0zfNv+ypeIw0qxOAq5UnuBLYXsQ=;
	b=YdTWLajd5vJu9VXQN4xNO4q0o5/VX8FXLKlVSZbObBi2eYVwEvRdKGTNtuduruuiNQ
	jU8gOVXrO8sk/BjQL9jyg+knYRF90s/oT7pwKI7CcPQxef+4PxsRLesZprSbctRdm3cv
	WOEtB3QfhozB8EdINiAob3vaMgVM6LyA1yws6sGljoB5yggJpR8MBQ7qE7vxWYaOVVNg
	V9SAFefGa1VWPdr//kuYj1Rtpk8lEQKZOMMuHP+PzkrO9hsfJkNdOdKQGvdh+HjI9eNj
	xLzHegWOsVmAYerEkuCbSTBQX8A9hef8DCfjXWJWswcJaP+U2yvVo4yles2SbtPn+XhE
	ycsw==
X-Gm-Message-State: APjAAAW6+2El9ZQ5qPotvW7csWQK/EVIejx8jR8CdjawAeVWzD21gsbn
	T9zeC5wWEzPGlAQSogPGLH0W5G+3ZVE=
X-Google-Smtp-Source: APXvYqwD1phLngZyxeszXbvjMzQYWQkBUdy5Ip9QICTzt6VCG0gGByHIhsG11nTqfK6QObumrxH5sw==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr1933612wro.148.1565951994337; 
	Fri, 16 Aug 2019 03:39:54 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z1sm5615034wrp.51.2019.08.16.03.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:53 +0000
Message-Id: <20190816103958.2701581-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/7] scsirastools: add runtime dependency on bash
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:54 -0000

* fixes:
  ERROR: QA Issue: /etc/init.d/sgraid contained in package scsirastools-raidmon requires /bin/bash, but no providers found in RDEPENDS_scsirastools-raidmon? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 77d3cfeef8..37d083c0ea 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -44,4 +44,4 @@ FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
 
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-diskmon += "${PN}"
-RDEPENDS_${PN}-raidmon += "${PN}"
+RDEPENDS_${PN}-raidmon += "${PN} bash"
-- 
2.17.1



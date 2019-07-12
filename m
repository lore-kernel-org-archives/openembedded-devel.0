Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9C42E7F134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:24:23 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id i21so10531330ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=ffaZSLvruoYnhKCgiyqZrFWJo7bWp/Ev1jBqwmenoAmRG0srEJ6DZz8c2cprMe8WT6
	uwczlzPS8g7tywrewDwCbYt17mhWR9ZtyWWYtaIxcLs6tUWNgCcBScYEwfUHZ550/kB+
	Gkmq2OPDF8E88xhQNgbb7J5pu3/0Ba3xJEzRVYcj0ZLWp2u0j2KusZv/Eboh2KAV3ra9
	PgRB6N6oIWivadaBn3WJVbI5Vznm3U7HtHjo6y5Mcsp6omkxhBZHXT6NcL87NP3OAJ5m
	BFWZPXi3OgEqsip5pgHlsRex3vuRlrdP7/eEBbZbjL4OoNDb1i0Xyem4/zDnIn65mcVg
	+T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=X+EZiwTANTS4c0rtdlMAcoJME0HG4rXtRqi3QJOh01DOaOtQMG0ZdmV7U84k+uQYgI
	JIxBAvjFR3HWzZibfG22P5ShnF9oAsFbUTlXGk/KFEKixLiJWSI6bxwncvJ04M7xdklv
	WqfAlYiMEvgyPdI2/PGakyFp/CcdS615wZiCXiK0W/xLdl2P7jKMTaerRS+I4ulBt1ak
	C/aqNd9cAFiUgn84vX6qzLPRVh3uT5Yt5ofTWfdXBRyl0s+J8NbRrx6+fieUicBOiBm8
	Ab4mH+2KqsuRV88mi++TjXDSz7/j/iAo/1bbWLaKafgz0tmCSskunmRNmaC9n7c2yUtG
	UUFA==
X-Gm-Message-State: APjAAAV/FfAOeZ/lzTy7aTXH7GVW2qKkPwco6KU9SKa2WMBNo5zUx62W
	oi3rYb7bSBo9aeXLBAl/uz4uX6wZ
X-Google-Smtp-Source: APXvYqw7GrXzI7orXVn+e/8prX550p0wgLfT3Z1rXjo+WP6VEfg2sp0Uhj8Za0wecGRqv9c1o0Zf0g==
X-Received: by 2002:a2e:5b1b:: with SMTP id p27mr6808367ljb.97.1562963063759; 
	Fri, 12 Jul 2019 13:24:23 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z83sm1620947ljb.73.2019.07.12.13.24.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 13:24:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 22:24:20 +0200
Message-Id: <20190712202420.13360-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] uftp: update to 4.9.11
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
X-List-Received-Date: Fri, 12 Jul 2019 20:24:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.9.9.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.11.bb
index a64d081cf..8b47bd16f 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
-SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
+SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
+SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
 
 DEPENDS = "openssl"
 
-- 
2.17.1



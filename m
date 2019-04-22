Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5309260017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 21:22:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j20so10020338lfh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 14:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Z4M5aiQp9BYnFgexVnP+OIGv6X2loYFamHAblec7O2I=;
	b=E1kyJ+4RxKBmbByYp/rmf0qapbm+NWd31kNfR35tdt+wJNDo13pSPIfqq437gJxp2D
	yNo6pqRsID99703hcIxkHQeIcY+Zd+zYSAwSHpFQR3KfcxotU5nN6911eEwpJ+QMJMlO
	Pg9Q8O6qfduDV5jHYfC2AkAqb6XG+IQQxS2IRqkN+rtR8lYgVeNk/3n+BQebwQdtsO9l
	AYXiDeHNOljHXT88OA5WlovB4Jp5SFM0mK26IXg2l+9KVFlZgP98Bz9yLcS2O9ig7AzW
	Q0uhvrfY1SLPzIPszDc6JVZhTC1my2rhvUku93Cb5DZWklGG9kgjnZuEoNMwSXHWBy2J
	+cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z4M5aiQp9BYnFgexVnP+OIGv6X2loYFamHAblec7O2I=;
	b=sok7Agrun4dOj8T6b4CxEYta1TxQt0FrnVgpCc75IdHqYYt/krKymehLcmkJ7DyFpd
	iALVvna1g8sZV7FFubwDpIy/ZRu1T7WXZtACULKv4Hwh+NaFs/r+aLuzPX+AqN/4uPpW
	cGAn4GHy/Fj0Vgvx4saktCWa/9J7T1Qs5VYm5uHiRGWYsCx9sihmg4JuQu7/a5CFXw8a
	wSAJ2eGC7aMHnMKC3/oBUcApSCS1xq16PaQLOXqMggfrVoZ3McLAwxLbCiBwV+1AJ6zp
	4nPsuH2CQAnZVsg1/glg2SR/Pw8aIg69jEdoofeBeQxg2AaWB6QbwyggvRxXkohKwffF
	nJYw==
X-Gm-Message-State: APjAAAVupq2xf2t7wBiDGhj07kcFLdcSf8unftOW1315cDEPeF8G0j73
	CohVP76DI44dU2AoYAt1qEO7PSOTsXE=
X-Google-Smtp-Source: APXvYqxjAxzUXt4UwMyk7MOWjo5FesjpJ9Ka2weGP7jha2KnziVn/wPrFvcoctNW2WI6DrpKThmc7Q==
X-Received: by 2002:a19:48c9:: with SMTP id
	v192mr11350355lfa.136.1555968152552; 
	Mon, 22 Apr 2019 14:22:32 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h6sm3154015lfp.1.2019.04.22.14.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 14:22:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2019 23:22:29 +0200
Message-Id: <20190422212229.8610-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-support] nano: update to 4.1
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
X-List-Received-Date: Mon, 22 Apr 2019 21:22:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_4.0.bb => nano_4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.0.bb => nano_4.1.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_4.0.bb b/meta-oe/recipes-support/nano/nano_4.1.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_4.0.bb
rename to meta-oe/recipes-support/nano/nano_4.1.bb
index 3d7921a37..1fe36cdb0 100644
--- a/meta-oe/recipes-support/nano/nano_4.0.bb
+++ b/meta-oe/recipes-support/nano/nano_4.1.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "2de3e8a60ecf09649e316e89be2aac65"
-SRC_URI[sha256sum] = "1e2fcfea35784624a7d86785768b772d58bb3995d1aec9176a27a113b1e9bac3"
+SRC_URI[md5sum] = "235eaf7d27db3c3679b2054361ff6181"
+SRC_URI[sha256sum] = "86bde596a038d6fde619b49d785c0ebf0b3eaa7001a39dbe9316bd5392d221d0"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1



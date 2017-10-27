Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C92E86FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 21:19:03 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z28so10030027qtz.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mdkl7YjMJwvxckHQYxrCWCmmTSG8scCUqBAlmLKKlgk=;
	b=bU0Yk9XHckiecSDNs35Pt8jGe59lKIeo2RoQa5cO/zE2mwro8s03GfxJ4pMZ0snMfq
	q/RxAglwlvMISKb1F9CUxu+j4YlaGHWqNJ7oK+Kd8kQNMG4u6eeUkhKXpMqPY5V9f9ms
	0QZcHFb9C3o4mLUFUHtWDnlfpNY29ZB+/gEmJUPS83xFm9klVkmAfXZs6jKivdfpIU4E
	VbeSuVwLrKyoeZY7ya6Akl2FXBpUtYi4mrLJfHzCWaiOHilKxZI4t9eKc42OfmFWEslq
	gp/f6wPWrEwEaLOkELVu87DuPXVdYc2rfqe7rCWL09be3infQO+5ruXMyLkng5LS1ZkA
	4dVw==
X-Gm-Message-State: AMCzsaWjq8GbsNR/IfE0wnMVpayqIDvbauhpiCSgDF7AqjyPzptxM3Nv
	fCClaaX3GUoxmzfOvm3N66+7/9xl
X-Google-Smtp-Source: ABhQp+SDGyrSHpthtCeBXQ7jpeKascW17WaFQQ2zSPMrPzhGyHekQETjq10qfVj37xz2b3vAK3L4ng==
X-Received: by 10.200.38.194 with SMTP id 2mr3011472qtp.196.1509139144634;
	Fri, 27 Oct 2017 14:19:04 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 2sm5976376qto.28.2017.10.27.14.19.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 14:19:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Oct 2017 17:18:57 -0400
Message-Id: <1509139137-21320-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] phpmyadmin: update to version 4.7.5
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
X-List-Received-Date: Fri, 27 Oct 2017 21:19:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../phpmyadmin/{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.3.bb => phpmyadmin_4.7.5.bb} (90%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
similarity index 90%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
index 9949a73..fa447b9 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "4b0c5dbaf871eb86671613da3c31e6b3"
-SRC_URI[sha256sum] = "ed51669043f62494dc3bc21a87423373164ff63865a6c6bceaee535ef785f33e"
+SRC_URI[md5sum] = "23f65155f37bef0addb7324d45671a4e"
+SRC_URI[sha256sum] = "e4f53b8a5a8e32cea389718c6f6f282e9ac22ed5f31f67d88266aa27ae0a1ca3"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.7.4



Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id EB9566FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:36 +0000 (UTC)
Received: by pff63 with SMTP id 63so12867912pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=a6NL+323PZmd7yiu94bNTgjnpi7KswUo02xCerYoso0=;
	b=SV488Q6xkQdTvxPezxqCJstLgqnjpllf5OuqQjNQAzeh2KlTOXMl/3jEiLi0b6lld9
	nF3oWlV3p5ELHhISWk69RPrc34otpDhLkWfNKmQGvn4Wmjxiafn2BC/fA0VICfW5oqWs
	yThVzT1NwjOJRSunx9eM40iTqtE/2uMPuT886JI1F1NpB2V0xjucGe8fl3j/Qo+eDVlv
	zkO48Tpg5+qE68QU+HfXwEDXiNRV8jPt8H+jB4dgQpq+9FDhwUh3rKFagrqEW9hdqPNe
	h9SwD6ISf9u41WI04ZFVJTHy42veh4ElPhP79t4hiHxEn29Ca7/kOiw8EB53q63Cb6IJ
	kA3w==
X-Received: by 10.98.11.133 with SMTP id 5mr37028737pfl.26.1450107277130;
	Mon, 14 Dec 2015 07:34:37 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 66sm5898819pfl.90.2015.12.14.07.34.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:35 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 456EBFCC845; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:06 -0800
Message-Id: <a22695429486a4123e5497c7a2c2f3ea44fe298d.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 13/14] pure-ftpd: add PACKAGECONFIG for libsodium
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:37 -0000

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
index fa592dc..c1f1504 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
@@ -18,3 +18,5 @@ SRC_URI[sha256sum] = "7be73a8e58b190a7054d2ae00c5e650cb9e091980420082d02ec3c3b68
 inherit autotools
 
 EXTRA_OECONF = "--with-minimal"
+PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
+                       ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
-- 
1.9.1



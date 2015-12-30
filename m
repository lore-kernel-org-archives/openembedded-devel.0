Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id DE25E60620
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 15:52:03 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 65so98862504pff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=NoP3A5IdFSHUU2xtrKqWj80jN+BqdaA5IEbfruFI30c=;
	b=GcYBL4TxjeIOlfi18xuXkgvfz/RQ7NKQIa9BqzC3k6lI3priASsrjIWJpaDmN5R+2N
	e2zLuT+5VDy5gAJelXJA2/lCQCWEjd2HePxvnM0XOj+WPViS4E8Zvqn8X9HJmWWzpqqV
	O16O+5uThLrB+pQNlWwaUcvYKNXSUr8CGVDz4Qo41JRt0I35bVgSYzZRRmr7aH54zB6U
	zyDgMDQ0y9q5ikVzqvTVG9RK/ZYJ9PVzZKEYmz1aneFTjG+QDqpeQU77UecP9Kf7NQGg
	+ZzBDz/5um+Zg3IWtERUdR5ZNn9pPsInG81ZhblzmmI5HyjClzk9O3gkPHBpA6bk+Bc8
	mVNg==
X-Received: by 10.98.80.144 with SMTP id g16mr94149097pfj.68.1451490723921;
	Wed, 30 Dec 2015 07:52:03 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	u14sm90970234pfi.58.2015.12.30.07.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 07:52:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Wed, 30 Dec 2015 07:51:58 -0800
Message-Id: <1451490718-25620-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: package update to 2.0.1
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
X-List-Received-Date: Wed, 30 Dec 2015 15:52:04 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.0.0.bb => wireshark_2.0.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.0.bb => wireshark_2.0.1.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
index 7dcc5a7..42a1b29 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.1.bb
@@ -8,8 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "5909af2a09a9a3023ba61bc62e787ad2"
-SRC_URI[sha256sum] = "90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd"
+SRC_URI[md5sum] = "c1610ab2238965363b811e5188750fb1"
+SRC_URI[sha256sum] = "c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d7084ae4f6c30b683ab"
 
 PE = "1"
 
-- 
2.3.5



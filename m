Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5782475E2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 14:45:43 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id b32so12778346qgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2016 07:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4bbpaRbGBpoh1eIaUaOLd7LYpPRaPqSPfbw9DUK6yos=;
	b=TaErCwRuyUJNo7MGytBI0dI/7V77/9sRwHEsfPtNM3eE/2zcYexmh1tEWD28S23jOJ
	KVmgJ+RBwHgEIYbZs7CDLnTp0W2W6H44d32bYIyOAmS91yqjk5mXw1EGuznvuNaFpjeX
	ztCNq7yQHnXM0CCg6elzVriR5UBzYggJtA10zelkf1EeG7AMJm7aMOs/0KspmMnMxmlf
	tS7iwdJYVs5wqhgiPDv0eRSA5p2Hy5sD8IJ6AkdAXlmTLQ1ENRrehBeFFnhXCQ6ztNWD
	GqrigQhyJwOGCmzZySmqw8RN8zvFieiDBaIOg/TOCxXSrixvnhlneEs3sCgp0SoHw95i
	amdA==
X-Gm-Message-State: AD7BkJIx3624Bv8UadvLOygrWVg/JCmNOdpM+HG8wy0zI5DSbOYzv+4Oeujo9oO6bG+/cA==
X-Received: by 10.140.221.147 with SMTP id r141mr8149912qhb.84.1459608344678; 
	Sat, 02 Apr 2016 07:45:44 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm8450194qkb.9.2016.04.02.07.45.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Apr 2016 07:45:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2016 10:45:28 -0400
Message-Id: <1459608329-26531-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459608329-26531-1-git-send-email-derek@asterius.io>
References: <1459608329-26531-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 2/3] libtest-harness-perl: update to 3.36
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
X-List-Received-Date: Sat, 02 Apr 2016 14:45:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libtest-harness-perl_3.30.bb => libtest-harness-perl_3.36.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.30.bb => libtest-harness-perl_3.36.bb} (96%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
similarity index 96%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
index c3d9674..7fb7e22 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb
@@ -21,8 +21,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[md5sum] = "c1ff25da5dfdf77adea13dc3465638dd"
-SRC_URI[sha256sum] = "ff1900f3b3e61321d3c4b3283298f3106d43d55446605e9cfcf1dcec036acec1"
+SRC_URI[md5sum] = "4c8d9c77e8e06ca96c7383c05c8f3616"
+SRC_URI[sha256sum] = "e7566f13b041d028b56f184b77ec2545ec6f0bb5a0f8f5368f7e4a08b496b63e"
 
 S = "${WORKDIR}/Test-Harness-${PV}"
 
-- 
1.9.1



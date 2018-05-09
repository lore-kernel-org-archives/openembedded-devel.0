Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4A34275014
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 21:22:56 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id c5-v6so17943637itj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=eCHWjFw6+RLzJ3LAfgwZLMPuldupXrJGXmEQvnOurw0=;
	b=GuaryDAlrILgg9UjK5jORhUBhbZx4NiNLlUI++uq8pMabgR7UhR/dvOv2WR/pQMsuL
	5Xl0Iu7S05VlmklOUb9P4lBSLkWzJNuysKRIPe3OxhRpIgDW1wSeD6MpnRhsMCCUw0ww
	DiOJtJzft5i8yhGcZK+yuk/cuzA2lPIj6gA0/6vBEAdhfKHg856xXSgHz83boqmo7BeQ
	nLnj0ep9o7Ai+CodnN7mgSub2nxhtdtdldCifpEIX4cmgCtKAyP/iYp9qg4sFqSA7S6R
	n4ahmeFjZipiAOz0/x1LuJRj+DPwFcrQb55dN0YZDnnORulyq5MA8kF2wvfZutI8NLk0
	/6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eCHWjFw6+RLzJ3LAfgwZLMPuldupXrJGXmEQvnOurw0=;
	b=Uy5oqJZ66s8VnPLtEYpPz/yspPBkWHrfJNaXUg1vTlFeQDl7sHDGFefhtRM8cXoprp
	PW6Cv94/+RjZMC9igD5+DHj40iTbyj9H9G0YjYIkc0b3iLYRjovv47Sv9sgaVwvwX8xx
	FAaofwN3rbtXmFqx/lMTBaDubFcqkxUSdK6xDaPMTvDv6lrgbfwD6H7oKOjWJZdrbcvf
	PKrYcGVBqvNkXMtLm0t/Jr8CXEVlnq+Co+9soL7Dfwcjt1HxLZDmBQIhFGCL+Xi3C4wB
	8JsbX9zZnIrbGgvUA6y60hSEGg2mQyrNLX6U/v/9svTwizc9zEGxoWaPrpo5xjevIWhd
	6c+Q==
X-Gm-Message-State: ALKqPwcgaEdKtIHjvLEu0Haf3UITTX/jiUbWbgLQdXOdePHFnVCSQ+Fg
	G0vt9K65UXN/mJmLtGcH5TijVCgO
X-Google-Smtp-Source: AB8JxZqvq95ogcTtpYjLDRuRl8k7g3sd8f6kydEzHv/B008qcfHtoevsQGYNYG7XqoS1q5J2pDdFiQ==
X-Received: by 2002:a24:9794:: with SMTP id
	k142-v6mr2156679ite.105.1525900977536; 
	Wed, 09 May 2018 14:22:57 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	c18-v6sm16093181ioa.16.2018.05.09.14.22.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:22:56 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 17:22:45 -0400
Message-Id: <20180509212246.15272-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH 1/2] libsrtp: switch away from github archive
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
X-List-Received-Date: Wed, 09 May 2018 21:22:57 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
index 0104d0456b..ee8c68bc1a 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
@@ -5,11 +5,11 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15bc16b9d2e305974dde47e733883714"
 
-SRC_URI = "https://github.com/cisco/libsrtp/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+S = "${WORKDIR}/git"
+SRCREV = "e806a66bad35f4b215b7a825c24ef0ec4cc19569"
+SRC_URI = "git://github.com/cisco/libsrtp.git;protocol=https; \
            file://0001-Rename-conflicting-variable-mips.patch \
            "
-SRC_URI[md5sum] = "2309aa6027992810a4285b042c71e644"
-SRC_URI[sha256sum] = "86e1efe353397c0751f6bdd709794143bd1b76494412860f16ff2b6d9c304eda"
 
 inherit autotools
 
-- 
2.17.0.rc2.3.gc2a499e6c



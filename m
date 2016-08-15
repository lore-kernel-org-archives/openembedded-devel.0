Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B788D7713C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:04:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x189so4882148qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zx+mkDcw3lRz5URBpqC4bL6bBMqaNHg3iOrjDS34+BA=;
	b=mXAl5bU40qBMOvTSotTKDyHs23/+OJ/1rsEtA0BCRDEBbxsKfJhC4qGOzdP91Ms5aB
	1iVEeLHbs3m6PWxaZLnNEywbqLXaNvDICUOntthacenUKvRbE5Jv/knBLWpgl8SqBQ2R
	36l1Y2tWmgggzCqLDkBoUxrmmXebwqXPcwgCtsTs5o8yP+mUXjsKLnzER9RiADwDiee1
	47Z9+hjTX0DVTfSkfy9/ObtnyyAIlSb1QKGy1SU8DqIJtTmgrnaPmyTW0V6TtW0YK+7D
	P7sQ9sbo6qXGAJREWIfYmSSmJgkD2c91zHMwxTor6th3WUfgn49tswWyqfh65Ke0osmC
	kBDw==
X-Gm-Message-State: AEkoouuI6TJbYgbPi41021zjHIegzsroXA9lifhBWpi/sGSr6NOGtoGtCHNWoB8lVBfgWA==
X-Received: by 10.55.221.131 with SMTP id u3mr32943291qku.243.1471287898114;
	Mon, 15 Aug 2016 12:04:58 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	j38sm13133088qtj.35.2016.08.15.12.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:04:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:04:32 -0400
Message-Id: <1471287872-24274-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471287872-24274-1-git-send-email-derek@asterius.io>
References: <1471287872-24274-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCHv2 3/3] opensc: update to version 0.16.0
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
X-List-Received-Date: Mon, 15 Aug 2016 19:04:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/opensc/{opensc_0.15.0.bb => opensc_0.16.0.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.15.0.bb => opensc_0.16.0.bb} (87%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.15.0.bb b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
similarity index 87%
rename from meta-oe/recipes-support/opensc/opensc_0.15.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.16.0.bb
index a11b3d8..fd67181 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.15.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
@@ -11,10 +11,9 @@ SECTION = "System Environment/Libraries"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
 
-SRC_URI[md5sum] = "f266024e5a9630821ffa0ac14f72e369"
-SRC_URI[sha256sum] = "8f8f8cf52e0252334e4dfdccca829b876a3de6340deb772aa0bfe0c0cc10eaf5"
+SRC_URI[md5sum] = "724d128f23cd7a74b28d04300ce7bcbd"
+SRC_URI[sha256sum] = "3ac8c29542bb48179e7086d35a1b8907a4e86aca3de3323c2f48bd74eaaf5729"
 
-S = "${WORKDIR}/OpenSC-${PV}"
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
 LICENSE = "LGPLv2+"
-- 
2.7.4



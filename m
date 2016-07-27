Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7385E60746
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:07:59 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q8so3502859qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 14:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l002jVyzEAzakvdwxpWGHktHhNA72YYR6vb2hiBcIzY=;
	b=RolmBMu8XBn7JrLSuGfH01058jUIBL2r4srF6qhhUst75ELq0Cjh7A9v4JyIcke6YW
	6X+QbNWuPohx3HX5R1V0bPOR2dEvCxM/blJXF85RRA3kyVRgHguuTH+3V9gS+Dfn6BUK
	jClVtwlxt2ZOPBdIJ0o+XTzbdb5tdNyAkV5QWFiSl5ORuDePAhjSSh097YADrIYpDz3w
	UgIl7T5++KXv7R3XrKkJOL/W+UzT3vHxamJeZAAvpjZYPFgTNWcYrVRclQ7jMocMC33P
	JYfsXkLNVJLKhaWbrMP+dcdkeRvF3eXVoMZrsYDfMM/Bk4YxE2JsZ4eBQ43byI4g+JUT
	kQMw==
X-Gm-Message-State: AEkoousvez+S0EWzCcYRsS68r+TjAOxumUVZFvs37QnWNYKpCN5EvTjXUOe3mintSo3n3Q==
X-Received: by 10.55.139.2 with SMTP id n2mr39921420qkd.49.1469653680660;
	Wed, 27 Jul 2016 14:08:00 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(mobile-166-137-178-128.mycingular.net. [166.137.178.128])
	by smtp.gmail.com with ESMTPSA id z64sm5367239qkb.3.2016.07.27.14.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 14:07:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:07:46 -0400
Message-Id: <1469653666-11180-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1469653666-11180-1-git-send-email-derek@asterius.io>
References: <1469653666-11180-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 2/2] libssh2: update to version 1.7.0
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
X-List-Received-Date: Wed, 27 Jul 2016 21:08:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb} (84%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
similarity index 84%
rename from meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
index ad0f677..155d3d4 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
-SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
+SRC_URI[md5sum] = "b01662a210e94cccf2f76094db7dac5c"
+SRC_URI[sha256sum] = "e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584"
 
 inherit autotools pkgconfig
 
-- 
1.9.1



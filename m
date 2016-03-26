Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA7D06067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:17 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s5so6266521qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=X5e6CN/Vj6KgZe6q9hUfhq9Yml1PRAiiZ8KToSh/bLA=;
	b=Jrfuk4qPgtW17EcRM+TAm1jvcK5DLlCUpj+OR57cR09oKzLAdorxcwVf6TjmodJkJs
	++B2Ba7vCds7u8qtT1DkXbYODG3mtfP4LVdMUnD7u7/tp9F1MutfezsLw+/rxwR8mj4H
	DykNB4Uj6k6BLAL8BXn12CrlP3ZsKwh6hUOWdfRKP2VmjXO0ClyDdDvIJAIYRKtTx4l+
	VRbeodFr4Lv0/VqrHcohKb8jGOa/vDIJk4hgPz0kNCtgNR4/3Y5Qc3vCKpjqFu7rN4nA
	X4aZEx8vTv4xddXEOM9SISLs5FFxQPZsDSxJE0nuejHLVhCL6+CdRMwMSpwTlY1YELH9
	BDuw==
X-Gm-Message-State: AD7BkJIQnyA5yqAbQtynxnPm6Is54Lrfj25CJOFvzIXPpozgPZo0ot393f/j2V2JMIdGiQ==
X-Received: by 10.55.76.213 with SMTP id z204mr23285897qka.58.1458997518595;
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:36 -0400
Message-Id: <c73cb4e7677fd7498f1d152bc53b2c892529e7cd.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 16/30] python-paste: update to 2.0.3
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-paste_2.0.2.bb => python-paste_2.0.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paste_2.0.2.bb => python-paste_2.0.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-paste_2.0.2.bb b/meta-python/recipes-devtools/python/python-paste_2.0.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python-paste_2.0.2.bb
rename to meta-python/recipes-devtools/python/python-paste_2.0.3.bb
index 4edd038..6b4019f 100644
--- a/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-paste_2.0.3.bb
@@ -5,8 +5,8 @@ RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
-SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
+SRC_URI[md5sum] = "1231e14eae62fa7ed76e9130b04bc61e"
+SRC_URI[sha256sum] = "2346a347824c32641bf020c17967b49ae74d3310ec1bc9b958d4b84e2d985218"
 
 PYPI_PACKAGE = "Paste"
 inherit pypi setuptools
-- 
1.9.1



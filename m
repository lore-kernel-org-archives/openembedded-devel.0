Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8492.1792765992133868855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EREoi9qt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261023143310c27e30429d000207b5-oshihw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261023143310c27e30429d000207b5
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 16:33:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T8lIKDDKUu10LsF/+IeNmzHaxK6n02wzxhQBkSApreY=;
 b=EREoi9qtux6ecvR4iR1txIzA7Kq6bHcIFJc2DAhz4lTdnwcGP0C4iICgyojXA+7o2TizRa
 ttNMMd0GPuxzgauUUSdIur/53l2iGULUX5hz1x+5a1Z9mKm1WKbgUhb520Y6MiquTNld/8/0
 hkce6bxBsTH2iox0X72PjjU7o8zmreQ1vdIfsB4W4p03hLhnYcucf9L9Nqu1NmGBsaYp0d8V
 WH9WxC14jVSDjs/FCxwt754LWbGgrmFYTDAvfsBguna+RgwXy5IB84ulEdaC9ouyBhaAZCDA
 XRYhipFpqHFhg+dhPl+qUfJ4zm8JOuE6PVPOptxkE1ZujlORktPqq2Aw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 4/5] python3-grpcio-reflection: upgrade 1.84.0 -> 1.84.1
Date: Fri, 23 Oct 2026 16:32:28 +0200
Message-ID: <20261023143229.184415-4-peter.marko@siemens.com>
In-Reply-To: <20261023143229.184415-1-peter.marko@siemens.com>
References: <20261023143229.184415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 14:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131369
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

Sync all grpc recipes to the same version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...reflection_1.84.0.bb => python3-grpcio-reflection_1.84.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.84.0.bb => python3-grpcio-reflection_1.84.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb
index c1460596fb..27c313626b 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.84.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc"
+SRC_URI[sha256sum] = "09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 

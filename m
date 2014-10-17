Return-Path: <eduardo@monkey.io>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2E40E7025A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 03:01:47 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id b6so2560656yha.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 20:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L69dcvF8jn8JKs9LiFZL3S9DPLWuRf8+8Sw9AUCg1kw=;
	b=gBLWEI9X6OKXw/V1tix23vdr08ZRs1mVBkZgr1qi5fh0aO72ebkjT8iC/oABosF6vA
	Bp2dCHmewXQ4XdudnGuHGsUx5bsOKznZXQFA9k7iWs+rqcBYj+oGA/dQ55L9EAEoXbit
	B15L00SzTAFbpL2g/1LAD0em3a5MUslEioNvDCua2H28KuAzWpcC10T5xYxRshW6HaV3
	ERwDmxY/Uk9J5Fxr8pxuo66tONMYwcW+WaNhtcgQ3tqW12Ay30cK5UXJD4nyobZ8zTj5
	kMgIbMBEvg/cXgIPwSps1Yvg9RO+TPljK/3mbyQA8oBMojWOufNt+NzocikCQilGNHpH
	yEEw==
X-Gm-Message-State: ALoCoQlx/olznS9eJgV/W5AgYRXFj7CMZNIcbE9qKr18t7FBx07dn7PCG/twjn18b+u12gXGXvio
X-Received: by 10.236.61.115 with SMTP id v79mr7242337yhc.73.1413514909017;
	Thu, 16 Oct 2014 20:01:49 -0700 (PDT)
Received: from monotop.amnet.co.cr ([186.4.56.221])
	by mx.google.com with ESMTPSA id q4sm170602yhb.15.2014.10.16.20.01.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Oct 2014 20:01:48 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Oct 2014 21:01:35 -0600
Message-Id: <1413514895-22623-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] Monkey: new v1.5.4 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Oct 2014 03:01:52 -0000

This patch add the new Monkey HTTP Server v1.5.4.

For more details about software changes please visit:

    http://monkey-project.com/Announcements/v1.5.4

=== Build Tests ==

This version have been tested on Yocto/Daisy based on RPM.

monkey-yocto/a617991e40bd5c3779ad7b3689f78857d3e45248

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/{monkey_1.5.3.bb => monkey_1.5.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.3.bb => monkey_1.5.4.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
index 06095ba..a4963af 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.3.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[md5sum] = "1fa9ddbb4c0100b22f2fc4b8da56dbe9"
-SRC_URI[sha256sum] = "0ac300e04f052818bc26b7da0183c3c5cd13be8090aaabd3505838587be8c0ec"
+SRC_URI[md5sum] = "b794724ac38cfedee2a5d27c175bc87e"
+SRC_URI[sha256sum] = "662bbafc614d32f645059e6e00258fed640665594f5b7f11cf4c4763cf09ddcf"
 
 EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --logdir=${localstatedir}/log/monkey/ \
-- 
1.9.1



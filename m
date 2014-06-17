Return-Path: <eduardo@monkey.io>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id F280C6FFE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 21:59:00 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jx11so5538680veb.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WyDlPGsZ5BBhVmdIyN9wd9Rvp232U1/aUXqsY6Z8mKM=;
	b=S8rgqD//HF/9JhXHIJu9N41/7AZcTv8S80B98n5q6JVefrCU3besYYdTVFcZ285QrQ
	tmighMnp6+1hU+Y4UDwq9Jr8qWF12GGDGd6PAAxcsqHmdqoA07b3V4sl14SIk4dVE1im
	z/rQRd5He4EugowQpNixa8BQKUuk/6qK1J3d9CHWTe7LhJtLQD39YzbrDVeB9ZrZgVrO
	2ZA+4Gz+rrsbaFnzbDde3KDdHIUfIfFmTSn/n1j8sLLrU/mbzQrMJ29tJ/7HmZgRDqUw
	FvXzu/GFOSCzZN2UueLf1BlSBju429SQs9TX0rENoSn5pVbkoMFHXaHll3EgOeWev1SE
	urow==
X-Gm-Message-State: ALoCoQmv8zReaIw0TPEYYEYWncNsww4tFWQqE4V57o6gDi4TL+Kv1FF9Acvu4iBkTzVytIgucgVX
X-Received: by 10.58.112.37 with SMTP id in5mr474585veb.51.1403042341333;
	Tue, 17 Jun 2014 14:59:01 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id lb8sm32935724vdb.0.2014.06.17.14.58.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jun 2014 14:59:00 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 15:58:53 -0600
Message-Id: <1403042333-15020-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] monkey: new v1.5.1 release (v2).
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
X-List-Received-Date: Tue, 17 Jun 2014 21:59:03 -0000

This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
some problems when switching user when started as root.

monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb} (88%)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
similarity index 88%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
index 6fa1b77..172d4f7 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SECTION = "net"
 
 SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
-SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
-SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
+SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
+SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
 
 EXTRA_OECONF = " \
              --plugdir=${libdir}/monkey/ \
-- 
1.9.1



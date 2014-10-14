Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 15E94716D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:43 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so357974wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Nb4mtVtD/OyqswrYi284GLjmjOUmwG7lQhzvc1SQqnM=;
	b=VNGtkcRhNgKCCtYjDQCb8VUmAkmiGoUYi+8jJnUK6M8COrLhI2OPEfzxSKfmDxFBfd
	RxS9/FeyY1w1ELygQdzwm3FnhsdvSnXFw9UOx5UMtKAxJGUdjGBhZ72xSyqQ96WBjjKt
	ufa8aw9e+mXUJMpEN56QaPB/NFyQ7bkPD8rF5A2D2BiYDhqAEtFKkeI+bhvevSxoVpQo
	auMdLNjpWVr3nGb7h1qFx5AWoZI370Jvj8hCM9j5jsE5ikrUmdL9i5cDNVil0FsrGQp2
	E7HqThyRvjgXqHe1u+IueWeij/4pUP6bbLrOzFGnwQv7dsOu6IZyFK3pz0stxxk41w95
	qX2g==
X-Received: by 10.181.27.229 with SMTP id jj5mr8254864wid.64.1413324884597;
	Tue, 14 Oct 2014 15:14:44 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:18 +0200
Message-Id: <1413324868-11856-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/15] orage: update to 4.10.0
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/orage/{orage_4.8.4.bb => orage_4.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.8.4.bb => orage_4.10.0.bb} (80%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb b/meta-xfce/recipes-apps/orage/orage_4.10.0.bb
similarity index 80%
rename from meta-xfce/recipes-apps/orage/orage_4.8.4.bb
rename to meta-xfce/recipes-apps/orage/orage_4.10.0.bb
index cf3081e..8164c3c 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.10.0.bb
@@ -6,8 +6,8 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "d5105981a9d77ed22be42615d70f3cc0"
-SRC_URI[sha256sum] = "b19df727da9da48b979e238ac7113c803976de80bd1e2dadf6d84b864956dfd5"
+SRC_URI[md5sum] = "b33fa272d92f539a224a7a40b1926dfc"
+SRC_URI[sha256sum] = "6cb854f3437e31bab23abfce97bd10afa1636a9a1480d80e14e26c85d06be7c0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
1.8.3.1



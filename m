Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A241D78215
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 13:48:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z50so20744162qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 06:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MYcdgZ0VRDQs+EYZVag6rQgDFUhmovKqKMFKfoTCU8I=;
	b=c8USMUV47VrWmLUJEnkZrmeU3YxmH6gcImm9VoWA4GTeift1RbS2G6neMYgWTcsXTP
	tl66xFFZdSv0mCS+2BAh6er0xDpT384YcelNvtxHj/MObIAjKHSzpejeKUcRb2hCq/ei
	Wo5PpqVqWBwULDHvCF9G5s/XDj0tkVMSFCXIm2BD3tj9FCgLvfi8XGp8ac1/C9aJUcJf
	0sKEpeikyTEJvUI4QbkX+EmgEfjeY9rVqCjqie6pPi2cmJ3saGY3YfEXBKyU3h6GQUIt
	UQE/vecvYph9I4ZOM/Q6o9JTO8Mu+6ycjoNkGbXVAmQF137cP1mI3p/5D/chl5js/f9P
	FPxg==
X-Gm-Message-State: AJaThX5PJxcSF26M9DX8aHnswL/5G1NXchCCuuDCQiV129g1uMjj2fx+
	nugbHWi391edtTRrDVj1gjr6DL1z
X-Google-Smtp-Source: ABhQp+TLyIDbwd4Oud8puaxgdQYOK0Qd8VT5Xnyul9Yc0v2HEToAXrKIPRFpWEC43izg40jZktMHSQ==
X-Received: by 10.200.63.242 with SMTP id v47mr3035545qtk.29.1509457724815;
	Tue, 31 Oct 2017 06:48:44 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id t34sm877076qtb.79.2017.10.31.06.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Oct 2017 06:48:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 09:48:08 -0400
Message-Id: <1509457688-28779-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] hiawatha: update to version 10.7
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
X-List-Received-Date: Tue, 31 Oct 2017 13:48:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/hiawatha/{hiawatha_10.3.bb => hiawatha_10.7.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_10.3.bb => hiawatha_10.7.bb} (94%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
similarity index 94%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
index 7b6ab26..4c3ca55 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.3.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "31567dfc18d435bd419be279f7970019"
-SRC_URI[sha256sum] = "99d185fb16bb1ab706724494d3cac86464f1485ed4b0fff09a192eca6da5ff8e"
+SRC_URI[md5sum] = "581aa71c831172ba06910deda717302f"
+SRC_URI[sha256sum] = "363e99d84a85dafbb74bcc30b3e30286053ec2abbc7afe08cd87193611735f74"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.7.4



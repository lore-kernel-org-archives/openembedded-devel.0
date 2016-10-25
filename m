Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD0F171A60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 15:08:23 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v138so15821372qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 08:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FrCD1Tjw99TdbyfeJ/YTQ2ThaRA/myUBRD8Kd4leIOc=;
	b=feI7nV30Syvt22GyfDTNieKUeLO01yrElLzQnlnH72jUc9Dnv7CvsAtkUvZr/kkXWl
	PVB322jFXOTb0p0yzVxyAek/U4Z1G3rW+kf3tsyF3Wqy48bnBTz7zJ+iAgajUeFE50QM
	OSHRcSt++enqf5rMZwQj+liivstzq7u8PmCw8es34I+EFAvCpYQWfKtrcJlyTihPiaPc
	1nYPIqsHeItheUZbACS7t+Zx4tvQu+2T6tdyyEHMW96fH2XM9CCz0bd18EPz2bFEHeRq
	G+b83EFJMoeGZZoaNaZckNAUrzgKivXHoiqkEmGtLos1Xh2vooBBBrz3HExYhSHMbH4h
	WdWg==
X-Gm-Message-State: ABUngvemux7/+4OdB1PMpPAqw1VuRUYJMtPlSTwAS6Wu9yhYV7B+WQ6Gn5+DLwN/dSQXRg==
X-Received: by 10.55.158.4 with SMTP id h4mr3751485qke.41.1477408104228;
	Tue, 25 Oct 2016 08:08:24 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	g10sm11185654qkb.17.2016.10.25.08.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Oct 2016 08:08:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Oct 2016 11:08:01 -0400
Message-Id: <1477408081-18074-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.10.2
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
X-List-Received-Date: Tue, 25 Oct 2016 15:08:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb
deleted file mode 100644
index c5392c7..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "088292d9caf6059ef328aa7dda332e44"
-SRC_URI[sha256sum] = "1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb
new file mode 100644
index 0000000..ea7d3d5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.10.2.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "e8f5f4beed041e63eb97f9f4f55f3085"
+SRC_URI[sha256sum] = "1045ac4987a396e2fa5d0011daf8987b612dd2f05181b67507da68cbe7d765c2"
-- 
2.7.4



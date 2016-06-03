Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14B7D77581
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 15:38:24 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id v3so4263396qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2016 08:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cPnHZLLiCSu83q0qpxTcxu9toq4Qg8cKis77u6ALC0I=;
	b=WnbLBUKxaFWEs0KoXzo3ygtMz8fH+Zd9nP8snQCvwW28esioQxNrshQ6uRwnpBpiMz
	MGqpDO9qqoxF5LW1JQKdi43YKJXzIflJAEfKX9TMhAlaWEjdKiYS1xDXxnlUPNd35erF
	bw2xgYFMsvLR6B7FQw47gAiVIPDU1zpWnp825Jwgp/3hC3V5m8nbdQiDMeFQkrwuCQgJ
	OHA+U2VFA7kCUVRoZkPehOyuIuMGiP24v+5x6nWWGTVqwM3F839Zii8pv4D8viA+ZxgE
	hK7njDErpART+7hAsWIhYNpCrO4yJKZ2zsWMNS03Bv8/svHF1/9rO01TwBDR3iHHAIMQ
	suVA==
X-Gm-Message-State: ALyK8tJ1+re5MhkHA5Es8P96ZXZ+73DJuJFOl7Y6ga2pBwpBvitg1uO12gGaup0+zz0d9Q==
X-Received: by 10.55.157.196 with SMTP id g187mr4013561qke.68.1464968305084;
	Fri, 03 Jun 2016 08:38:25 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id
	m129sm1192584qkb.22.2016.06.03.08.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Jun 2016 08:38:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jun 2016 10:38:15 -0500
Message-Id: <1464968296-2180-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 1/2] nginx: update stable version to 1.10.1
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
X-List-Received-Date: Fri, 03 Jun 2016 15:38:26 -0000

  * Resolves CVE-2016-4450

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
deleted file mode 100644
index 53cce00..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "c184c873d2798c5ba92be95ed1209c02"
-SRC_URI[sha256sum] = "8ed647c3dd65bc4ced03b0e0f6bf9e633eff6b01bac772bcf97077d58bc2be4d"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb
new file mode 100644
index 0000000..c5392c7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "088292d9caf6059ef328aa7dda332e44"
+SRC_URI[sha256sum] = "1fd35846566485e03c0e318989561c135c598323ff349c503a6c14826487a801"
-- 
1.9.1



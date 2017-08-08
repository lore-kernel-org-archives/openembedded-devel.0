Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F130719AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:16:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id t37so3704200qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LNupBFCGt28boYEvUAl436aPlpHc9jaoEAUla2aGSlA=;
	b=AEo/icU5VyomGerxDE/85zd081sU9PpBB5xcSStI51KAZI1JedVIy14IHoxxfpptiM
	p5I7PzpqWazFEGbXfgbyJemfRVzcVlGsitdEna6ybBlPCrSOmPPPdJBAtJ8mF+s+JIw4
	6BnmtnbN1vQo4GolAMSQ1XdRfPH0ecOqROQ+nhjpEEY1GWTIm+co4msPlOPi2v7iP8Hk
	s98CIfJv7LyGgUYpKwsGM0ETOj7fF3/bo+FIiR/u6ljuEHSO++TfhuQJlGncgU3RObZz
	/VQf1HC6ZCL3cdaTBddxhmdTs4paQGaJhpLyVd6R1m1U0M5zHGkPn7/l+cZOGTh4sUhf
	HzJQ==
X-Gm-Message-State: AHYfb5g6D12K8loBjFtcZQZm8qiZRBE331DqGl2ASHOIQfS5uYBq2vcD
	N7Www7Gz4bEmIp2JPyk=
X-Received: by 10.200.55.129 with SMTP id d1mr6903678qtc.167.1502212615175;
	Tue, 08 Aug 2017 10:16:55 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id c39sm579874qta.40.2017.08.08.10.16.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 10:16:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 13:16:46 -0400
Message-Id: <1502212606-19666-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update stable version to 1.12.1
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
X-List-Received-Date: Tue, 08 Aug 2017 17:16:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
deleted file mode 100644
index d3e15a8..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
-
-SRC_URI[md5sum] = "995eb0a140455cf0cfc497e5bd7f94b3"
-SRC_URI[sha256sum] = "b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
new file mode 100644
index 0000000..7f0e3ad
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
+
+SRC_URI[md5sum] = "a307e74aca95403e5ee00f153807ce58"
+SRC_URI[sha256sum] = "8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb"
-- 
2.7.4



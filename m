Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A3069731D5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 23:18:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so14896523wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 16:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wysYaJHePd/mKua4zPUiefK7yDIK/11A5LOVM4A1OfU=;
	b=CxZfSX0VvePCFsajcpyMxi0/NhgpB1xjfsDfdq2fA449BlfpckxUs8cn7hWHy1RkoZ
	ynRb8j8mCervOz45k52KiG3WuAl4ZtAJQBhs9CA2E7y8nA9pQeFRSkdwmtER2nmEGU2w
	E8VSpwp3vbOSjXGHR4iczdPFev803pKI7yLZBkpPQHqg9Y3aPC6rQetR4rYYI/HnzkBW
	Yp0w34SLkYHvyb24aAvwDWGx/dfigD2HzwDfbPmXTWYJ4LwuWUSHoFPtDhrfwOl91j12
	AqF4LG4swJT6NDi52KHWhDVtCFicycmAz5e5BKwrcx+tpTGs34QNC09OV9ylL4srXmPp
	0AvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wysYaJHePd/mKua4zPUiefK7yDIK/11A5LOVM4A1OfU=;
	b=QoASenR9cuh1ffcZ6FDiIYcYAcMl1VemuTs9nuR36u4n8YLSdnVtMAjGh3f0k8RdGV
	hfmWKvrXbpfyxQ7zN1/qGghLvINUDf0z2jao8CLX+JnrDdtTUafuWS9zhsCuI7/i8g/x
	7C5MwsBV0cFwhQoRKTAYO2FTP/GT1DzIuWpbpl1Vegt1U3U2ngCIwTP55UJ1/zeyWIzE
	y/1+BFKHNdkZ5PvYRMBnIi6VLQtRwMjjiRvB0gl5qGkVu3nmywYuR3Z1m/i9+axrTbK5
	4zJeIPeZo7Rpkz0g7Xune7DRvp7OU4AOTxDA1yjMsjp/w80BckrZsXQJR+5smWlSsaW7
	wNyQ==
X-Gm-Message-State: AOPr4FXB56wLqsDMU72OoLPrsYDRYTbGpLY2BzASk8BJqXvWpRcpv88TcGRxYzX18MB6ng==
X-Received: by 10.194.234.167 with SMTP id uf7mr33304801wjc.122.1462144687065; 
	Sun, 01 May 2016 16:18:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A03E5.dip0.t-ipconnect.de.
	[91.10.3.229]) by smtp.googlemail.com with ESMTPSA id
	e16sm15572258wmc.3.2016.05.01.16.18.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 May 2016 16:18:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2016 01:17:48 +0200
Message-Id: <1462144669-18427-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
References: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] xfce4-cpufreq-plugin: update to 1.1.3
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
X-List-Received-Date: Sun, 01 May 2016 23:18:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-cpufreq-plugin_1.1.2.bb => xfce4-cpufreq-plugin_1.1.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.2.bb => xfce4-cpufreq-plugin_1.1.3.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb
index ac2a811..d454787 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "bfc4c8277cb009439fb4c7aec8679126"
-SRC_URI[sha256sum] = "fd9ca91b99e830c6b0962a07eb269ce814ed773cd6008081771fd04060fe6ce9"
+SRC_URI[md5sum] = "859122da0a8cd991ee2fbeee434bc948"
+SRC_URI[sha256sum] = "74a162c7e101db0495d5da147aba1f404c33544f04e8c34d7d1d705668102d33"
-- 
2.5.5



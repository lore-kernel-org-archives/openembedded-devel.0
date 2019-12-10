Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0F57F7AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:43:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c20so3489352wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RBxi9fT/ekXkqRdcjQC9eXHjItzX8NWwkrqocrQjmLY=;
	b=nVVgeqkwYUkzQUmNCcC4GsYOFOT6c92NXI2hMtah2j2qKCn6JDbJMvjXQAIjIsdLT3
	TNGIIRjzQzGfoj8PHwpsy1ris/4SCEY24JD7zhTE2YiMEuZ0XqWTih0WPAIKkKpgNfjg
	BXLbinLGkJsgX9alATJLEorspiVUN+iaurSUKq1h4UwicIB8PSnw7qqfKrQ67qfQv9UZ
	ykfUtckvd9p2+m2i2wvWi2Z56wieqK+rkTZ+OZXmqscSvwK5RZR34IBOimkEdKx5GLQJ
	1Pwa+FAGB/U2bk2tyM8eRhUARtif5yabkXsWlkR1ZjxOntw5Xu+D62qiNGh5kCx8xuM4
	gqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RBxi9fT/ekXkqRdcjQC9eXHjItzX8NWwkrqocrQjmLY=;
	b=nVp0XlhBiDEdjjympfq9P+68yJSEp2R1vOfg2LAfmuQk58lZJQLVOcT2dPewRNS4Dr
	m4f0E9FJnDxpYrpvSNWGNQwjRl92AB20Is3iN8Wpzb00W1Z7Ukmny5lp4iCFlCL3c4rT
	xACv6qIVuEEvd38PEyhUStatqDs/b+1PI7ye7O724coQchDRP5khrFqcnw6iy17m/aCc
	v2hAwVF1JPFHcELcte1nU5eN88KEtAV/3iqHNBzm/Dhx2/1D7dhxgKDKg2BGYNCZQvjm
	I7HOXqPywckC6bIWLqQPhcm2TmnuEHQ4q9KsvPZl2WbfaDY3ZoGIGqwJvIqtIVgO8AY1
	MtmA==
X-Gm-Message-State: APjAAAWXvVFj2tw2f4CHIb+EXZbcYa3QwzvRZ7j2pTxiVVOU9P7Fa6xr
	jG31fY183WMqy9gAK4MJts+yboXNjTY=
X-Google-Smtp-Source: APXvYqzfHqvSzSWow6gdMUddTmWMP/xhwXDiQ9h8/Xrl14guszzPS5Ekpk7j1a7js3vxFMm49MohoQ==
X-Received: by 2002:a7b:cd8a:: with SMTP id y10mr5516423wmj.136.1575988998741; 
	Tue, 10 Dec 2019 06:43:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b16sm3677593wrj.23.2019.12.10.06.43.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 06:43:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2019 14:43:10 +0000
Message-Id: <20191210144310.15704-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python3-pystemd: upgrade to 0.7.0
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
X-List-Received-Date: Tue, 10 Dec 2019 14:43:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{python3-pystemd_0.6.0.bb => python3-pystemd_0.7.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.6.0.bb => python3-pystemd_0.7.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
index 02a5c8f857..66f026cae2 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "c5472be419f53f53f5da089ca8c981c0"
-SRC_URI[sha256sum] = "b1fc072c87e3766711f64caf86fd633dca393e20c8a0a37a5058dd70a21d8a14"
+SRC_URI[md5sum] = "f493c3e54457e49fe3c160274b863bac"
+SRC_URI[sha256sum] = "f5dc49d02995ab96335d9e94f9fe036673d89b8cc9907e7a0ac83c06665f2430"
 
 DEPENDS = "systemd"
 REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.20.1



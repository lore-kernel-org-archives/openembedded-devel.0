Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 06034731D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 21:03:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so1532091wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ytQXfTxfcC4bH1z8xAAd2i/mw4bhBF8HsfoOPa5zDDc=;
	b=QfKVrSzvAu6ET6xUToICvtqpb9hag5BsU62ksgGwKJpgRAX/UX8YQ+I+dBoAYf3/lZ
	c/AZI9OM8CHelCDVZ+2kBVWVJA2APIG/Ew+EuPEW5FzaOusYtQ23vGFMxB5mS5UyGz+J
	/FYxIEN5LW3FIpRGWJpWSgzU2Wf5m5FHexmg2IWc4GV3JRjA85xSDFgtERAuFAlSJ2nT
	lNlSNA+PGxSaBvzqcy4LRWwaeN0N/TbI/78FubmjEHhWWAR2gKZi5ZIDAme5fNTW0zJI
	lOxLQ5IuEWmp0muB+y5RXC8UP5jSyjhT1F04H6GRt93rb+eheI7oM8SF2sSHlOOV4ZMM
	rmdQ==
X-Gm-Message-State: AEkooutFU1Dd2SrO3y4IXNwKkf4VVTPiW/gzkLYLy5jd7LRdyaVjafBEPZQ0wwVedctupg==
X-Received: by 10.28.152.66 with SMTP id a63mr11988482wme.66.1470949381816;
	Thu, 11 Aug 2016 14:03:01 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id 3sm1532052wms.1.2016.08.11.14.03.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 14:03:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 22:03:10 +0100
Message-Id: <1470949390-21988-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470949390-21988-1-git-send-email-git@andred.net>
References: <1470949390-21988-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] wireless-regdb: update 2014.11.18 -> 2016.06.10
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
X-List-Received-Date: Thu, 11 Aug 2016 21:03:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 .../{wireless-regdb_2014.11.18.bb => wireless-regdb_2016.06.10.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2014.11.18.bb => wireless-regdb_2016.06.10.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
index b3d82ba..a9119ea 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2016.06.10.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d750c402c5510add7380edcb1d9b75b2"
-SRC_URI[sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd"
+SRC_URI[md5sum] = "d282cce92b6e692e8673e2bd97adf33b"
+SRC_URI[sha256sum] = "cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7"
 
 inherit bin_package
 
-- 
2.8.1



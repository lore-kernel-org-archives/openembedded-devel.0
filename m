Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD1B7F2A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:50:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so8857147wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q7mK1p0ijAEEwxTSmr4dqc5OyFZrSeUs1V4+OkKsWuw=;
	b=kyqYsNNhOXTD72QxYTw64UleXyptzbS9I3ESX7bb12KrrSFimG8BWkRQD95Q66mX+x
	etNWOalm0mfI9kr+F0Pfszo4mh2jcAamDAWsjxo0R968MbDOS/Ze9MY8V8g2u4S63wI6
	EaXOZJNDr3+6n6kx5j+k4iqHg99J4XYLyir3juc+LyR6/0TJoQyQah6Q29vzSUBRkOyg
	PIizAv3qOhEUSmpuw7TysH8v/err78/W0cnDX7SZrOPaFwqMa+egvBRH4n49ijGst2ip
	Px/nl/FcGS0lqZSNmAqDZViC+WqBRApOsqG5xlpGa2ztAq0jlLWDmkPW2OBHSLonXHq5
	WiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q7mK1p0ijAEEwxTSmr4dqc5OyFZrSeUs1V4+OkKsWuw=;
	b=batdHasyrKrbDtt9c64+eznh3HEuS6YUzbfEdJ6+vU1bwT4LH1UfJdgkoccWIp8ceG
	MAYrf701zn1mGc4d4OPQo6uZsrGynZuzpqrRNsRUNBzu4ybUt1AJWKOLI5jnl++PHGBB
	qUnAL9Gws2k53GBOL7SdxL8/tKETNb1eJzKMcORbTi6QDbezJSwi/yG4psizyYf2rLfi
	bAFrRZrIuqbTeRIJsLNTFyJjcsixQ+3hrbD/WOQBhKSRsh4o2W+I6vW4/j9rokDvdGhq
	Ox0+ms4lf/5bl2nX0fU95JuMkp1xEpwxQBg6/gOWm/ZnQZup2mArLfitbeeRTCg+XFv5
	3mfA==
X-Gm-Message-State: APjAAAXq/w6Swm7Ut5xr8SfgiMudutoh/v9IJ+uPiaNRTl5KT6DiE7YE
	LRloXYp4ac6iaS5mS1zlfufxqdUW
X-Google-Smtp-Source: APXvYqzv0tJe1jOiOrPU41Wq4HkhBBzxlElepsfB1o6NLyDcCeBZzTTXnzHW8tqhT3+rvAqX/uxMaw==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr18788314wmi.51.1578909014773; 
	Mon, 13 Jan 2020 01:50:14 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e18sm14093973wrw.70.2020.01.13.01.50.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 01:50:14 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 09:50:05 +0000
Message-Id: <20200113095004.34295-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-jsonrpcserver: update to 4.1.2
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
X-List-Received-Date: Mon, 13 Jan 2020 09:50:14 -0000
Content-Transfer-Encoding: 8bit

this release solve the permission issue on the EGG directory

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 ...onrpcserver_4.1.0.bb => python3-jsonrpcserver_4.1.2.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.1.0.bb => python3-jsonrpcserver_4.1.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
index a6dcef81d..e23720c3e 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
-SRC_URI[md5sum] = "c1cc652bdeb04b8ce3ad962fbab34daf"
-SRC_URI[sha256sum] = "3a35c0ef21174ca98f995f99688cebadda97053785833fbb31ec862d6b157f6d"
+SRC_URI[md5sum] = "fd4091bc19eb18579c15b97af70714eb"
+SRC_URI[sha256sum] = "73db55d1cf245ebdfb96ca05c4cce01c51b61be845a2a981f539ea1e6a4e0c4a"
 
 inherit pypi setuptools3
 
@@ -22,6 +22,3 @@ RDEPENDS_${PN} += "\
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_install_append() {
-    chmod 0644 ${D}${PYTHON_SITEPACKAGES_DIR}/jsonrpcserver-4.1.0-py${PYTHON_BASEVERSION}.egg-info/*
-}
-- 
2.20.1



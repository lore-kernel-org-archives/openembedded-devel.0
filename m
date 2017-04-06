Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id E1E9377B14
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 00:07:14 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 21so19042367pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uedOs/sXuE5qNjtKvi+8lwWnpAQaDStEKwsWyAEQlUk=;
	b=FkbW/c2kjNbzNUQ8j6DcfzyPisXMOXfAHQatAKYy+TsYmQf9R4e3ExEarotGzgzdK1
	Z8yLnFpg3SUw4z7BjbIsJwG0MAzkFOcaAnosxrNgIOhTFT/nihmzA3fswGGwiKdDdZ94
	4adp6euTFwKgAjNMPc4OwMw/OizR2p+520i4Jmtsn1GNVdidiXb+bLDVd5B5tr8eC3n5
	/wXmqie8AT5dcVuZL8w27rq80IJ8ljckFjTDZyFJ5r9HiuG2fEH9lF2cYp4N9oFq5olM
	yoUkJGl++FkPvxX4XTCFuQ1cWhaJm9tlV4jAV1t1+OQiQ9BhXUpIRO7HNhokdvRowMQQ
	KhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uedOs/sXuE5qNjtKvi+8lwWnpAQaDStEKwsWyAEQlUk=;
	b=Boaqv9uD2Ie2xjyS6vGZ3C/7YThjqWG1VK4bgdK2Zi8IRON4xNlqYByvKSlWKdty9L
	XYecjN7kofh+fo0xqkOIEWhGf0xyo1LNzTOsXzPnccG659yRdTSpMC3xgUZabX36zdn3
	PPKWZAXFxM6483lqsvi3ojRbxu1K9CVey0JZw9TJ5Mpu4DRC5kOSygHFzgXBbkoblFvD
	kIU/YqE8rk7t0yuEyCbUCfDU32xNz9cFpsEcyUnWT+12dhlgvpvybeLe7EhX4ue4EPTP
	cG8VETVfK0Xgtnt7qyfMec7cL9yaKK1Vv39F0NzAdL4VJgeqYVP4v01/7aR3eza8qKjM
	jM2Q==
X-Gm-Message-State: AFeK/H18gy6p0PiLzZ/Jung1ger/FUxhfXaDr9bxExwoaFNnFT7SDnQKuHkTEGx5SZVUyqC8
X-Received: by 10.84.177.36 with SMTP id w33mr39650672plb.105.1491437236084;
	Wed, 05 Apr 2017 17:07:16 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	j84sm414342pfe.112.2017.04.05.17.07.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 17:07:15 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 17:06:25 -0700
Message-Id: <20170406000625.1685-3-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170406000625.1685-1-andrej.rode@ettus.com>
References: <20170406000625.1685-1-andrej.rode@ettus.com>
Subject: [PATCH 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 00:07:15 -0000

---
 .../python-mprpc/python-mprpc_0.1.13.bb                     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb

diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
new file mode 100644
index 0000000..88f11b7
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A gevent based messagpack rpc library"
+DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
+It is based on gevent for handling connections and enabling concurrent connections."
+HOMEPAGE = "https://github.com/studio-ousia/mprpc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "python-gevent"
+RDEPENDS_${PN} += "python-gevent python-msgpack python-gsocketpool"
+
+SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
+SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
+
+inherit pypi setuptools
-- 
2.10.2



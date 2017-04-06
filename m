Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9E077ACD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 00:06:46 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id g2so18817463pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D2pNt+9E8eb/DrIO7+V84a13LCXsHmcfmnwYZgFlZRY=;
	b=KYvmIPw5evYMxEROdKTC19Cdv5POwqTbdmBCPqC7elhzu6PeR4mUh8NmiycHEm2M4F
	KKreHhfaMWQAdDXyXHLIypVcZsLazXrjC/EokogP/JmdP1aYdSlaBq7ZC0VpvH0g0Ydo
	IYDSVx6h+EwjBhcuoSQlnYMehfnSkLUR7dztFmazIJwXrNfL4CEJwWAawpCRr7HWXJHf
	IIpecESVlgguVYkjmm0zHYcAhQrg/pGT/oQWM3elvy8cPXJZG0g7ueVVSz5USezEOdAb
	NORWoF8pD8WFyJ5aFRHT7djx/BODU5BBiznNDydHqTOp9bVLMsk+lX8HaebVND30Oibb
	bs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D2pNt+9E8eb/DrIO7+V84a13LCXsHmcfmnwYZgFlZRY=;
	b=EpncjM52OMVvFbIXB73kNjNUyuJpti6ram6QFwgBXdYNu0tz1SkGXCDEAOrj4iweMg
	v1Sc6oDcBuSO414/qKgrm4g6da1b4D71+h1mCS0qS1LzNQMod99nxa/nbe9PVLRCaftX
	ZzR+ElRw4wCanr0WZ7NKORKTS9wFhAHDjqHnGIwrs9OvvIq+wQatO1w4cbjaikhHOcgo
	6O0wDkWdNGwQ2JieZ8w1knVhrac1aE3kMDj4q2fJYF0VIFLE9ezNAMsHkjXGPy2npSag
	YaZwRXmnixkrRPbMvYKB3jSpI8cIB9EjUJ+0Q24zaJVb3cNr7pViyUWR1/MAnJPR+ptv
	XttA==
X-Gm-Message-State: AFeK/H0/aIPxCJDFtxaX5O+cF+O93E25hB2z/TREHbaQtHWOu2LAqrJjPb7HcICU226Y+0ui
X-Received: by 10.98.25.215 with SMTP id 206mr1340917pfz.84.1491437207899;
	Wed, 05 Apr 2017 17:06:47 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	j84sm414342pfe.112.2017.04.05.17.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 17:06:47 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 17:06:24 -0700
Message-Id: <20170406000625.1685-2-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170406000625.1685-1-andrej.rode@ettus.com>
References: <20170406000625.1685-1-andrej.rode@ettus.com>
Subject: [PATCH 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 00:06:47 -0000

---
 .../python-gsocketpool/python-gsocketpool_0.1.5.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
new file mode 100644
index 0000000..ae7f264
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A simple connection pool for gevent"
+DESCRIPTION = "creates a pool of connections that can be used with gevent"
+HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "python-gevent"
+RDEPENDS_${PN} += "python-gevent"
+
+SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
+SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
+
+inherit pypi setuptools
-- 
2.10.2



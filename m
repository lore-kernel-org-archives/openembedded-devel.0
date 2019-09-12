Return-Path: <prvs=15194f099=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id A14967CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568295962; x=1599831962;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=alBRGRAxQuvNWC+9Wi6bsgDhwoTmxGMvHiGK76NGB1Y=;
	b=Z8ivYGW8QzL4mbKkRT6KSLCHWwVU4jyrmwMx2c9mSp0D6AqW5bG8sHXU
	Nqd3S1TB1LtJH7YNjG8tTKydzFbzUw7BUTScyFEvh+9TEjns4aCfif43f
	kRjRGIDza6ztoOWZl4rwe0PomFuN7aR+MRzSjQ4bsh0SC5OoSzhMVUxJR
	nGYNYIZGZxzPeOE4fNgvi8ntzn5ntcI0xM1qHXLhq5T5Wh1SGCBjN4nDv
	Y/NxyL+mL56NZdRtGL6WwakBApx9zePEWolk5EkGqaXUGJK+9BgGIxoCZ
	cKeCtu3SHZbZtTqC+y0HqvlN4kVPli3L4+LRRo+7YZsECEAkyWf+lTS7f w==;
IronPort-SDR: uyngeMZfMFS1o8hiE+7UjfK3jqoqcbiKFQtNYb16Ki6IN93q5ialFYld7gXsnrRe7SocgNWt3p
	Wysq+ztfug0YEhIBA7303fmRUp63tOviVfPOKiHp+lPHjCuTtXqt8bgPBXGLvSCxjIP0t/Ywc3
	HxC6zNaOUrwBxWvc1iwFYqmYnJbbBhaf8ggCIH5ecroyxoAwfXol+N0DU9LEtz0ww4tWmaIkAs
	PYvEkkHRRuqJw59Y9Y7yJfjC3Mu7GFQU3Z64+jKJ57kFLhhq1ICf7TT7ZdoPez70JjMn0yI+hl
	Nwg=
X-IronPort-AV: E=Sophos;i="5.64,497,1559491200"; d="scan'208";a="119673082"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 21:46:02 +0800
IronPort-SDR: wJj3/SF9TzonfM1oP9+hRZJ1aFl0TP3pXrhmJlY9YTTbFzghd9uBfoRIHIsAcmdKzlnctoJb5X
	36+RE2LSalfzscKihAPVh40imxoeQZm4zZCgizwbWWzCHrZkpF9UglaWZjuRfCT129t6xh5woc
	PC4iaPz8Zsa0D+REAUdBsfHH//57znyP8lTq0xQ2/fJQBD69CK2a0Uds9KUGOh7igogvlnDA8G
	IeemgjnYFk6rmtwtFKSKAL5S0x3CG6A7mBOxP6igNCI5HZjFAqhl8CzjfnFdFKRiW2NBhfL+OM
	vi/7mm9PzRWyPjlXM94BQe2F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 06:42:43 -0700
IronPort-SDR: 0wfBm9qos5fe27RCSqjYoHSgXKK4xJEI2X4bWUM4U6tRfRqfaLlJnk9Iz8KKeLnVQSJEhx7fS5
	UtUEk+ok1X8J1JjX4aCvkZzBtwXweK4ZZZWeCekEf8vbBjHMkWg0n7/QXbNVx2/E0wx43juswr
	2yJ3yQleAOyrC+SPu2BiY7uOEk/vwKUAd/O7tUSg8055KVoareF8az/gc/jGCMdH5qdoAyt0ba
	8Y5w3Zny67AJZfpy8KFagUcKCon0F4+aE6higM/plGwCz4NyzQW+XIbIaOOEI7vYUOvgn63vpq
	bBM=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 12 Sep 2019 06:46:02 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 06:41:56 -0700
Message-Id: <20190912134158.22033-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-fasteners: Initial commit of 0.15
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
X-List-Received-Date: Thu, 12 Sep 2019 13:46:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-fasteners_0.15.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fasteners_0.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
new file mode 100644
index 000000000..8786a1484
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A python package that provides useful locks."
+HOMEPAGE = "https://github.com/harlowja/fasteners"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
+
+SRC_URI[md5sum] = "440f8ab461c8fed941355860d8669556"
+SRC_URI[sha256sum] = "3a176da6b70df9bb88498e1a18a9e4a8579ed5b9141207762368a1017bf8f5ef"
+
+inherit pypi setuptools3
-- 
2.23.0



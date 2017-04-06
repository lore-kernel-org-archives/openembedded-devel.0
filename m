Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 575E077ACB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 01:05:45 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id x125so20090225pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AvXAgcJL/79I/a/xXlQFtYyTu5rJr2UxXuREsioLE4E=;
	b=xcDg1MW4uSY+iIl5lLPQwPmjEHxLa1wubzvby9JecQHheeGlBkYWDMsU6zhiNQg4rF
	p1uW6FFSjIxROVzXdb1j/7l+q4iGueX9hoKvj3WcMdN0ZPWddm9zqp+YvdCF5mTZLtV/
	mp/UfWaPeZ5pcN16XC0TsBtpwWOR8K7+wIJTQ8AE0Y04AzHrO0tnJIMWZxXvcAVBEyvI
	Yn2SDui5k0VDqS6X+/SHLGyrKQ3AUPeNdptia9GGO/iVuNk4lgPQD7LO9ihRpYUxZn8F
	5ZW7QG1hMyVU8a732rF3L/bhNDzU3uqrrvs+TObYTkN4J0NMmHEVyn97tzmkqFtHPv6R
	thvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AvXAgcJL/79I/a/xXlQFtYyTu5rJr2UxXuREsioLE4E=;
	b=hY4DSbRhnkJA8iSPjRTZJWx8I0fVdD8oQBV+a/7qbeyGXLPFNrfS4Cugp38H8fM3PY
	x5PFsmHXmr6W+K+aA9AYr0Lu8qn2Lskia0FnROA4fW1Y32s3t+6Hziq1qdspMMfIFJxw
	d5sgnU7yKZj17ozaIEYSmrvmNK1e69g/4s7uLHbYLoHltOm9NZt0qvBNxi9fPEokfhfa
	CvFel3kxUDzG+NrL/jMMf/nI9Ko92IeY0WaNv1I36P57+98UTqoDmsLYJTQmTfFcVA9b
	DyseDupCFTq3zD7vuccmQzaA7aC0k9Q4JBmWHlKZ5rYCNVRgJEw7CETgjVYrIvhOoI8r
	n6uQ==
X-Gm-Message-State: AFeK/H32F2EhtKAj/FuMaDH3MokijpVXXldOEpf5EbOP4SIbQ0CiJ9rLy2XacYcYPUL1LcsI
X-Received: by 10.98.89.139 with SMTP id k11mr32523945pfj.196.1491440746350;
	Wed, 05 Apr 2017 18:05:46 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id y65sm27094pfd.82.2017.04.05.18.05.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 18:05:45 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 18:04:52 -0700
Message-Id: <20170406010452.16529-2-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170406010452.16529-1-andrej.rode@ettus.com>
References: <20170406010452.16529-1-andrej.rode@ettus.com>
Subject: [meta-python][PATCH v2 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 01:05:45 -0000

Add recipe for python-mprpc, a messagepack RPC library for python

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
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



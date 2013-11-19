Return-Path: <daniel.mcdougall@liftoffsoftware.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id DEA0E6CFF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 19:40:10 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id z12so4592897yhz.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 11:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zahHuynM7fHcYV8PiYkIXUS7uQInm+UTpwTOaJEJBJ0=;
	b=mg4AgBqCUVNI/jUZndY95WxBIXaljpjA75/yq65lO0lcTEALwjlzQHYE0T8AdqPdxG
	qdddTTkgSDs1FwKUCPU55lJYfmjSEHJhEqjOjRQJF19aiKxJdmQhqRM93eRSXks0plHp
	cO0GBaeDPUmfr9agJtGdMnatNKFaXV4NBFYO9Koz6DKQbr5V//ArcsCXNprQfF3j4MdP
	ovs4GjHgqeKlkXqlDOu93pnx9qsARBTOx8eYynZUYQ77c3kKA0zaTO96wA1B9ZjKOGi/
	G+UOsIdTCms7YxWN2ZC4IoQeSuHETxMCFbtz506oRTlZn5RkVzlq9AcgwLo7T+9vUbew
	jCTQ==
X-Gm-Message-State: ALoCoQn5ZB86q5lzg7mKeggwCIRL30EtfO9fwHQbqCe2ugdeoGFBOkTwG/Im+Xi4JoTlVdF6Xg7J
X-Received: by 10.236.73.1 with SMTP id u1mr2483227yhd.91.1384890012185;
	Tue, 19 Nov 2013 11:40:12 -0800 (PST)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPSA id
	e10sm37547086yhj.1.2013.11.19.11.40.05 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 11:40:05 -0800 (PST)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2013 19:39:57 +0000
Message-Id: <1384889997-23375-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] python-futures: New package (provides concurrent.futures)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 19:40:11 -0000

The python-futures package is a backport of Python 3.2+'s
concurrent.futures module to Python 2.6+.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 meta-oe/recipes-devtools/python/python-futures_2.1.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-futures_2.1.5.bb

diff --git a/meta-oe/recipes-devtools/python/python-futures_2.1.5.bb b/meta-oe/recipes-devtools/python/python-futures_2.1.5.bb
new file mode 100644
index 0000000..817a917
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-futures_2.1.5.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e96d16356742ac95c07be571717e51a3"
+HOMEPAGE = "http://code.google.com/p/pythonfutures"
+DEPENDS = "python"
+
+SRC_URI = "https://pypi.python.org/packages/source/f/futures/futures-${PV}.tar.gz"
+SRC_URI[md5sum] = "2fc924890ccd30a5fe676fa9bbcf0ab8"
+SRC_URI[sha256sum] = "8f5a627d3aee94cc1859a942965fdebb714be8cdd2366d819cb8fb9b7cc628a6"
+
+S = "${WORKDIR}/futures-${PV}"
+
+inherit setuptools
-- 
1.8.1.2



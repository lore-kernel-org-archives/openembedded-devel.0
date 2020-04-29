Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1279.1588190289363230836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03TJw63l017590
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 12:58:07 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 12:58:06 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 5874D900659;
 Wed, 29 Apr 2020 12:58:06 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-atomicwrites: add python3-misc to RDEPENDS
Date: Wed, 29 Apr 2020 12:58:06 -0700
Message-ID: <20200429195806.173250-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The atomicwrites module depends on the tempfiles module, but it is not
in the RDEPENDs, so add it:

root@qemux86-64:~# python3
Python 3.8.2 (default, Feb 25 2020, 10:39:28)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import atomicwrites
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/atomicwrites/__init__.py", line 5, in <module>
    import tempfile
ModuleNotFoundError: No module named 'tempfile'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-atomicwrites_1.3.0.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
index 04bbed707..e43bf0884 100644
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
 SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-misc"
-- 
2.17.1


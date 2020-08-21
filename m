Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.145850.1598053521004375550
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gik-0003AI-BP; Sat, 22 Aug 2020 02:45:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/11] python3-custom-inherit: Add recipe
Date: Sat, 22 Aug 2020 02:44:59 +0300
Message-Id: <20200821234504.719-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
References: <20200821234504.719-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add recipe for custom-inherit, a Python package that provides
customized docstring inheritance schemes between derived classes
and their parents. Changelog for release 2.3.0:

- Add three new built-in styles, numpy_with_merge,
  google_with_merge, and numpy_napoleon_with_merge, which permit
  users to concatenate the respective sections of a parent's and
  child's docstrings.
- Also add is the ability to configure DocInheritMeta so that
  special methods will have their docstrings inherited as well.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-custom-inherit_2.3.0.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
new file mode 100644
index 000000000..489e71984
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
+HOMEPAGE = "https://github.com/rsokl/custom_inherit"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c"
+
+PYPI_PACKAGE = "custom_inherit"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "adf2850dc0e488df959821a5d4c16cbd"
+SRC_URI[sha256sum] = "1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a"
+
+inherit pypi setuptools3
-- 
2.17.1


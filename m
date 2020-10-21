Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8623.1603268738822284209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38626 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kV9R9-0005B2-OO; Wed, 21 Oct 2020 11:25:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-semver: Upgrade 2.10.2 -> 2.13.0
Date: Wed, 21 Oct 2020 11:25:29 +0300
Message-Id: <20201021082530.10132-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021082530.10132-1-leon.anavi@konsulko.com>
References: <20201021082530.10132-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 2.13.0:

- Document how to create subclass from VersionInfo
- Ensure equal versions have equal hashes. Version equality means
  for semver, that major, minor, patch, and prerelease parts are
  equal in both versions you compare. The build part is ignored.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-semver_2.10.2.bb => python3-semver_2.13.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.10.2.bb => python3-semver_2.13.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
index 71cb1acec3..8c7c424c6d 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
@@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
-SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
+SRC_URI[md5sum] = "e98b5fb283ea84daa5195087de83ebf1"
+SRC_URI[sha256sum] = "fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1


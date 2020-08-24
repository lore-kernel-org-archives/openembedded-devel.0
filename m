Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.191369.1598260510208463310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37652 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kA8ZI-0005wO-Jy; Mon, 24 Aug 2020 12:15:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-attrs: Upgrade 19.3.0 -> 20.1.0
Date: Mon, 24 Aug 2020 12:14:57 +0300
Message-Id: <20200824091457.3360-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824091457.3360-1-leon.anavi@konsulko.com>
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 20.1.0:

- Python 3.4 is not supported anymore.
- Added attr.resolve_types(). It ensures that all
  forward-references and types in string form are resolved
  into concrete types.
- Added @attr.s(collect_by_mro=False) argument that if set to
  True fixes the collection of attributes from base classes.
- On Python 3, all generated methods now have a docstring
  explaining that they have been created by attrs.
- Fixed a ValueError: Cell is empty bug that could happen in some
  rare edge cases.
- Added attr.converters.pipe(). The feature allows combining
  multiple conversion callbacks into one by piping the value
  through all of them, and retuning the last result.
- Provisionally added attr.field() that supplants attr.ib().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-attrs_19.3.0.bb => python3-attrs_20.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_19.3.0.bb => python3-attrs_20.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
index 7ff8049e5..371f1f042 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72"
-SRC_URI[md5sum] = "5b2db50fcc31be34d32798183c9bd062"
+SRC_URI[sha256sum] = "0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a"
+SRC_URI[md5sum] = "ab7533fc91c5db3d5b65e66be907444e"
 
 inherit pypi setuptools3
 
-- 
2.17.1


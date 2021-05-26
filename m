Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3796.1622064789202575687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19D-0000vH-NV; Thu, 27 May 2021 00:33:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-flask: Upgrade 1.1.2 -> 2.0.1
Date: Thu, 27 May 2021 00:32:43 +0300
Message-Id: <20210526213248.10348-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526213248.10348-1-leon.anavi@konsulko.com>
References: <20210526213248.10348-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 2.0.1:

- Re-add the filename parameter in send_from_directory. The
  filename parameter has been renamed to path, the old name is
  deprecated.
- Mark top-level names as exported so type checking understands
  imports in user projects.
- Fix type annotation for g and inform mypy that it is a namespace
  object that has arbitrary attributes.
- Fix some types that weren’t available in Python 3.6.0.
- Improve typing for send_file, send_from_directory, and
  get_send_file_max_age.
- Show an error when a blueprint name contains a dot. The . has
  special meaning, it is used to separate (nested) blueprint names
  and the endpoint name.
- Combine URL prefixes when nesting blueprints that were created
  with a url_prefix value.
- Roll back a change to the order that URL matching was done. The
  URL is again matched after the session is loaded, so the session
  is available in custom URL converters.
- Re-add deprecated Config.from_json, which was accidentally
  removed early.
- Improve typing for some functions using Callable in their type
  signatures, focusing on decorator factories.
- Nested blueprints are registered with their dotted name. This
  allows different blueprints with the same name to be nested at
  different locations.
- register_blueprint takes a name option to change the (pre-dotted)
  name the blueprint is registered with. This allows the same
  blueprint to be registered multiple times with unique names for
  url_for. Registering the same blueprint with the same name
  multiple times is deprecated. #1091
- Improve typing for stream_with_context.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-flask_1.1.2.bb => python3-flask_2.0.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_1.1.2.bb => python3-flask_2.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
index 23799617f..2c94f82da 100644
--- a/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "0da4145d172993cd28a6c619630cc19c"
-SRC_URI[sha256sum] = "4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060"
+SRC_URI[sha256sum] = "1c4c257b1892aec1398784c63791cbaa43062f1f7aeb555c4da961b20ee68f55"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.17.1


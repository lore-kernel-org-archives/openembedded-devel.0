Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16041.1601368016492431118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2020 01:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46838 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kNAyM-0004Ji-8v; Tue, 29 Sep 2020 11:26:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-djangorestframework: Upgrade 3.11.1 -> 3.12.1
Date: Tue, 29 Sep 2020 11:26:45 +0300
Message-Id: <20200929082645.32560-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929082645.32560-1-leon.anavi@konsulko.com>
References: <20200929082645.32560-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.12.1:

- Add --file option to generateschema command.
- Support tags for OpenAPI schema generation. See the schema docs.
- Support customising the operation ID for schema generation. See
  the schema docs.
- Support OpenAPI components for schema generation. See the schema
  docs.
- The following methods on AutoSchema become public API:
  get_path_parameters, get_pagination_parameters,
  get_filter_parameters, get_request_body, get_responses,
  get_serializer, get_paginator, map_serializer, map_field,
  map_choice_field, map_field_validators, allows_filters.
  See the schema docs.
- Add support for Django 3.1's database-agnositic JSONField.
- SearchFilter now supports nested search on JSONField and
  HStoreField model fields.
- SearchFilter now supports searching on annotate() fields.
- The authtoken model no longer exposes the pk in the admin URL.
- Add __repr__ for Request instances.
- UTF-8 decoding with Latin-1 fallback for basic auth credentials.
- CharField treats surrogate characters as a validation failure.
- Don't include callables as default values in schemas.
- Improve ListField schema output to include all available child
  information.
- Allow default=False to be included for BooleanField schema
  outputs.
- Include "type" information in ChoiceField schema outputs.
- Include "type": "object" on schema objects.
- Don't include component in schema output for DELETE requests.
- Fix schema types for DecimalField.
- Fix schema generation for ObtainAuthToken view.
- Support passing context=... to view .get_serializer() methods.
- Pass custom code to PermissionDenied if permission class has one
  set.
- Include "example" in schema pagination output.
- Default status code of 201 on schema output for POST requests.
- Use camelCase for operation IDs in schema output.
- Warn if duplicate operation IDs exist in schema output.
- Improve handling of decimal type when mapping ChoiceField to a
  schema output.
- Disable YAML aliases for OpenAPI schema outputs.
- Fix action URL names for APIs included under a namespaced URL.
- Update jQuery version from 3.4 to 3.5.
- Fix UniqueTogether handling when serializer fields use
  source=....
- HTTP HEAD requests now set self.action correctly on a ViewSet
  instance.
- Return a valid OpenAPI schema for the case where no API schema
  paths exist.
- Include tests in package distribution.
- Allow type checkers to support annotations like
  ModelSerializer[Author].
- Don't include invalid charset=None portion in the request
  Content-Type header when using APIClient.
- Fix \Z/\z tokens in OpenAPI regexs.
- Fix PrimaryKeyRelatedField and HyperlinkedRelatedField when
  source field is actually a property.
- Token.generate_key is now a class method.
- @action warns if method is wrapped in a decorator that does not
  preserve information using @functools.wraps.
- Add TokenProxy migration.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mework_3.11.1.bb => python3-djangorestframework_3.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.11.1.bb => python3-djangorestframework_3.12.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
index 81f55ff9e7..60bdbaa9ec 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[md5sum] = "c8ea3e4c3c0d705acf70184faeb2b696"
-SRC_URI[sha256sum] = "6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32"
+SRC_URI[md5sum] = "47d5ea46923a131c5fbefeb610c6ce2c"
+SRC_URI[sha256sum] = "d54452aedebb4b650254ca092f9f4f5df947cb1de6ab245d817b08b4f4156249"
 PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools3
-- 
2.17.1


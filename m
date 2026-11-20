Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4790.1795146382277774793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NMeqN0Tb;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=48682; q=dns/txt;
  s=iport01; t=1795146383; x=1796355983;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t0F7iunS9ZXAIvswDGZ1WUUeQKiTOOLDHPt7SkyeFpw=;
  b=NMeqN0TbpkN0YNUxiAq0WHU8ICNuNXimn7nn+gFIAlBwwbxEE4lhCmz2
   O9MWX6SzZz7uTa6HJJYMksyLrfHQaly4oKezCbT0/OrFJxqbrRekHHFVA
   8JnD/mAqCV3dmrbymjxXXbHqyq/gqxlFoVzre9cMPF37Jxk0Ac10yjD0i
   /cesemZQt/8NDOLwk75C0jzpdTBbg9Vo47tI3kef6gHt1qfdwYng6Fdaq
   00TlL/k4D7+y9euVMKF6jSguSFiQrxPwy2W6rLMdmab5nZajyCI1Di1Sa
   SCVxJNybfc9liZszE6xrg9uGs3TXAdsKNYcxYZFbUnzEQKUPnoehgEnT+
   Q==;
X-CSE-ConnectionGUID: fR7e+Yo+TiWulmnK5+IfLw==
X-CSE-MsgGUID: bGaBhs7XR0KWNOvPhhzAiQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgBEwP9q/9NK/pBQCoJZgld1YENJlCqCIQOBE5A9j?=
 =?us-ascii?q?FmBfg8BAQEPRA0EAQGEP0YCjiECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDGgEMCwEYARsiHAMBAi8rIwgZgwIBgnQDE?=
 =?us-ascii?q?bk8gXkzgQGDKQE/AkNQ2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVgnR2gQWBX?=
 =?us-ascii?q?AEBAgGBMBWGXgSCDRWBDIFUgQIJgheJdQKBT4gmSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FG?=
 =?us-ascii?q?iY+GwqBDCcfHhsOAh8QBg0YDUgRLDcVGQQ+bgeTbIIoJBUBARYOEgEuMhMHE?=
 =?us-ascii?q?wEHAx8BAQQTCQEILSkbBhQZDSkBLgkNAgYWFJJDCQgKCwGSPYE1nh6BPgoog?=
 =?us-ascii?q?3mMJJU6GjOBBoJ+gVeSQ5JUC5h9iyeCY5U1AioICw0BAhY3hGqBaDyBRwsHc?=
 =?us-ascii?q?BU7gmcJShkPji4LC4NggX+DFFHIdyYyAgEIMgEBBwIHDgMLgWiQAi1vA10BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:zFF2u6iFZ5pAFt+Lz7SiMdjMX161NBEKZh0ujC45NGQN5FlHY01je
 htvXTrSbKqMMTfyedokOY62904A75bdn9IyGQQ9pSAzEHhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8EwHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUWwLl6QlBJt
 sAZFy0Jaxag2qGXzpakH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGISPI4TSFJgP9qqej
 mjp9k75GU4qDoS89hyi7Eqshv3mnBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:3Cwwb6HJIR/BhPmspLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:/YX9cGAENLf4GvT6Eyddq0NXK8dmTnzi0XPVJWzlSkdnbKLAHA==
X-Talos-MUID: 9a23:tru55AtJIEHmf9vbAM2njh5rHsdzvJSUUGMyt7IYg8mEJwVxAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62100952"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 03:46:20 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 9B4C9180001EF
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:19 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 4C431CBF203; Thu, 19 Nov 2026 19:46:18 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 4/4] python3-oauthlib: fix CVE-2026-49272
Date: Thu, 19 Nov 2026 19:46:18 -0800
Message-Id: <20261120034618.604880-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120034618.604880-1-hthakar@cisco.com>
References: <20261120034618.604880-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132759
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

The RFC 8628 token endpoint can issue a bearer token for a missing or
bogus device_code when the configured client validator accepts the
request, without checking the device authorization state.

Backport upstream fix [1], referenced by NVD [2], to OAuthLib 3.3.1.
Require the provider's validate_device_code hook to verify client
ownership and authorization state before a token can be issued.

Include upstream scope follow-up [3] to ignore client-supplied scopes
and require scopes from the stored authorization.

Add a local adjustment to preserve an approved empty scope list instead
of expanding it to client defaults, a remaining upstream gap reproduced
on 3.3.1. Keep the validator's scope-policy check and test missing,
empty and denied approved scopes.

Retain the upstream device-flow regressions. Omit
docs/oauth2/endpoints/device.rst because the 3.3.1 source archive
excludes the documentation tree.

[1] https://github.com/oauthlib/oauthlib/commit/77a5f1c8ce00da2b0b8c5f6e9cc129920085f114
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-49272
[3] https://github.com/oauthlib/oauthlib/commit/5edac41fb1164485582f4bc4d2abd9c50eb6df47

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-oauthlib/CVE-2026-49272_p1.patch  | 817 ++++++++++++++++++
 .../python3-oauthlib/CVE-2026-49272_p2.patch  | 263 ++++++
 .../python/python3-oauthlib_3.3.1.bb          |   2 +
 3 files changed, 1082 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p1.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p1.patch
new file mode 100644
index 0000000000..17d9d16731
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p1.patch
@@ -0,0 +1,817 @@
+From 77a5f1c8ce00da2b0b8c5f6e9cc129920085f114 Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <JonathanHuot@users.noreply.github.com>
+Date: Fri, 2 Oct 2026 00:30:11 +0200
+Subject: [PATCH] Merge pull request #954 from hekhuisk/improve-device-workflow
+
+Improve device workflow
+
+CVE: CVE-2026-49272
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/77a5f1c8ce00da2b0b8c5f6e9cc129920085f114]
+
+Backport Changes:
+- Omit docs/oauth2/endpoints/device.rst because the 3.3.1 source archive
+  does not contain the documentation tree. Retain all production code,
+  regression tests and validator-contract documentation in Python files.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/common.py                                 |   1 +
+ oauthlib/oauth2/rfc6749/grant_types/base.py        |   6 +-
+ .../rfc8628/endpoints/device_authorization.py      |  56 ++-----
+ oauthlib/oauth2/rfc8628/grant_types/device_code.py | 136 ++++++++++++++++
+ oauthlib/oauth2/rfc8628/request_validator.py       |  38 +++++
+ .../rfc8628/endpoints/test_error_responses.py      |  80 ++++++----
+ .../oauth2/rfc8628/grant_types/test_device_code.py | 175 ++++++++++++++++++++-
+ tests/oauth2/rfc8628/test_server.py                |  43 ++++-
+ 8 files changed, 455 insertions(+), 80 deletions(-)
+
+diff --git a/oauthlib/common.py b/oauthlib/common.py
+index dfa851798828b24f54e767a7f61a2180cd59b48c..641a0e228105aab0acbc8dd85bcf9017a1ccd45d 100644
+--- a/oauthlib/common.py
++++ b/oauthlib/common.py
+@@ -366,6 +366,7 @@ class Request:
+             "code_challenge": None,
+             "code_challenge_method": None,
+             "code_verifier": None,
++            "device_code": None,
+             "extra_credentials": None,
+             "grant_type": None,
+             "redirect_uri": None,
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/base.py b/oauthlib/oauth2/rfc6749/grant_types/base.py
+index a5e5f426a9c44e1539716e734ea8bda6f035d435..a108bf685ebe514e98c0fccb8b1750e9849d704c 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/base.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/base.py
+@@ -208,9 +208,9 @@ class GrantTypeBase:
+ 
+         if request.client is None or \
+             not hasattr(request.client, 'client_id'):
+-            raise NotImplementedError('Authenticate client must set the '
+-                                      'request.client.client_id attribute '
+-                                      'in authenticate_client.')
++            raise NotImplementedError('authenticate_client_id must set the '
++                                      'request.client attribute to a client '
++                                      'object with a client_id attribute.')
+ 
+         if not request.client_id:
+             request.client_id = request.client.client_id
+diff --git a/oauthlib/oauth2/rfc8628/endpoints/device_authorization.py b/oauthlib/oauth2/rfc8628/endpoints/device_authorization.py
+index 3f38a540590a9d38d42e3d84a79f6acfe440cac7..81f2fe8539ec369cd401f91d16f55ee4a252baa3 100644
+--- a/oauthlib/oauth2/rfc8628/endpoints/device_authorization.py
++++ b/oauthlib/oauth2/rfc8628/endpoints/device_authorization.py
+@@ -10,11 +10,12 @@ import logging
+ from typing import Callable
+ 
+ from oauthlib.common import Request, generate_token
+-from oauthlib.oauth2.rfc6749 import errors
++from oauthlib.oauth2.rfc6749 import utils
+ from oauthlib.oauth2.rfc6749.endpoints.base import (
+     BaseEndpoint,
+     catch_errors_and_unavailability,
+ )
++from oauthlib.oauth2.rfc8628.grant_types import DeviceCodeGrant
+ 
+ log = logging.getLogger(__name__)
+ 
+@@ -52,6 +53,7 @@ class DeviceAuthorizationEndpoint(BaseEndpoint):
+         :param user_code_generator: a callable that returns a configurable user code
+         """
+         self.request_validator = request_validator
++        self.device_code_grant = DeviceCodeGrant(request_validator)
+         self._expires_in = expires_in
+         self._interval = interval
+         self._verification_uri = verification_uri
+@@ -101,44 +103,7 @@ class DeviceAuthorizationEndpoint(BaseEndpoint):
+         .. _`Section 3.2.1. of [RFC6749]`: https://www.rfc-editor.org/rfc/rfc6749#section-3.2.1
+         .. _`Section 2.2 of [RFC6749]`: https://www.rfc-editor.org/rfc/rfc6749#section-2.2
+         """
+-
+-        # First check duplicate parameters
+-        for param in ("client_id", "scope"):
+-            try:
+-                duplicate_params = request.duplicate_params
+-            except ValueError:
+-                raise errors.InvalidRequestFatalError(
+-                    description="Unable to parse query string", request=request
+-                )
+-            if param in duplicate_params:
+-                raise errors.InvalidRequestFatalError(
+-                    description="Duplicate %s parameter." % param, request=request
+-                )
+-
+-        # the "application/x-www-form-urlencoded" format, per Appendix B of [RFC6749]
+-        # https://www.rfc-editor.org/rfc/rfc6749#appendix-B
+-        if request.headers["Content-Type"] != "application/x-www-form-urlencoded":
+-            raise errors.InvalidRequestError(
+-                "Content-Type must be application/x-www-form-urlencoded",
+-                request=request,
+-            )
+-
+-        # REQUIRED. The client identifier as described in Section 2.2.
+-        # https://tools.ietf.org/html/rfc6749#section-2.2
+-        # TODO: extract client_id an helper validation function.
+-        if not request.client_id:
+-            raise errors.MissingClientIdError(request=request)
+-
+-        if not self.request_validator.validate_client_id(request.client_id, request):
+-            raise errors.InvalidClientIdError(request=request)
+-
+-        # The client authentication requirements of Section 3.2.1 of [RFC6749]
+-        # apply to requests on this endpoint, which means that confidential
+-        # clients (those that have established client credentials) authenticate
+-        # in the same manner as when making requests to the token endpoint, and
+-        # public clients provide the "client_id" parameter to identify
+-        # themselves.
+-        self._raise_on_invalid_client(request)
++        self.device_code_grant.validate_device_authorization_request(request)
+ 
+     @catch_errors_and_unavailability
+     def create_device_authorization_response(
+@@ -189,6 +154,13 @@ class DeviceAuthorizationEndpoint(BaseEndpoint):
+               SHOULD wait between polling requests to the token endpoint. If no
+               value is provided, clients MUST use 5 as the default.
+ 
++           scope
++              **OPTIONAL.** The space delimited scopes resolved for this request,
++              either the scopes the device asked for or the ones returned by
++              ``get_default_scopes``. Not defined by RFC 8628, it is included so
++              the caller can persist the authorized scopes with the device_code.
++              Omitted when no scopes were resolved.
++
+            **For example:**
+ 
+               .. code-block:: http
+@@ -224,6 +196,12 @@ class DeviceAuthorizationEndpoint(BaseEndpoint):
+         if self.interval is not None:
+             data["interval"] = self.interval
+ 
++        # ``validate_device_authorization_request`` resolves request.scopes,
++        # falling back to ``get_default_scopes`` when the device omitted the
++        # ``scope`` parameter. Echo the resolved value so callers can persist it
++        # alongside the device_code/user_code without re-running the validator.
++        if request.scopes:
++            data["scope"] = utils.list_to_scope(request.scopes)
+ 
+         verification_uri_complete = self.verification_uri_complete(user_code)
+         if verification_uri_complete:
+diff --git a/oauthlib/oauth2/rfc8628/grant_types/device_code.py b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+index 41ee09e263af3bfe257daa68578d8f7da5cdf6d6..f17384854c66bc10978ef457d1a9b2427ce86641 100644
+--- a/oauthlib/oauth2/rfc8628/grant_types/device_code.py
++++ b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+@@ -1,5 +1,6 @@
+ from __future__ import annotations
+ import json
++import logging
+ 
+ from typing import Callable
+ 
+@@ -7,9 +8,33 @@ from oauthlib import common # noqa: TC001
+ 
+ from oauthlib.oauth2.rfc6749 import errors as rfc6749_errors
+ from oauthlib.oauth2.rfc6749.grant_types.base import GrantTypeBase
++from oauthlib.oauth2.rfc8628 import errors as rfc8628_errors
++
++log = logging.getLogger(__name__)
+ 
+ 
+ class DeviceCodeGrant(GrantTypeBase):
++    #: Maps a non-authorized device code status to the RFC 8628 Section 3.5
++    #: error it raises. The status strings are the errors' own ``error`` codes,
++    #: keeping a single source of truth.
++    _device_code_errors = {
++        cls.error: cls
++        for cls in (
++            rfc8628_errors.AuthorizationPendingError,
++            rfc8628_errors.SlowDownError,
++            rfc8628_errors.ExpiredTokenError,
++            rfc8628_errors.AccessDenied,
++        )
++    }
++
++    #: Authorization statuses returned by
++    #: :meth:`RequestValidator.validate_device_code`, per RFC 8628 Section 3.5.
++    DEVICE_CODE_AUTHORIZED = "authorized"
++    DEVICE_CODE_PENDING = rfc8628_errors.AuthorizationPendingError.error
++    DEVICE_CODE_SLOW_DOWN = rfc8628_errors.SlowDownError.error
++    DEVICE_CODE_EXPIRED = rfc8628_errors.ExpiredTokenError.error
++    DEVICE_CODE_DENIED = rfc8628_errors.AccessDenied.error
++
+     def create_authorization_response(
+         self, request: common.Request, token_handler: Callable
+     ) -> tuple[dict, str, int]:
+@@ -33,6 +58,61 @@ class DeviceCodeGrant(GrantTypeBase):
+ 
+         return self.create_token_response(request, token_handler)
+ 
++    def validate_device_authorization_request(self, request: common.Request) -> None:
++        """Validate the device authorization request.
++
++        The client_id is required if the client is not authenticating with the
++        authorization server as described in `Section 3.2.1. of [RFC6749]`_.
++        The client identifier as described in `Section 2.2 of [RFC6749]`_.
++
++        :param request: OAuthlib request.
++        :type request: oauthlib.common.Request
++
++        .. _`Section 3.2.1. of [RFC6749]`: https://www.rfc-editor.org/rfc/rfc6749#section-3.2.1
++        .. _`Section 2.2 of [RFC6749]`: https://www.rfc-editor.org/rfc/rfc6749#section-2.2
++        """
++        # First check duplicate parameters
++        for param in ("client_id", "scope"):
++            try:
++                duplicate_params = request.duplicate_params
++            except ValueError:
++                raise rfc6749_errors.InvalidRequestFatalError(
++                    description="Unable to parse query string", request=request
++                )
++            if param in duplicate_params:
++                raise rfc6749_errors.InvalidRequestFatalError(
++                    description="Duplicate %s parameter." % param, request=request
++                )
++
++        # the "application/x-www-form-urlencoded" format, per Appendix B of [RFC6749]
++        # https://www.rfc-editor.org/rfc/rfc6749#appendix-B
++        content_type = request.headers.get("Content-Type", "")
++        content_type = content_type.split(";", 1)[0].strip().lower()
++        if content_type != "application/x-www-form-urlencoded":
++            raise rfc6749_errors.InvalidRequestError(
++                "Content-Type must be application/x-www-form-urlencoded", request=request
++            )
++
++        # REQUIRED. The client identifier as described in Section 2.2.
++        # https://tools.ietf.org/html/rfc6749#section-2.2
++        if not request.client_id:
++            raise rfc6749_errors.MissingClientIdError(request=request)
++
++        if not self.request_validator.validate_client_id(request.client_id, request):
++            raise rfc6749_errors.InvalidClientIdError(request=request)
++
++        # The client authentication requirements of Section 3.2.1 of [RFC6749]
++        # apply to requests on this endpoint, which means that confidential
++        # clients (those that have established client credentials) authenticate
++        # in the same manner as when making requests to the token endpoint, and
++        # public clients provide the "client_id" parameter to identify
++        # themselves.
++        self.validate_client_authentication(request)
++
++        # OPTIONAL. The scope of the access request as defined by Section 3.3
++        # of [RFC6749]. https://www.rfc-editor.org/rfc/rfc8628#section-3.1
++        self.validate_scopes(request)
++
+     def validate_token_request(self, request: common.Request) -> None:
+         """
+         Performs the necessary check against the request to ensure
+@@ -60,11 +140,67 @@ class DeviceCodeGrant(GrantTypeBase):
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
++        # Validate the device_code first: per RFC 8628 Section 3.4 the token
++        # request carries no scope, so the validator must populate
++        # request.user and request.scopes from the stored authorization before
++        # validate_scopes runs (otherwise it would fall back to default scopes).
++        self.validate_device_code(request)
++
+         self.validate_scopes(request)
+ 
+         for validator in self.custom_validators.post_token:
+             validator(request)
+ 
++    def validate_device_code(self, request: common.Request) -> None:
++        """Validate the ``device_code`` and its authorization status.
++
++        Delegates to :meth:`RequestValidator.validate_device_code`, which
++        returns one of the ``DEVICE_CODE_*`` statuses, and maps it to the
++        appropriate RFC 8628 Section 3.5 error.
++
++        :param request: OAuthlib request.
++        :type request: oauthlib.common.Request
++        """
++        if not request.device_code:
++            raise rfc6749_errors.InvalidRequestError(
++                "Missing device_code parameter.", request=request
++            )
++
++        status = self.request_validator.validate_device_code(
++            request.client_id, request.device_code, request
++        )
++        if status == self.DEVICE_CODE_AUTHORIZED:
++            # The validator is expected to populate these from the stored
++            # authorization; if it did not, validate_scopes will silently fall
++            # back to the client's default scopes.
++            if getattr(request, "user", None) is None:
++                log.debug("request.user was not set on device_code validation.")
++            if getattr(request, "scopes", None) is None and request.scope is None:
++                raise rfc6749_errors.ServerError(
++                    description="validate_device_code must set request.scopes for an authorized device_code.",
++                    request=request,
++                )
++            if getattr(request, "scopes", None) is None:
++                log.debug("request.scopes was not set on device_code validation.")
++            return
++
++        # A recognized non-authorized status maps to its RFC 8628 polling
++        # error; anything else means the device_code is unknown or invalid.
++        error_class = self._device_code_errors.get(status)
++        if error_class is not None:
++            raise error_class(request=request)
++
++        # None is the documented "unknown/invalid device_code" return. Any
++        # other unrecognized value most likely signals a validator that did
++        # not return a DEVICE_CODE_* status, so surface it for debugging.
++        if status is not None:
++            log.warning(
++                "validate_device_code returned unrecognized status %r; treating "
++                "the device_code as invalid. Return one of the "
++                "DeviceCodeGrant.DEVICE_CODE_* constants.", status
++            )
++        raise rfc6749_errors.InvalidGrantError(request=request)
++
+     def create_token_response(
+         self, request: common.Request, token_handler: Callable
+     ) -> tuple[dict, str, int]:
+diff --git a/oauthlib/oauth2/rfc8628/request_validator.py b/oauthlib/oauth2/rfc8628/request_validator.py
+index 70ee7824e92dae12b5b44d073f11c708ebd07577..1afacd291113f4ffd94568ec7fb6a6fcf420c9c3 100644
+--- a/oauthlib/oauth2/rfc8628/request_validator.py
++++ b/oauthlib/oauth2/rfc8628/request_validator.py
+@@ -23,3 +23,41 @@ class RequestValidator(OAuth2RequestValidator):
+         .. _`Section 3.1`: https://www.rfc-editor.org/rfc/rfc8628#section-3.1
+         """
+         return True
++
++    def validate_device_code(self, client_id, code, request, *args, **kwargs):
++        """Validate a ``device_code`` and return its authorization status.
++
++        Called when a device polls the token endpoint. The implementation
++        should look up the ``device_code``, confirm it was issued to the
++        authenticating client, and report where it is in the authorization
++        process described in `Section 3.5`_ by returning one of the
++        ``DeviceCodeGrant`` status constants:
++
++        - ``DEVICE_CODE_AUTHORIZED``: the end user approved the request.
++          The implementation should also set ``request.user`` (and any
++          scopes or claims to embed) so they end up on the issued token,
++          which removes the need for a separate token validator.
++        - ``DEVICE_CODE_PENDING``: the user has not yet completed the
++          interaction; raises ``AuthorizationPendingError``.
++        - ``DEVICE_CODE_SLOW_DOWN``: as pending, but the client is polling
++          too quickly; raises ``SlowDownError``.
++        - ``DEVICE_CODE_EXPIRED``: the ``device_code`` has expired; raises
++          ``ExpiredTokenError``.
++        - ``DEVICE_CODE_DENIED``: the user denied the request; raises
++          ``AccessDenied``.
++
++        Returning ``None`` (or any unrecognized value) is treated as an
++        unknown or invalid ``device_code`` and raises ``InvalidGrantError``.
++
++        :param client_id: Unicode client identifier.
++        :param code: Unicode device_code.
++        :param request: OAuthlib request.
++        :type request: oauthlib.common.Request
++        :rtype: str or None
++
++        Method is used by:
++            - Device Code Grant
++
++        .. _`Section 3.5`: https://www.rfc-editor.org/rfc/rfc8628#section-3.5
++        """
++        raise NotImplementedError("Subclasses must implement this method.")
+diff --git a/tests/oauth2/rfc8628/endpoints/test_error_responses.py b/tests/oauth2/rfc8628/endpoints/test_error_responses.py
+index c799cc81af295715d91351d3ac75cf0bb970a6e7..75f0ef06b8fdad07d5f490c7cc217b3d9bef7bd5 100644
+--- a/tests/oauth2/rfc8628/endpoints/test_error_responses.py
++++ b/tests/oauth2/rfc8628/endpoints/test_error_responses.py
+@@ -8,15 +8,23 @@ from oauthlib.oauth2.rfc8628.request_validator import RequestValidator
+ 
+ 
+ class ErrorResponseTest(TestCase):
+-    def set_client(self, request):
++    def set_client(self, request, *args, **kwargs):
++        """Stand in for a validator that attaches the client, as documented."""
+         request.client = mock.MagicMock()
+-        request.client.client_id = "mocked"
++        request.client.client_id = request.client_id
+         return True
+ 
+-    def build_request(self, uri="https://example.com/device_authorize", client_id="foo"):
+-        body = ""
+-        if client_id:
+-            body = f"client_id={client_id}"
++    def set_client_id(self, client_id, request, *args, **kwargs):
++        return self.set_client(request)
++
++    def build_request(
++        self, uri="https://example.com/device_authorize", client_id="foo", body=None
++    ):
++        # The body must be passed to the constructor: Request parses it once at
++        # initialization, so assigning to request.body afterwards would leave
++        # request.scope and request.duplicate_params stale.
++        if body is None:
++            body = f"client_id={client_id}" if client_id else ""
+         return Request(
+             uri,
+             http_method="POST",
+@@ -24,26 +32,29 @@ class ErrorResponseTest(TestCase):
+             headers={"Content-Type": "application/x-www-form-urlencoded"},
+         )
+ 
+-    def assert_request_raises(self, error, request):
++    def assert_request_raises(self, error, request, description=None):
+         """Test that the request fails similarly on the validation and response endpoint."""
+-        self.assertRaises(
+-            error,
+-            self.device.validate_device_authorization_request,
+-            request,
+-        )
+-        self.assertRaises(
+-            error,
+-            self.device.create_device_authorization_response,
+-            uri=request.uri,
+-            http_method=request.http_method,
+-            body=request.body,
+-            headers=request.headers,
+-        )
++        with self.assertRaises(error) as caught:
++            self.device.validate_device_authorization_request(request)
++        if description is not None:
++            self.assertEqual(description, caught.exception.description)
++
++        with self.assertRaises(error) as caught:
++            self.device.create_device_authorization_response(
++                uri=request.uri,
++                http_method=request.http_method,
++                body=request.body,
++                headers=request.headers,
++            )
++        if description is not None:
++            self.assertEqual(description, caught.exception.description)
+ 
+     def setUp(self):
+         self.validator = mock.MagicMock(spec=RequestValidator)
+         self.validator.get_default_redirect_uri.return_value = None
+         self.validator.get_code_challenge.return_value = None
++        self.validator.authenticate_client.side_effect = self.set_client
++        self.validator.authenticate_client_id.side_effect = self.set_client_id
+         self.device = DeviceApplicationServer(self.validator, "https://example.com/verify")
+ 
+     def test_missing_client_id(self):
+@@ -69,27 +80,40 @@ class ErrorResponseTest(TestCase):
+         self.assert_request_raises(errors.InvalidClientIdError, request)
+ 
+     def test_duplicate_client_id(self):
+-        request = self.build_request()
+-        request.body = "client_id=foo&client_id=bar"
++        request = self.build_request(body="client_id=foo&client_id=bar")
+         # Device code grant
+-        self.validator.validate_client_id.return_value = False
+-        self.assert_request_raises(errors.InvalidRequestFatalError, request)
++        self.assert_request_raises(
++            errors.InvalidRequestFatalError, request, "Duplicate client_id parameter."
++        )
+ 
+     def test_unauthenticated_confidential_client(self):
+         self.validator.client_authentication_required.return_value = True
++        self.validator.authenticate_client.side_effect = None
+         self.validator.authenticate_client.return_value = False
+         request = self.build_request()
+         self.assert_request_raises(errors.InvalidClientError, request)
+ 
+     def test_unauthenticated_public_client(self):
+         self.validator.client_authentication_required.return_value = False
++        self.validator.authenticate_client_id.side_effect = None
+         self.validator.authenticate_client_id.return_value = False
+         request = self.build_request()
+         self.assert_request_raises(errors.InvalidClientError, request)
+ 
+     def test_duplicate_scope_parameter(self):
+-        request = self.build_request()
+-        request.body = "client_id=foo&scope=foo&scope=bar"
++        request = self.build_request(body="client_id=foo&scope=foo&scope=bar")
+         # Device code grant
+-        self.validator.validate_client_id.return_value = False
+-        self.assert_request_raises(errors.InvalidRequestFatalError, request)
++        self.assert_request_raises(
++            errors.InvalidRequestFatalError, request, "Duplicate scope parameter."
++        )
++
++    def test_invalid_scope(self):
++        request = self.build_request(body="client_id=foo&scope=foo")
++
++        # Only reject the scope requested in the body, so that the test fails if
++        # the requested scope never reaches the validator.
++        def validate_scopes(client_id, scopes, client, request):
++            return scopes != ["foo"]
++
++        self.validator.validate_scopes.side_effect = validate_scopes
++        self.assert_request_raises(errors.InvalidScopeError, request)
+diff --git a/tests/oauth2/rfc8628/grant_types/test_device_code.py b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+index 3e3c002b4f30e6418bcb9d8bb456b76c12734b95..952cfe4c1aaf82b03e6e9bc92be1ac46711e557a 100644
+--- a/tests/oauth2/rfc8628/grant_types/test_device_code.py
++++ b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+@@ -5,18 +5,24 @@ import pytest
+ from oauthlib import common
+ 
+ from oauthlib.oauth2.rfc8628.grant_types import DeviceCodeGrant
++from oauthlib.oauth2.rfc8628.request_validator import RequestValidator
+ from oauthlib.oauth2.rfc6749.tokens import BearerToken
+ 
+ def create_request(body: str = "") -> common.Request:
+     request = common.Request("http://a.b/path", body=body or None)
+     request.scopes = ("hello", "world")
+     request.expires_in = 1800
+-    request.client = "batman"
+     request.client_id = "abcdef"
++    # Client authentication must leave request.client set to an object whose
++    # client_id matches request.client_id, otherwise validate_client_confidential
++    # /validate_client_public raise before the grant's own checks run.
++    request.client = mock.Mock()
++    request.client.client_id = request.client_id
+     request.code = "1234"
+     request.response_type = "code"
+     request.grant_type = "urn:ietf:params:oauth:grant-type:device_code"
+     request.redirect_uri = "https://a.b/"
++    request.device_code = "device_code_1234"
+     return request
+ 
+ 
+@@ -54,6 +60,7 @@ def test_custom_pre_and_post_token_validators():
+     request: common.Request = create_request()
+     request.client = client
+     client.client_id = request.client_id
++    validator.validate_device_code.return_value = DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+@@ -70,8 +77,7 @@ def test_custom_pre_and_post_token_validators():
+ def test_create_token_response():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+-    request.client = mock.Mock()
+-    request.client.client_id = request.client_id
++    validator.validate_device_code.return_value = DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+@@ -104,7 +110,6 @@ def test_create_token_response():
+ def test_invalid_client_authentication_error_confidential_client():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+-    request.client = mock.Mock()
+ 
+     auth = DeviceCodeGrant(validator)
+     bearer = BearerToken(validator)
+@@ -131,7 +136,6 @@ def test_invalid_client_authentication_error_confidential_client():
+ def test_invalid_client_authentication_error_public_client():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+-    request.client = mock.Mock()
+ 
+     auth = DeviceCodeGrant(validator)
+     bearer = BearerToken(validator)
+@@ -158,7 +162,6 @@ def test_invalid_client_authentication_error_public_client():
+ def test_invalid_grant_type_error():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+-    request.client = mock.Mock()
+ 
+     request.grant_type = "not_device_code"
+ 
+@@ -184,7 +187,6 @@ def test_duplicate_params_error():
+     request: common.Request = create_request(
+         "client_id=123&scope=openid&scope=openid"
+     )
+-    request.client = mock.Mock()
+ 
+     auth = DeviceCodeGrant(validator)
+     bearer = BearerToken(validator)
+@@ -201,3 +203,162 @@ def test_duplicate_params_error():
+     assert status_code == 400
+ 
+     validator.save_token.assert_not_called()
++
++
++@pytest.mark.parametrize(
++    ("status", "expected_error"),
++    [
++        (DeviceCodeGrant.DEVICE_CODE_PENDING, "authorization_pending"),
++        (DeviceCodeGrant.DEVICE_CODE_SLOW_DOWN, "slow_down"),
++        (DeviceCodeGrant.DEVICE_CODE_EXPIRED, "expired_token"),
++        (DeviceCodeGrant.DEVICE_CODE_DENIED, "access_denied"),
++    ],
++)
++def test_device_code_status_errors(status, expected_error):
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    validator.validate_device_code.return_value = status
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++
++    _headers, body, status_code = auth.create_token_response(request, bearer)
++    body = json.loads(body)
++
++    assert body == {"error": expected_error}
++    assert status_code == 400
++
++    validator.validate_device_code.assert_called_once_with(
++        request.client_id, request.device_code, request
++    )
++    validator.save_token.assert_not_called()
++
++
++@pytest.mark.parametrize(
++    "status",
++    [
++        None,  # documented "unknown / invalid device_code" return
++        "not_a_real_status",  # validator returned an unrecognized value
++        True,  # validator wrongly returned a bool instead of a status
++    ],
++)
++def test_invalid_device_code(status):
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    validator.validate_device_code.return_value = status
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++
++    _headers, body, status_code = auth.create_token_response(request, bearer)
++    body = json.loads(body)
++
++    assert body == {"error": "invalid_grant"}
++    assert status_code == 400
++
++    validator.save_token.assert_not_called()
++
++
++def test_device_code_scopes_populated_before_scope_validation():
++    """Authorized scopes from the stored grant must be validated, not defaults.
++
++    Per RFC 8628 Section 3.4 the device token request carries no scope, so
++    validate_device_code must populate request.scopes from the stored
++    authorization before validate_scopes runs; otherwise validate_scopes falls
++    back to get_default_scopes and the token silently receives default scopes
++    (issue #944).
++    """
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    # The device token request has no scope of its own.
++    request.scope = None
++    request.scopes = None
++
++    def authorize(client_id, code, req):
++        req.scopes = ["read", "write"]
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++    auth.create_token_response(request, bearer)
++
++    validator.get_default_scopes.assert_not_called()
++    validator.validate_scopes.assert_called_once_with(
++        "abcdef", ["read", "write"], request.client, request
++    )
++
++
++def test_device_code_authorized_without_scopes_fails_loudly():
++    """An authorized device_code must not silently fall back to default scopes.
++
++    If ``validate_device_code`` returns ``DEVICE_CODE_AUTHORIZED`` without
++    populating ``request.scopes`` (and the token request itself carries no
++    ``scope``), failing loudly with a ``server_error`` is the only safe
++    option: continuing would let ``validate_scopes`` fall back to
++    ``get_default_scopes`` and reintroduce the consent-integrity bug from
++    issue #944.
++    """
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    # The device token request has no scope of its own, and the validator
++    # forgets to set request.scopes on the authorized device_code.
++    request.scope = None
++    request.scopes = None
++    validator.validate_device_code.return_value = DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++
++    _headers, body, status_code = auth.create_token_response(request, bearer)
++    body = json.loads(body)
++
++    assert body == {
++        "error": "server_error",
++        "error_description": (
++            "validate_device_code must set request.scopes for an "
++            "authorized device_code."
++        ),
++    }
++    assert status_code == 400
++
++    validator.get_default_scopes.assert_not_called()
++    validator.validate_scopes.assert_not_called()
++    validator.save_token.assert_not_called()
++
++
++def test_validate_device_code_is_required_on_real_validator():
++    """The hook lives on the rfc8628 RequestValidator and must be implemented.
++
++    Guards against the gap mocks hide: a MagicMock auto-creates
++    ``validate_device_code``, so the behavior tests above pass even if the
++    method did not exist. A real validator subclass that has not implemented
++    it must fail loudly rather than silently.
++    """
++    request: common.Request = create_request()
++    with pytest.raises(NotImplementedError):
++        RequestValidator().validate_device_code(
++            request.client_id, request.device_code, request
++        )
++
++
++def test_missing_device_code():
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    request.device_code = None
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++
++    _headers, body, status_code = auth.create_token_response(request, bearer)
++    body = json.loads(body)
++
++    assert body == {
++        "error": "invalid_request",
++        "error_description": "Missing device_code parameter.",
++    }
++    assert status_code == 400
++
++    validator.validate_device_code.assert_not_called()
++    validator.save_token.assert_not_called()
+diff --git a/tests/oauth2/rfc8628/test_server.py b/tests/oauth2/rfc8628/test_server.py
+index 52025032849ec5cee16c4e2778802958a1ed73ea..9592d9e1eeaa6208deb8fcf7479fe06f15d9a9da 100644
+--- a/tests/oauth2/rfc8628/test_server.py
++++ b/tests/oauth2/rfc8628/test_server.py
+@@ -8,11 +8,30 @@ from tests.unittest import TestCase
+ 
+ 
+ class DeviceAuthorizationEndpointTest(TestCase):
++    def _set_client(self, request, *args, **kwargs):
++        """Stand in for a validator that attaches the client, as documented."""
++        request.client = mock.MagicMock()
++        request.client.client_id = request.client_id
++        return True
++
++    def _build_validator(self, scopes=None):
++        validator = mock.MagicMock(spec=RequestValidator)
++        validator.authenticate_client.side_effect = self._set_client
++        validator.authenticate_client_id.side_effect = (
++            lambda client_id, request, *a, **kw: self._set_client(request)
++        )
++        validator.get_default_scopes.return_value = scopes
++        return validator
++
+     def _configure_endpoint(
+-        self, interval=None, verification_uri_complete=None, user_code_generator=None
++        self,
++        interval=None,
++        verification_uri_complete=None,
++        user_code_generator=None,
++        scopes=None,
+     ):
+         self.endpoint = DeviceAuthorizationEndpoint(
+-            request_validator=mock.MagicMock(spec=RequestValidator),
++            request_validator=self._build_validator(scopes),
+             verification_uri=self.verification_uri,
+             interval=interval,
+             verification_uri_complete=verification_uri_complete,
+@@ -20,7 +39,6 @@ class DeviceAuthorizationEndpointTest(TestCase):
+         )
+ 
+     def setUp(self):
+-        self.request_validator = mock.MagicMock(spec=RequestValidator)
+         self.verification_uri = "http://i.b/l/verify"
+         self.uri = "http://i.b/l"
+         self.http_method = "POST"
+@@ -46,6 +64,25 @@ class DeviceAuthorizationEndpointTest(TestCase):
+         self.assertEqual(200, status_code)
+         self.assertEqual(body, expected_payload)
+ 
++    @mock.patch(
++        "oauthlib.oauth2.rfc8628.endpoints.device_authorization.generate_token",
++        lambda: "abc",
++    )
++    def test_device_authorization_grant_echoes_requested_scope(self):
++        self.body = "client_id=abc&scope=read+write"
++        _, body, _ = self.endpoint.create_device_authorization_response(*self.response_payload())
++        self.assertEqual("read write", body["scope"])
++
++    @mock.patch(
++        "oauthlib.oauth2.rfc8628.endpoints.device_authorization.generate_token",
++        lambda: "abc",
++    )
++    def test_device_authorization_grant_echoes_default_scope(self):
++        """A device that omits scope gets the resolved defaults back (issue #949)."""
++        self._configure_endpoint(scopes=["read", "write"])
++        _, body, _ = self.endpoint.create_device_authorization_response(*self.response_payload())
++        self.assertEqual("read write", body["scope"])
++
+     @mock.patch(
+         "oauthlib.oauth2.rfc8628.endpoints.device_authorization.generate_token",
+         lambda: "abc",
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p2.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p2.patch
new file mode 100644
index 0000000000..9752f0fa17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49272_p2.patch
@@ -0,0 +1,263 @@
+From 5edac41fb1164485582f4bc4d2abd9c50eb6df47 Mon Sep 17 00:00:00 2001
+From: Vibe Nuage Agent <vibe@mistral.ai>
+Date: Fri, 30 Oct 2026 22:44:06 +0000
+Subject: [PATCH] Ignore client-supplied scope on RFC 8628 device token
+ requests
+
+The token endpoint pre-fills request.scopes from the untrusted scope
+parameter before the grant runs, which allowed a device-flow client to
+obtain a token for any scope within its own registration whenever
+validate_device_code did not populate request.scopes, bypassing the
+issue #944 consent-integrity guard. Clear scopes on the authorized
+path so the grant fails loudly unless the stored authorization
+populates them.
+
+CVE: CVE-2026-49272
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/5edac41fb1164485582f4bc4d2abd9c50eb6df47]
+
+Backport Changes:
+- Avoid the shared grant helper's fallback for empty approved scopes in
+  the device token path. This remaining upstream gap was reproduced on
+  3.3.1; call the documented validator policy hook directly and keep
+  authorization-request defaults unchanged.
+- Add regressions distinguishing missing from empty approved scopes and
+  rejecting denied empty scopes without issuing a token.
+
+Co-authored-by: JonathanHuot <JonathanHuot@users.noreply.github.com>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/oauth2/rfc8628/clients/device.py          |   7 +-
+ oauthlib/oauth2/rfc8628/grant_types/device_code.py |  18 +++-
+ oauthlib/oauth2/rfc8628/request_validator.py       |  10 +-
+ .../oauth2/rfc8628/grant_types/test_device_code.py | 116 ++++++++++++++++++++-
+ 4 files changed, 141 insertions(+), 10 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc8628/clients/device.py b/oauthlib/oauth2/rfc8628/clients/device.py
+index ee0ccf8d61897ac5dae0ecd9028f13a929006129..ec36c64fdbb5443728408b3bfc8a783faaebc606 100644
+--- a/oauthlib/oauth2/rfc8628/clients/device.py
++++ b/oauthlib/oauth2/rfc8628/clients/device.py
+@@ -62,8 +62,11 @@ class DeviceClient(Client):
+ 
+         :param body: Existing request body (URL encoded string) to embed parameters
+                      into. This may contain extra parameters. Default ''.
+-        :param scope:   The scope of the access request as described by
+-                        `Section 3.3`_.
++        :param scope:   Optional scope of the access request. Note that per
++                        RFC 8628 Section 3.4 the token request carries no
++                        scope parameter; authorization servers issue the
++                        scopes approved during the device authorization, so
++                        this parameter is ignored by oauthlib-based servers.
+ 
+         :param include_client_id: `True` to send the `client_id` in the
+                                   body of the upstream request. This is required
+diff --git a/oauthlib/oauth2/rfc8628/grant_types/device_code.py b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+index f17384854c66bc10978ef457d1a9b2427ce86641..a7131e649c1107257d0f2f44241009a76cf17783 100644
+--- a/oauthlib/oauth2/rfc8628/grant_types/device_code.py
++++ b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+@@ -143,10 +143,15 @@ class DeviceCodeGrant(GrantTypeBase):
+         # Validate the device_code first: per RFC 8628 Section 3.4 the token
+         # request carries no scope, so the validator must populate
+         # request.user and request.scopes from the stored authorization before
+-        # validate_scopes runs (otherwise it would fall back to default scopes).
++        # the approved scopes are checked against the client's scope policy.
+         self.validate_device_code(request)
+ 
+-        self.validate_scopes(request)
++        # Stored approved scopes are authoritative, including an empty list.
++        # The shared grant helper would replace empty scopes with defaults.
++        if not self.request_validator.validate_scopes(
++            request.client_id, request.scopes, request.client, request
++        ):
++            raise rfc6749_errors.InvalidScopeError(request=request)
+ 
+         for validator in self.custom_validators.post_token:
+             validator(request)
+@@ -166,6 +171,13 @@ class DeviceCodeGrant(GrantTypeBase):
+                 "Missing device_code parameter.", request=request
+             )
+ 
++        # RFC 8628 Section 3.4: the token request carries no scope. The token
++        # endpoint pre-fills request.scopes from the untrusted scope parameter,
++        # so clear it before the validator runs to guarantee only the scopes
++        # populated from the stored authorization are honored.
++        request.scopes = None
++        request.scope = None
++
+         status = self.request_validator.validate_device_code(
+             request.client_id, request.device_code, request
+         )
+@@ -175,7 +187,7 @@ class DeviceCodeGrant(GrantTypeBase):
+             # back to the client's default scopes.
+             if getattr(request, "user", None) is None:
+                 log.debug("request.user was not set on device_code validation.")
+-            if getattr(request, "scopes", None) is None and request.scope is None:
++            if getattr(request, "scopes", None) is None:
+                 raise rfc6749_errors.ServerError(
+                     description="validate_device_code must set request.scopes for an authorized device_code.",
+                     request=request,
+diff --git a/oauthlib/oauth2/rfc8628/request_validator.py b/oauthlib/oauth2/rfc8628/request_validator.py
+index 1afacd291113f4ffd94568ec7fb6a6fcf420c9c3..0a8db48ecc872088a2508e03306528ef0de26dde 100644
+--- a/oauthlib/oauth2/rfc8628/request_validator.py
++++ b/oauthlib/oauth2/rfc8628/request_validator.py
+@@ -34,9 +34,13 @@ class RequestValidator(OAuth2RequestValidator):
+         ``DeviceCodeGrant`` status constants:
+ 
+         - ``DEVICE_CODE_AUTHORIZED``: the end user approved the request.
+-          The implementation should also set ``request.user`` (and any
+-          scopes or claims to embed) so they end up on the issued token,
+-          which removes the need for a separate token validator.
++          The implementation should also set ``request.user`` and
++          ``request.scopes`` from the scopes approved during the device
++          authorization, so they end up on the issued token. Any scope
++          parameter sent by the client on the token request is ignored, so
++          failing to set ``request.scopes`` here results in a
++          ``server_error`` rather than issuing the client's requested
++          scopes.
+         - ``DEVICE_CODE_PENDING``: the user has not yet completed the
+           interaction; raises ``AuthorizationPendingError``.
+         - ``DEVICE_CODE_SLOW_DOWN``: as pending, but the client is polling
+diff --git a/tests/oauth2/rfc8628/grant_types/test_device_code.py b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+index 952cfe4c1aaf82b03e6e9bc92be1ac46711e557a..1cb5429472553f21b8263268c6f745abbef2d7f7 100644
+--- a/tests/oauth2/rfc8628/grant_types/test_device_code.py
++++ b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+@@ -4,6 +4,7 @@ import pytest
+ 
+ from oauthlib import common
+ 
++from oauthlib.oauth2.rfc6749 import errors as rfc6749_errors
+ from oauthlib.oauth2.rfc8628.grant_types import DeviceCodeGrant
+ from oauthlib.oauth2.rfc8628.request_validator import RequestValidator
+ from oauthlib.oauth2.rfc6749.tokens import BearerToken
+@@ -60,7 +61,12 @@ def test_custom_pre_and_post_token_validators():
+     request: common.Request = create_request()
+     request.client = client
+     client.client_id = request.client_id
+-    validator.validate_device_code.return_value = DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    def authorize(client_id, code, req):
++        req.scopes = ["hello", "world"]
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+@@ -77,7 +83,12 @@ def test_custom_pre_and_post_token_validators():
+ def test_create_token_response():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+-    validator.validate_device_code.return_value = DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    def authorize(client_id, code, req):
++        req.scopes = ["hello", "world"]
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+@@ -362,3 +373,104 @@ def test_missing_device_code():
+ 
+     validator.validate_device_code.assert_not_called()
+     validator.save_token.assert_not_called()
++
++
++def test_device_code_ignores_client_supplied_scope_parameter():
++    """A client-supplied scope parameter must not become the granted scopes.
++
++    The token endpoint pre-fills request.scopes from the untrusted ``scope``
++    parameter before the grant runs. Without this guard, a device-flow client
++    could obtain a token for any scope within its own registration whenever
++    validate_device_code did not populate request.scopes from the stored
++    authorization, bypassing the consent-integrity guard for issue #944.
++    """
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    # Simulate the token endpoint pre-filling scopes from the request
++    # parameter: the client was granted "read" but asks for "admin".
++    request.scope = "admin"
++    request.scopes = ["admin"]
++
++    def authorize(client_id, code, req):
++        req.scopes = ["read"]
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++    auth.create_token_response(request, bearer)
++
++    validator.get_default_scopes.assert_not_called()
++    validator.validate_scopes.assert_called_once_with(
++        "abcdef", ["read"], request.client, request
++    )
++
++
++@pytest.mark.parametrize("stored_scopes", [None, []])
++@pytest.mark.parametrize("policy_allowed", [True, False])
++def test_device_code_distinguishes_missing_and_empty_approved_scopes(
++    stored_scopes, policy_allowed
++):
++    validator = mock.MagicMock()
++    validator.get_default_scopes.return_value = ["default-admin"]
++    validator.validate_scopes.return_value = policy_allowed
++    request = create_request()
++    request.scope = "client-admin"
++    request.scopes = ["client-admin"]
++
++    def authorize(client_id, code, req):
++        req.user = mock.Mock()
++        req.scopes = stored_scopes
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
++    auth = DeviceCodeGrant(validator)
++
++    if stored_scopes is None:
++        with pytest.raises(rfc6749_errors.ServerError):
++            auth.validate_token_request(request)
++        validator.validate_scopes.assert_not_called()
++    else:
++        if policy_allowed:
++            auth.validate_token_request(request)
++        else:
++            with pytest.raises(rfc6749_errors.InvalidScopeError):
++                auth.validate_token_request(request)
++        assert request.scopes == []
++        validator.validate_scopes.assert_called_once_with(
++            "abcdef", [], request.client, request
++        )
++
++    validator.get_default_scopes.assert_not_called()
++    validator.save_token.assert_not_called()
++
++
++def test_device_code_empty_approved_scopes_policy_denial_does_not_issue_token():
++    validator = mock.MagicMock()
++    validator.get_default_scopes.return_value = ["default-admin"]
++    validator.validate_scopes.return_value = False
++    request = create_request()
++    request.scope = "client-admin"
++    request.scopes = ["client-admin"]
++
++    def authorize(client_id, code, req):
++        req.user = mock.Mock()
++        req.scopes = []
++        return DeviceCodeGrant.DEVICE_CODE_AUTHORIZED
++
++    validator.validate_device_code.side_effect = authorize
++    token_handler = mock.Mock()
++    auth = DeviceCodeGrant(validator)
++
++    _, response, status = auth.create_token_response(request, token_handler)
++
++    assert status == 400
++    assert json.loads(response)["error"] == "invalid_scope"
++    assert request.scopes == []
++    validator.validate_scopes.assert_called_once_with(
++        "abcdef", [], request.client, request
++    )
++    validator.get_default_scopes.assert_not_called()
++    token_handler.create_token.assert_not_called()
++    validator.save_token.assert_not_called()
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index d41eeff279..ca78875fb4 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -11,6 +11,8 @@ SRC_URI += " \
     file://CVE-2026-49264_p2.patch \
     file://CVE-2026-118669-dependent.patch \
     file://CVE-2026-118669.patch \
+    file://CVE-2026-49272_p1.patch \
+    file://CVE-2026-49272_p2.patch \
 "
 
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
-- 
2.35.6


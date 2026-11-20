Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4792.1795146382716273373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YVfqjcMX;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=41868; q=dns/txt;
  s=iport01; t=1795146382; x=1796355982;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aT+Mo/+/qbfxXQICuvQQ//GIUl/nTmW9IeoL1e4ek6s=;
  b=YVfqjcMXplJbvColhBmQSbC2hmYwD2xlyFcwbR7QoHsnjM4xjlr9T26Y
   KmvWv2B6UhfRDWpATWiwRl53FdHZovv6ww0y69Ms0ayd5Z5a77tnH21L/
   ZDI3SIqgTJa+DTcZXpCrtNCj7H/v/dlRPOicO4wii2c2BYNZ1/HSK5BQc
   BN6EieUOhci60HZOt9idriPqLSd1eLhwisx+6B0vxdPo+NreroA0RHgs6
   4HcPF2+fZWNzWTBuRZGpjUTnJpWcmqu57xvr9Mot7PDl3aJoER/LqUNVF
   +y1euWLOs7FFihtxQPSoVqizvng5+JbYG269tBZdTAYAuz7itZNoXNw+H
   A==;
X-CSE-ConnectionGUID: DL9y2wSrTkiHcHtQe7+XEQ==
X-CSE-MsgGUID: 8mxU2vqYRFWh5eECcfPjqQ==
X-IPAS-Result: =?us-ascii?q?A0C3AgBXwf9q/8xK/pBRCR4BAQsSDIIFC4JXdWBDSQOUJ?=
 =?us-ascii?q?4IhA4tmhWqMWYF+DwEBAQ9EDQQBAYQ/RgKOIQImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaARcBGAE9HAMBAhkWIAsjC?=
 =?us-ascii?q?BmDAgGCOgM3AxG5O4IsgQGDKQE/AkNQ2EwNgloBCxQBgTiFQoMAhSRdGAGEf?=
 =?us-ascii?q?ScbG4FygRWDaoEFgRpCAQECAYExFGiFdgSCIoEMgQdNgQuLchoCgU+BW4ZLS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?iGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRLDcVGQQ+bgeTb?=
 =?us-ascii?q?IImJgcOAjYvMhMHEwEpAQECFQoId2MBASccAQUDjiCETAkUCQiSNoE1nmtxC?=
 =?us-ascii?q?iiDeYwkjz6FfBozhASBV6UXC5h9glmIToJjhAqRKwI9DQNNhGqBaDyBRwsHc?=
 =?us-ascii?q?BWDIglKGQ+OOYNrgX+DFFHIdyYyAgEIAy8BAQcCBw4DC4FokAIkCYFPAQE?=
IronPort-Data: A9a23:AfOyTqvAgVfqoVpDDNf2CQ3dzufnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTyFOvuNamLwf9EjO4239klQu5PVn4JnGwBprykwE3sWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ8Esw1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1sImEDtRz
 uYkKzEtZTCfvu/pg4KWc7w57igjBJGD0II3s3x6iDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgt/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIK4fXFJUJwi50o
 EqW+nTEWA8DBeax9jrY/1+HjeH3nzrCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:1AK78aoVVitRnwuVgM72TdQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AvGq1NWvtu8xV6Xq6srffEpyB6IsJVizMlmjrOXO?=
 =?us-ascii?q?7CEZiaKGsRADTyI5dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AoBS/gw0Upa6fgE1UOva5qDzgjjUjs6G+NRoTiKQ?=
 =?us-ascii?q?8lfaEaCFdEDyTtDaue9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59359844"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 03:46:20 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 9E027180006C5
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:19 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 4537BCBF202; Thu, 19 Nov 2026 19:46:18 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 3/4] python3-oauthlib: fix CVE-2026-118669
Date: Thu, 19 Nov 2026 19:46:17 -0800
Message-Id: <20261120034618.604880-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120034618.604880-1-hthakar@cisco.com>
References: <20261120034618.604880-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132758
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

The client_credentials and password grants can authenticate one client
while authorizing grants and scopes using a supplied client_id for
another client, when validators rely on that client_id argument.

Backport upstream fix [1], referenced by NVD [2] and Debian [3], to
bind authorization to the authenticated client identity and reject a
conflicting client_id in OAuthLib 3.3.1.

Include authentication-helper prerequisite [4] for the older grant
implementation. Public-client validators must attach request.client.
Retain the upstream validator contract and regressions, and add cases
for missing, matching and inconsistent client identifiers. Omit
docs/oauth2/server.rst because the 3.3.1 source archive excludes docs.

[1] https://github.com/oauthlib/oauthlib/commit/c951a1d09f99f14e3240973fa83c4f4287d4753d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-118669
[3] https://security-tracker.debian.org/tracker/CVE-2026-118669
[4] https://github.com/oauthlib/oauthlib/commit/90d8aa851b6ce0fd095ed27e0f88051ab02279a9

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../CVE-2026-118669-dependent.patch           | 237 +++++++
 .../python3-oauthlib/CVE-2026-118669.patch    | 602 ++++++++++++++++++
 .../python/python3-oauthlib_3.3.1.bb          |   2 +
 3 files changed, 841 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669.patch

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669-dependent.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669-dependent.patch
new file mode 100644
index 0000000000..f3933854e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669-dependent.patch
@@ -0,0 +1,237 @@
+From 90d8aa851b6ce0fd095ed27e0f88051ab02279a9 Mon Sep 17 00:00:00 2001
+From: Kyle Hekhuis <kyle@posit.co>
+Date: Mon, 14 Jul 2025 16:04:42 -0400
+Subject: [PATCH] Add helper method for validating client authentication and
+ use it in AuthorizationCodeGrant, DeviceCodeGrant, RefreshTokenGrant, and
+ ResourceOwnerPasswordCredentialsGrant.
+
+Add some missing imports to the oauth2 __init__.py
+
+CVE: CVE-2026-118669
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/90d8aa851b6ce0fd095ed27e0f88051ab02279a9]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ oauthlib/oauth2/__init__.py                        |  5 ++--
+ .../rfc6749/grant_types/authorization_code.py      | 16 +----------
+ oauthlib/oauth2/rfc6749/grant_types/base.py        | 21 +++++++++++++++
+ .../oauth2/rfc6749/grant_types/refresh_token.py    | 16 ++++-------
+ .../resource_owner_password_credentials.py         |  9 +------
+ oauthlib/oauth2/rfc8628/grant_types/device_code.py | 20 +++++---------
+ .../oauth2/rfc8628/grant_types/test_device_code.py | 31 +++++++++++++++++++++-
+ 7 files changed, 67 insertions(+), 51 deletions(-)
+
+diff --git a/oauthlib/oauth2/__init__.py b/oauthlib/oauth2/__init__.py
+index 3bb5102..0e0bafd 100644
+--- a/oauthlib/oauth2/__init__.py
++++ b/oauthlib/oauth2/__init__.py
+@@ -66,5 +66,6 @@ from .rfc6749.request_validator import RequestValidator
+ from .rfc6749.tokens import BearerToken, OAuth2Token
+ from .rfc6749.utils import is_secure_transport
+ from .rfc8628.clients import DeviceClient
+-from oauthlib.oauth2.rfc8628.endpoints import DeviceAuthorizationEndpoint, DeviceApplicationServer
+-from oauthlib.oauth2.rfc8628.grant_types import DeviceCodeGrant
++from .rfc8628.endpoints import DeviceAuthorizationEndpoint, DeviceApplicationServer
++from .rfc8628.errors import AuthorizationPendingError, SlowDownError, ExpiredTokenError, AccessDenied
++from .rfc8628.grant_types import DeviceCodeGrant
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+index 09dc619..f2d6d27 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+@@ -452,21 +452,7 @@ class AuthorizationCodeGrant(GrantTypeBase):
+                 raise errors.InvalidRequestError(description='Duplicate %s parameter.' % param,
+                                                  request=request)
+ 
+-        if self.request_validator.client_authentication_required(request):
+-            # If the client type is confidential or the client was issued client
+-            # credentials (or assigned other authentication requirements), the
+-            # client MUST authenticate with the authorization server as described
+-            # in Section 3.2.1.
+-            # https://tools.ietf.org/html/rfc6749#section-3.2.1
+-            if not self.request_validator.authenticate_client(request):
+-                log.debug('Client authentication failed, %r.', request)
+-                raise errors.InvalidClientError(request=request)
+-        elif not self.request_validator.authenticate_client_id(request.client_id, request):
+-            # REQUIRED, if the client is not authenticating with the
+-            # authorization server as described in Section 3.2.1.
+-            # https://tools.ietf.org/html/rfc6749#section-3.2.1
+-            log.debug('Client authentication failed, %r.', request)
+-            raise errors.InvalidClientError(request=request)
++        self.validate_client_authentication(request)
+ 
+         if not hasattr(request.client, 'client_id'):
+             raise NotImplementedError('Authenticate client must set the '
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/base.py b/oauthlib/oauth2/rfc6749/grant_types/base.py
+index d96a2db..0b69e54 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/base.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/base.py
+@@ -175,6 +175,27 @@ class GrantTypeBase:
+                                                       request.scopes, request.client, request):
+             raise errors.InvalidScopeError(request=request)
+ 
++    def validate_client_authentication(self, request):
++        """Raise on failed client authentication."""
++        # Handles confidential clients
++        if self.request_validator.client_authentication_required(request):
++            # If the client type is confidential or the client was issued client
++            # credentials (or assigned other authentication requirements), the
++            # client MUST authenticate with the authorization server as described
++            # in Section 3.2.1.
++            # https://tools.ietf.org/html/rfc6749#section-3.2.1
++            if not self.request_validator.authenticate_client(request):
++                log.debug('Client authentication failed, %r.', request)
++                raise errors.InvalidClientError(request=request)
++
++        # Handles public clients
++        elif not self.request_validator.authenticate_client_id(request.client_id, request):
++            # REQUIRED, if the client is not authenticating with the
++            # authorization server as described in Section 3.2.1.
++            # https://tools.ietf.org/html/rfc6749#section-3.2.1
++            log.debug('Client authentication failed, %r.', request)
++            raise errors.InvalidClientError(request=request)
++
+     def prepare_authorization_response(self, request, token, headers, body, status):
+         """Place token according to response mode.
+ 
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py b/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
+index 43bf55a..f626f0c 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
+@@ -96,17 +96,11 @@ class RefreshTokenGrant(GrantTypeBase):
+         # authentication requirements), the client MUST authenticate with the
+         # authorization server as described in Section 3.2.1.
+         # https://tools.ietf.org/html/rfc6749#section-3.2.1
+-        if self.request_validator.client_authentication_required(request):
+-            log.debug('Authenticating client, %r.', request)
+-            if not self.request_validator.authenticate_client(request):
+-                log.debug('Invalid client (%r), denying access.', request)
+-                raise errors.InvalidClientError(request=request)
+-            # Ensure that request.client_id is set.
+-            if request.client_id is None and request.client is not None:
+-                request.client_id = request.client.client_id
+-        elif not self.request_validator.authenticate_client_id(request.client_id, request):
+-            log.debug('Client authentication failed, %r.', request)
+-            raise errors.InvalidClientError(request=request)
++        self.validate_client_authentication(request)
++
++        # Ensure that request.client_id is set.
++        if request.client_id is None and request.client is not None:
++            request.client_id = request.client.client_id
+ 
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py b/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
+index 55d9287..6fc67c6 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
+@@ -85,14 +85,7 @@ class ResourceOwnerPasswordCredentialsGrant(GrantTypeBase):
+         """
+         headers = self._get_default_headers()
+         try:
+-            if self.request_validator.client_authentication_required(request):
+-                log.debug('Authenticating client, %r.', request)
+-                if not self.request_validator.authenticate_client(request):
+-                    log.debug('Client authentication failed, %r.', request)
+-                    raise errors.InvalidClientError(request=request)
+-            elif not self.request_validator.authenticate_client_id(request.client_id, request):
+-                log.debug('Client authentication failed, %r.', request)
+-                raise errors.InvalidClientError(request=request)
++            self.validate_client_authentication(request)
+             log.debug('Validating access token request, %r.', request)
+             self.validate_token_request(request)
+         except errors.OAuth2Error as e:
+diff --git a/oauthlib/oauth2/rfc8628/grant_types/device_code.py b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+index 082daf0..9d23d45 100644
+--- a/oauthlib/oauth2/rfc8628/grant_types/device_code.py
++++ b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+@@ -55,14 +55,12 @@ class DeviceCodeGrant(GrantTypeBase):
+                     description=f"Duplicate {param} parameter.", request=request
+                 )
+ 
+-        if not self.request_validator.authenticate_client(request):
+-            raise rfc6749_errors.InvalidClientError(request=request)
+-        elif not hasattr(request.client, "client_id"):
+-            raise NotImplementedError(
+-                "Authenticate client must set the "
+-                "request.client.client_id attribute "
+-                "in authenticate_client."
+-            )
++        self.validate_client_authentication(request)
++
++        if not hasattr(request.client, 'client_id'):
++            raise NotImplementedError('Authenticate client must set the '
++                                      'request.client.client_id attribute '
++                                      'in authenticate_client.')
+ 
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+@@ -93,13 +91,7 @@ class DeviceCodeGrant(GrantTypeBase):
+         """
+         headers = self._get_default_headers()
+         try:
+-            if self.request_validator.client_authentication_required(
+-                request
+-            ) and not self.request_validator.authenticate_client(request):
+-                raise rfc6749_errors.InvalidClientError(request=request)
+-
+             self.validate_token_request(request)
+-
+         except rfc6749_errors.OAuth2Error as e:
+             headers.update(e.headers)
+             return headers, e.json, e.status_code
+diff --git a/tests/oauth2/rfc8628/grant_types/test_device_code.py b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+index da0592f..10b5dd6 100644
+--- a/tests/oauth2/rfc8628/grant_types/test_device_code.py
++++ b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+@@ -99,7 +99,7 @@ def test_create_token_response():
+     validator.save_token.assert_called_once()
+ 
+ 
+-def test_invalid_client_error():
++def test_invalid_client_authentication_error_confidential_client():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+     request.client = mock.Mock()
+@@ -107,6 +107,8 @@ def test_invalid_client_error():
+     auth = DeviceCodeGrant(validator)
+     bearer = BearerToken(validator)
+ 
++    # Simulate a confidential client that requires authentication
++    validator.client_authentication_required.return_value = True
+     validator.authenticate_client.return_value = False
+ 
+     headers, body, status_code = auth.create_token_response(request, bearer)
+@@ -124,6 +126,33 @@ def test_invalid_client_error():
+     validator.save_token.assert_not_called()
+ 
+ 
++def test_invalid_client_authentication_error_public_client():
++    validator = mock.MagicMock()
++    request: common.Request = create_request()
++    request.client = mock.Mock()
++
++    auth = DeviceCodeGrant(validator)
++    bearer = BearerToken(validator)
++
++    # Simulate a public client that does not require authentication
++    validator.client_authentication_required.return_value = False
++    validator.authenticate_client_id.return_value = False
++
++    headers, body, status_code = auth.create_token_response(request, bearer)
++    body = json.loads(body)
++
++    assert headers == {
++        "Content-Type": "application/json",
++        "Cache-Control": "no-store",
++        "Pragma": "no-cache",
++        "WWW-Authenticate": 'Bearer error="invalid_client"',
++    }
++    assert body == {"error": "invalid_client"}
++    assert status_code == 401
++
++    validator.save_token.assert_not_called()
++
++
+ def test_invalid_grant_type_error():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669.patch
new file mode 100644
index 0000000000..dd89de8a4a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-118669.patch
@@ -0,0 +1,602 @@
+From c951a1d09f99f14e3240973fa83c4f4287d4753d Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <jonathan.huot@gmail.com>
+Date: Sat, 11 Jul 2026 16:25:12 +0200
+Subject: [PATCH] Organized validate_client functions for all grant to avoid
+ mistake in grnat implementation
+
+CVE: CVE-2026-118669
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/c951a1d09f99f14e3240973fa83c4f4287d4753d]
+
+Backport Changes:
+- Omit docs/oauth2/server.rst because the 3.3.1 PyPI source archive
+  excludes the documentation tree. Retain the corresponding validator
+  contract changes in request_validator.py.
+- Add defensive tests for mismatched and missing client identifiers in
+  both affected grants, and absent/matching/mismatching identifiers in
+  the confidential and public authentication helpers.
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../rfc6749/grant_types/authorization_code.py      |  7 ---
+ oauthlib/oauth2/rfc6749/grant_types/base.py        | 60 ++++++++++++++++------
+ .../rfc6749/grant_types/client_credentials.py      | 11 +---
+ .../oauth2/rfc6749/grant_types/refresh_token.py    | 10 +---
+ .../resource_owner_password_credentials.py         | 10 +---
+ oauthlib/oauth2/rfc6749/request_validator.py       | 14 ++---
+ oauthlib/oauth2/rfc8628/grant_types/device_code.py |  6 ---
+ .../rfc6749/endpoints/test_error_responses.py      |  2 +-
+ .../rfc6749/endpoints/test_scope_handling.py       |  4 +-
+ .../rfc6749/grant_types/test_authorization_code.py | 32 +++++++++++-
+ .../grant_types/test_client_authentication.py      | 44 ++++++++++++++++
+ .../rfc6749/grant_types/test_client_credentials.py | 26 ++++++++++
+ .../rfc6749/grant_types/test_refresh_token.py      | 11 ++++
+ .../grant_types/test_resource_owner_password.py    | 25 +++++++++
+ tests/oauth2/rfc6749/test_server.py                |  4 +-
+ .../oauth2/rfc8628/grant_types/test_device_code.py |  2 +
+ .../connect/core/endpoints/test_claims_handling.py |  4 +-
+ .../connect/core/endpoints/test_refresh_token.py   |  7 +++
+ .../core/grant_types/test_authorization_code.py    |  2 +-
+ 19 files changed, 212 insertions(+), 69 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+index f2d6d27..1677939 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+@@ -454,13 +454,6 @@ class AuthorizationCodeGrant(GrantTypeBase):
+ 
+         self.validate_client_authentication(request)
+ 
+-        if not hasattr(request.client, 'client_id'):
+-            raise NotImplementedError('Authenticate client must set the '
+-                                      'request.client.client_id attribute '
+-                                      'in authenticate_client.')
+-
+-        request.client_id = request.client_id or request.client.client_id
+-
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/base.py b/oauthlib/oauth2/rfc6749/grant_types/base.py
+index 0b69e54..a5e5f42 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/base.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/base.py
+@@ -175,26 +175,56 @@ class GrantTypeBase:
+                                                       request.scopes, request.client, request):
+             raise errors.InvalidScopeError(request=request)
+ 
++    def validate_client_confidential(self, request):
++        # If the client type is confidential or the client was issued client
++        # credentials (or assigned other authentication requirements), the
++        # client MUST authenticate with the authorization server as described
++        # in Section 3.2.1.
++        # https://tools.ietf.org/html/rfc6749#section-3.2.1
++        log.debug('Authenticating confidential client, %r.', request)
++        if not self.request_validator.authenticate_client(request):
++            log.debug('Client authentication failed, %r.', request)
++            raise errors.InvalidClientError(request=request)
++
++        if request.client is None or \
++            not hasattr(request.client, 'client_id'):
++            raise NotImplementedError('Authenticate client must set the '
++                                      'request.client.client_id attribute '
++                                      'in authenticate_client.')
++
++        if not request.client_id:
++            request.client_id = request.client.client_id
++        elif request.client_id != request.client.client_id:
++            raise errors.ServerError('Discrepency found between client identifier')
++
++    def validate_client_public(self, request):
++        # REQUIRED, if the client is not authenticating with the
++        # authorization server as described in Section 3.2.1.
++        # https://tools.ietf.org/html/rfc6749#section-3.2.1
++        log.debug('Authenticating public client, %r.', request)
++        if not self.request_validator.authenticate_client_id(request.client_id, request):
++            log.debug('Client authentication failed, %r.', request)
++            raise errors.InvalidClientError(request=request)
++
++        if request.client is None or \
++            not hasattr(request.client, 'client_id'):
++            raise NotImplementedError('Authenticate client must set the '
++                                      'request.client.client_id attribute '
++                                      'in authenticate_client.')
++
++        if not request.client_id:
++            request.client_id = request.client.client_id
++        elif request.client_id != request.client.client_id:
++            raise errors.ServerError('Discrepency found between client identifier')
++
+     def validate_client_authentication(self, request):
+         """Raise on failed client authentication."""
+         # Handles confidential clients
+         if self.request_validator.client_authentication_required(request):
+-            # If the client type is confidential or the client was issued client
+-            # credentials (or assigned other authentication requirements), the
+-            # client MUST authenticate with the authorization server as described
+-            # in Section 3.2.1.
+-            # https://tools.ietf.org/html/rfc6749#section-3.2.1
+-            if not self.request_validator.authenticate_client(request):
+-                log.debug('Client authentication failed, %r.', request)
+-                raise errors.InvalidClientError(request=request)
+-
++            self.validate_client_confidential(request)
+         # Handles public clients
+-        elif not self.request_validator.authenticate_client_id(request.client_id, request):
+-            # REQUIRED, if the client is not authenticating with the
+-            # authorization server as described in Section 3.2.1.
+-            # https://tools.ietf.org/html/rfc6749#section-3.2.1
+-            log.debug('Client authentication failed, %r.', request)
+-            raise errors.InvalidClientError(request=request)
++        else:
++            self.validate_client_public(request)
+ 
+     def prepare_authorization_response(self, request, token, headers, body, status):
+         """Place token according to response mode.
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/client_credentials.py b/oauthlib/oauth2/rfc6749/grant_types/client_credentials.py
+index 35c5440..d5a653a 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/client_credentials.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/client_credentials.py
+@@ -103,18 +103,11 @@ class ClientCredentialsGrant(GrantTypeBase):
+                 raise errors.InvalidRequestError(description='Duplicate %s parameter.' % param,
+                                                  request=request)
+ 
+-        log.debug('Authenticating client, %r.', request)
+-        if not self.request_validator.authenticate_client(request):
+-            log.debug('Client authentication failed, %r.', request)
+-            raise errors.InvalidClientError(request=request)
+-        elif not hasattr(request.client, 'client_id'):
+-            raise NotImplementedError('Authenticate client must set the '
+-                                      'request.client.client_id attribute '
+-                                      'in authenticate_client.')
++        self.validate_client_confidential(request)
++
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
+-        request.client_id = request.client_id or request.client.client_id
+         log.debug('Authorizing access to client %r.', request.client_id)
+         self.validate_scopes(request)
+ 
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py b/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
+index f626f0c..60ec06b 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/refresh_token.py
+@@ -91,17 +91,9 @@ class RefreshTokenGrant(GrantTypeBase):
+ 
+         # Because refresh tokens are typically long-lasting credentials used to
+         # request additional access tokens, the refresh token is bound to the
+-        # client to which it was issued.  If the client type is confidential or
+-        # the client was issued client credentials (or assigned other
+-        # authentication requirements), the client MUST authenticate with the
+-        # authorization server as described in Section 3.2.1.
+-        # https://tools.ietf.org/html/rfc6749#section-3.2.1
++        # client to which it was issued
+         self.validate_client_authentication(request)
+ 
+-        # Ensure that request.client_id is set.
+-        if request.client_id is None and request.client is not None:
+-            request.client_id = request.client.client_id
+-
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py b/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
+index 6fc67c6..c721328 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/resource_owner_password_credentials.py
+@@ -85,7 +85,6 @@ class ResourceOwnerPasswordCredentialsGrant(GrantTypeBase):
+         """
+         headers = self._get_default_headers()
+         try:
+-            self.validate_client_authentication(request)
+             log.debug('Validating access token request, %r.', request)
+             self.validate_token_request(request)
+         except errors.OAuth2Error as e:
+@@ -168,23 +167,18 @@ class ResourceOwnerPasswordCredentialsGrant(GrantTypeBase):
+         if not request.grant_type == 'password':
+             raise errors.UnsupportedGrantTypeError(request=request)
+ 
++        self.validate_client_authentication(request)
++
+         log.debug('Validating username %s.', request.username)
+         if not self.request_validator.validate_user(request.username,
+                                                     request.password, request.client, request):
+             raise errors.InvalidGrantError(
+                 'Invalid credentials given.', request=request)
+-        elif not hasattr(request.client, 'client_id'):
+-            raise NotImplementedError(
+-                'Validate user must set the '
+-                'request.client.client_id attribute '
+-                'in authenticate_client.')
+         log.debug('Authorizing access to user %r.', request.user)
+ 
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
+-        if request.client:
+-            request.client_id = request.client_id or request.client.client_id
+         self.validate_scopes(request)
+ 
+         for validator in self.custom_validators.post_token:
+diff --git a/oauthlib/oauth2/rfc6749/request_validator.py b/oauthlib/oauth2/rfc6749/request_validator.py
+index 6d6ebaa..ce0dc98 100644
+--- a/oauthlib/oauth2/rfc6749/request_validator.py
++++ b/oauthlib/oauth2/rfc6749/request_validator.py
+@@ -80,9 +80,10 @@ class RequestValidator:
+         A non-confidential client is one that is not required to authenticate
+         through other means, such as using HTTP Basic.
+ 
+-        Note, while not strictly necessary it can often be very convenient
+-        to set request.client to the client object associated with the
+-        given client_id.
++        After the client identification succeeds, this method needs to set the
++        client on the request, i.e. request.client = client. A client object's
++        class must contain the 'client_id' attribute and the 'client_id' must have
++        a value.
+ 
+         :param client_id: Unicode client identifier.
+         :param request: OAuthlib request.
+@@ -419,9 +420,10 @@ class RequestValidator:
+     def validate_client_id(self, client_id, request, *args, **kwargs):
+         """Ensure client_id belong to a valid and active client.
+ 
+-        Note, while not strictly necessary it can often be very convenient
+-        to set request.client to the client object associated with the
+-        given client_id.
++        After the client identification succeeds, this method needs to set the
++        client on the request, i.e. request.client = client. A client object's
++        class must contain the 'client_id' attribute and the 'client_id' must have
++        a value.
+ 
+         :param client_id: Unicode client identifier.
+         :param request: OAuthlib request.
+diff --git a/oauthlib/oauth2/rfc8628/grant_types/device_code.py b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+index 9d23d45..41ee09e 100644
+--- a/oauthlib/oauth2/rfc8628/grant_types/device_code.py
++++ b/oauthlib/oauth2/rfc8628/grant_types/device_code.py
+@@ -57,15 +57,9 @@ class DeviceCodeGrant(GrantTypeBase):
+ 
+         self.validate_client_authentication(request)
+ 
+-        if not hasattr(request.client, 'client_id'):
+-            raise NotImplementedError('Authenticate client must set the '
+-                                      'request.client.client_id attribute '
+-                                      'in authenticate_client.')
+-
+         # Ensure client is authorized use of this grant type
+         self.validate_grant_type(request)
+ 
+-        request.client_id = request.client_id or request.client.client_id
+         self.validate_scopes(request)
+ 
+         for validator in self.custom_validators.post_token:
+diff --git a/tests/oauth2/rfc6749/endpoints/test_error_responses.py b/tests/oauth2/rfc6749/endpoints/test_error_responses.py
+index f61595e..5b9a929 100644
+--- a/tests/oauth2/rfc6749/endpoints/test_error_responses.py
++++ b/tests/oauth2/rfc6749/endpoints/test_error_responses.py
+@@ -400,7 +400,7 @@ class ErrorResponseTest(TestCase):
+         self.assertEqual('invalid_client', json.loads(body)['error'])
+ 
+         # Client credentials grant
+-        _, body, _ = self.legacy.create_token_response('https://i.b/token',
++        _, body, _ = self.backend.create_token_response('https://i.b/token',
+                 body='grant_type=client_credentials')
+         self.assertEqual('invalid_client', json.loads(body)['error'])
+ 
+diff --git a/tests/oauth2/rfc6749/endpoints/test_scope_handling.py b/tests/oauth2/rfc6749/endpoints/test_scope_handling.py
+index 4c87d9c..6de7641 100644
+--- a/tests/oauth2/rfc6749/endpoints/test_scope_handling.py
++++ b/tests/oauth2/rfc6749/endpoints/test_scope_handling.py
+@@ -30,12 +30,12 @@ class TestScopeHandling(TestCase):
+         request.user = 'foo'
+         request.client_id = 'bar'
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     def set_client(self, request):
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     def setUp(self):
+diff --git a/tests/oauth2/rfc6749/grant_types/test_authorization_code.py b/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
+index 77e1a81..1448646 100644
+--- a/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
++++ b/tests/oauth2/rfc6749/grant_types/test_authorization_code.py
+@@ -34,7 +34,7 @@ class AuthorizationCodeGrantTest(TestCase):
+ 
+     def set_client(self, request):
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     def setup_validators(self):
+@@ -198,6 +198,36 @@ class AuthorizationCodeGrantTest(TestCase):
+         self.assertRaises(errors.InvalidClientError,
+                           self.auth.validate_token_request, self.request)
+ 
++    def test_client_id_discrepancy(self):
++        """ServerError raised when authenticate_client sets a different client_id."""
++        def set_mismatched_client(request):
++            request.client = mock.MagicMock()
++            request.client.client_id = 'different_from_abcdef'
++            return True
++        self.mock_validator.authenticate_client.side_effect = set_mismatched_client
++        self.assertRaises(errors.ServerError,
++                          self.auth.validate_token_request, self.request)
++
++    def test_public_client_id_missing(self):
++        """NotImplementedError raised when authenticate_client_id does not set request.client."""
++        self.mock_validator.client_authentication_required.return_value = False
++        self.mock_validator.authenticate_client_id.return_value = True
++        self.request.client = mock.MagicMock()
++        del self.request.client.client_id
++        self.assertRaises(NotImplementedError,
++                          self.auth.validate_token_request, self.request)
++
++    def test_public_client_id_discrepancy(self):
++        """ServerError raised when authenticate_client_id sets a different client_id."""
++        def set_mismatched_client(client_id, request):
++            request.client = mock.MagicMock()
++            request.client.client_id = 'different_from_abcdef'
++            return True
++        self.mock_validator.client_authentication_required.return_value = False
++        self.mock_validator.authenticate_client_id.side_effect = set_mismatched_client
++        self.assertRaises(errors.ServerError,
++                          self.auth.validate_token_request, self.request)
++
+     def test_invalid_redirect_uri(self):
+         self.mock_validator.confirm_redirect_uri.return_value = False
+         self.assertRaises(errors.MismatchingRedirectURIError,
+diff --git a/tests/oauth2/rfc6749/grant_types/test_client_authentication.py b/tests/oauth2/rfc6749/grant_types/test_client_authentication.py
+new file mode 100644
+index 0000000..3481cba
+--- /dev/null
++++ b/tests/oauth2/rfc6749/grant_types/test_client_authentication.py
+@@ -0,0 +1,44 @@
++from types import SimpleNamespace
++from unittest import mock
++
++from oauthlib.common import Request
++from oauthlib.oauth2.rfc6749 import errors
++from oauthlib.oauth2.rfc6749.grant_types.base import GrantTypeBase
++
++from tests.unittest import TestCase
++
++
++class ClientAuthenticationIdentityTest(TestCase):
++
++    def authenticate(self, method, client_id):
++        request = Request('https://example.test/token')
++        request.client_id = client_id
++        validator = mock.Mock()
++
++        def attach_client(*args):
++            request.client = SimpleNamespace(client_id='test-client')
++            return True
++
++        validator.authenticate_client.side_effect = attach_client
++        validator.authenticate_client_id.side_effect = attach_client
++        grant = GrantTypeBase(validator)
++        getattr(grant, method)(request)
++        return request, validator
++
++    def test_missing_identifier_is_set_from_authenticated_client(self):
++        for method in ('validate_client_confidential', 'validate_client_public'):
++            with self.subTest(method=method):
++                request, _ = self.authenticate(method, None)
++                self.assertEqual(request.client_id, request.client.client_id)
++
++    def test_matching_identifier_is_preserved(self):
++        for method in ('validate_client_confidential', 'validate_client_public'):
++            with self.subTest(method=method):
++                request, _ = self.authenticate(method, 'test-client')
++                self.assertEqual(request.client_id, 'test-client')
++
++    def test_mismatched_identifier_is_rejected(self):
++        for method in ('validate_client_confidential', 'validate_client_public'):
++            with self.subTest(method=method):
++                with self.assertRaises(errors.ServerError):
++                    self.authenticate(method, 'different-client')
+diff --git a/tests/oauth2/rfc6749/grant_types/test_client_credentials.py b/tests/oauth2/rfc6749/grant_types/test_client_credentials.py
+index e9559c7..10afd4f 100644
+--- a/tests/oauth2/rfc6749/grant_types/test_client_credentials.py
++++ b/tests/oauth2/rfc6749/grant_types/test_client_credentials.py
+@@ -3,6 +3,7 @@ import json
+ from unittest import mock
+ 
+ from oauthlib.common import Request
++from oauthlib.oauth2.rfc6749 import errors
+ from oauthlib.oauth2.rfc6749.grant_types import ClientCredentialsGrant
+ from oauthlib.oauth2.rfc6749.tokens import BearerToken
+ 
+@@ -74,3 +75,28 @@ class ClientCredentialsGrantTest(TestCase):
+     def test_validate_token_response(self):
+         # wrong grant type, scope
+         pass
++
++    def test_client_identifier_mismatch_rejected_before_authorization(self):
++        self.request.client = mock.Mock(client_id='authenticated-client')
++        self.request.client_id = 'different-client'
++        self.mock_validator.authenticate_client.return_value = True
++
++        with self.assertRaises(errors.ServerError):
++            self.auth.validate_token_request(self.request)
++
++        self.mock_validator.validate_grant_type.assert_not_called()
++        self.mock_validator.validate_scopes.assert_not_called()
++
++    def test_missing_client_identifier_set_before_authorization(self):
++        self.request.client = mock.Mock(client_id='authenticated-client')
++        self.request.client_id = None
++        self.mock_validator.authenticate_client.return_value = True
++
++        self.auth.validate_token_request(self.request)
++
++        self.mock_validator.validate_grant_type.assert_called_once_with(
++            'authenticated-client', 'client_credentials',
++            self.request.client, self.request)
++        self.mock_validator.validate_scopes.assert_called_once_with(
++            'authenticated-client', self.request.scopes,
++            self.request.client, self.request)
+diff --git a/tests/oauth2/rfc6749/grant_types/test_refresh_token.py b/tests/oauth2/rfc6749/grant_types/test_refresh_token.py
+index f963444..efa156a 100644
+--- a/tests/oauth2/rfc6749/grant_types/test_refresh_token.py
++++ b/tests/oauth2/rfc6749/grant_types/test_refresh_token.py
+@@ -15,6 +15,7 @@ class RefreshTokenGrantTest(TestCase):
+     def setUp(self):
+         mock_client = mock.MagicMock()
+         mock_client.user.return_value = 'mocked user'
++        mock_client.client_id = 'abcdef'
+         self.request = Request('http://a.b/path')
+         self.request.grant_type = 'refresh_token'
+         self.request.refresh_token = 'lsdkfhj230'
+@@ -146,6 +147,16 @@ class RefreshTokenGrantTest(TestCase):
+         self.auth.validate_token_request(self.request)
+         self.request.client_id = 'foobar'
+ 
++    def test_client_id_discrepancy(self):
++        """ServerError raised when authenticate_client sets a different client_id."""
++        def set_mismatched_client(request):
++            request.client = mock.MagicMock()
++            request.client.client_id = 'different_from_abcdef'
++            return True
++        self.mock_validator.authenticate_client.side_effect = set_mismatched_client
++        self.assertRaises(errors.ServerError,
++                          self.auth.validate_token_request, self.request)
++
+     def test_invalid_grant_type(self):
+         self.request.grant_type = 'wrong_type'
+         self.assertRaises(errors.UnsupportedGrantTypeError,
+diff --git a/tests/oauth2/rfc6749/grant_types/test_resource_owner_password.py b/tests/oauth2/rfc6749/grant_types/test_resource_owner_password.py
+index 294e27b..49fbb26 100644
+--- a/tests/oauth2/rfc6749/grant_types/test_resource_owner_password.py
++++ b/tests/oauth2/rfc6749/grant_types/test_resource_owner_password.py
+@@ -32,6 +32,31 @@ class ResourceOwnerPasswordCredentialsGrantTest(TestCase):
+         request.client.client_id = 'mocked'
+         return True
+ 
++    def test_client_identifier_mismatch_rejected_before_authorization(self):
++        self.request.client = mock.Mock(client_id='authenticated-client')
++        self.request.client_id = 'different-client'
++        self.mock_validator.authenticate_client.return_value = True
++
++        with self.assertRaises(errors.ServerError):
++            self.auth.validate_token_request(self.request)
++
++        self.mock_validator.validate_grant_type.assert_not_called()
++        self.mock_validator.validate_scopes.assert_not_called()
++
++    def test_missing_client_identifier_set_before_authorization(self):
++        self.request.client = mock.Mock(client_id='authenticated-client')
++        self.request.client_id = None
++        self.mock_validator.authenticate_client.return_value = True
++
++        self.auth.validate_token_request(self.request)
++
++        self.mock_validator.validate_grant_type.assert_called_once_with(
++            'authenticated-client', 'password',
++            self.request.client, self.request)
++        self.mock_validator.validate_scopes.assert_called_once_with(
++            'authenticated-client', self.request.scopes,
++            self.request.client, self.request)
++
+     def test_create_token_response(self):
+         bearer = BearerToken(self.mock_validator)
+         headers, body, status_code = self.auth.create_token_response(
+diff --git a/tests/oauth2/rfc6749/test_server.py b/tests/oauth2/rfc6749/test_server.py
+index 94af37e..1bfd3e7 100644
+--- a/tests/oauth2/rfc6749/test_server.py
++++ b/tests/oauth2/rfc6749/test_server.py
+@@ -112,7 +112,7 @@ class TokenEndpointTest(TestCase):
+         def set_user(request):
+             request.user = mock.MagicMock()
+             request.client = mock.MagicMock()
+-            request.client.client_id = 'mocked_client_id'
++            request.client.client_id = request.client_id
+             return True
+ 
+         self.mock_validator = mock.MagicMock()
+@@ -219,7 +219,7 @@ class SignedTokenEndpointTest(TestCase):
+         def set_user(request):
+             request.user = mock.MagicMock()
+             request.client = mock.MagicMock()
+-            request.client.client_id = 'mocked_client_id'
++            request.client.client_id = request.client_id
+             return True
+ 
+         self.mock_validator = mock.MagicMock()
+diff --git a/tests/oauth2/rfc8628/grant_types/test_device_code.py b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+index 10b5dd6..3e3c002 100644
+--- a/tests/oauth2/rfc8628/grant_types/test_device_code.py
++++ b/tests/oauth2/rfc8628/grant_types/test_device_code.py
+@@ -53,6 +53,7 @@ def test_custom_pre_and_post_token_validators():
+ 
+     request: common.Request = create_request()
+     request.client = client
++    client.client_id = request.client_id
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+@@ -70,6 +71,7 @@ def test_create_token_response():
+     validator = mock.MagicMock()
+     request: common.Request = create_request()
+     request.client = mock.Mock()
++    request.client.client_id = request.client_id
+ 
+     auth = DeviceCodeGrant(validator)
+ 
+diff --git a/tests/openid/connect/core/endpoints/test_claims_handling.py b/tests/openid/connect/core/endpoints/test_claims_handling.py
+index bc70269..d47affd 100644
+--- a/tests/openid/connect/core/endpoints/test_claims_handling.py
++++ b/tests/openid/connect/core/endpoints/test_claims_handling.py
+@@ -29,12 +29,12 @@ class TestClaimsHandling(TestCase):
+         request.user = 'foo'
+         request.client_id = 'bar'
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     def set_client(self, request):
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     def save_claims_with_code(self, client_id, code, request, *args, **kwargs):
+diff --git a/tests/openid/connect/core/endpoints/test_refresh_token.py b/tests/openid/connect/core/endpoints/test_refresh_token.py
+index 9161f5a..b083097 100644
+--- a/tests/openid/connect/core/endpoints/test_refresh_token.py
++++ b/tests/openid/connect/core/endpoints/test_refresh_token.py
+@@ -19,6 +19,13 @@ class TestRefreshToken(TestCase):
+         self.validator = mock.MagicMock(spec=RequestValidator)
+         self.validator.get_id_token.return_value='id_token'
+ 
++        def set_client(request):
++            request.client = mock.MagicMock()
++            request.client.client_id = request.client_id
++            return True
++
++        self.validator.authenticate_client.side_effect = set_client
++
+         self.server = Server(self.validator)
+ 
+     def test_refresh_token_with_openid(self):
+diff --git a/tests/openid/connect/core/grant_types/test_authorization_code.py b/tests/openid/connect/core/grant_types/test_authorization_code.py
+index f19b5fa..b453d9d 100644
+--- a/tests/openid/connect/core/grant_types/test_authorization_code.py
++++ b/tests/openid/connect/core/grant_types/test_authorization_code.py
+@@ -54,7 +54,7 @@ class OpenIDAuthCodeTest(TestCase):
+ 
+     def set_client(self, request):
+         request.client = mock.MagicMock()
+-        request.client.client_id = 'mocked'
++        request.client.client_id = request.client_id
+         return True
+ 
+     @mock.patch('oauthlib.common.generate_token')
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index ffb07fef30..d41eeff279 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -9,6 +9,8 @@ SRC_URI += " \
     file://CVE-2026-49265_p2.patch \
     file://CVE-2026-49264_p1.patch \
     file://CVE-2026-49264_p2.patch \
+    file://CVE-2026-118669-dependent.patch \
+    file://CVE-2026-118669.patch \
 "
 
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
-- 
2.35.6


Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16FEC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:47:05 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.787.1787204821946704479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hnGTT76x;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17073; q=dns/txt;
  s=iport01; t=1787204821; x=1788414421;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6qrwXLIG0T678vvG0tQKBefmtM16x6g900UASey3PLQ=;
  b=hnGTT76xh9jRK0Bj7vRmW+M/Fb9N8FXnkxwiZJxV96Rax3Siak0THstE
   s+gKMuCZZZP8qozsdSGAP/krO4eirq9nHk5T68JbTwROyupyO8cRf07pK
   8C3QiwuMicReEIJqLR0sSzUkq8dZc8Qpr7nig34WhXTn169v/lCaCnXCt
   TFWKypXvH43DcIiaB/rm6hJRAHRuPtMBJ9y1Hx5qRSQc/bVcWvDTo7sr6
   EA9WF1P7a87Htv3+IUxTmZvDk4hJsbXWQdJ4oqrTTggmsu5C//tIWnmK/
   +DY1FGuZosfe2Tq837UseRjWbDZqFuH9iNKcNHisfqWXzHCgqk5VQpgtp
   A==;
X-CSE-ConnectionGUID: Symctp6FRGOb+HwsFZHIDw==
X-CSE-MsgGUID: efAQT5sIRwe3CTxa4xqcNg==
X-IPAS-Result: =?us-ascii?q?A0AnAABXk4Zq/5MQJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0XkNJA4RUiBuJWItnkjeBfg8BAQEPRA0EAQGFBY1tAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEmBAsBGAEtLAMBAgMCJ?=
 =?us-ascii?q?gIiCyMYCYMCAYI6AzcDEcIxen8zgQGDKAGBVNhLDYJYAQsUAQWBBS4BhT6Cf?=
 =?us-ascii?q?yABhQJdGAFEhDgnGxuBcoEVg2mBBYEaQgKFO4JqBIIigQyBWAKBLXEBYo5vS?=
 =?us-ascii?q?IECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc1WBsGBYEdgSiENyMZNnyBC?=
 =?us-ascii?q?V6BKyphARIXgQmCCgKCcIIGAgFJRQ4JFwsYDUgRLDcUGQQ9AW4HjlEggX5NL?=
 =?us-ascii?q?SsjEwEqAYEgFHgFCQ4IAaVRoB5xCiiDdowhjz6FfBozhASBV5JAklELmH2CW?=
 =?us-ascii?q?YsxhAmRMkVQhGmBaDyBWXAVO4JnCUoZD44qBAoLg2CFZMZVJzICCQMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:rJnlKq5mVKrgeE4+k8f+owxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mUbDDyAPfyMN2Dxetlwa4Tlox8OvZfcn4I2TQE5pHs2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eBpwd8fpvX0902
 tsSaxASdT6xp8Oa3+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0In1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aYCLJYTbFZs9ckCwq
 2zvxlikGTAgK9HE4gaV+y68n+TpknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:J/L0RKiFpIT8hWH7kDhPsG818HBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHvJYVcqKRQdcL+7WZVoLUmwyXcX2/hyAV7dZmnbUQKTRekIh7cKqAePJ8SRzIJgPI
 5bAs9D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AXlpH2moksqSjEDmb+hAeNuHmUfs0d3bB1Cn+GWC?=
 =?us-ascii?q?fAyVJV6a7e3+x1Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:BUhfygZpyxrvWuBTujHFvQ0/L+ZS/Kn1I3wdmMkWosKiOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812670986"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:47:01 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id C81AD18000174;
	Thu, 20 Aug 2026 05:47:00 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 65F7BCC12A6; Wed, 19 Aug 2026 22:47:00 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH] python3-web3: Fix CVE-2026-40072
Date: Wed, 19 Aug 2026 22:45:38 -0700
Message-Id: <20260820054538.26512-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129379

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the v7 upstream fix for CVE-2026-40072 shown in [1].
The security advisory [2] references the patch-equivalent v8/main fix [3].
The v7 commit was selected because it is the nearest source baseline to
Scarthgap's web3.py 6.17.0 recipe.

[1] https://github.com/ApeWorX/web3.py/commit/d62e67d3b636bd4c5a929696c0f5c4167c31625b
[2] https://github.com/ApeWorX/web3.py/security/advisories/GHSA-5hr4-253g-cpx2
[3] https://github.com/ApeWorX/web3.py/commit/b1c57bb0a124359c9902daaefab4d8af7c3c4c1e

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-web3/CVE-2026-40072.patch  | 434 ++++++++++++++++++
 .../python/python3-web3_6.17.0.bb             |   1 +
 2 files changed, 435 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch

diff --git a/meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch b/meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch
new file mode 100644
index 0000000000..35e94cde60
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch
@@ -0,0 +1,434 @@
+From 21ee858ea75287d781eb0a878d9463346da648b3 Mon Sep 17 00:00:00 2001
+From: fselmo <fselmo2@gmail.com>
+Date: Fri, 13 Mar 2026 15:38:09 -0600
+Subject: [PATCH] feat: added restrictions on CCIP read durin calls
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SSRF Mitigation for CCIP Read:
+
+- validate_ccip_url_scheme() — HTTPS-only by default; HTTP allowed via opt-in
+- validate_ccip_url_host() / async_validate_ccip_url_host() — resolves hostname and blocks private/reserved IP ranges (127.0.0.0/8, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, etc.)
+- Type aliases: CcipUrlValidator, AsyncCcipUrlValidator
+- Provider config (base.py, async_base.py):
+- ccip_read_allow_http: bool = False
+- ccip_read_url_validator — optional user-supplied hook to reject/allow URLs
+- Handler changes (exception_handling.py, async_exception_handling.py):
+- Scheme + host validation before each HTTP request
+- allow_redirects=False on all requests
+- Validation failures continue to next URL (consistent with existing error handling)
+
+- Wiring (eth.py, async_eth.py):
+- _durin_call passes provider config to handlers
+
+Tests:
+- tests/core/utilities/test_ccip_url_validation.py — 23 unit tests for scheme/host validation
+- tests/core/contracts/test_offchain_lookup.py — 6 new integration tests (HTTP rejection, allow_http, custom validator, private IP blocking, redirect prevention)
+- Updated test mocks to patch socket.getaddrinfo and assert allow_redirects=False
+
+CVE: CVE-2026-40072
+Upstream-Status: Backport [https://github.com/ApeWorX/web3.py/commit/d62e67d3b636bd4c5a929696c0f5c4167c31625b]
+
+Backport Changes:
+- Retained the v6.17 request helper APIs and passed
+  `allow_redirects=False` through them instead of using the newer direct
+  session APIs.
+- Retained the v6.17 POST `data` payload and malformed-URL checks; the
+  newer source uses a `json` payload and a generic POST fallback.
+- Exported the validator aliases through the v6.17 utility imports; this
+  version has no utility `__all__` list to update.
+- Kept the v6.17 timeout and POST-payload assertions in the request mocks
+  while adding the upstream redirect assertions.
+- Reformatted the synchronous `_durin_call` arguments so the new provider
+  options can be passed on the v6.17 call site.
+- Omitted changes under `tests/core` and `tests/ens` because the PyPI
+  source archive used by this recipe does not ship those directories.
+  The omitted tests were validated separately against the v6.17 Git tag.
+
+(cherry picked from commit d62e67d3b636bd4c5a929696c0f5c4167c31625b)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../module_testing/module_testing_utils.py    |  26 ++++-
+ web3/eth/async_eth.py                         |   2 +
+ web3/eth/eth.py                               |   5 +-
+ web3/providers/async_base.py                  |   5 +
+ web3/providers/base.py                        |   5 +
+ web3/utils/__init__.py                        |   4 +
+ web3/utils/async_exception_handling.py        |  21 +++-
+ web3/utils/ccip_url_validation.py             | 105 ++++++++++++++++++
+ web3/utils/exception_handling.py              |  21 +++-
+ 9 files changed, 190 insertions(+), 4 deletions(-)
+ create mode 100644 web3/utils/ccip_url_validation.py
+
+diff --git a/web3/_utils/module_testing/module_testing_utils.py b/web3/_utils/module_testing/module_testing_utils.py
+index 46c82c22..7b05702b 100644
+--- a/web3/_utils/module_testing/module_testing_utils.py
++++ b/web3/_utils/module_testing/module_testing_utils.py
+@@ -89,6 +89,24 @@ def assert_contains_log(
+     assert log_entry["transactionHash"] == HexBytes(txn_hash_with_log)
+ 
+ 
++def _mock_getaddrinfo_public(
++    monkeypatch: "MonkeyPatch",
++) -> None:
++    # Patch socket.getaddrinfo to return a public IP for CCIP test domains
++    # so that CCIP URL host validation passes during tests. Pass through
++    # to the real getaddrinfo for all other hosts (e.g. 127.0.0.1 for geth).
++    import socket as _socket
++
++    _original_getaddrinfo = _socket.getaddrinfo
++
++    def _patched_getaddrinfo(host: Any, port: Any, *args: Any, **kwargs: Any) -> Any:
++        if host == "web3.py":
++            return [(_socket.AF_INET, _socket.SOCK_STREAM, 0, "", ("1.2.3.4", 0))]
++        return _original_getaddrinfo(host, port, *args, **kwargs)
++
++    monkeypatch.setattr("socket.getaddrinfo", _patched_getaddrinfo)
++
++
+ def mock_offchain_lookup_request_response(
+     monkeypatch: "MonkeyPatch",
+     http_method: Literal["GET", "POST"] = "GET",
+@@ -100,6 +118,8 @@ def mock_offchain_lookup_request_response(
+     sender: str = None,
+     calldata: str = None,
+ ) -> None:
++    _mock_getaddrinfo_public(monkeypatch)
++
+     class MockedResponse:
+         status_code = mocked_status_code
+ 
+@@ -119,6 +139,7 @@ def mock_offchain_lookup_request_response(
+         # mock response only to specified url while validating appropriate fields
+         if url_from_args == mocked_request_url:
+             assert kwargs["timeout"] == 10
++            assert kwargs.get("allow_redirects") is False
+             if http_method.upper() == "POST":
+                 assert kwargs["data"] == {"data": calldata, "sender": sender}
+             return MockedResponse()
+@@ -146,6 +167,8 @@ def async_mock_offchain_lookup_request_response(
+     sender: str = None,
+     calldata: str = None,
+ ) -> None:
++    _mock_getaddrinfo_public(monkeypatch)
++
+     class AsyncMockedResponse:
+         status = mocked_status_code
+ 
+@@ -169,7 +192,8 @@ def async_mock_offchain_lookup_request_response(
+         # mock response only to specified url while validating appropriate fields
+         if url_from_args == mocked_request_url:
+             assert kwargs["timeout"] == ClientTimeout(10)
+-            if http_method.upper() == "post":
++            assert kwargs.get("allow_redirects") is False
++            if http_method.upper() == "POST":
+                 assert kwargs["data"] == {"data": calldata, "sender": sender}
+             return AsyncMockedResponse()
+ 
+diff --git a/web3/eth/async_eth.py b/web3/eth/async_eth.py
+index b6412a59..14d5679a 100644
+--- a/web3/eth/async_eth.py
++++ b/web3/eth/async_eth.py
+@@ -293,6 +293,8 @@ class AsyncEth(BaseEth):
+                 durin_calldata = await async_handle_offchain_lookup(
+                     offchain_lookup.payload,
+                     transaction,
++                    allow_http=self.w3.provider.ccip_read_allow_http,
++                    url_validator=self.w3.provider.ccip_read_url_validator,
+                 )
+                 transaction["data"] = durin_calldata
+ 
+diff --git a/web3/eth/eth.py b/web3/eth/eth.py
+index 6e1700ca..e11623a7 100644
+--- a/web3/eth/eth.py
++++ b/web3/eth/eth.py
+@@ -279,7 +279,10 @@ class Eth(BaseEth):
+                 return self._call(transaction, block_identifier, state_override)
+             except OffchainLookup as offchain_lookup:
+                 durin_calldata = handle_offchain_lookup(
+-                    offchain_lookup.payload, transaction
++                    offchain_lookup.payload,
++                    transaction,
++                    allow_http=self.w3.provider.ccip_read_allow_http,
++                    url_validator=self.w3.provider.ccip_read_url_validator,
+                 )
+                 transaction["data"] = durin_calldata
+ 
+diff --git a/web3/providers/async_base.py b/web3/providers/async_base.py
+index 30404b6b..64b9f7f8 100644
+--- a/web3/providers/async_base.py
++++ b/web3/providers/async_base.py
+@@ -38,6 +38,9 @@ if TYPE_CHECKING:
+         AsyncWeb3,
+         WebsocketProviderV2,
+     )
++    from web3.utils.ccip_url_validation import (
++        AsyncCcipUrlValidator,
++    )
+ 
+ 
+ class AsyncBaseProvider:
+@@ -54,6 +57,8 @@ class AsyncBaseProvider:
+     has_persistent_connection = False
+     global_ccip_read_enabled: bool = True
+     ccip_read_max_redirects: int = 4
++    ccip_read_allow_http: bool = False
++    ccip_read_url_validator: "AsyncCcipUrlValidator | None" = None
+ 
+     @property
+     def middlewares(self) -> Tuple[AsyncMiddleware, ...]:
+diff --git a/web3/providers/base.py b/web3/providers/base.py
+index d7877546..5d91f635 100644
+--- a/web3/providers/base.py
++++ b/web3/providers/base.py
+@@ -32,6 +32,9 @@ from web3.types import (
+ 
+ if TYPE_CHECKING:
+     from web3 import Web3  # noqa: F401
++    from web3.utils.ccip_url_validation import (
++        CcipUrlValidator,
++    )
+ 
+ 
+ class BaseProvider:
+@@ -46,6 +49,8 @@ class BaseProvider:
+     has_persistent_connection = False
+     global_ccip_read_enabled: bool = True
+     ccip_read_max_redirects: int = 4
++    ccip_read_allow_http: bool = False
++    ccip_read_url_validator: "CcipUrlValidator | None" = None
+ 
+     @property
+     def middlewares(self) -> Tuple[Middleware, ...]:
+diff --git a/web3/utils/__init__.py b/web3/utils/__init__.py
+index 13c24de6..2c4f1d94 100644
+--- a/web3/utils/__init__.py
++++ b/web3/utils/__init__.py
+@@ -14,6 +14,10 @@ from .async_exception_handling import (  # NOQA
+ from .caching import (  # NOQA
+     SimpleCache,
+ )
++from .ccip_url_validation import (  # NOQA
++    AsyncCcipUrlValidator,
++    CcipUrlValidator,
++)
+ from .exception_handling import (  # NOQA
+     handle_offchain_lookup,
+ )
+diff --git a/web3/utils/async_exception_handling.py b/web3/utils/async_exception_handling.py
+index 0619bd5b..e4fa933d 100644
+--- a/web3/utils/async_exception_handling.py
++++ b/web3/utils/async_exception_handling.py
+@@ -26,11 +26,18 @@ from web3.exceptions import (
+ from web3.types import (
+     TxParams,
+ )
++from web3.utils.ccip_url_validation import (
++    AsyncCcipUrlValidator,
++    async_validate_ccip_url_host,
++    validate_ccip_url_scheme,
++)
+ 
+ 
+ async def async_handle_offchain_lookup(
+     offchain_lookup_payload: Dict[str, Any],
+     transaction: TxParams,
++    allow_http: bool = False,
++    url_validator: AsyncCcipUrlValidator | None = None,
+ ) -> bytes:
+     formatted_sender = to_hex_if_bytes(offchain_lookup_payload["sender"]).lower()
+     formatted_data = to_hex_if_bytes(offchain_lookup_payload["callData"]).lower()
+@@ -48,13 +55,25 @@ async def async_handle_offchain_lookup(
+             .replace("{data}", str(formatted_data))
+         )
+ 
++        try:
++            validate_ccip_url_scheme(formatted_url, allow_http=allow_http)
++            await async_validate_ccip_url_host(formatted_url)
++            if url_validator is not None:
++                await url_validator(formatted_url)
++        except Web3ValidationError:
++            continue
++
+         try:
+             if "{data}" in url and "{sender}" in url:
+-                response = await async_get_response_from_get_request(formatted_url)
++                response = await async_get_response_from_get_request(
++                    formatted_url,
++                    allow_redirects=False,
++                )
+             elif "{sender}" in url:
+                 response = await async_get_response_from_post_request(
+                     formatted_url,
+                     data={"data": formatted_data, "sender": formatted_sender},
++                    allow_redirects=False,
+                 )
+             else:
+                 raise Web3ValidationError("url not formatted properly.")
+diff --git a/web3/utils/ccip_url_validation.py b/web3/utils/ccip_url_validation.py
+new file mode 100644
+index 00000000..a86618d8
+--- /dev/null
++++ b/web3/utils/ccip_url_validation.py
+@@ -0,0 +1,105 @@
++import asyncio
++import ipaddress
++import socket
++from typing import (
++    Awaitable,
++    Callable,
++)
++from urllib.parse import (
++    urlparse,
++)
++
++from web3.exceptions import (
++    Web3ValidationError,
++)
++
++CcipUrlValidator = Callable[[str], None]
++AsyncCcipUrlValidator = Callable[[str], Awaitable[None]]
++
++BLOCKED_IP_NETWORKS = [
++    ipaddress.ip_network("127.0.0.0/8"),
++    ipaddress.ip_network("10.0.0.0/8"),
++    ipaddress.ip_network("172.16.0.0/12"),
++    ipaddress.ip_network("192.168.0.0/16"),
++    ipaddress.ip_network("169.254.0.0/16"),
++    ipaddress.ip_network("0.0.0.0/8"),
++    ipaddress.ip_network("::1/128"),
++    ipaddress.ip_network("fe80::/10"),
++    ipaddress.ip_network("fc00::/7"),
++    ipaddress.ip_network("::/128"),
++]
++
++
++def validate_ccip_url_scheme(url: str, allow_http: bool = False) -> None:
++    parsed = urlparse(url)
++    scheme = parsed.scheme.lower()
++
++    if scheme == "https":
++        return
++
++    if scheme == "http" and allow_http:
++        return
++
++    if scheme == "http":
++        raise Web3ValidationError(
++            f"CCIP Read request to non-HTTPS URL '{url}' is not allowed. "
++            "Set ``ccip_read_allow_http=True`` on the provider to allow HTTP URLs."
++        )
++
++    raise Web3ValidationError(
++        f"CCIP Read request with scheme '{scheme}' is not allowed. "
++        "Only HTTPS URLs are permitted."
++    )
++
++
++def _check_ip_blocked(ip_str: str) -> bool:
++    try:
++        addr = ipaddress.ip_address(ip_str)
++    except ValueError:
++        return False
++    return any(addr in network for network in BLOCKED_IP_NETWORKS)
++
++
++def validate_ccip_url_host(url: str) -> None:
++    parsed = urlparse(url)
++    hostname = parsed.hostname
++    if not hostname:
++        raise Web3ValidationError(f"CCIP Read URL '{url}' has no hostname.")
++
++    try:
++        addrinfos = socket.getaddrinfo(hostname, None)
++    except socket.gaierror:
++        raise Web3ValidationError(
++            f"CCIP Read URL hostname '{hostname}' could not be resolved."
++        )
++
++    for addrinfo in addrinfos:
++        ip_str = str(addrinfo[4][0])
++        if _check_ip_blocked(ip_str):
++            raise Web3ValidationError(
++                f"CCIP Read request to '{url}' is not allowed: "
++                f"resolved IP '{ip_str}' is in a blocked private/reserved range."
++            )
++
++
++async def async_validate_ccip_url_host(url: str) -> None:
++    parsed = urlparse(url)
++    hostname = parsed.hostname
++    if not hostname:
++        raise Web3ValidationError(f"CCIP Read URL '{url}' has no hostname.")
++
++    loop = asyncio.get_running_loop()
++    try:
++        addrinfos = await loop.run_in_executor(None, socket.getaddrinfo, hostname, None)
++    except socket.gaierror:
++        raise Web3ValidationError(
++            f"CCIP Read URL hostname '{hostname}' could not be resolved."
++        )
++
++    for addrinfo in addrinfos:
++        ip_str = str(addrinfo[4][0])
++        if _check_ip_blocked(ip_str):
++            raise Web3ValidationError(
++                f"CCIP Read request to '{url}' is not allowed: "
++                f"resolved IP '{ip_str}' is in a blocked private/reserved range."
++            )
+diff --git a/web3/utils/exception_handling.py b/web3/utils/exception_handling.py
+index 77a46fc6..1d5ee0bd 100644
+--- a/web3/utils/exception_handling.py
++++ b/web3/utils/exception_handling.py
+@@ -25,11 +25,18 @@ from web3.exceptions import (
+ from web3.types import (
+     TxParams,
+ )
++from web3.utils.ccip_url_validation import (
++    CcipUrlValidator,
++    validate_ccip_url_host,
++    validate_ccip_url_scheme,
++)
+ 
+ 
+ def handle_offchain_lookup(
+     offchain_lookup_payload: Dict[str, Any],
+     transaction: TxParams,
++    allow_http: bool = False,
++    url_validator: CcipUrlValidator | None = None,
+ ) -> bytes:
+     formatted_sender = to_hex_if_bytes(offchain_lookup_payload["sender"]).lower()
+     formatted_data = to_hex_if_bytes(offchain_lookup_payload["callData"]).lower()
+@@ -47,9 +54,20 @@ def handle_offchain_lookup(
+             .replace("{data}", str(formatted_data))
+         )
+ 
++        try:
++            validate_ccip_url_scheme(formatted_url, allow_http=allow_http)
++            validate_ccip_url_host(formatted_url)
++            if url_validator is not None:
++                url_validator(formatted_url)
++        except Web3ValidationError:
++            continue
++
+         try:
+             if "{data}" in url and "{sender}" in url:
+-                response = get_response_from_get_request(formatted_url)
++                response = get_response_from_get_request(
++                    formatted_url,
++                    allow_redirects=False,
++                )
+             elif "{sender}" in url:
+                 response = get_response_from_post_request(
+                     formatted_url,
+@@ -57,6 +75,7 @@ def handle_offchain_lookup(
+                         "data": formatted_data,
+                         "sender": formatted_sender,
+                     },
++                    allow_redirects=False,
+                 )
+             else:
+                 raise Web3ValidationError("url not formatted properly.")
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
index f1be4dcf4d..6c093c794d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
+SRC_URI += "file://CVE-2026-40072.patch"
 SRC_URI[sha256sum] = "1b535272a40da3d8d2b120856edb53b84b0c08bcc8fe1a5bbd5f816fd72f4ec6"
 
 inherit pypi setuptools3
-- 
2.35.6



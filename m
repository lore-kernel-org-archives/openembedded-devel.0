Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27344.1793854576576944746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DmvjWknu;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4660; q=dns/txt;
  s=iport01; t=1793854576; x=1795064176;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oFFKNeeu/9yo48L7bIOHph0EGXQnH4NPqPhV6zXAYO0=;
  b=DmvjWknu0x+A/rl6/DUusy0O7zht3AGygowTOW0MpP8W2cYT076WWwWr
   xEsbm1Zv+YyG9EHjqc8Qs5yFUO9DrhJgHrCvJ+GOE+Dlmk7QbfF0VYXgL
   EzyApgmXi1bbJRUopiBLWB39Yjk9H56ASIA/UsWRwnf30xnqXQskSFTld
   BZ7d/uY8hlLQnuIiVawUDpINVFcGTEpeLdF+fU7hRtCjYt4Chw1aFXFHg
   2HBCHJpFdwRlZyYeA6E1g3hE9J4cBWSTfZrp7XMiQVhvwAp/HsD1HB98i
   dfj7z7EMtTayhJMVGMBwRCHWDB1aEGtjlRrYkZbQks6J7hxDmDRATId3Q
   g==;
X-CSE-ConnectionGUID: QGWTfeyKR4KoNFTZZgkkNA==
X-CSE-MsgGUID: Ly4r4N0US/K8hoc/AQxfBQ==
X-IPAS-Result: =?us-ascii?q?A0AnAABGC+xq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJA4xvhziCIQOeIYF+DwEBAQ9EDQQBAYUFAo4cAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvK?=
 =?us-ascii?q?yMIGYMCAYJ0AgERvEuBeTOBAYMpATEFgR7bMwELFAGBOAGFP4MDgRGED10YA?=
 =?us-ascii?q?YR9JxsbgXKBFYNpgQWBXAKIJgSCInoSgVqBDIwMAoFShnBIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0McjkQM?=
 =?us-ascii?q?B4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4JkLYEOASsXaBJyKR6TGQGSPqERC?=
 =?us-ascii?q?iiDeIwklToaM4VbpRYLmH2OCpVhcIRpgWg8gVlwFYMiCUoZD44rDguDYIVky?=
 =?us-ascii?q?G8jNQIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:fPZWPaww9bmBAJ5xKSB6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 TNJCjuOb/uOYTDwc90gb4TkpkoFvJ6Gz94yT1BvpFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHgZArEW9/dUOz1t8
 to2FAI/YROAocvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2aICMI4PQGq25mG68t
 z7co0KhPypdF4yfzjHC20u8iMX2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:oTXho6rCFEA64Vxz/JExbnQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:EGE1iW5O1RaGySOGe9sszWErJs4oY17nkFTXBWGEO1RmS76zYArF
X-Talos-MUID: 9a23:4Lr4KQjPH+aTMlE2R/WOjcMpENY0+fiIUH021rZWu86PcgVJKzm3tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530211727"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id C0221180003DA
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 19688CC1250; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 6/8] python3-pyjwt: fix CVE-2026-102275
Date: Wed,  4 Nov 2026 20:56:12 -0800
Message-Id: <20261105045614.2677776-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131858
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Require the public component of an imported OKP private JWK to match the
public key derived from its private component.

[1] https://github.com/jpadilla/pyjwt/commit/3cd9ceec33ced359decbad75b413ad668ae6332c
[2] https://github.com/jpadilla/pyjwt/security/advisories/GHSA-x33g-cr3x-6449

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python3-pyjwt/CVE-2026-102275.patch       | 81 +++++++++++++++++++
 .../python/python3-pyjwt_2.8.0.bb             |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102275.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102275.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102275.patch
new file mode 100644
index 0000000000..9d281bee1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102275.patch
@@ -0,0 +1,81 @@
+From 64f02b83a79f25b687eaf990f7f871ece4faea8f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Padilla?= <jpadilla@users.noreply.github.com>
+Date: Wed, 14 Oct 2026 05:12:30 -0700
+Subject: [PATCH] fix: reject inconsistent OKP private keys
+
+CVE: CVE-2026-102275
+Upstream-Status: Backport [https://github.com/jpadilla/pyjwt/commit/3cd9ceec33ced359decbad75b413ad668ae6332c]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ jwt/algorithms.py        | 14 ++++++++++++--
+ tests/test_algorithms.py | 29 +++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 2 deletions(-)
+
+diff --git a/jwt/algorithms.py b/jwt/algorithms.py
+index fcfca89..38c0a2e 100644
+--- a/jwt/algorithms.py
++++ b/jwt/algorithms.py
+@@ -893,8 +893,18 @@ if has_crypto:
+                         return Ed25519PublicKey.from_public_bytes(x)
+                     return Ed448PublicKey.from_public_bytes(x)
+                 d = base64url_decode(obj.get("d"))
++                private_key: Ed25519PrivateKey | Ed448PrivateKey
+                 if curve == "Ed25519":
+-                    return Ed25519PrivateKey.from_private_bytes(d)
+-                return Ed448PrivateKey.from_private_bytes(d)
++                    private_key = Ed25519PrivateKey.from_private_bytes(d)
++                else:
++                    private_key = Ed448PrivateKey.from_private_bytes(d)
++                if (
++                    private_key.public_key().public_bytes(
++                        encoding=Encoding.Raw, format=PublicFormat.Raw
++                    )
++                    != x
++                ):
++                    raise InvalidKeyError("Public key does not match private key")
++                return private_key
+             except ValueError as err:
+                 raise InvalidKeyError("Invalid key parameter") from err
+diff --git a/tests/test_algorithms.py b/tests/test_algorithms.py
+index c843903..afc569b 100644
+--- a/tests/test_algorithms.py
++++ b/tests/test_algorithms.py
+@@ -906,6 +906,35 @@ class TestAlgorithmsRFC7520:
+ 
+ @crypto_required
+ class TestOKPAlgorithms:
++    @pytest.mark.parametrize("curve", ("Ed25519", "Ed448"))
++    @pytest.mark.parametrize("as_dict", (False, True))
++    def test_okp_jwk_should_reject_inconsistent_private_key(
++        self, curve: str, as_dict: bool
++    ) -> None:
++        with open(key_path(f"jwk_okp_key_{curve}.json")) as keyfile:
++            jwk = json.load(keyfile)
++
++        d = base64url_decode(jwk["d"])
++        jwk["d"] = (
++            base64.urlsafe_b64encode(bytes([d[0] ^ 1]) + d[1:]).rstrip(b"=").decode()
++        )
++
++        with pytest.raises(InvalidKeyError):
++            OKPAlgorithm.from_jwk(jwk if as_dict else json.dumps(jwk))
++
++    @pytest.mark.parametrize("curve", ("Ed25519", "Ed448"))
++    @pytest.mark.parametrize("length", (0, 1, 56, 58))
++    def test_okp_jwk_should_reject_private_key_with_invalid_public_length(
++        self, curve: str, length: int
++    ) -> None:
++        with open(key_path(f"jwk_okp_key_{curve}.json")) as keyfile:
++            jwk = json.load(keyfile)
++
++        jwk["x"] = base64.urlsafe_b64encode(b"\x00" * length).rstrip(b"=").decode()
++
++        with pytest.raises(InvalidKeyError):
++            OKPAlgorithm.from_jwk(jwk)
++
+     hello_world_sig = b"Qxa47mk/azzUgmY2StAOguAd4P7YBLpyCfU3JdbaiWnXM4o4WibXwmIHvNYgN3frtE2fcyd8OYEaOiD/KiwkCg=="
+     hello_world = b"Hello World!"
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index f260bb1817..c235499d24 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://CVE-2026-102268_CVE-2026-102270.patch \
     file://CVE-2026-102271.patch \
     file://CVE-2026-101917.patch \
+    file://CVE-2026-102275.patch \
 "
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
-- 
2.35.6


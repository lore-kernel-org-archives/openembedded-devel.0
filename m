Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34305.1794851679966132649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xmoWEmA7;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4829623eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851679; x=1795456479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEH0zzXDogAnz73o/smVPGeE525KEwVYgsxlYWa15KA=;
        b=xmoWEmA7whbDr3kEBSchLPSJsP5vVGZu33QXuz/QDHy70mnP1upSHVuyXEpo6NI9DS
         IUB46ucHWtnivxFPyhC+go8KLLprSmtEMIi+N8LKuTsW0K1zvSb8N3i06BsExtYOiViJ
         TN4sTIO+GU5gAIHhNEM4kBHrGdsuUsDUHDilFsqxCUfyKN+yvj//fwCpPcQs2uygl+6g
         GQSwBLvdZjR9gGrZtI/ETaS2TLGT1UYidbNXQIkT6PnztOvW1yp857Miz/Ftx8CSLF/i
         opUM+ovFkzEXiqsiwXw7NpKBdX0pBP4ugimsGz2a4L9fjIXXUxfaVkr/IyN4u/e0dxzt
         x1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851679; x=1795456479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEH0zzXDogAnz73o/smVPGeE525KEwVYgsxlYWa15KA=;
        b=BGleQoUMy7l9zgWFrfC3tlFYf5TOOedkFBKExYw7W2sokWf5peJM0Mo5C+Qm77Y98V
         IUOZRCx9BFpxUZ5kW/GfHfI/79/1wctqqQhDyf9pE7n/R8kXjjv9NP73W1FEWxmvB7+d
         GCZNrdb6I95ehlfEAvFd08/uR3PBQKXALmAc4OBh39hqLTpfesyaNbdsDonPVtaU6d4Z
         z1SyGuxtVaAB6TxpVl5phS0yNCmviRewk9T56Rl5X4c22AagMgJFDlYKJC8+JoDXdqas
         HiuiHvU7M6GFgcWKPQyCK13Urmt4nb2Qc0OhHz9I4j6WaVGt7FKD+DJmi4DJQDYUxPtF
         j6gw==
X-Gm-Message-State: APuU4Z/Cy945e/gvqMCrTh4x0VoctVSA3oLGgtdGQfL/rKWRElAxkNKu
	N7dELWfIqfQf47CujohHzvj1/gbFKopM7VmxECNSPz+zNp6VRGRvplK0Ld+PVjJY
X-Gm-Gg: AYBFou2t6yDxxgeKIxBRLgwURjvkOVA/ai41DRFP9HlDiTsyjwuNyobG9r0plRNrFwE
	W75wGNrXFv9+2b2IP+SC1Gb6eiuVyQoxfiM1zb1MHZ9TFFYTJkXapYofTq00gXNnExCcrcuWAO2
	TWMotudI8jLCpvhwjBIndZmRADdfEKpJBpXSz+MOIdYjrD8ZL/dCHA3hVQBAEKFZ2VE3MBnT9xq
	dbs2fJvbwbzWvQQPbdSXAUGYmeK7GsKl1A4v328+S6Y3lvvkb9B03CBKSt3rN63cEqUrfntUYR2
	qNDppXgpjDxY0WMZHIrlZ+Z9LJqasxrN5GpzgTy6QCOYGgQPwbUjcKDq+Ju+J76Mxii9brkHUuJ
	LQU6iHCjrEuOBzqLpXJrajvX8IcdFKDm/mWrlDrNJL3nibVffJha1TOd0vfO2PZ7AiPuYN6xmFF
	zrlwEejU5MNTFo/5gk6HfkV6CmMsqKXX+0G70QX3biZmWbeJQLKrdkcphTROd5q44UrlF68uBw+
	dU4GpcVVlOFZbr7bwmOcNcYq4sm1qeEAdv9h6ECxkSXwX+lbZAcbZf7jYAshDZ5zxRDyw9fRnas
	zYTCRSY754hbhpzwn3H0T9f9ea1juRT33ANfhCa4269yW3rLRuURF78uUu5/ue1Clu2raS8fuuU
	jOFeavkoWXFR6qTNS9NoydvQDT9d41ZypR9te+9ggnH7mu+UjRrIrFvMJ5hLJF5RIWm/5Y1/h4k
	5id3nd9DR6nGOfaHyEesa8Bbbah+QHyPpGdOgaq0+KtrMtivta14OhLFgju5GlrREZiquw3VHAL
	Kj/QV6SmSRwbrvwMAn2YA34HLMOF4SMw0fd8sRGTWpS8odWcYj7ngl+lR/8SxIsHNc81cR9Dk01
	K//n
X-Received: by 2002:a05:7301:2424:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3796057b51cmr10232246eec.0.1794851679206;
        Mon, 16 Nov 2026 09:54:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 024/105] python3-dnspython: upgrade 2.8.0 -> 2.9.2
Date: Mon, 16 Nov 2026 09:52:36 -0800
Message-ID: <20261116175359.342679-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132480
Content-Type: text/plain; charset="utf-8"

Upstream moved from hatchling to uv_build; inherit python_uv_build.
Refresh the DDR test skip patch. The zone tests need the idna module for
IDNA 2008; add python3-idna to the ptest RDEPENDS.

Changes:
- Requires Python 3.11+ (2.9.0); httpx2 replaces httpx for HTTPS TCP
  connections; DNSSEC gains ML-DSA-44.
- Security (no CVE IDs; GHSA-45c3-73f7-pv4m): name decompression chain
  limited to 16 (CPU DoS); crafted WKS record in a zone file could
  exhaust memory/CPU (2.9.2); $GENERATE width capped at 127.
- Security (2.9.1): DNSSEC rejects revoked DNSKEY use and mismatched
  RRSIG type/class; strict ECDSA/DSA signature lengths; resolver uses
  a random query id each time; negative TTL without SOA capped at 300.
- Security (2.9.1): asyncquery.quic() now verifies the server
  hostname; XFR responses are checked with is_response(); from_xfr()
  ignores out-of-zone records; TSIG checked on DoH/DoQ replies.
- Stricter rdata parsing (SVCB/HTTPS, NSEC3, NID/L64, TLSA, SSHFP,
  LOC, TTL); escape control characters in to_unicode/EDNS text output.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...R-tests-when-the-resolvers-do-not-answe.patch | 16 ++++++++++++----
 ...ython_2.8.0.bb => python3-dnspython_2.9.2.bb} |  5 +++--
 2 files changed, 15 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.8.0.bb => python3-dnspython_2.9.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch
index 991604682e..30654d0d01 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch
+++ b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch
@@ -16,13 +16,14 @@ Skip the tests unless both resolvers return DDR SVCB records.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- tests/test_ddr.py | 27 +++++++++++++++++++++++++--
+ tests/test_ddr.py |   27 +++++++++++++++++++++++++--
  1 file changed, 25 insertions(+), 2 deletions(-)
 
+diff --git a/tests/test_ddr.py b/tests/test_ddr.py
 --- a/tests/test_ddr.py
 +++ b/tests/test_ddr.py
-@@ -6,13 +6,36 @@
- 
+@@ -8,12 +8,35 @@
+ import dns._ddr
  import dns.asyncbackend
  import dns.asyncresolver
 +import dns.message
@@ -30,6 +31,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 +import dns.query
 +import dns.rdatatype
  import dns.resolver
+ import dns.rrset
  import tests.util
  
  
@@ -53,13 +55,19 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 +    return True
 +
 +
+ def _svcb_nameserver_kinds(svcb_text):
+     rrset = dns.rrset.from_text("_dns.resolver.arpa.", 7200, "IN", "SVCB", svcb_text)
+     answer = types.SimpleNamespace(nameserver="192.0.2.1", rrset=rrset)
+@@ -64,7 +87,7 @@
+ 
+ 
  @pytest.mark.skipif(
 -    not tests.util.is_internet_reachable(), reason="Internet not reachable"
 +    not _ddr_available(), reason="Internet not reachable or DDR not available"
  )
  @tests.util.retry_on_timeout
  def test_basic_ddr_sync():
-@@ -26,7 +49,7 @@
+@@ -78,7 +101,7 @@
  
  
  @pytest.mark.skipif(
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.9.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.9.2.bb
index a1367e2028..db75ad1949 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.9.2.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
+SRC_URI[sha256sum] = "8d4d39a513e649d634004ce4d39ade2352efcea472a0247535a5c2d18a9d7ba9"
 
 CVE_PRODUCT = "dnspython"
 
-inherit pypi python_hatchling ptest
+inherit pypi python_uv_build ptest
 
 SRC_URI += " \
 	file://run-ptest \
@@ -16,6 +16,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    python3-idna \
     python3-pytest \
     python3-unittest-automake-output \
 "

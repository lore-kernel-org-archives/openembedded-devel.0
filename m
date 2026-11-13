Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6351.1794554666821252465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 23:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UixFvsPr;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so835884eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554666; x=1795159466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpNCCngEwWMFLFi13UNa7D8Z9doK9c4ZWebK1TxV5bY=;
        b=UixFvsPrg/Wk97sSQEJttHKEHIF3W/C+xr2KeKzfvE2hR+yWEwFdTZVyBQ5bttz3v3
         1TQHsV/85WJ5OSATUe5lUO9ck23HTV0IZLFWxC/4WbIldWsOkKC9i630srlRQeL57MGS
         xK93DpRiefuf+eivGGRigJWDvj/XLYXmpWtsjIpMfqBVWTI9S5w3XMLpIr8XluwKK7jT
         23qpA+78tC+K2unuAjbZrhqHumIyFXaAleM5LgRKfwYq/qovEO2hOEk5NDL4l+pEmDYA
         vkj/9F7SjQfTt0LUJz2pB+pKhJRhJSCNYzwGcFj+Lc3hlTyugyhby87XojxW3uGbXfIS
         4jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554666; x=1795159466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpNCCngEwWMFLFi13UNa7D8Z9doK9c4ZWebK1TxV5bY=;
        b=vmqPfxpZSgHh3rCbkgn/SFjkasf9MspnQiSh0+5Pe39fjwIQUepPrXzVp/EnjjQWel
         FDj39yof+3f5ec2Kn+8fKXgc0Q24AMQK/X9aglo/bIbPD6cpTXOJmJ6rHMM4qY/OJRwx
         fPUecBP4Wr+ewIFVAdJ3QH9JOlglKVCw/ONcrY/MRvixgRLCE7dtFac4HAPx9pDMThyi
         bxFFxOID+8TE3ox8XGEmgd1pkio/kTpgA1ulUD/7wjMNiH1oD9OW6vP9FGA1iWVv9lsq
         n8lBf8KevqlX9ZtyMjvIsAReL4beKiHCYR/tn+cSoX5+fMzrS6KgLFYDlUn/GBsLrijL
         7dfQ==
X-Gm-Message-State: APuU4Z984bShJuuAGCFbsaFazIpIs24KW+I6rB8Y66ZGH/IcRn//aGBb
	9NYiA1LhlRbourFZD0iILbIalNaMdrEk3+IVVXB5eVYHtwvLV/qUP/Bt07408g8eNm1rsPY7
X-Gm-Gg: AYBFou3FEQYc1c/6BmajbaygAAsveHddcEMP0AjAbBDIAOwVv6ooKNhCs/52M64molh
	5wg6DtixUUoMk23VI8zMozfoyRdUEG33Zw9bKIk7wpod2oPJAple0ys6WsKZ0uj1a4wbmpP1Odb
	ZWruwJUxCBIWgJc1NHRD3mtnkFx0Ns6GI8dISQz0tzuU+CSFb+JX4jw0tYc/R04Sjuly9CVBd2d
	GxRYoyulEdFg6it2+PpLnFSLAXl2jtA2+P2QfUi/Gri/zVW29RHUkaiKpspOID23PKgOpPjbkIl
	Yf+oQijbr1By7281erMR8HXqBDQy6xXOiLCqGcz9uvr5jjbapTFUo8wglUdLgBxR2q7DEqCV+kG
	W/DLEj8B81rYCbRiQofL/kA+qMwznCSJZb87pYTBCcjYnHzVUKiqWy56DmrPf/cln2ah8G6r5S+
	oio6Y4nZVMNNl1igE0ECQgfeouE7AOXHIynO6ZL9UIPvUikaqrtZ1IpNZKgxYst3zPDtq2ompaA
	+EkOB+zqEcNdCfL5kKRVxpZPkVfTky19JgxhTDr2CCs/DHTBRdbLugPNrt5jmhg7cc0tQqTBULP
	9ykPRdzAn8EGMfMRRtLWzrhNn4FnOK2ruYmTZoJKlUueql6alWdBz1x7VHn9Im31iw2RgZQSRb3
	1XCx4HIMdqk3JXPZXhZkhMm3lg1zqV8x2vRR/cVGTLXMByZNRNr5jhmwNZsw5jf+sOeBqgDL0sP
	Z4sCSwvpaIwjRSJylQszpqckTzanmMPRhnsg+yWE4s+4+6fOa0/69fV5w3PnC9XI8pEob3Phc1o
	ZiOOnWqaYj2/27BxFXOVPwuUYtkJu6HPlFozOlMX7dDZLkcu+cJK6jLiuoWYAMSq97f5wz3pbN9
	Sov+
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr1488231eec.11.1794554665711;
        Thu, 12 Nov 2026 23:24:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm9560533eec.8.2026.11.12.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:24:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-dnspython: Retry socket timeouts in ptests
Date: Thu, 12 Nov 2026 23:24:22 -0800
Message-ID: <20261113072422.1331786-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 07:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132228
Content-Type: text/plain; charset="utf-8"

testQueryUDPFallbackWithSocket fails intermittently because it connects
its TCP socket with a 2s socket timeout, and the resulting TimeoutError
is not dns.exception.Timeout, so the test's retry_on_timeout decorator
does not retry it. Retry TimeoutError too and give the connect the same
4s budget as the query.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-socket-timeouts-in-retry_on_timeout.patch | 47 +++++++++++++++++++
 .../python/python3-dnspython_2.8.0.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dnspython/0001-tests-retry-socket-timeouts-in-retry_on_timeout.patch

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-retry-socket-timeouts-in-retry_on_timeout.patch b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-retry-socket-timeouts-in-retry_on_timeout.patch
new file mode 100644
index 0000000000..ff2d7b20ad
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dnspython/0001-tests-retry-socket-timeouts-in-retry_on_timeout.patch
@@ -0,0 +1,47 @@
+From 0d751963d381da8adbbe4bcb9c0163e41f70eeca Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 22:41:22 -0800
+Subject: [PATCH] tests: retry socket timeouts in retry_on_timeout
+
+testQueryUDPFallbackWithSocket opens its TCP socket itself with a 2
+second socket timeout. When that connect is slow (e.g. on a loaded host
+or an emulated target) it raises the builtin TimeoutError rather than
+dns.exception.Timeout, so retry_on_timeout does not retry it and the
+test fails intermittently.
+
+Retry TimeoutError as well, and give the connect the same 4 second
+budget as the query itself.
+
+Upstream-Status: Submitted [https://github.com/rthalley/dnspython/pull/1423]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/test_query.py | 2 +-
+ tests/util.py       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_query.py b/tests/test_query.py
+index 1c949e6..a6f1a1b 100644
+--- a/tests/test_query.py
++++ b/tests/test_query.py
+@@ -230,7 +230,7 @@ class QueryTests(unittest.TestCase):
+                 udp_s.setblocking(0)
+                 with socket.socket(af, socket.SOCK_STREAM) as tcp_s:
+                     ll = dns.inet.low_level_address_tuple((address, 53))
+-                    tcp_s.settimeout(2)
++                    tcp_s.settimeout(4)
+                     tcp_s.connect(ll)
+                     tcp_s.setblocking(0)
+                     qname = dns.name.from_text(".")
+diff --git a/tests/util.py b/tests/util.py
+index a448f2d..84e16c0 100644
+--- a/tests/util.py
++++ b/tests/util.py
+@@ -144,7 +144,7 @@ def retry_on_timeout(f):
+                 f(*args, **kwargs)
+                 bad = False
+                 break
+-            except dns.exception.Timeout:
++            except (dns.exception.Timeout, TimeoutError):
+                 pass
+         if bad:
+             raise dns.exception.Timeout
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
index 859b71bcda..a1367e2028 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
@@ -12,6 +12,7 @@ inherit pypi python_hatchling ptest
 SRC_URI += " \
 	file://run-ptest \
 	file://0001-tests-skip-DDR-tests-when-the-resolvers-do-not-answe.patch \
+	file://0001-tests-retry-socket-timeouts-in-retry_on_timeout.patch \
 "

 RDEPENDS:${PN}-ptest += " \

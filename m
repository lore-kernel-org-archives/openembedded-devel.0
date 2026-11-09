Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2823.1794217570126694301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 01:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TJLnvCnR;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so475276c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217569; x=1794822369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlO19SJCPVcYLPLLfwDOlbJm8NUPZVSSnmH6BY+nPV0=;
        b=TJLnvCnRxUPIHPgV/e7r7YjXm/sYE2tnc29rxfh2E25xeWT6bw1PxQfkI3uhj9KHkW
         2hjdxGqPJm5Ld25Fdj/+hFdcpONl3RhCYLVzRNGgbcYyUib2ZUQmqQUIHxNlY/GilOCi
         r2IrnO2RlbNXwP52bzfVANLtmc0iyAX1Pj21JQUJUCcMKEUvqa8rVSkTp14I2qk5Z7JZ
         X7MhIBZQHVZKbmWByeDd8DTi65xQFB1GgmgdS5+m0rmgd1YPTcmF6cjtRiWXZZAxr5XL
         BCIZkgY1/suSuVn7tlxblpbljHg81JZ5UsW+di1j4drw++2tMlJOQ8Yz4gJuSU708C6u
         c1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217569; x=1794822369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlO19SJCPVcYLPLLfwDOlbJm8NUPZVSSnmH6BY+nPV0=;
        b=zwkWOAtmcF9c8doqaBjx+u0Li46hPTbMZpEGmnXoBxeuUaEzlKTY3RlH7eyc3v8YiQ
         Jxk0RDRHZiS++hGDefsHIlwK247xGluo/2HuFNhr8Emmx6Pd6G/7eFKUd6nuN5OR9GPM
         +b3hSCw+4TFiDv1HP4APuh0t/dYDC11cqcWmPpZnzSKOThZ+KznuLvCe+yZR60pToxJk
         fWNR+Hs/p10U3/viwe1oxl0AmUZFvJXPq6cShLpzFf9H72szy60ewLlpIas68GHCWZwE
         qack7KinU55ZO4d1lb9SvTw05/TLh+2KRiS2uuUKEfb26oYebiDJPl6I2tJixA4CH+fb
         jyVw==
X-Gm-Message-State: APuU4Z+qHyx05A9AOYL5cf5lxxGMFkMCs9Xaah5BTKlvriYFp9WJr1gT
	9Xo9kvPHwh7yOSrN4J7ZAVNzHy0ksTMnPV8KbVgtM4R5lm+fFinlI6Paml6zD9LFfDE=
X-Gm-Gg: AYBFou1+5Z8UIXRBRU5HrPf72gp2oDVBahDdq9Pc2S6FaSe6ScJXLcBRs5DO0oRfsEF
	hvgUkpOkp710LzWMHtMvDqlrxA84KAjvxW+A2F0E5G2qtvCKVR1+jTnzrh1KigPQM1TsC/wlx06
	KNq7mtq6RdqDoTxoChZJUQeFUFGEAus7XEOtzwMVt/Xvr55tXnC2nxXxcF7nzv+xeZDz/UlIGsV
	t+wFuO0+ijeSnk20U8GQscagRSLbuWAt36U+Es8wMhRYVWBaT5FgC+KVnVam6HVNWEuIqlwEIto
	2MjdCc9u+kNsrqseQDdnvPhQ/Go3rnsX3bOdUhmXcR9dAe/nrig01e3X7W8xMNgHoEGaT4vx4ak
	IBpCh0w/TEkGnNrzjJBjMkzcQwalKIBzGSH9Wa4o46ote5vtXJ9HrvnFnP+T2KRpObf9KByvuMf
	BHIsGyuduQsv0EwV8aIYgVxrSwwx29UUbABVurPH1enJKTa7757E657WQNSxmPhneAvaVGnXqRu
	caTlze1krAMRle7SHmFyWc3BbPXFIMM1RPn/IVLEvtV1mAQdp9dwlStHvQNoAaPdJWVbSYBDOAC
	CF9DkLJmLaw1gnNmS/1vCFOAngWfW+hcMuJPqwG3znbiXAkBdp/VE6YysLuJAE5G1HzQJqUUlCM
	imseWMoprbQZUaiBwX0rGuiIm23uhIXKXRHW6OQQKApfwfdJ+E71do1P3L8Rhutv0OpwJVAwJR2
	K4N4KffAfDofvmK/qTyZMgqXSRTV441SFj+qy4+C5ofFAD3kyeLjOphIheJbqCkpAXTq01Kmtxf
	4fZt15ENZgtBeNckP1NULZIoWEUkiHQyX0PXK9SinaW7Hk4Pmx9SFCMfQ114Ae7qWDYXlQqirZy
	d4Yg
X-Received: by 2002:a05:7022:7f1b:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3abd22ef9mr2663455c88.10.1794217569149;
        Mon, 09 Nov 2026 01:46:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm11224402c88.12.2026.11.09.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:46:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/3] python3-propcache: Drop the PEP 517 backend test from ptests
Date: Mon,  9 Nov 2026 01:46:04 -0800
Message-ID: <20261109094606.2418633-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 09:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132054
Content-Type: text/plain; charset="utf-8"

tests/test_pep517_backend.py imports the in-tree build backend from
packaging/pep517_backend, which pytest.ini puts on the path when run
from the source tree but which is not installed. Collection fails and
pytest stops without running any test:

  E   ModuleNotFoundError: No module named 'pep517_backend'

The test checks the CFLAGS/CPPFLAGS handling of the build backend,
which has no use on the target, so remove it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-propcache_0.5.4.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb b/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
index a931791660..77261cd1c1 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
@@ -21,4 +21,9 @@ RDEPENDS:${PN}-ptest += " \
 	python3-statistics \
 "

+do_install_ptest:append() {
+	# tests the in-tree build backend, which is not installed
+	rm -f ${D}${PTEST_PATH}/tests/test_pep517_backend.py
+}
+
 BBCLASSEXTEND += "native nativesdk"

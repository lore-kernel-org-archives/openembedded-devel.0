Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34345.1794851731923238233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CDvsicgQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4831199eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851731; x=1795456531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdcvTp9aQdMsL3w7A+LpUPRLvhaRvlRp5d8bNbcA1lw=;
        b=CDvsicgQFX+K5i0DKBEZ/56mjxC6dd3xv7WK/9RJLv3vBXMq+gMsAsvHxS9icnMzvb
         hH8rc7pByQx1YkVzXY+aep4P2mfqWRAybNfX4nxTYPuxnJvSL8h1SdBTAvUykaoJg3Nh
         OfSRx3ylc4rKW3nI8ZwrJ1FHhKNaxHxd1dCHx1f1MQfwX0wcW4plbimDmDFxCIPdvMU4
         Ahzc2ptv6R9uE6pg1t0vlckyHEMKQpL8PhJw/7OWzlhAKLNJ7zqzqZv/8W/9IIhUHE1G
         GgcpCdi0QjqQ8VnYxorRZPCLu41VenPJCxlM3kONpBqPhaSwZOhWbCAL03Vn38TtT2GB
         M6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851731; x=1795456531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdcvTp9aQdMsL3w7A+LpUPRLvhaRvlRp5d8bNbcA1lw=;
        b=AgUfZTlXVtaiYpLDZFgmeFFzW3fRtwwLJIRFlMLeI0K0mHMDvgQ4uTto243SUnMUXN
         sVJW0LLb5fDz732q/lA6ZFqjbhjWjXPtHx2d04TA8POYm7FyUyKzXDCKRk6eyxcqmObn
         CZGT1GTC0/FPoBmg1QifU/7QlxWK4o0x2Frx/tt2uQQiuG8aOvSlS4NcKD3cXTsF0qTz
         luGC/NtEL3UhdJP9ZbbbLlZdMW1SvEuyVAYVIWtULXYc+YwHfgW3K19tOaKEEF4e2Jen
         L1NItdDYVqerrM+x6xzvC7iWYvT9Gqo6XJZHBCIi7VDH/e5aIE1tkV0fNhGcmWDsNVQ+
         KVng==
X-Gm-Message-State: APuU4Z9bMbalvh5JvUHaD5PaRApMsF5g014u4IsAJC6DFM6ttTpD8a4d
	f0NthRU3TL8XCeMp8ZoBB3Qh7zgbnNgrbCtwm4Y2VNBZ+UtcCve9AwmzgNVd0giM
X-Gm-Gg: AZFdTZd3BXJ2xjtUx/NjyZikTwxqUHAUwUM4ZHvgwvCthxLRJRtEPZsXx67npNTL3YZ
	mt1Ah6o7uxRp1aME3qtjh02P/gudx1FPzgHND5Kj84m7TeLWsII2H6pXk9zUcvYyNlqfI0fFPkz
	Rca38eXlGUOWuhI8Q8dK+DFoHfF6K2uhXkfGiwa8GWP9kFH5uKSkz7vCIfIfUica/90LeZmCrVw
	qTphbBHLr2p0Ncdurp+Lsc9W3Ut78FnWnh9o2N5WyERre2guaqsbaB5iAQfKv7LFf2tEVv9yeJP
	43LbrYkKHR/EBJkQOSsfHbiu95LLwQgDKF+5hoPkooTnaooNU7aq6e0k3BNH7OzslTGhNZ8phuB
	iwcTDGOoShTmHLUW00ES5FMp9UFug9tbN3qLdeclvZGgxf0GrXi7hK5kiITgyWktiKVcPs162Pd
	DFj8cC5dPoGZZNhUqAHw29uzY90AIRcgtn8Fszvalh1WXRdjw2lhbHeoYFa8/0m6viScePOUDp/
	pBB1ldd7WFuUIeUF1wWkJb6nF7eua+ptyf8NvzYH0oegTIwnIhR/vrSqTkfLFm1D2vxvyvp4pZ8
	Lz8NEt9fhvr5lVhKBRuAppKmQQtLr9fzSOiAbw3lo4MBNONCNMJ2BDk0+vyhQx3a9HwPwkP/TvJ
	6CRXGDfxnHY0sLgckI1InGd5/zI0gNfj11cKa/kV0Kle4UnjA/RbATWmxphHrOJYx8hmsCeU79z
	FK9tsdM/+e/U3nM00Jq4uKx3sUp8DjrXy9WSorbImzliselk9nbvZ4d6iCVqlPWiTKsZzAsAjZV
	Bc9lZnE3/pRZ3NZgHfz1+vOSVxMjR8mbnzlHsiAqQR0awoBQ+2K5thI/Nz1fg776NDC/KG5p8LC
	GT1A
X-Received: by 2002:a05:693c:83cc:10b0:380:9c6f:ad0a with SMTP id 5a478bee46e88-3809c6fad5fmr1150813eec.10.1794851731205;
        Mon, 16 Nov 2026 09:55:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 063/105] python3-pyais: upgrade 3.2.3 -> 3.3.1
Date: Mon, 16 Nov 2026 09:53:15 -0800
Message-ID: <20261116175359.342679-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132519
Content-Type: text/plain; charset="utf-8"

Changes:
- 3.3.1: malformed input now raises InvalidNMEAMessageException
  instead of arbitrary Python errors, so one bad line can no longer
  terminate UDPReceiver, TCPConnection or IterMessages. Stricter NMEA
  validation: non-ASCII bytes, fill bits 0-5, fragment count/number
  ranges, tag block checksums.
- BREAKING-ish: multi-fragment messages are only assembled when
  fragments arrive in order starting at fragment 1; orphaned and
  out-of-order fragments are dropped.
- Fixed encode_dict() TypeError for truncated type 6, 8, 24 messages
  and encoding of non-byte-aligned or empty variable-length fields.
- 3.3.0/3.2.x: more type 6/8 application messages (DAC 1, DAC 367),
  faster decoding (also on PyPy), fixed messages spanning recv()
  calls, encoding CLI --talker split into --talker-id/--sentence-type.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pyais_3.2.3.bb => python3-pyais_3.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.2.3.bb => python3-pyais_3.3.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb b/meta-python/recipes-devtools/python/python3-pyais_3.3.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.3.1.bb
index 4e2dccacb3..f3d3ed8cd7 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "b44fdc6e0fd4ddb9e0afadab9c8ef87f475aa091"
+SRCREV = "0d62ef7071f327824618d804141f31fee3e01e29"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2881.1794217571270951285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 01:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=D7AH/LSK;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1280575c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217570; x=1794822370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5oCBCe3xdPhHpWYERaQYF8ZtjeYjlM8eH3MReVwedpQ=;
        b=D7AH/LSKnCmWhNlOpDC8OH6fZyQvGy+MfQfFYsyVt0/RlNWNjjOjvyqMSglKspEod1
         914SpiUIz9u1AUJ46swJyD60yNmXaIL8PHJ3DByjl9N4VeGBe8C1d8ALbzdgoOMjR9M7
         o23wqzTyaB+dAfe0vpPpUqh3fXxIBC8vklsqdp+x0g4wLrXYUth+0iSlpNzRHld0gKa3
         HCqI9FMQCKunlDdI0YtzkBbgQiCTmanNX0ISp0sR+ISiprp4mjl6nxtaov37OG8kRO1F
         7CY5dQNQIp/p5dxRNjZBjo6NqHXUN80Cyhv1LVTle9HMXn/Pwx9EjXfWe9F4aSO7H/kS
         HDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217570; x=1794822370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5oCBCe3xdPhHpWYERaQYF8ZtjeYjlM8eH3MReVwedpQ=;
        b=FucWeKLJERPyh9ITv79Ur/lMmti1rj30iJ/CWV5aJVo6fUl0CON10G8Tj7xbStYdlV
         v2Eh/YPlX3FSpR1bbi9orm6G56jiDdTxchYfGVQsNGIgsvh4ytFVN5vG6hjhbvS2ISb6
         JcSCZXxgolSuwNGkiPRlMxpXqRE0hxAZaQrjcL6MZfx9N+zGfhPWejrczmb3lHY6r7eA
         GBaZmHpZDXS8fMaj4+PkZeDQEUXgbzqBJ/yjm3tcQ7FYdzlKmQAgcafbVOByfWwVUCTR
         Cng3KVdXAPW/+P61q5WTlidrnzKSKd7oKsTpBlpn4XCrNDMkv7mRlYLrUygViI4//Dh0
         8RMQ==
X-Gm-Message-State: APuU4Z9IoDJSs5D+9TtcH5YUPnUXTbfLMnQYNz8/8p+G6/l0EpWvoB9u
	LHk8ujIkqq0tdwsKW40cHd4oLn9ObPaQEUcPb15q0Tv9rSgNaKLONksbUFjCLkBXXO0=
X-Gm-Gg: AYBFou2z4g5pCveZBNVehJDiHBF9MFDcfi1Nook4om+DnmzRfOsOR3k28fhH/F8mdWI
	c4jlULJQjqHCx8yQnqnmmuD9kMzVkB5vfLX5hbzKF3kS67EW/DhMJPhH08rq2kiqWnpb30c0IFc
	hjrsKfQXYPT4cH5vbSlJZmq2RFvbcgCdyVdaTy3ag77iscm3DKd+LkxeX0piGAjewG5dvCCNEaN
	LBRYeCkUk3dJnbFxIBE6OT1p9DGjE/Odwp2XgkCgNmzzSsbymG6e4EMcdQgWplOBReUeRcod7WA
	xZV+q3pANlrtGpDOzkMcwSNRASLcwjn+EbfiHciIejBo+2EYkRavNBGJJ2OfLKybA5f/y28sFq7
	VJ+XX0sLRyDvd47O/ACJl23qcYp9o4xO64ODVelC5H6PegPFALo/I8MvabEcXsUNIpmUH9U8H/o
	F2KSVT/JKSX1mtuVNzTrO9m5pPcyxEX5skFwR5lwVUHmJwCzwMpq09hx8kqtoNXZpnAssilb67j
	TdCzjGpEMV582izLNzETxXasI50U9ZCyRkPN9Ih7otFgnVc12H/Ol6jgGlhbLEaWESJ4CyDdc22
	Yf0jo9RA6by9c0zRM9SsqH7DlA5YmLeU+YKigh7bLRNxHhdXZIhVnmK/CBNgbkmqxOudCTV1Kg6
	SLKMq4DnaihZdvfh9uCry32ZKox2SXVfROs1SbI6pt+BTaW/al4k/4gAAYvqyJoLuaNUrjffxRB
	ERG4wDt3gNn2FPRMRm1X1eutVLqgmtbU9eh+OYwysmg90W2Bqc7ICR36akfYVYIF+f6PvHby45A
	p24emdWydGL0DpQAxsxADWWLd3f1iiD58MOUtpl4pySDBKx2iEhmj1KpUNF3RR3bqmBTh77QmHs
	5RXBiQ==
X-Received: by 2002:a05:7022:b047:20b0:1b3:a927:f17a with SMTP id a92af1059eb24-1b3a927f2d2mr3981004c88.5.1794217570364;
        Mon, 09 Nov 2026 01:46:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm11224402c88.12.2026.11.09.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:46:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/3] python3-pydantic: Add missing time-machine ptest dependency
Date: Mon,  9 Nov 2026 01:46:05 -0800
Message-ID: <20261109094606.2418633-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109094606.2418633-1-khem.raj@oss.qualcomm.com>
References: <20261109094606.2418633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 09:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132055
Content-Type: text/plain; charset="utf-8"

tests/test_docs.py imports time_machine. The collection error stops
pytest before any test runs:

  E   ModuleNotFoundError: No module named 'time_machine'

With it, 6892 tests pass and 242 are skipped on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
index 85234a7175..eb8e42198e 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
@@ -56,6 +56,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytz \
     python3-rich \
     python3-sqlalchemy \
+    python3-time-machine \
     python3-unixadmin \
     python3-ruff \
     python3-pytest-examples \

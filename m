Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B623CC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:01 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11405.1784590740524978083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BqnGYXDn;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so9961054a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590740; x=1785195540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIzYe7LNy4B96ufGP8IvZ397WuDrGYAjGqLQURJE+e8=;
        b=BqnGYXDnjq3QMI576hOUVKFIlAG7/hOVu4REjaEfh/OF7eHKSO7EYuqC9qSiDBghtS
         zlmmL01uDNG2Wt6Th6D3MdV8C5Zzol23WCvphPIqzA15EXBhekArah0vmCrrVAC9ktqE
         M1Wz4SODBYIT3oK8/NdY0kV566px18vKQ5/gxI96i8VvsQEpH1Z+gvcBqjLzIDGsN1Bp
         0yBHrp5Zn0FajX/mstLvPBS8fi9p21f3aJSYZKaTjVgA3ItU4sUs7Nt3+YNviQA1mV8F
         NmXXZ+u27GcKcY0/nBodih1MHNj2lK6PlETtfiRSI631YB022nNu18zAHIs29Q0WQEA0
         wujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590740; x=1785195540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIzYe7LNy4B96ufGP8IvZ397WuDrGYAjGqLQURJE+e8=;
        b=Hl7u8AcB/laHCIetlXz2lVjjSofPD6eKnA2OVqQNBsQE8sKxO2zHGjcRpyM7cYRd0J
         nE/suApn+go4GtVY91oxWs4Z73PCjIkkD/QHp5VDy6HBvliIDT/FZto376SFhj+WfK/f
         im7pOeuboQm2/ac1Y+a0o+QFWHCSTJB1RspBPtkc1dFUPEWF24k48INRoYWzto27oQ+T
         qEWNkJMtuVPw79QxojvMPaCvctVHRdShQaszvLXGdULMFFf+w+HIeX9ws6mGR/wWDdaT
         Vt8H+uXusP6oHLXixHX3rdz1Xz1vYSHgYxo5ExIae6vRB6x8qdk6h8/DmcmSiIi6aDY/
         AqNA==
X-Gm-Message-State: AOJu0YxaHVQUwniEJ40uGwTTCc6fgNR/8wWGSqyCQcWmBzN+T10NyU8E
	SKmdnIQW6zVq6ORzXxt4FcSiMv5e1qwaTANcu6Q5t+fQZ4y2ZKx7pU6gQJ5wdQ==
X-Gm-Gg: AfdE7ckAt1ZQRc0qxsRdTlord/qTrBF2Jl6q+7nWjqLJmQopuVSQlT03JhTrxlo9pAy
	hxyrscbOHDVfwCpNNNMkr0WRteRK68cywISf2EmPneUBtfnUhm4OetCSSlmAhFBFGUinQrQRwCi
	bwV8QigjEV8gTdKL2qOSkfykmu40Z8cWMxoH22xNlBTUB+8w4easNIuOyaOM5jmDkDw/9oqLtvX
	x0ra3ktv72OoBaQfu3qOeMd6h9ktwU8DuFGW2/q4l/ov78SrcCkJEu+Q0T6yXVbdJQkSBX5dBQs
	LtYXwC8V229uQRXmAzVwuThommmNAk/1DwSkM8ib/uIqnhaS1V6Yf36zOHWazZKibb45kdS6UJG
	9gJ4Jq5+V4knxeoC56//OWDA6K5KNA0KSH7UNkGvIv4DPd2QH0IHP9IecbPjjfczsTeUIWUxKXr
	yv+1BzxUXSYJBEBx0=
X-Received: by 2002:a05:6a21:a87:b0:3c3:a8a4:e71a with SMTP id adf61e73a8af0-3c3ad6035d4mr16732511637.11.1784590739935;
        Mon, 20 Jul 2026 16:38:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 14/30] python3-sqlalchemy: upgrade 2.0.49 -> 2.0.50
Date: Tue, 21 Jul 2026 11:37:55 +1200
Message-ID: <20260720233811.2324493-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128315

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c419e48aa35ee108ffc8f333f75815505b3ead73)

Changelog:
https://docs.sqlalchemy.org/en/21/changelog/changelog_20.html#change-2.0.50

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-sqlalchemy_2.0.49.bb => python3-sqlalchemy_2.0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.49.bb => python3-sqlalchemy_2.0.50.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
index ecc9099e30..aa14e1570b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.49.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.50.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "d15950a57a210e36dd4cec1aac22787e2a4d57ba9318233e2ef8b2daf9ff2d5f"
+SRC_URI[sha256sum] = "af5607d11ef90fd6a5c0549fe0045dce1663d427426bcfb506dcb5346a85a3b9"
 
 inherit pypi python_setuptools_build_meta cython
 


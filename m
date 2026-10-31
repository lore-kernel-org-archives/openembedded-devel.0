Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.693.1793419072250488607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HF3pDYMo;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2345691eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419072; x=1794023872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPuAh17Z75zUUlqU8a9X7cPjwBCk5xigg90QkZLUfU8=;
        b=HF3pDYMovgLloGS38uuY2vif3RU7NK4iPr7Gxq7wvCO9IkZB11+ZyX+4s+te0glEDU
         FiKTSK8MnnJN1dy398NC+VKnpS5/Hxpb/GWwAInAge609muhSqCjVTv1GZnUT6AIJ1uO
         zDMLS9pfNkfmsijyfMtJTRVtInL93T1btmwiVOZcRD+SQd1EgPp0U+pX/IWx5M3wfcpj
         ML8xQ7sAD3ZEYihk7eFp30Qp9G9k5+vO34tfGBz6Hwy05wtNP9pKWXdQyjlRD5h4kBtT
         LE7XTsL6cszITWDCBeIqIShYs4cDzRG9Zhkd5ZCIe6iY/NLdc6kWxjrFBNPtcNggQAgB
         rqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419072; x=1794023872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPuAh17Z75zUUlqU8a9X7cPjwBCk5xigg90QkZLUfU8=;
        b=PTE9yoSa67i8m1cBjKBgCfSdW+d5qiatT+gAKdmS2k+UtlpAh+8txkPSWTbjjehnnz
         oQ8/kRbRQbEkPyJL1S0dOsTFEQrmnIgO4LktpllEBrMGk7Xwmp5zslAWmRqzFUvHpF23
         QEQES/GvBGm14Yyrp7VxcBQQWdU7ft786gPVLiwjEafFLuOk4CawB7ZdtVx++/HviY62
         A6Oe4C3iMF36wtpVngwxKqpzcp+zGuacI49Spe8R1yZPeHYuCcp37h0s77CLHph+juoe
         JWM/T66x2eU6LbUK7meV2irNw0eZ26Qg0Ui5XLzAJRhMEIwRrVm151ebb4dzqTncy/0j
         A1zA==
X-Gm-Message-State: AFq9FYIGQO8rkoD8vb66E7Lb45iXI7A5Ct/6a/HHIAqDAu/alkBKhiZR
	rjyeqjysi1UxdkFzv6xiLbGJ/rrVkkxUI1n9x2AQHOU3MUFsHFnAfuOdBrDqsDZjELM=
X-Gm-Gg: AYBFou17oQ4OEsTDJ5c5y4RxULi5+zGY1Rf1O3ITmUJuVVqYTEoHWcc/WJsrBpuloNR
	REAVuhmZnekoxe1r0agptShHMcXCturwDHgxGNOBlYDTknoYiJfzL7tuFpp82nyMOZvY9oV4SaR
	DEF6EW1IgjbRZ40V8yDZyNX+6JNx6D0FmrH6++xvjbF2AszRDxJMVlv6laseZ3iIB8vjHRoQMFi
	9z4DkW5ZQQq9isVAADJkS5oDPR7LUQsjHqmEjUpoOvjqhBcp3QKUQTjhJMtnKeQ+LnBQX02w04k
	0ZWStO6/vRHBlEWZiA5ZPvE3g+29Z6ixuDXogO9YstESMEqqoAiV8M02RkhUyH2T2/GMnpvgAgy
	DNTknvdmh94D5KEOD8METVUigfOIlixsyzXzz5xfBbo69v5LcidYb7+ART5IHUUh9ObmVyvOVUy
	8jBJyWE9temBHHrFvmdufusqn3ImEo9+9SVaIT6Nwgl+48ZOm5X8fTm5ldHWjMUyWZbDVtAv9VS
	WBKoHCjqerclTjmmI8mfi1vVnuZzBsc28Wnn9rikhhVSBlqd5lvxkT9xYd7I6zUkh99OgGbN+KM
	Tb9uQP3v07IWqF/hTUor3XktqV08ORcmY/8Bs2ErMBy4KqC9QHPU+MmVnocE5G50o9t7sYDs3T1
	rumx1bEMV+8ZBe7cw/vu0EMHP60wmV6IDcy6xFr4/U2s/xXm0bAVbzlzvmMRmg4o/fbFRaRqzNq
	i7SyOUsOk/X3c/k5gmwh+8lcgAv2tqHeIaNJxzdPN8IrKZIKtMpAaScWfg25ZXgAvgXDXkvfGw8
	K+it6nOn1addclwZSL+ES+qr5ChHwEDKcAAmlx7zEpZ5THp934+oFU4VYVBNzKzAra2kfvw3/a3
	aeKo
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr7916192eec.11.1793419071507;
        Fri, 30 Oct 2026 20:57:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 01/10] python3-pyroute2: Add missing python3-resource runtime dependency
Date: Fri, 30 Oct 2026 20:57:38 -0700
Message-ID: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131711
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

pyroute2/ndb/task_manager.py imports the resource module and it is
pulled in when importing pyroute2, so every ptest module failed to
import with:

ModuleNotFoundError: No module named 'resource'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
index d83b65f6da..a0abcd2514 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN} += " \
     python3-pickle \
     python3-pkgutil \
     python3-pprint \
+    python3-resource \
     python3-shell \
     python3-sqlite3 \
     python3-unittest \

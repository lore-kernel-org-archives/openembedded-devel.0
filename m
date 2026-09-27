Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E58FC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35367.1790506288870129516
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FnroZMvD;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88379342f7fso50824b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506288; x=1791111088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fVQPxYNB1mfdO3pFieFi4gl+TKiR13+jdsRxGlVmAo=;
        b=FnroZMvDHRPEJVtuh0sQLxla/SewS0fUGBCKLIEwMHKLo15qZi77fMNa2574d4QLUL
         WgCJ6z34PjbGtZc1qi+TP71uLJ2cjeVGebceCx5Nk2KFzKmt4UQZhQ+sVHdbKZJXYIsu
         /c0QGsrqSgli7mwTHCo0l+EBPDjDLakHImOhgGT5iCCsA/c+jwc9lKq1MG37u/2UDmcx
         MKQY280vXYFeMYd7DsPYNzA9S2SADPYJTsHwmyElttxZnPMobclgmPGk/4ldsB+nPPEQ
         TVn3rDzT3D505x6AIKNH9a+waAcbwtoNJPJz9wDhFhlPVHfyEOE5AfUbZPbSAZ0bmhss
         dVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506288; x=1791111088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fVQPxYNB1mfdO3pFieFi4gl+TKiR13+jdsRxGlVmAo=;
        b=W6Oay/hmOwB3IKDG8udkaosLi4qSBzLzZpf8Zju8Mgln/tD0owVU2llrUaFv7UDwEq
         ND4HClAHiUKD/9L+zTXOPqmj4q9ilVEXGIoGjQR++ReQI2r6OMWMTipxVtEv0Lvi2Fx5
         D1YawPFixhTmNS4yrCBzR1cuPb1t/Sle1clOYO7c10Thp6phGtl6+Okuc5EcvBVv10pA
         UKM1Rpml3Yi9cso90D0oitViefgJMR/O2RXkq8n9XUtOqv06lI5vUN+mYor0VnlSTDSe
         MaEoJq8yDP0h6+Igy8LN5cfVDKPCUg1UwvEeTlp59KS22Y57UIERLpzjnKlDzg3/QC+R
         uQZQ==
X-Gm-Message-State: AFuF++lv+ym9jj7WOtF6E4sprBfrxfrOYBjsnG3jt+Dt2b3ah+ihbL8C
	Mece7MltbYkSX+6SXUK2Yl1idnZDgDynJ7dbKpDPW11BV+BtyCrsrFBF7p4Z2Q==
X-Gm-Gg: AYBFou2xNggtk+pvfMmRTP8rHnpA0q93bV33g/6a/EJfYpgeyOg9SK3Iznh4ViUktBx
	gswKsqd6yWWsGtajfHrHwdHf/LLSscSm6RrTiM+NoZcRZ9pJrfcbaKfIamOxI4jMYs5N8/zyIW0
	75itn06Ou0ebosEBGJi+6M5Z7k9Ewx8+JfBrbUIGnMJffjCouUdaG1/LfzrI8vPrQ69vYliIbH1
	yvwRCpiK87MMaF1OLqmlTmlPmdTsfV6OOH2bsdLXwGHyUyjdddQVJK/3tZHjHiOCqCABn063BXM
	3wtBgp7VJC0NlvXrrSjSWLjo7JCKpYnFFQlGIp2F+HRg07fsz/KmUUpiVbbluRQqJ5g7C/cXcNn
	4pmDcZNDR+CueIMUNPIHsOPUbS8AXrHHVKAqU+v4jo8IQ2iNxiydryMnVUc9l0q/1CuCGC2M4t7
	glQPmaS/I7b8HCo8OddBz7oHQqs38xGCw/3mhQrugPD7aVFSoD+c+AWHH1iffakC0NA1oE3ZJNU
	pRLhaAVd7b87U9U2e5A6Xo=
X-Received: by 2002:a05:6a00:22cc:b0:881:42e0:b92d with SMTP id d2e1a72fcca58-88142e0ba40mr3258386b3a.57.1790506288269;
        Sun, 27 Sep 2026 03:51:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 28/35] python3-psycopg: upgrade 3.3.4 -> 3.3.6
Date: Sun, 27 Sep 2026 23:49:55 +1300
Message-ID: <20260927105002.1832451-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130362

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-psycopg_3.3.4.bb => python3-psycopg_3.3.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.4.bb => python3-psycopg_3.3.6.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb
index 063219b260..83a1e33863 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.6.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "e21207764952cff81b6b8bdacad9a3939f2793367fdac2987b3aac36a651b5bc"
+SRC_URI[sha256sum] = "c081f2250df751a943036e42db6df4571c66cd0aabe8291a7a506512b12007d2"
 
 inherit pypi python_setuptools_build_meta
 


Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17652.1794787850508323221
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JhXCXY50;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1881316c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787850; x=1795392650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b11cnpqV/HtcozsssZO/kO0lrFaNn+PIxeqn5h8lKM4=;
        b=JhXCXY50HFYK4qDev9pObbgpmUZmBBc9nlMFOYVumhvbua7IYv89isQuKQa6mc5H+T
         zaNog03U+vSw4Lv4hnRscqJOwP/01iuFuskhHmXw9ajv2S0hB1xEmV6YbSzBqyXxEtvq
         WX3X69SHHSxfzHtwt2RwzhGqoEbLX0DvI6/3fOjy43JPeUhnbcJD21i/j8X/2wUwGikq
         SkbZoIE1OCW+omuRXJ4noqopBRA937m2lpAt51uYNE3qLr531c/mCJKjXU4PlW/Us4V6
         G2PsqQCygSpHucvNRbGOs3eMJwoS+cuBKTuTcrzueQnXNOJDjHEXcShYJDISs+yRE4io
         9q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787850; x=1795392650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b11cnpqV/HtcozsssZO/kO0lrFaNn+PIxeqn5h8lKM4=;
        b=J6Dx+VwwX9aSpgArpiZUcOozDBSTJyY71qqqzphgLpKZZ93f2GKfupd7uDA/AYtRNp
         kRUqGevw1iPhOCzIBhP+DlPN5z5JaC8UFs1El/geQAF8P1IStqaLb0N02OlOdm6zcTcM
         tasEEN761YxfF88q9ZHOX5BMXdk5lAtLcsi4UTzgahUr7jPZzySEje36xNyM/cimxPM2
         tptqBM+tBSzYnAyynNyiXlA9uAhbvvm0DsC76K+y8Mo1AlLqrSQicIJ1V2P1YGmcp2BH
         gDWf0jOsxzDWWklLbNochE5u0XoH5DnWWshQsAOsGvE5FTG21adzQiPyad5w7vsA/RPi
         PR6w==
X-Gm-Message-State: APuU4Z+1HGnDVJzmOtYdAPtiIxM9wy4yIjeraOtc9T42LDJVo4jSdLtC
	gi/meEARA1fx0K+Jk0xG8Qb0nm2iPUDkBmi2CD0vCjtbC9ZBqyj2sOCpll3258BT
X-Gm-Gg: AYBFou0mp45C5dGYe7B7w6qoRwF+jn80SmYNKLktQN/MJVyfyONbPIB4RywaRCQifRf
	eifR2KLi4v19yqwTBDzFktECSPafr3GEWjt95tMM9HVvRylnCceU41ZxsxT4jCCJZF0A1Q9wG3+
	uY6CcwK19/OOnT9Asu1AlNZzg8ZdFdMPf8wabg4pti8R6h8gekvvGHbUtLjGDxVk6z+/Yn6evPy
	i3pxhbQNuBf970GaErOOIrZgcIRl25BxvQs/AgeVMATE4urlu8tUW/h/3AlCDwtK9ucbDgfo8Rs
	1FFYEfS4e080DThMmeIl45jj+zt1C3pPXodbhe8u6ssiWvZq3pYJAh8c02a1kFtr5wq5vkUzg9t
	Af+YFMaCsuL1+4eG3lRyrPo2Vzp+NPHC+XKzzjvDTDO0G/Fq+ISnso+eDGmOZDBgs4p2+/P4Jdw
	UNgIx83+Nk9FG5L7gua7kK5qv399DN2IrebQJJWdizr/08QsvEytHE6IOWcsrG6PUdQAW1HYeI8
	1kQEZkAUUVo4heS+jbw4dW0UcjOEieXbgZE901pdbxgIpC0HpPP6/TlMm67eH4PI8yuUEhjxPO2
	W+UmcFEiQq2UeILTCvz5o2Tz6I8q54aLKMuVgGlIsgMMfU1rsbap69eK/s9Y6WKLi+d5xEisjhj
	xnr5cCgPV4P/+5bIwkFyehRPj8CyMjSskRR5TK/od2/NaN9vC+Kb8evdgwz7kJPJ5MSFoDGLm5h
	pooAlbXi5DVaTPFsqKr21cCquryTZRR0L6X0WGrQv5o7fVJJX04SVEuN/qSF9zt2mjfLArNDpC+
	khCOYQFE8ZB4042mZ8KiGs8GKaVF3+wOx6Zt53K+UAaZLAlQ90KOLepFZeMaRWK6UEtkr9ibuik
	pLHE
X-Received: by 2002:a05:7022:7e8a:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1b5030b8167mr9561913c88.22.1794787849833;
        Sun, 15 Nov 2026 16:10:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/16] krb5: Fix package name in admin-server RDEPENDS
Date: Sun, 15 Nov 2026 16:10:30 -0800
Message-ID: <20261116001038.440763-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132389
Content-Type: text/plain; charset="utf-8"

The package is ${PN}-admin-server, ${PN}-kadmin-server does not exist,
so the dependency on ${PN}-kdc was never added.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
index 8fa9ac0859..1a13f1e85a 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
@@ -176,7 +176,7 @@ FILES:libkrb5 = "${libdir}/libkrb5${SOLIBS} \
 FILES:libkrb5support = "${libdir}/libkrb5support${SOLIBS}"
 FILES:libverto = "${libdir}/libverto${SOLIBS}"

-RDEPENDS:${PN}-kadmin-server = "${PN}-kdc"
+RDEPENDS:${PN}-admin-server = "${PN}-kdc"
 RDEPENDS:${PN}-kpropd = "${PN}-kdc"

 INITSCRIPT_PACKAGES = "${PN}-admin-server ${PN}-kdc"

Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C00F99C84
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 13:52:17 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67177.1776520336481383654
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 06:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tLcGMww2;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c79c7ba8cso659823c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776520336; x=1777125136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moDhyLtRpOWKopMmwv6sVe77Zat+F+zp29vVPzoODLU=;
        b=tLcGMww2bYFh8qBPPZhw141MwC6a4xgLhu+LiVz72EGQS4D4vxzJ6IpYNmzTkt9EbE
         os8sBFrwYk1TnKeIzLnZAYg2pVFtAXslUjMZcRq6WTJZiVZki3G2PVdSQ+b1PyrNx6Cx
         Zl3Pyqo9AhLoYJKVNpndt0LmaZLEQeOA/KDB7rAm9K2xTboZ2CeoYCQMeFqaUk0rv+PZ
         etOgyOSDS3rhjI+sVDsQerH2PUx2LKvFYjfaU8+mMq8KQabURuDqBtCfjkXQ20h91hPP
         46rwVLTEtIzEwEmptkZIZhBTEDmemRYhhsqE6haJpHaeKpuQ0Di+dhaAzq6A8rpdNvfu
         iWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776520336; x=1777125136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=moDhyLtRpOWKopMmwv6sVe77Zat+F+zp29vVPzoODLU=;
        b=OMkvnUFu42J3lZeEiPHW/rb7v/FZKMqTiUsJQkWfNJp4cV8cnM8y9Cqo5uYZPD1mkP
         gl/wqhgh+yzRXIixsSWogSZ9X5nd10PeXcwDO5GbR6vlFx45iu36W1u+YnEQOTsE7BDC
         x8WfhnOv1RVLdn6alQpz9tmyFoCo+R0XpkbRKlA5P5xeMAFVks6VddWE/V3P1pIaMKZj
         kOpSs8/4i0j3ZosCiO3iijE/xeA68kN66NbpkWDn7U+F2YqW4nEsVK3R0tVDqV8qtLQj
         CMzEv0HjNOW7Y9X0NkMO6lt2N/rou57qpii1Z0Hk2uDzQw0hvYQWPvMUVM+d12DIvBlX
         4CSA==
X-Gm-Message-State: AOJu0YzahUE75/NyTt265ASCs+sBF293HpbTHs2STPpgrTUyLyZ6rLG+
	9TliEeIimhwJujxIiEBqyO0oyESFSeSCYTh9kgzHEPKW6Xr4iHuPRXOSn/sfYbuT
X-Gm-Gg: AeBDievCws1Z43wG9shY+MPyLtjk0TCWIl2Irpq0fuEq3G032jIHvGXHCUFB5TCpea+
	6Nffc3mc80BroemNsh0z0e++v8R9+dt1cl/Y6Z+7ldh+WsNHIpmyD3YsXgrzpcr5OXVc5YyTFjB
	VebmzQUIi9bCa/vuIhbpb7a18yH4y4TrlpHrKj9pHNw1alVPQst/FdN3dew09nUwiAsero/w1GL
	FKyE5lrUfaR+nWvrAK5CFwAPE6Wj8OicNVcM68wMWr0uIHAitAKr0KkKU7loZkLgxLQlGzEiDuT
	j8LCGUhbEJv0B6Sxa/+KREDE0a4RY/vaFKj68VfFEIVEHNab/VxyUOeHt67OYYEFOwwLOUS4FUQ
	kgGaBZdGD5LsFf3q2Ew0T6VzaxbARa1g0+J0W3n+G7APWMJrbK76yOQQMDQnl0Z+kzVVyxghjgl
	izfjUzjeXfrePBUl9+DeIMMu0KNxhSgUeuONlDdnQ4p+iWSQV+nygOIIneeqwWRgbS9ueOD9W3u
	i6z2HtZduKOBmlwzKnwyDuLzFstSR1yOIHFXbbNVHvba/Td5ojSHSQDmkMrFPW/PEmXxLYvwVjF
	cx0Ym4VwzJFQEXqyswPPstWEj7EMVxKD4bXXTmLpJtKXcSDVpU+/huJB7D752g==
X-Received: by 2002:a05:7023:b0d:b0:12a:6d05:3938 with SMTP id a92af1059eb24-12c73afc31fmr2365043c88.7.1776520335548;
        Sat, 18 Apr 2026 06:52:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm6642041c88.15.2026.04.18.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 06:52:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/4] enca: disable C23 support to fix configure check
Date: Sat, 18 Apr 2026 06:52:09 -0700
Message-ID: <20260418135209.1635971-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
References: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 13:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126455

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/enca/enca_1.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/enca/enca_1.19.bb b/meta-oe/recipes-support/enca/enca_1.19.bb
index 61da50ba52..395d7abe70 100644
--- a/meta-oe/recipes-support/enca/enca_1.19.bb
+++ b/meta-oe/recipes-support/enca/enca_1.19.bb
@@ -17,4 +17,6 @@ SRC_URI[sha256sum] = "4c305cc59f3e57f2cfc150a6ac511690f43633595760e1cb266bf23362

 inherit autotools

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 EXTRA_OECONF += "MKTEMP_PROG=mktemp"


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A38CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 00:49:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4616.1761871776627092757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 17:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mek7i7Lm;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so1718151b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 17:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761871776; x=1762476576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyU9Tren9PHP1+LAZ6yTH7KMGENp2CnGgjiJRotOBuU=;
        b=mek7i7LmwKJKOfSFx8F5hyr0toYH4bBZCESWsnj+E2MPJq0irXV+Ao4+FkiPkjC+tD
         0pCG4GLAFdHUKG4dTojQpnTIBro8Lg/4EKSI5Ymj4K9WDDl8pjl7HazGD4YmgOZaXAEQ
         0ES40aPOyX/feufiiuM6+nt1Rd0mviSfJ63QZ/3zjFpfIAPKTUR7umdqhXXLSIW3YrT/
         +6i87sQi4HyLleAvdc0pU+KzeWe3j1haz9HbeHcvN+UYwszpVCUWS9WEm5G2Jqv2/ygd
         ZujU42UXFpArxiVHlSVXub1VJfyD0+B6JKreKurLgpoiRyeQHaUKysoshx3dNkFROuer
         qfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761871776; x=1762476576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyU9Tren9PHP1+LAZ6yTH7KMGENp2CnGgjiJRotOBuU=;
        b=sNiTgesNRzKZumUMHmzcttVrGPM4SYT8Xmz4AX9zBPdJmFzmUKzFcyqwu7ouFINWjD
         yh/o7stRQrDUi9l/dhW/jPbiUKdm8KMEzMUg+p7U8BZLRbN6Zw6x4FCAHib2EmIZbYg6
         crZZV/tlmr1YlGzowL7h+LO3ifFQzsM5cdQT3fMnBrFvjckoYi7r4Sq0rZRrhapJ6zAd
         HesLbgMQmwiFwfTUHe+d/wlXP7HKPxDOJcjyCagL7cTRooP8CiLTtuhyyw3vxA4e2fk8
         IcH3PDkxvdB7gwY0CEMzEjp89TSD0g6UjXJsa6/I3XAH9n0dwxIArIUG7gHu54OG4UfW
         Qe5A==
X-Gm-Message-State: AOJu0YziEM3wCeXgWKbxd4RIdCM+A3WSozvLWoJb3lk5Dl5/swLrMYe6
	EEqUYGvqLCOsgwM2gIZp2wxA125gBwAE9P1/OEZGYDEEjAXGpfIDukT9a7EEQIWx8wo=
X-Gm-Gg: ASbGncsBDfE4gcuVDlpaf1MM12e9xIs0+S1XhWIE/Z4eIW52Ao7ON0tK6Uti9/v5IB/
	o2/f6sxIhVgItTFADMEgAzUwrext6jf+j14mkJs5tjRIweiAtqghJ1QCI/lvYHlr+4TkWh1yXCL
	rKK0tcr47Fc2ijeUlVcQNhJ84KFnV3A8oKZPkLdUjDvukBF+RB7FdQDoJAJhv6jwmNawdifiSMW
	UFZ4JvqRcjGnwbJT4qcPOqsiFkTw7rXpoAOgIw19RAN3w/6/NfdwAErsIs/sxx9WzuUZEo+ld0O
	8wA9X6GTssYAMvVWLz0liVeGedM0j2VgjZDnjtvSCLtHJh1rtnr1nJKHy8XR41Ey2oa6zqlF/YQ
	u76+OeGmtbQ4eocFWJ42uMHunG5xjFFrwx0OWwTf+wPKgMQZDYnCw98m0mb4dghLDyO4DyoTLSi
	3WwmXQ+JEP8Z72Scl5MioNpIPp
X-Google-Smtp-Source: AGHT+IHp/FvDrI9WHyqfa0NgReqebm0m7Yyop+G47ugfXvz8ukKji1X3z9PSJjsgk+ML1gOXkabTtQ==
X-Received: by 2002:a17:902:cece:b0:28e:7f50:5d80 with SMTP id d9443c01a7336-2951a36b780mr24594125ad.7.1761871775578;
        Thu, 30 Oct 2025 17:49:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e764sm131505b3a.3.2025.10.30.17.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 17:49:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH] mercurial: set CVE_PRODUCT to "mercurial-scm:mercurial"
Date: Fri, 31 Oct 2025 13:49:28 +1300
Message-ID: <20251031004928.2869520-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 00:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121213

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Other product "mercurial" introduce false CVE finding like:

https://nvd.nist.gov/vuln/detail/CVE-2022-43410

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
index 2451a36be2..e25f20713a 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
@@ -34,3 +34,4 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
+CVE_PRODUCT = "mercurial-scm:mercurial"


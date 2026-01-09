Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14EBD185F5
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6694.1767950938964436318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8qP7hYP;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a2ea96930cso29575465ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950938; x=1768555738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8T0kKatXBHkf81ZqZ2W54SIVE8Q9Dy/hft15B5So1g=;
        b=W8qP7hYPA2yIJYYvTaEG2NLouNbxzdKOob5axMW5c5285g3rB2SvcmWe+9ZTrEUnUD
         dWCCcvDUS2Jj3yy3f/3wRVpoBnszY8NVLgJuP4BDLaVEGhTnU6wC1iklilLuNA5qgp11
         K5v2UnaEu/lvdyaBv/5A2aSs2Upn7QEaA0y7golZ/vbrNcYdNF89dEIkif/r44SfvapR
         DBGVe+8kngKMk9dyeqiGTEJO4jZ9k2ZZfMMR5OLmcHKRf0ulwOkGz7nL1n8/RCfQ9GfY
         gtyhLwzSKq8IezNS2Chgfs+uTXrrYBmpoU/mQr1mCA/AK2DI1uI6valJdC6UCODJtH0u
         Zi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950938; x=1768555738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8T0kKatXBHkf81ZqZ2W54SIVE8Q9Dy/hft15B5So1g=;
        b=op+1aVY8+mVaXrUHjKPJnt1rWlcc132UzJpLXQOyRg71yYK2aBZ1KlW0loKifPmewZ
         e4KD7Qybpxbca+zewnIo3gCyM7Yw3ml/o/6MZXvRf16cbtxXh9c0ybtjqVBInn8SxHbW
         U/vSPA2LVEFUakJ9KoSbbNp6yhh4AmFaOFmLXey19J1vJqu8CthP4K3jmLSLvcIRuMyf
         2UCoQpsFWZ8lbLR27+D+r0Y6tOftkDkLPskwop6TU8kfiOM+6UaARiDqZnS/Jpn9i64k
         9dvs328Vl0e+OXFMoE6LTbTo3QEqN5KDPwnL1bO8S2UH8YGODofn2AxhKleHvcUW+jjo
         bm2w==
X-Gm-Message-State: AOJu0YxRVDk4tIPrbA2nlDXbQgBb/gkWuGd49v7KQEFS0g3D/xlLtmRu
	r2Rw+CFaDDXSpX51ZfRDb1oOcWhqXpFK0I2DuqyhKgkbuuR0MIzOn+qPncjQOA==
X-Gm-Gg: AY/fxX4t0BXhQcOhWfc2HKodrcZeVoJF5sd718kesNHJJMWcvMTyg069L1JV4a0csiT
	eaSP/VOF6W5Vr84vB+WgixjVoiYR6GmFEeNX36eb+8HoSwkBDKGFnBmenLcxndzf/tv6OUk1FXQ
	Mzltqjk6/33iSZGHRx46UHSL4HD0Cz3GPW69xC1XArxdcAw7hIOdmRUQDAgesE+KEy/nyTw4acB
	bBexlDRpfQ1qu6M40TZ/ndOPv8y/f/R+2jkbQME6JHsA3Xko8k7RdgJ3nUPMzjXfvx+nENy4dt0
	w2bnV9KpcEmUMFe/g1ZWDQbrX8bydvJaSR2+JZvUSF4yj5bv6ljhuxVOGAvY6u7x9G2vWkRBS4K
	VrL0OrheD/yPb3IC5piu7+upc04l8aAs2UJhqXrWM/ldN3aLur3lvVSpqyH05wh+OHP9ASq5wCp
	HhL/nRx1mD+cizz+zzH5KOev8=
X-Google-Smtp-Source: AGHT+IHJBbP344BF6Q/M4RLRn16Bu45kYpR3YoqOIu8a4kaaaPZwDtef56uddSb3v1UvxMhP+3z6fg==
X-Received: by 2002:a17:903:2284:b0:2a1:3cd8:d2df with SMTP id d9443c01a7336-2a3ee51385emr94596915ad.54.1767950938020;
        Fri, 09 Jan 2026 01:28:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 03/12] dante: Add _GNU_SOURCE for musl builds
Date: Fri,  9 Jan 2026 22:28:33 +1300
Message-ID: <20260109092843.1924568-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123281

From: Khem Raj <raj.khem@gmail.com>

This helps build fixes e.g. cpuset_t definitions etc.
glibc builds have _GNU_SOURCE defined inherently.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 848bac20ea27afddc3843c41ad105843ad167177)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 3a290d31d6..2fa2767e86 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -29,6 +29,8 @@ CPPFLAGS += "-P"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"
 
+CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
+
 REQUIRED_DISTRO_FEATURES = "pam"
 
 EXTRA_AUTORECONF = "-I ${S}"


Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2519.1794961607937255440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TtnXkhYB;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so779417c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961607; x=1795566407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elkQlmVmyGYaQKEIT6wqJhq8hD1+pEgUyEgKLRVQPUk=;
        b=TtnXkhYBq52vQa79rGGnAMkFUK+lbNfKhukDY73M75GBEkgGWANJTOXsezEwokf8rP
         DRqZ4+hIwOF6LflRslDMoWhxyh92jrqwfGm4j6HWpS8y6oRhPJZ/51F60aIcCMBXsFrj
         F2u+jxwMoJ880AqKifUADU/jNCgKpXpIpmcVYjMcxerCEkdnj8hdW7VQlruAqXV6P63X
         NitijnbpeebqSlyg6g3PokVS6ty9dKi/aCo6FMCF4rv4/ctErAjgqC6xZ0ko08iTEkeD
         1DT6qyqBCaR7gP5lGl3I/s+/pdPNSN11/D+yjDskII4Ccqlzjqn79BKgM09vHsv9jRAj
         Quvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961607; x=1795566407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elkQlmVmyGYaQKEIT6wqJhq8hD1+pEgUyEgKLRVQPUk=;
        b=RTJT7H0yd55oVHXSFtiHOztTyEmY5LnLrIZuewuKEhsd2F8/UojMCY3oL5T/IJfk1Y
         snbY5CieRAGwtixup0KaXS0nQJU8VWRHuMry0sJQNlFEolgMCyBUaZ6e9y8Ry8/ag3da
         akhRpHX+F+32r3zy2u3sJSC9KQonL3L0U1VlrrwtLAyXnUlkSoLRc2rvom1t47ToZbI5
         wRXTabJwIkw+R7fC4XGci9B9+kRwnR0fnotij4t1oPnU2mfgzJ3rU9sW4eaiGy01lcWn
         sERtneuJsoL7ukhMK6d7cFjA6/fR4NQ3OSYpvkvHacPfEYY99okfQ4RejO4mhgCSxO2/
         iUoA==
X-Gm-Message-State: APuU4Z9yHa+95BXjRETNULA37kE1g39kC4sC+/xH6KylRu/CIotgFHX/
	z/9/xG+g+K9Krq0R1Obh9MJ4X0j7kgipDlms6yIFBUi+1XuNmF70SAsrmbOxjzXs
X-Gm-Gg: AZFdTZdrCdM18e1Rhad9vuutwNeMkBBu7U8XCRye2LD+FvlIWUueY0RMifxHRlDqFAT
	SH7vu4+4zBfA/GOl/jVP5HJvJainZLaGEMs/DS19BIW+PgGp09Cu7ev2741zs6dP53OJARTn11n
	PDxE46S/hCUsUg+0ExQA5KfwOLg8ARDgEyFLz2mBCZwgehCLN6w+M0gxVRXsuJr4Z3bWLwLy7nS
	Y6OtMM2GNQvTYI7Y9NnsWg7fRF6axkLWnnj4f9lut5xJSqCXrPtzJj7kV2D+Y7VF/QrEhptOZap
	niKC7vnKjulK32HZfvT22gzSYcrIpwdBNBZqYHx0l2qfhWxcEuz051PNRRx+lb5LOERT/JGBJik
	8MFbVma37UPQmur/w6o9K63dNkxoVGtzJQULldkma5nI8ovaOjNEKK8VccC2ctt9D1KyD0BwLBS
	fDFoE7gHX1a1OcXAanrFnBzVuRxhC8IScidR1z9YP48pxCuDZqSONGfhHylAQWVFspA7NGGOuuI
	Kcb6TegVEyj11NRLYimUmQBB3y+58idRkDky4s9W3PzatOboz4VuBlA5j4G2p6RZvPpJUbyYcfF
	CWFkc35w4P7HcBHI3v4Y3lRhlDY0y0usfp/1wM3PA+6oGs5W8sDvjvLE9p/GAD3yr0rvkDThZEh
	IVO+IhL8kxIfrFbBrWTQeaFOYQbO3XO3mtkePR/1xb8/4ATMaxQyV2rzygzIRDQuDjSVl90RzL5
	7cw8MOnIKxZBaJx+ok703n71w8+OxUSLo1uZbbyLHoXI7/KnogStVJSIKT6w4HJTs/yuZCxN0SH
	POgHvY6Q4e2k7BmXaDvN9kI4dn5ie6EPs0ztVJz6wbhKFrv6x13rIhWT6J51H7T+BY/Ipw8QUBk
	qe3U
X-Received: by 2002:a05:7300:d217:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3827db0fa8bmr1049629eec.5.1794961607104;
        Tue, 17 Nov 2026 16:26:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/14] ostree: Fix LICENSE to LGPL-2.0-or-later
Date: Tue, 17 Nov 2026 16:26:30 -0800
Message-ID: <20261118002643.29829-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132603
Content-Type: text/plain; charset="utf-8"

Upstream sources are tagged SPDX LGPL-2.0+ / LGPL-2.0-or-later and
COPYING is the LGPL-2.0 text; LGPL-2.1-only was incorrect.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/ostree/ostree_2026.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.6.bb b/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
index 70f3c8ee13..ca6ebdd739 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
@@ -4,7 +4,7 @@ tools that combines a \"git-like\" model for committing and downloading \
 bootable filesystem trees, along with a layer for deploying them and managing \
 the bootloader configuration."
 HOMEPAGE = "https://ostree.readthedocs.io"
-LICENSE = "LGPL-2.1-only"
+LICENSE = "LGPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 

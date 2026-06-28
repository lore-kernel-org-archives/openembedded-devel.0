Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C45FC44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:13:00 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69160.1782634370650071020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sVgWNx6B;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3061236eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634370; x=1783239170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBMQIGkc5EhECcoXM1LI15bl6p5AYhz5VKS9nV2nYrY=;
        b=sVgWNx6Bn1QAtTLQnJpBo9kvaI8yxQpykbdMbuVzsaTKVEJGmBi5jwRnttbmgxz8M2
         8cTcon/GIGUFTRFhWbapToLSoOVTmq6j5WI09NdV3rrFwatSatLxnl5d9l1hrbpneqWE
         Cr4YNccj98Kv/4M/RQZOc7valbIGZi9pzDCcYwi8yjeYBNzVm4pr9pQjGlxZ+bAueuvf
         rtRuwzcLYc19xzZ45JY6JaUM+B41CGhx4x2Mkt1zgpqE5rtxb5Fk6DvUpPzkJ245b41m
         EGcq85aCiOAUMrdGMhmpRDIrP62aEPmjRYIL7fsoDmPljOXsSwuDlvvpKpHR44Uf3dO2
         idkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634370; x=1783239170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBMQIGkc5EhECcoXM1LI15bl6p5AYhz5VKS9nV2nYrY=;
        b=ZSnJ/ikZEdrp62orAmMjsO7vqeHoHEwHCMYSPfcLNO7goOCMpmcteTIx+yi742Fhau
         yiUyA4h5+/7xAzpak5OwFeDRXioUl9EjLllVSi0WyitXIB0cZaZ26gCT0J/i/OdepCtX
         0+WNrRNfuE5bXmHpLkbziGuuXsP6TRSXmfLC7fP7+i++3O6MzKfnkLc6AXfsMbNBQnFU
         V9F0zPGRxA8uCaNH/VtKekHMFI5om3IxrV2OHowwdsXkdpjUynrj4sADes/YJ36VOm6F
         0hCNB5sw9tlxBVOLQmKavb0Chy5EB3EXOgJc4RWJkT8Rqa4WkeODucja3Q7v3GbeDlwT
         mOug==
X-Gm-Message-State: AOJu0YxlH1OJbaOU1SgunAk7l0dVHOiXXqkf6rHYADkwmiTsseynSn7K
	eTCH/Vy6Qg3nsc9rOZL6TIc8YphWjv4NdzPNXw5aPGKKS946dPDDvBIwLqCCHCaXN0gXjA==
X-Gm-Gg: AfdE7cmCxHZ8apaQyNYnborX8cXr74r00iEl1awsnKYmeEUOhQ+7Ar4w7rPzEw7Lmeu
	M92rOT3qgUVj97JjYZ+79fLM/mmL16TPebCmZkTE9JrQqBCaN2ZgeCEXi4UwNTnktHLVgFSkFOr
	SfzT4C0eIBmgrznkITcViLuJdpXrvp7AB1fcg7b+xhZ+M6/5lkv+Ddnv0IpgW+2oQoxK2joa/9+
	eb9BzHe5Nn+5vfPuYrcYGVWSnEu5ET0lCX6gDOkVV2hq+PMzwPeoSlmq8u3FsZGZE1tY7Zi53UR
	qk+Q6rbRlAIl9vG11A1otnF87giBN894rk77BjFZlagPyehoiWa9+ME6N6/RSbbJ1HhY1b48F1L
	8+zT2RhQELzxAG43RuvfT+/qfWKtsMTy5QKRYxNfrDjAWeLmoo7lF6dv4TMh7j4yh+WioWx4/gk
	tzkvUJJYuvAH6/+jZ5APv0yJhgJHR3tjKLzOU4fdH2oE5gPbAG7PXwe7WyTZV09UnPNtr/2nrOC
	kompWMLHhFTbBAuj3WJGt7Q4NvZsiMuFeJXp8sHToNv0gSCCZeTh6kZUD7FUJ67ylYAWjulH/It
	UCkAIa1dSx++01RxSha1ylFqOKx6mw==
X-Received: by 2002:a05:7300:2312:b0:30c:efc:c399 with SMTP id 5a478bee46e88-30c8502724fmr13072564eec.35.1782634369960;
        Sun, 28 Jun 2026 01:12:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 092/128] logcheck: upgrade 1.4.3 -> 1.4.7
Date: Sun, 28 Jun 2026 01:10:43 -0700
Message-ID: <20260628081122.178348-92-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127902

The Makefile now creates /run/lock/logcheck (was /var/lock/logcheck);
update the sed that comments out that install line so nothing is left
installed-but-not-shipped.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../logcheck/{logcheck_1.4.3.bb => logcheck_1.4.7.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.4.3.bb => logcheck_1.4.7.bb} (90%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.7.bb
similarity index 90%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.4.7.bb
index f00d78fef4..41cc92baa3 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.7.bb
@@ -11,10 +11,10 @@ HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "https://snapshot.debian.org/archive/debian/20230718T155737Z/pool/main/l/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20250829T211924Z/pool/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[sha256sum] = "ad83ae80bd780bdae5eefd40ad59a3e97b85ad3a4962aa7c00d98ed3bdffcdd0"
+SRC_URI[sha256sum] = "cc160cbcac28f39388e8b96e462c4e62d005453b6957f1f0eaa8c093ff9cf3df"
 
 inherit useradd
 
@@ -25,7 +25,7 @@ GROUPADD_PARAM:${PN} = "-r ${BPN}"
 
 do_install() {
     # Fix QA Issue
-    sed -i '/install -d $(DESTDIR)\/var\/lock\/logcheck/s/^/#/' Makefile
+    sed -i '/install -d $(DESTDIR)\/run\/lock\/logcheck/s/^/#/' Makefile
 
     # "make install" do not install the manpages. Install them manually.
     install -m 755 -d ${D}${mandir}/man1


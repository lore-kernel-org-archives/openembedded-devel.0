Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDD4E64016
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53473.1775477006646186714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDFf/SSR;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf7683a28so2232614f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477005; x=1776081805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJywD/00p/DmhU3CbmDOvJMiCh+e7LeMdm1zQF34lA0=;
        b=gDFf/SSR6We4k759piaYlC40ioowE0zox8EVurkp87+sZOMuZCFxCk1uK6IgttNCqx
         MCc/I84itAfRXe5km+zB73KFXJ7JNN6ro7DuxjOtchij3rwt+qXgj7XxiSQjsv/RyIK4
         sbM23y+CIK4G9KEDZ4X6zrCVajI5QOctm39CB2FC6KtrfrACro+kBj0npBJIoq9eDBvM
         oyBcl5pLL9212RZRTLG+QFmyOIByAOOXVRgUYPVGztURjYsBa8kAbF3M6dE4cahB0Gox
         1tKK0M96BoMIIzuCwURx/jpDSY8URPNvojpHE+qNWltou7zVgUoQU14SZpvYd3ke+1Ja
         9xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477005; x=1776081805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJywD/00p/DmhU3CbmDOvJMiCh+e7LeMdm1zQF34lA0=;
        b=avfyesQQIzzEI9XYRnhoyJcUi6Oav74UNE63sE9H7xTVAUCXP8WelNYByWZiAIdLeT
         5lozoz0+DJUET9zG04cdCw6JoAwA8sZ7UvLCJ4Vxt4uQ86Acio7Vh8CvIHA2EeC9HXMJ
         l4pmZx1ofAsJdmQR34T6mCaaEMNHtYkmaO5xlNrkGHOyfnuFOFf0NvAbIEIchZOwfSMG
         U8h+aDom+Lmi8oJH8jZlHb7RoV5qpGV8hsTRTqSGr1iNzQfq0M+72B4SwLrlZiS3JEci
         01kpVvmDcMRRBTywzyXgW5pEDST/khWvSSSwu7HWnzY6uTNQV+xbvj5IeuAmLVRRjWKx
         m64g==
X-Gm-Message-State: AOJu0YzHRZUJ7QnwMgwFP1GjzUQjHwbvGYAiui3zYhwcC2SHITDirG62
	AQaqTcwacd4WnEz84LX6tCNmtM82IrD1WWT839VrejS+8ECVhgZah8ZVde9t6w==
X-Gm-Gg: AeBDiev+vjYcMVyegdXxt9PVRk9bkCBaeLjsQzIjJXrnoqnTu9ecHR2ln6Pb5tZ9YT8
	45rh3RF1YwUWDhQhCdr1kq8RPYiJBo3fraKHAHRo3H/+sByxTKQlvdeaidKdP4yfLK02onY3n/r
	IWNX8FrrIJaYvrEDSCGMyOIQKpYQGlL2yOcOqnO0LYan7XEbzo0XAvwU7PhxuS48QQgB9TuMHSK
	rkNOeK4pn3vWmhM7TacKVvbKCr2qoUGbWc+9oJ3gwurDTf6YQYJy1AGc41j9nhcgjgxfKaOjKsa
	5BWoSAM2JFmG+o1n/ovhPlMfTkUHZe1btLKAKnWqdStuTvWO8k/ewpkyFzPYYd1dp5fLgz8a88B
	CbbJQTSdmTOhuRwDmVU6xX7z4IPIor818apaCvt/mwDXre0Saxo0zivfvSZXhhKIGCh3dSAALqz
	JiA1d7JI7D0g4sOaZ+L2td
X-Received: by 2002:a05:6000:420c:b0:43d:1cec:4767 with SMTP id ffacd0b85a97d-43d292da9fbmr18365449f8f.36.1775477004858;
        Mon, 06 Apr 2026 05:03:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/7] dovecot: ignore already fixed CVEs
Date: Mon,  6 Apr 2026 14:03:10 +0200
Message-ID: <20260406120314.3514982-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126040

The following CVEs are fixed in the current version already,
however they are tracked without version info.

Upstream has confirmed[1] that these vulnerabilities are fixed,
and Debian has also identified the relevant commits:

CVE-2025-30189: https://security-tracker.debian.org/tracker/CVE-2025-30189
CVE-2026-0394: https://security-tracker.debian.org/tracker/CVE-2026-0394
CVE-2026-24031: https://security-tracker.debian.org/tracker/CVE-2026-24031
CVE-2026-27855: https://security-tracker.debian.org/tracker/CVE-2026-27855
CVE-2026-27860: https://security-tracker.debian.org/tracker/CVE-2026-27860

[1]: https://seclists.org/fulldisclosure/2026/Mar/13

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
index a8930979ea..10ca595029 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
@@ -81,3 +81,8 @@ FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
 CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: Affects only postinstall script on specific distribution."
+CVE_STATUS[CVE-2025-59031] = "fixed-version: fixed since v2.4.2"
+CVE_STATUS[CVE-2026-0394] = "fixed-version: fixed since v2.4.1"
+CVE_STATUS[CVE-2026-24031] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27855] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27860] = "fixed-version: fixed since v2.4.3"


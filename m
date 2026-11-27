Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8103.1795739768246827996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NJzeUWn+;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f07a960666so52342185ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739767; x=1796344567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQ3tOm2mBThggoeV0Hy+xUABUYk+uo4lxIHWrjSTeMM=;
        b=NJzeUWn+FQAzFamI6TSmbWUAszmF3/AzDU8ty14b0ekAYvhZ3gt0r0Q+qtUdG+8YYP
         TuPY2o+q4xtbgS5YfFtmokjJWIRKWJolHDU9/TIJfZxyWRxGpsW5NxeXgpMuUsL9aEu9
         A+GrEbHnkTPOYZCuYdat7jkUDfEZqV4x9djCTYFHSsmgFchUMe0pc05g58iPqc70n/ya
         36lyevcr70h4YpdDFB3Ee7lHIbDMQp+D+1eA7w4Y9RIl+shw/rp2Kou1gy1jj9liInsz
         RzdTjs2eXZrmAQqeR+P24sFjQOgHl/8uDj0tVilt+/4eMcXwQNhPU4gqP7YDqD7++TlL
         ZXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739767; x=1796344567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQ3tOm2mBThggoeV0Hy+xUABUYk+uo4lxIHWrjSTeMM=;
        b=o0GsEdTj4wyoLIGW9rYeU5+D3Alk5oMjjEUeSv5lFDhgbc1o8ogCdVPey7Oy8FbILr
         3zMSfiFRM+iY481dGu38tLbvhn/sTPBJPQe4gAyHWeciWxGjVlPy4HEJxOiK3TR4RM04
         a4fIVFFlTyPNc3BRygZ63vqenoDTvo1X60zOz1BFNDxvBo3o0RdiBX374/RZHT5+/3p0
         yDoHNu8cFX8TyA0uQJPOezqwEBr2YJvNdzDNiUdGL2/8C7Knm/Gpo/99bcaf5ejp01Ps
         gB6lKg5hxDr2b22TcnG8BA5Esvtce39i18HG1Zog1wf9pKmlT7wke7sqPSCdLtwT+DdR
         /6BQ==
X-Gm-Message-State: APuU4Z8RTbopQxPMv3WdIVbueE2ADnMJo0xbCpjE6FFODdXoMkQvCBq5
	lRaFCiDHXPDlzo8MU/KT6DWJZ85/REOAofgtDBV5DvPQgA/KyZXxtI4JIRkeuw==
X-Gm-Gg: AZFdTZe9xHCOm75Ql4iaydWA5fqNd7LLUMSFSD0ACDoHuS/uAO68twJRo5jxX/DC7zo
	MUuqs9Xa99ZqxGXaNnsNDYfKq5KXjWKhVR9TcM4H7mV7c9wY0Hy2oKAp9Xifo2P/y8Gio3R2q9+
	aFCccQX7ydSHbapJv+sOHMcE+Df22iRXJLGlHpSDj8yjkdZs9ESk6rgfj8bieIw8PPv0avMbFsG
	98wZezHwzm0gNwYoVux4FL/uqz/TNWMhitWjan81karxH5cyPvmLZ/24/SFeuY2XKD/oNTqsujo
	e413GtrZ0GfrTW9Z+O2om7wb1dKShLso/h7I3C4ld8fb4OkPs8RyR+DRsXCVlj5CT9dGGfL5qbw
	s+sAd1BZVYmbCMeovucQOOHHBFCLV/tMEhmaa2FjADbiZ0IiExnRxcrMMo8tbKMVOlh+f6JxEEr
	Znw6GVOZ9KE1FDYWmbcLn6bYcZTiPUTYUwIHuBdQvXyJ4hAMiQo7aY1Ut9z1GjG5Z/usZ5hRRtV
	zz1769a0d8Oc6yRD/ZdUdtxytlODmGguEZoksuxVDv12T+TdTJFy5BqUUKQsOck/NfATICV9+EW
	mSdzD+DHo7Z8XkQNPVQI4tPFQytRbizGoQqYtWoq5wdpPKVaSNFbCcPGloYZo/A0B7FBtg/3xax
	OUGp1gA+6T4ZJ1ylHwAciuBhj91Pn/tXjS30lKYKi9yLj51WYN9LHgfkUwlt+7ncuOjgGkK/tWt
	M2LtphneukYf9sC/15s6wfGpKp8uHHNKiLB2EE1++JQ7pANX+hu9DEC7cCLp0S0KF21Zg2S1AgV
	0hZM13GTLo9+BC/J0IFI0mIsfNbAc9ptw2AhEqOja0+ZBogR2yszbo1yDYkFPW7n8YpJJovo6Lf
	/hUa
X-Received: by 2002:a17:903:2b0f:b0:2ef:d981:9576 with SMTP id d9443c01a7336-2f03f181ee6mr228527075ad.54.1795739767518;
        Thu, 26 Nov 2026 16:36:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/39] volume-key: Fetch the release tarball from Debian
Date: Thu, 26 Nov 2026 16:35:07 -0800
Message-ID: <20261127003543.2167775-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133173
Content-Type: text/plain; charset="utf-8"

releases.pagure.org is gone and volume_key has no new home. Debian's
orig tarball is byte-identical to the upstream 0.3.12 release, so fetch
that, and check upstream versions against the Debian pool.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index 01215a4b25..1964ec9ae9 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -8,10 +8,13 @@ HOMEPAGE = "https://pagure.io/volume_key"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
-"
+# releases.pagure.org is gone; Debian ships the unmodified release tarball
+SRC_URI = "${DEBIAN_MIRROR}/main/v/${BPN}/${BPN}_${PV}.orig.tar.xz"
 SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd77309b"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/v/${BPN}/"
+UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
+
 SRCNAME = "volume_key"
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 

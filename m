Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22464.1794808952402040375
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zUWoYTWa;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso4512482eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808952; x=1795413752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCbhkJnlQOgsEHyvRrQRgU1f32U35cMVDq2iXRvw0oA=;
        b=zUWoYTWamDRztNiQ0MdDwdqKvs8XJcL6c2buyfCK1Xren2m7WkYsF7gdH9Ltvipy1H
         TApkowVcC95zPsLXXVjwypnHqgPbwhazl8Cq3x8h9m6EzUeUWvaZhZFE6U0ivRnVp0GM
         dj8jwa0+bwe7lcmpaK/glV1vMpkHf3bQywDuWSaa5KnNTbWIz8PLcolBmMD5pA+wv6GJ
         LJQOYpxNsbyoW2Bjrtd+jAcjm9x0O2uizAkUVs+zz6Haa/6E/ZBvzJY6NQmXuavHumZD
         iSwUIH1mYVJ9nkxQx24HQe/XXsZkO/blZ3HGPUFpHy44Uwo01GI/xW812bcSxjMHH5VI
         YGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808952; x=1795413752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCbhkJnlQOgsEHyvRrQRgU1f32U35cMVDq2iXRvw0oA=;
        b=1S/nTG2fjM/0VQM2tuhjLFx+Pc+u3kxDFmu7JTWOsEZoyArpCr0sUiByAxxpNV3WBV
         yuEjpIVjdSBZGTTTTWSmcKdAvBIsiuddcr0LM9HaQP+1HRzmIBqzN01T1WsiJe6UAls/
         T6dQZz41PwjvEx8cqNNT2z3oX+F5ECSQZntIz6mqDTZ4oXnosjaBaWlVc6XO/bENuomj
         aDqX+TJQm3T7kvL2WrTOpJbjdNCtYShHR+a7VLwbcI9XM9VOORtPkOQT28WkOFixxdBd
         whBke5hHxDRGtUvSBdyMg9alkpJnsaVbOUoZvjeOBAc2LTGg1IuY3A2KH3kMfhjEq/cJ
         pUYg==
X-Gm-Message-State: APuU4Z/0RcUgFUZcOQCKi+1flUTd8UzqEhe5WJ+F2qyRJkhVRTjiqmmk
	cUHHK41/BMKNsX5IyXNrHzgVBV+DEA78cyhej88Jq7SDE5yt1DpYdYsHJvwCU1RK
X-Gm-Gg: AYBFou15mO1xnHCIeIzQWPNVZoZMjTEFFsEEC9F4cMMHbi2XW70/hFJuhj/l+8/t23C
	9Faq2x4WdQWaNXzukTXw7HorJn6dLivutM2vJ9Fa0KB5BFIqGufRbLDESLx9A714GKW4TknD4w5
	aWNZ1Vi/dv4x9BTxCr6zK+kOa6uCMxFkJbF1R3sP84wLNbwX+AykSEPq6R4UJz7oXuwD69OL8VD
	Vto+bZ8mMf874ICkOLefZ0mlCocV9G8d1t8OvCuWzRaU60oS1emgcK5wvRwy+OP6WVgQlwX4T1Y
	SM2m8XtHz0/TS0YawZLWJ4ULanH9XXtIklw6XB9EPRljNNFJvVBqeGlNM7rlvROzS14TryfwN1c
	JxZ1huylpUJcVPjl/q9kGzaY/CaylCOs9Nt2HDHYHLhyZ+fk23QazH0YWf4UkkMoWI6jjrLYsCl
	Q9P10aT7PGDAXXorvElNtEmg9Of8N1Rw8oSq/29ca8QzKztVBUUww53fxNqT1O6TmY4+RPjUUOU
	Lqrc+VPnW9Qd7cR8WRRwIdxgkBwsGqaJIs3xOwganz8LddP1OaBY3Y0oI47Sj3epX86bqGbOLDH
	ZecAhnp9gU610agnnhO98FlCXIiH3Aq25DJTl6VKj6M4rQU2sWiK5U6mkdGx0RzlMPvcQhZ4mdR
	uSAh69dwptrp/pFXPq5JCnvrLRs1gD7uPWjlaHJHBeOBX8OovLm3xANwTEtaalpjnNAzwokpFoq
	bcfcy4dPuJiIkMi8EM6reY2aqzskNgASvAlBb9zJNdxvrXkfr7+ZT5k5ruAX09vYNpX9/C3koVX
	xj2+OBwcfU0eH9VQDOn9T103xCOwfbqN1MhK+zTfJDau5fFtUBAwM+vHRGLvjbyuTs+zMElwkQH
	fz9s
X-Received: by 2002:a05:7300:d195:b0:36f:202c:48 with SMTP id 5a478bee46e88-3796731599dmr8641673eec.14.1794808951748;
        Sun, 15 Nov 2026 22:02:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 18/30] libnet-dns-sec-perl: upgrade 1.27 -> 1.28
Date: Sun, 15 Nov 2026 22:01:56 -0800
Message-ID: <20261116060209.2916444-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132416
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{libnet-dns-sec-perl_1.27.bb => libnet-dns-sec-perl_1.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-sec-perl_1.27.bb => libnet-dns-sec-perl_1.28.bb} (93%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.28.bb
similarity index 93%
rename from meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.28.bb
index 9c1aa2cbb9..d3565a1cd0 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.28.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b7e4176275d57d0b036bdccbc01a0e7"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-SEC-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a64482584ef3ba8f84aced78d696048b87e25ca7fb3c91a50df391157212c4bd"
+SRC_URI[sha256sum] = "7f84343598a8c73e915b4b5b05c18e53172fe83d861ec408951731a88ce0c24a"
 
 DEPENDS += "openssl"
 

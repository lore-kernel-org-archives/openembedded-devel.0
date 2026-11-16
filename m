Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34312.1794851689048556923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=u0Gh1VPc;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so3058959eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851688; x=1795456488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LgxjwrJbmdz07K/RiOq3nghQMjlyIxqVT1dc4Dtbsw=;
        b=u0Gh1VPcDPSU7dP3hLx39NKvHF1TA+/exOMpm1Byt9zuCrY62qKwjeHBpRqrPJMF/x
         GkAsoMfp48iIPrcgOCDXqOQHLtxXkf4uuH8+7ZEYDLsWF5TOqcdiG64lQMFv59W3DPM6
         3WsHQ8slZMOEIBV+MbOPzTSNVTKSfu6XFFEZqMZZ/L9wWROiGnvMoKr8+j73zmHE0wLa
         peqpxdy3S+qW1kaEB86atnunCT9qLSSSk2BUL7X5fV1l+i3xSWqQjVq68NB4q7Ql2wy/
         0HplEWr98zC6zCItui6td+mU8Vv/DgFuhdfbAUhEuXI/IxhXu8Gf7DN81JLV/PqeJkmY
         LKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851688; x=1795456488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LgxjwrJbmdz07K/RiOq3nghQMjlyIxqVT1dc4Dtbsw=;
        b=uQ30jQKihifyYz9sg3MMvRA5DLcDPk4WqCl6+ljTvPZFIBayQes/QpWUiMfMx4lByT
         D/WFsxyMwLmEbuhQdsBHclOIMwyTLssv+YqMo+ubtaB3yYhEyE/DTPumeaoT+BXkS/5l
         q4Vy3QE+qb4HsaHJUx18fDojxon3YDRnf2AWTH8KhIKlxhBIKpKL6XA4IkySK8WpqeoL
         Vyt7RkZsBdqjNmk/7AzgVMEyFDLEkPWV1IQdtzqYr302neK09oYZ3gbO9K44Ny0pUitA
         vFjQJ4NydTjRQc9bBbvcn5Vfp5yuTBRQn8nfWe4gdMNKapt4Jl1GYqMyS1TGjNrfN7W8
         34LA==
X-Gm-Message-State: APuU4Z8aR69Qq0yOjYN03UmgypR8BIG2jJmhIyuN7oJFlNsrUmLK8Wl5
	97EuPNoUeSslaEhb4Xd3vSwxmQk4uEvAqOeXMdnNT4wDNL4CFnRJnH4aY9kCXI8o
X-Gm-Gg: AYBFou3BjDh5AwxEUdRLe7scY4DayMSJjeqN7Ip8I7uS3+V63ULt1SE9OF3DTEGS0w1
	gx4yUhn1h/97bxJZrWJS4kasepUSge5xFLgMtBIai+Ha+e1/ayt5zHBhypQ1prd+u0azyGMu7i6
	qG7am5K68QhPCSETBHJfjZVLENUD9hwMI/CItVHorz9kOjmybjn94ePwo5TJmhlWhFJNK3ujgyG
	2AZ6nii6wS8gx4QEDvVatelo+PSCA4EQAwp7CnuKSJb9gr0pfYt8Bl/vj65Gz3xb10FbxK+sNwp
	OSH61UGckwoYYZEAGNpaKTSrSgTS2ZiBbe63Ybe36n1Ouqd/xGGDPW6GT78zIR4X38j6T2Fxf7W
	3Olk9BVEQjLpOBw62esEkqtjkxy7Ha/tBlSB5K0XPTMg/rxPYfHKVG2BhBeH+hkbTWgBUs7N9H9
	J+jPRxQ+rxTmqiNeepNU1YLCLEdbtepgRUuIecJb+vLNBXOJpH8oqhLqMjLaKaPz0QQ0MFPJQp4
	3nJtkx1BkNJ1+jUwphaqT1srVn+U+AbebhXJliITD0m8xispdaAhj0TZ2PIAaF4/BU64ukOrfWh
	jRHBqzPq+37p4KJMb0yYNlzMyUfExoSCVc21o++E01PBvwg6sf5RfT5X6UyoG3DyM7Svtun4KMu
	zqi2MW63msNZVqBX/xC4GzhXNGhvTS5dwC5CYBNzfVZNAERGnq5WuNVlAQKQXc3thwxd3zm0N+H
	22n0H/ukDAqDKeCZuLFqige+h9pSxpSySnogM2b5qyrUxxflZL//Ao/4ujxuI8QA52EJzAco+my
	lHT5samCjh4eENXfmmPCqS1egXa9G3g/EBCHkDH+aWhMzg+2G9mqnTabwBjipnBn78EPp/IiaVg
	hhQfbVhX613Ay1Oy5IMqpnWOeA==
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr10198075eec.0.1794851688412;
        Mon, 16 Nov 2026 09:54:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 032/105] python3-flask-cors: upgrade 6.0.2 -> 6.0.5
Date: Mon, 16 Nov 2026 09:52:44 -0800
Message-ID: <20261116175359.342679-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132488
Content-Type: text/plain; charset="utf-8"

Add setuptools-scm to DEPENDS, now required by the build.

Changes:
- Add full type annotations and a py.typed marker; the package passes
  mypy --strict. CORS()/init_app() accept a Blueprint (6.0.5).
- Resolve options into a frozen internal dataclass; invalid regular
  expressions now raise instead of being silently ignored.
- Derive the package version from the git tag via setuptools-scm.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-flask-cors_6.0.2.bb => python3-flask-cors_6.0.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-cors_6.0.2.bb => python3-flask-cors_6.0.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-cors_6.0.5.bb
index 89c844cff4..4a1dac242b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-cors_6.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-cors_6.0.5.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=134f1026f0de92fd30
 CVE_PRODUCT = "flask-cors"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423"
+
+DEPENDS += "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "30c5031552cd59f620ac0c8211dac45b345d3b2df310e7721879e4f46ef9c601"
 
 RDEPENDS:${PN} += "python3-flask"

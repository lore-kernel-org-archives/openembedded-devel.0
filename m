Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8079.1795739713427097552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yC/NFsu8;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c71feeeaso3977656eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739713; x=1796344513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tFIBXDI1SA7eDyELTyDSYmrzhmoIXxXggEEMbCKG9o=;
        b=yC/NFsu8fMvuxe/XgczZGr4khUoSosjRXhvHc+R7hROqyAviGmYT3pFmN3nvi42Qap
         Rn++YpMIoPQf4/9VCWfweh2U+hHHpUekazBhwdD7fvGmEXnrwsPnhGWbiuMPT093xPop
         g1YRpLueTmKOAjaLMHf8r38jaoq/V4miXw7ZEWXW8cag1Z/Sx0zagh2MbW6h3EfREbsT
         CmkAuDRuZvZEzEsWnU4Dxga1zluu6wisX0KQ3zP1MvKKcLmzqtRr/Fh8boq/9XAG4UuH
         nPFAR3hMzphYkrhVxx0emjtrTMdR9eH1IHRgt5NDVS+HCNepmJ2LwBD6QwBxusExswzS
         ic6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739713; x=1796344513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7tFIBXDI1SA7eDyELTyDSYmrzhmoIXxXggEEMbCKG9o=;
        b=YpmuK0GPJSWoH0keAJnqZMJucKJw1zgHHOjCCWeNDjtOumVsUuVqJ3tG817nUGEL0l
         a+0mVKvdn/jtiEHV9561Vi+inQcrVMztL82fNDgF5ncZP/SCkll++vTYdXl944Wz7yiZ
         Lq6do4og3P8jY+5xnhlOx7JnP3c6ErROtuJqDFu9txgjlZMdTiEC2HvOpHlNBhi1KBuA
         CXoYGCXim1D5k+2l6z9vsIDX6xlRphrkpnudpqSCH0J61BMKuXDUZo5oLb7B6+sL5j1h
         G6C7RuV1cycsxovWA8agfbSWh0M6dHbgIOXTLyWVgebDyD9Fn/+/o58y89OZTJuBCaZr
         u2yg==
X-Gm-Message-State: APuU4Z9PHYwKlM3hsSpAbkj2N0eD02HAb/sKfEqQN2vQgVccjsnZv3W4
	aY2PX2CKEpx997sNJGxup/Vk1bX+Cf7KJ8Ghp1hlepwjPZfhvVSK4CbEaecaBVZr
X-Gm-Gg: AZFdTZc8kEJF+XOyWxzrJ+57LIZrN/1wl673xN31qLLFkZrGeLma8D10W2wDRI5KWdd
	UFhoXrZtEdBtTBThs68RmSNijjBIfu/p91b1LuDII5URfNYuqZrXmCe4S/DT7EYbeqCJ8QoEooQ
	KC7Fu/6JplVV0Xp4xA+L4ZpOO1NYTWd4xJ1p/6+/AArXkpoNA3+gj05xXHL7Cy0G30BrQPb4Xyv
	stTEMVHG5WPwI4KS/GYndAG1i30NkTRmdx2Ax/R78HTFRF32zk3JZ8x+3X/EORFn/vWJd5vZqZZ
	bzlODj0+wrNU7kyhRFBDltDDAguIyl3wOfhx2BZl5uyWCEJdEzdX+wdGudrwP28aAfRKUykV6su
	g+5yn7oSHqMKhMb/IFcvUkcGQvNhb7BIzd1qmtA4a61e/k+YwghcbUPIp615a55OjGxnQzfCbIO
	Mge90x/4TACXTQH4U2cFlMdQ2e36D0HAzCUgxiYpnjcyx9tVZf8i4F+hFR1GxQPqizbFGYV30tp
	+97riSTZPPTcBP4RajZWhSr7K7pGTDjXn+wbJv6AdSmn1pr+IdytXdNd0lrWxRAY2GO2+TI5E1O
	oafN0cZXlZHnL5tlMwtLWpKSb81yZyBU2MJcR7uDcPjUEZnELcLCsB2HB6dY5m42fEQfeab9CKA
	RHXlV1gr+Pxleo/cEuOIcYttp6RCuoM7dyf0OFrUvOdWwLNi6+SbNJ4I4K7adDHf8NXL4t+ezBs
	ZBZqx5iKDpTuStAzaiRDpM8T6ZTMfEHPlmOuofYVWkFivxF6Rk1/ohT3UcbLF+3Bm79UPF0vwEp
	V85U675rsVKNZM4jwrwaDGT3Fid4qvhE6sBpdlpTQMqT6Bcl7KRv4LEshKuz7l7Q5zK7xRYAJl0
	5B5LxQ==
X-Received: by 2002:a05:7301:1703:b0:386:319b:fb0f with SMTP id 5a478bee46e88-386319bfc98mr21199850eec.38.1795739712760;
        Thu, 26 Nov 2026 16:35:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 41/69] python3-drgn: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:57 -0800
Message-ID: <20261127003425.2166632-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133141
Content-Type: text/plain; charset="utf-8"

The default tag regex matched digits in the vmtest-kernels-s390x tag and
reported 390. Only consider v<version> release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
index 09aef3a4bb..0790917118 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "818b5a7e8a4db82a1e0326667e7afaec5bf5fd19"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
 DEPENDS = "\

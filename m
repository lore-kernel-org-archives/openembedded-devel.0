Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 940607FC75
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 195so5216761pfw.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6S5G7Ln2QCYLW/dnXiwrMd/ljIBwmu6jMbLtZ3oyIQc=;
	b=tblaz8re8J410T//lKxq+1gPgTZ6UtpuNQCLAsoKySuneuBxgMD1/kqclM42dFqMdF
	/jSZe09TaTyTCKsqMXM1lHzpCQTGV7GRx17tkY0EYTtaKWz+6KboErojwyn6PYRxcLOw
	PIeZfxvGkuvfp9yW91Xj8nzqblhy2rpIJV88hYjG1DRhIZ7Zoi4gAaV0AwkVWTB5E8b3
	Osv8b8o0clPH3iewKmQDQXEWtcXa3WdetJB8aMUhWhRop94knhbxRxUME+oALF/JgjLN
	8tQWl+yVZCddg6GSr8KgDXGUAAn+WriU7nxk/LXMyEZO0yYEzN2xkoheyZsQB5vMCem3
	IKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6S5G7Ln2QCYLW/dnXiwrMd/ljIBwmu6jMbLtZ3oyIQc=;
	b=fP2EQa9VgPms2UcUrBpGsNMqlvPXb31Nb7KUMFRCh2ANG3xaTzcLgoQvSafT2OX//9
	7cceEzvLvu6YSATmRxUhfUTDdQ2i4QmLvB7cp+o3t2Vy6DTB44dAZPGIzKO2no4lDNp2
	H2JlJCWI62jCJPbTHxAiwfeOjUbNWwZ/ZKlZ7DLZYDUEQroLr6NeSJZAPN5Wa5nOKRPD
	kH4h8MyH187c83AFRJg50sKYh5VFPywjppxYfq7O2iS/BW0CCxHF8M/x/o2z+YBJdhWL
	T6VEyLSCGGVaVopKKKCh1OZIIcd3L6md+EmHWyQwliC8aruhM4wcGmrg1BaiEZbCF7x4
	SO5A==
X-Gm-Message-State: APjAAAWI3ACkHNKonMmW96Q2d9Uxz3XCm2R8u+Xl92+LYauGV2MjyQzA
	lcBEDwTupFZIrKQcspud9Bgx+Q6wnGg=
X-Google-Smtp-Source: APXvYqzskVM016KIpiF7ixwUbLOyo+vjqg4OIiP8kX2BiAg3ihkVYJbvubQuMI4m6PXRQ2D97E6m9A==
X-Received: by 2002:a63:e513:: with SMTP id r19mr18072384pgh.326.1576886821210;
	Fri, 20 Dec 2019 16:07:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:30 -0800
Message-Id: <20191221000635.1573390-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 18/23] civetweb: Upgrade to latest tip
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Dec 2019 00:07:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index c8fe24c637..71368c1a15 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/civetweb/civetweb"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f28fdcba0dda735eed62bac6a397562"
 
-SRCREV = "ce8f6d38a60eb16c996afee1e5340f76ef4d0923"
+SRCREV = "6423faea4800f6cd4055750a7af2da85cdbe4e96"
 PV = "1.11+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
-- 
2.24.1



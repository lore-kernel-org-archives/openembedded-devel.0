Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5748D74F9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:33 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a22so11987693pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vDDvSJYLLzgj+hTZmAjBxFawSsnO0mJ3T/a2NeabWl8=;
	b=AhzBcxRjYuTy5T0R1ArVDheaIy4zj7atN8H98buWzKvx4w/xKZyxpl17qW4poX/yfT
	jeqx2GtfJqBoHptSNSN4+qQS+cBatbfQhnMrtQqGl8Khrp0qiCW42+17b9ATsRyaaDJ7
	nZgToiapmPWJUhUVlTtRf3pBnNykEiwDSQ2Vii3x5SrR0zJ4Omt+KKfFirCzxiNr9TlE
	jheqmZWUO+NK7PD7csPu4SiUJV5ecTK1zEdM9fv4X+1y6/jiB6lYiFvitTvzoMl6hsws
	Uudc+IJIfpPE5cp68TlXKfxTVuNU/zS6lDrR4UjcRvmIu4CPBX/iC/hTv5DFm+71529M
	UxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vDDvSJYLLzgj+hTZmAjBxFawSsnO0mJ3T/a2NeabWl8=;
	b=rDDKazZE/vygDe+rgPs+QjYZusi7FdgggY0YM97U+b/Ud9bY90tDNZ8h/t6HNXpZYE
	NOf1K6UUAZLqgDMRnJjBptvR0P7PRUv6oE+wcHjaZ+VCV69zV3l574c+3Pxv/DbkIR2u
	0gmMrcadKtyoN9eKUUq9hXdQUGRVQC/nwcSePg2RD5GjpFL90hCCb1sQ4t+sJ44V+ibF
	mZOdWlXOTISzyCtnx3GVty/IB/0tPYfRKZA3XROP34pwnCsXqs5NHk4dGLGBXIXNfJlk
	dclrU60UFLmKEtolL/VduagdoBWb98xmmOiOyiAxO4ZrRtoBgGAHJffMeSNM7AAP4f61
	84hQ==
X-Gm-Message-State: ALQs6tDO5SZz1yQGHW0LDVvx8SiQU0XyVwEh1KdN16RB9roK3AvOU8pi
	3BjaLW9SZCI5xJwILGQrtBG82g==
X-Google-Smtp-Source: AB8JxZroo+B9fG4DlFESXVgtfsQxdbyJm2tHhWl6Qq7J4Bp8UjDQbFVvsX2U3CyhLUXVilZkaKIHhw==
X-Received: by 10.98.237.18 with SMTP id u18mr38542672pfh.127.1525892432820;
	Wed, 09 May 2018 12:00:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:07 -0700
Message-Id: <20180509190011.30006-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 12/16] xfce4-vala: Build with 0.40.x vala APIs
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
X-List-Received-Date: Wed, 09 May 2018 19:00:33 -0000

OE-Core has updated to 0.40.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 28f9cde97b..388659f20b 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.38"
+EXTRA_OECONF = "-with-vala-api=0.40"
 
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
-- 
2.17.0



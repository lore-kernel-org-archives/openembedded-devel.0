Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 49BE771DEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:24 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g23so138918pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U3Sx27vwq7TEiuEeIw4wPjG2RJ6sTUSZSphtAyxrsCk=;
	b=gTPGWfqbad7Sc/17n80g8R5K/I/VibivIrR8AKTIL2da+7ZVD9wpwEqBJ7g9odd2V7
	N+G+O7I+rt0dxgRnM7xjoXJLkWv6x3g5Vko14LQiWvD3W3v2ub/i0z9rS9yQBIdUe3wv
	aG/zhs4/r2z7VHP+5M0sp8DTTiYgkx+jOJz8zFE5m0Mjo+e0+pzDZRrzWdcrCdFFykRF
	+zr5GKuTNPajSdb0Lwse6VcBNc2jbiPbXnBDODeyLe0o3HInfN6+NeRQLLcie/OMbGbT
	8FO3kaqD0VEaTQGY6hL/xlFp4vxM9qDrcKL9KFTB48qEl79gg/kR89tPvTCgyDkWp6Ru
	W2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U3Sx27vwq7TEiuEeIw4wPjG2RJ6sTUSZSphtAyxrsCk=;
	b=ZNtYP6v1t7xD75d8aCT7YR22heo07506qNTVQpyRelrGp8K+OPXI3or29nUebEKZ++
	wj999QRWBU1GPJfD9AcipNgR8VI5pawyN8/pLHhfstIvDK1NLEPqVwF7voCIXGfxVr+k
	4bVkvoLC5yf+Dk+KpXJ7oySAcnrg+W695ZbwS2I6Sy1Dv/CLHNl1ZM50BFQpe+3fVeNX
	UXQO/h0LIVnf/jttwu4RTYr2AdkPILqiSINMansTa5tRbkX0iJWCPi+p+R4B//buKKX8
	MdxvN9BZeySpLTsPZYJ4xbQOkKltGhy8tHICTHoGUAyVoV1IlePGArz8IJ7Fel2gZKFL
	DdQg==
X-Gm-Message-State: AN3rC/6RIHdzJj5gMtjnCXsA4RYU18MFwj57BNFQyTmm2ZVM6eEiS9i4
	xnnfAukdt4ORDErK
X-Received: by 10.84.218.14 with SMTP id q14mr24666822pli.80.1492539746131;
	Tue, 18 Apr 2017 11:22:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:32 -0700
Message-Id: <20170418182142.27253-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 22/32] zeromq: Upgrade to 4.1.6
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/zeromq/{zeromq_4.1.5.bb => zeromq_4.1.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.5.bb => zeromq_4.1.6.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
index 8da86746b..e126f3239 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
@@ -9,8 +9,8 @@ PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "e7adf4b7dbae09b28cfd10d26cd67fac"
-SRC_URI[sha256sum] = "04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf"
+SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
+SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.12.2



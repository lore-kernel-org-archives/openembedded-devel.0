Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id B66EF6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:15:39 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id c11so6746310lbj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qDm2vbP+d8AYn6vYngbscZrlIH1YrEEYPLLze+Lid9A=;
	b=R/g4PPxEpDp9GTHFfsMoXS4UTtkwxNdUT3/wG8RYBIcNSwueIUVuCMBawwidgqHz4i
	mNTRcmtshaV5fyHtlFOd9ezWLo/+O+D82lRyaiWCpErOmPYw5Y0jm8/tJPxoH8FmRT/e
	cJOXOtfNNaqTm/M1uZH1FUe6iFd5y7UueGa6OrgIzYwvof7p/gAEpEMIGsI2hUyN/erf
	jA2Jh7ysdXiz5YsmNy5ni8XnG+56kaiXFDe5PitHdBK934waqGrq8ccVtXVxtPQEfdfM
	TVrr1eygqaG+3a9yDfjB+m4jmSRkATg6dLTdGaeuCTW71k97rxbDE/ycMGa2Z30A33ly
	Ot/w==
X-Gm-Message-State: ALoCoQmvXPMeoiaYAMQm/BEUWT1Bl5WpaprA7We+wzfshBJSt1lkkS0C3D/VhcGVC7HwKfJRYVkg
X-Received: by 10.112.135.104 with SMTP id pr8mr2033713lbb.34.1381835740916;
	Tue, 15 Oct 2013 04:15:40 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id b1sm64273318lah.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:15:40 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:15:33 +0300
Message-Id: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 11:15:41 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 4fd258f..f18d37d 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE ="BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
-                    file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
+                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
+                    file://djpeg.c;endline=13;md5=03db065044529233c296324be85530ab \
 "
-PV = "8d+1.2.1"
-PR = "r2"
-SRCREV = "837"
+PV = "8d+1.3.0"
+SRCREV = "988"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
-- 
1.8.1.2



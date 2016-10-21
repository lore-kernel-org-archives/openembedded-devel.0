Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF5A60268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:14:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z190so6942415qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=smmu04amaUuaTxXiLPLk6Zg9EvUyfxzhT70kkeWWY14=;
	b=mbR1/6eryZEIHvzVTUlp2G2Umr9xP1x0mRCGWQz+bzX/3cJHOuYWIxixaNQttBIjhE
	mL/PdlZRtOOoZSz7Cj/WXvqaS7plPTGPSLm+BegpGFO88VYS+sdGAH3NBi6cOSu9t31O
	sYENyAGXFuKyZ2fRG+PsuG6ti38Vc4jJsrRIiNUuEf0NIg/tXSMU3zqpQ611A5FFxXaD
	r+tgGIFEkypw/o72YvVNVs44p7q75YRy/XfBZU4BEgKJu2f72PmITW7UD/7lC6l5i2md
	Rn+TwQP1pvtnAwje363TJV/J7D2xwyk4hKkOzryfrrLknNzhLnSq96+ygYWAc73bovvh
	V/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=smmu04amaUuaTxXiLPLk6Zg9EvUyfxzhT70kkeWWY14=;
	b=XbxMb64SiTBQvIiO9mGIoAWDKPUF9FjrFJ+HZMvTbzK+Efk8mtbn0rzEJOQb9Lq0ki
	FVHo4Z2oclxgTi1sVJlIcu8aeOg7fptYtNOZplZ2d/XRWpfeRCeprPwxrWRSUCmw01A+
	4uu9rI7w5Dxo+CQjS/UBJypT2haU2UpN6Ja424LF4ExHcVw8Gfov8qxqAS3c2MyJ5ymr
	aLKpz2Guq9k5jewaTuS+UMSbmaP97jLgCC/bOBCrVT0lh/tRomD62mmkeF0cQ9MtABfY
	d1USJQSTWYgJy1EFqhW/uZK08AyaupmB7Iuy40lRKUXnn6buUrTrhG6Tnm+lY5P7EzBI
	0Nkg==
X-Gm-Message-State: ABUngveo3nlxZQOzNtnZvsDNC+O6GIujG+XgBQoLPx7WlRGIUqHwO6dl0JWdeT3DzeSqPw==
X-Received: by 10.55.145.197 with SMTP id t188mr716950qkd.59.1477052061885;
	Fri, 21 Oct 2016 05:14:21 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165])
	by smtp.gmail.com with ESMTPSA id 21sm1190868qtx.12.2016.10.21.05.14.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 05:14:20 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2016 08:14:16 -0400
Message-Id: <1477052056-14472-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] fftw: Allow an empty package for fftw.
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
X-List-Received-Date: Fri, 21 Oct 2016 12:14:22 -0000

The fftw-dev package RDEPENDS on the fftw package. Let the recipe create an
empty one to satisfy this requirement.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index 0faaea1..0bb6cc2 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -69,4 +69,6 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
 FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
 FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
+ALLOW_EMPTY_${PN}= "1"
+
 BBCLASSEXTEND = "native"
-- 
2.5.5



Return-Path: <patrickvacek@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 074AF795AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:45:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f21-v6so5510208wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8i7/0HwfrS8qp3UDMR0tAePGqXZeBBFE7kMHxqJeK+8=;
	b=s9ozhjsHZLN8FXPY2gGI9FTw4jSW/QRU2wub1VC6RaayCPbz7K8NJ5Jja/7eOQHkKP
	bZKx4BLNxsD3l+wOIA9g3uaKXTl402VLkmfKwKjcL+dkxWs5SZEX+APiyF4IGIjLpmqB
	nzWQSxSguhKYTob/sbFTR8RU0f9O6cxVz93np68dvGnOUc4YpjerOqp8/pt6zmBfFNnz
	50t9F/CqqvfM49lw8NkRmemJLlLl7+W6Dzi2MO6Si1VzBiJX/UH9Kd8IR8YHWAZSKvky
	nk8Tz4+vjyagiw39GcxUdPoTUF2IoiynKiRXYKlw4aHJKmvOuKm545CpwulNWatorer1
	LGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8i7/0HwfrS8qp3UDMR0tAePGqXZeBBFE7kMHxqJeK+8=;
	b=ArNl/Nl31j69jmYTmlqGMc/ZzLeqP+jBw0ZgxSxid0BFdXJdMSCcAJ8Eb/IZ4UEqMV
	grNPignQlZQG5KbkzrTLVkAFwC4ibm7HpJKlq/zZKkoTC98KsMZ2dRH4qU3fwjQws0wE
	M5FDuun/TT0J6bPDndrbdvFIWWzFmpNSxQQjcyf9L3Obcg9Ee/bnKSx76XSV5CU+TfdR
	iUNYAB0XbiPBWL7FznWhNYHYecqHhvapfQKcFceaqDuErrBAdioNHruho0E6RiBdNVu2
	kQ9FtukbbPRQs01KpXQj7VJ3lTeYC5t8vdYr25EggvElUafYz4B4UONYOt8ijorCJKcT
	ROCA==
X-Gm-Message-State: APzg51CY+b1ORcBvQi4cxPfAdfpfalA1M4k6MTJv76uFD6jdXQsdAyWw
	foc+9FGnf88JGVus/ZeIbWhxVe3+rHEE62MOtGKcxK5r
X-Google-Smtp-Source: ANB0VdZzaBPoG/MwrNnZ5wOUJAWoC1WRCsLVgpe5brIilYptRAlzEOhAzCKp8GFpUjaNlTmIsw0C8l7DYkc0N+YrLks=
X-Received: by 2002:a1c:85cb:: with SMTP id
	h194-v6mr18302338wmd.54.1537350322291; 
	Wed, 19 Sep 2018 02:45:22 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Vacek <patrickvacek@gmail.com>
Date: Wed, 19 Sep 2018 11:45:10 +0200
Message-ID: <CAG+wK9k0p_-pEeCcxYpc3RhUvhHkJs5-1vSn1v4TQXq=aLEh2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH] openct: Remove apparently unnecessary pkg_postinst.
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
X-List-Received-Date: Wed, 19 Sep 2018 09:45:22 -0000
Content-Type: text/plain; charset="UTF-8"

This prevents an error about "Postinstall scriptlets".
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb
b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 913290cd9..67b7c2975 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -88,7 +88,3 @@ do_install () {
     touch ${D}${localstatedir}/run/openct/status
     chmod 644 ${D}${localstatedir}/run/openct/status
 }
-
-pkg_postinst_${PN} () {
-    ln -sf ctapi/libopenctapi.so ${libdir}/libopenctapi.so
-}
--
2.17.1


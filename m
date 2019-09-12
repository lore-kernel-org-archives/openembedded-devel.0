Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id BD9427C603
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 19:52:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id c12so20333049lfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Rakxds3yWGknH6nHDfTXbZ+yBGP16JFrRODz0MBdTjY=;
	b=mNRN/D/9I7/jC+UPuVJgPGqZq2cmAI9QpLGj6tv2O+0viMT1oMAYmIdu5s196dzlJ/
	IjSeO2KYXlSJ3FGeIS59Qz7aykJn9Nb1USFNiU01Pgrd07OUGAhiLM6xYZW0xaq2YE6Q
	wzm3uuCyaWQM2C0zLuSlo71k7yrfvHcV8YcXBYPfxx7MNME93CflBx1TqEWnIz/aM49p
	IDKr4+U0AhpL4mLunn0NoFFq8nnzVVO8quuG6w8+rRQIWHHQl9CMp8RJHnEHCMJ8PTJC
	+c1P0msFU96eOGcwMcQ2UnckTDjlODnZNKpJgOA/r6XSt8z8tStDy9AbiwGB2qE1NqfM
	qF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rakxds3yWGknH6nHDfTXbZ+yBGP16JFrRODz0MBdTjY=;
	b=mgyOZ5B43mRno+66cNLUEMX3Lvc3IylxST5+5V5Y7ddSB3GMA3PsheSeCg+Hf0O62D
	W8MFdCLdut2gET4ZfCF6/q/WY1QAaoiObSJ3MRWWMag+2/LmE8OMGc6lfpmiOO6qnZvG
	jK3uYur1tQ9zdnf6n98ntNzeic+luIrOyADfD7TWbq6dg7gFClU4BySIf288+YipL3Ty
	x4C2ojtZdGiE7ktzehRMT5xJ0P/BuxyJnxCziLEFEQi0VmrVuiKi6LJF6ZCq1fFU/dCx
	gD0BtbOliXduwwpVWpQ+udgXq3bGPLts+i1pvWgv+6Ah8KF5km2PzZEYN5Nv/60WXmUn
	AGFQ==
X-Gm-Message-State: APjAAAUGf2Jslub0XuY9/oxb8BqIy+nyfnJ5/26xNoQ8sNWxkWNh1Ijv
	FVVXIqOU96hd/7JWHqi5Z8hrRguyqnU=
X-Google-Smtp-Source: APXvYqyRcYLuGFZdPpl+Exp2uY9TSNbVZgDJpoxJKCKdhTq1cpTl6YaEOy12vumvN9Ie54sVSgFeug==
X-Received: by 2002:a19:7413:: with SMTP id v19mr28485528lfe.176.1568317962900;
	Thu, 12 Sep 2019 12:52:42 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id r1sm870031ljj.52.2019.09.12.12.52.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 12:52:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 21:52:36 +0200
Message-Id: <20190912195236.27939-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] analyze-suspend: update to 5.5
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
X-List-Received-Date: Thu, 12 Sep 2019 19:52:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{analyze-suspend_5.3.bb => analyze-suspend_5.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/analyze-suspend/{analyze-suspend_5.3.bb => analyze-suspend_5.5.bb} (94%)

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
similarity index 94%
rename from meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb
rename to meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
index 451671dda..bb0aad341 100644
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 RDEPENDS_${PN} += "python-core python-datetime python-stringold"
 
 SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
-SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
+SRCREV = "cf59527dc24fdd2f314ae4dcaeb3d68a117988f6"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



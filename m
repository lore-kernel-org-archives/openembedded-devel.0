Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C6BB560043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:40:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u108so6601432wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IaHUJO33qAIL3rGsreh5xBBKPxX3r8+EZZJkrzoUUOs=;
	b=Oyn7zjwB37QyYJbM1eGZ1DZnFY/1rezr4S5PeQ/JRJakgf0Jte/6lTii4GZEuXl8kI
	tKleLq3s+kwDPYDIpxeAPZiE1jfWoFypE1cozozOdftvuoITfI4m79L27HPR7P0NVtAF
	Wmi9sRh3YXFv/b9GfQUb43KuI+lwgzJE7fsGRZ8ysB/VOZICmuZt2omQsF8cKW5HnlOh
	bP8GIiz0PNEnc95ue0ZYpYkigtZzMVmSA2z+lwb7KispmJc74/ERVkBq7KL41E9fKVVL
	hi0ESMKOBvdGcsDSpld6/DsaiXXhyPUPeCXwT/0rdGTYBL3HIzmeuNHeS17YoNoGZaqE
	Qdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IaHUJO33qAIL3rGsreh5xBBKPxX3r8+EZZJkrzoUUOs=;
	b=Uagy3nYi0aLToCn3EukpvWJi9T9xus+N2yZQaO2lf74PLlAz+CjpVTSDXeA8UkwtZx
	gcod7FzPdGwSJBQ/sx7tHmMA52bKvFWps4cr8c8R5urvSoDN/7fv9Vn8pZidtnckIR+t
	NDluhV/lBB1csbkYlmfR2rQFmuFYUCeeZMWkhRQ8K9rMxE9EMNWur3a1tPGM75ZYhF6t
	yE4nRgijucuHyjzqVZRYUxTMoJP4b1iXEXWAnG/jV3GMNQKDWzKCOgbwyvpzfcCgpGGB
	jU0zA/mvd9m3povgYFpsfR1xiEf6wBwDK0GSmE45SdBpYJspJ5bRsy69myDNeJcKbQc3
	cn2Q==
X-Gm-Message-State: AFeK/H32lZvLpK0R9ZL6HDNI5WTGLBZ5apK+j47EQUyv/zQsqbd0cFq+JcBLTjKoRZh+xA==
X-Received: by 10.223.135.47 with SMTP id a44mr9758056wra.197.1489682458107;
	Thu, 16 Mar 2017 09:40:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w207sm4934336wmw.1.2017.03.16.09.40.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 09:40:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Mar 2017 17:40:54 +0100
Message-Id: <20170316164056.15895-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH][meta-oe 1/3] scsirastools: add dependency on groff-native
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
X-List-Received-Date: Thu, 16 Mar 2017 16:40:58 -0000

* calls nroff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
index c64bd9269..d0c36e472 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -8,6 +8,8 @@ HOMEPAGE = "http://scsirastools.sourceforge.net/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=687ea108478d26152ae46eb29d9d1545"
 
+DEPENDS += "groff-native"
+
 SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.tar.gz"
 SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
 SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
-- 
2.12.0



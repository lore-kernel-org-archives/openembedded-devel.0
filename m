Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 52B5060191
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 14:01:33 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c4so3393414qkm.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Feb 2018 06:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=uOz2zmnW+XUQrIGiMS1+ewYwJqT0j8ZuthjPO7ULOAw=;
	b=K7kxUGkdh1XCDB653kA7A88TUspSnx/efEgbj30qMFBSbbO3FOXPMpp5nM8pY6+fiO
	Ha+XQ56Cx6j/WT7ndQz1rkKYAjphqe5QWEhxHFe5e3er7ZKAhNCZhghwYx6V79B4JIo9
	YbiivbLLttgsPwuc/kJbpOtt0ArxzKfuei40pHAswSYlarKsaK8sqgGKwELw1JpB0dD1
	X+okWxDdNN2QnhWrJQz+HC8tRYNUdADU/Rw9xgWD29fkjiQFFtHC3Q/ai2Rrwe4u7f/c
	Aj7a1bqhgDV3MZFp6e+MKSmVxWcYQOI46zUnNucOMSNko/+yIG+qg+47q5++RfUjwWxl
	osgA==
X-Gm-Message-State: APf1xPA/+YVyq37bROmj4L1SNQs8kupJ7+/HxQy9HdplhPi837VHe5us
	rH/6L7zqqZN96Toa2AwU50gkjg==
X-Google-Smtp-Source: AH8x226GsL9JPFk2cJXB1X0OSU/Vz1vOIfUdxGibgyT4/f3kHyCJ6u2VT3P1NLOIIIlyvClKlXGxOA==
X-Received: by 10.55.39.88 with SMTP id n85mr1070075qkn.33.1518098494826;
	Thu, 08 Feb 2018 06:01:34 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id x1sm2745qkd.77.2018.02.08.06.01.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Feb 2018 06:01:33 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 08 Feb 2018 12:01:27 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  8 Feb 2018 12:01:25 -0200
Message-Id: <20180208140126.20887-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 1/2] python3-jsonschema: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Thu, 08 Feb 2018 14:01:34 -0000

The misc package has been removed when the python3 was reworked.

Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
index 5aaee682b..926990747 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
@@ -1,6 +1,2 @@
 inherit pypi setuptools3
 require python-jsonschema.inc
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
-- 
2.16.1



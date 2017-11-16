Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE497876B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 17:03:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r39so28112576qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=btHdxgMf/g6gmjSlSqyxCc4BkGe/TT4yHmjTLdcwrDk=;
	b=MImgV45DwxIpbzMwCK3u7trG7e39Ivqc8F/YUpIB4ghrO8mp7ftYbuA/ch5vzCcVrz
	OmeExWdyCA1wDLSR41Xp0HEv+n0lRfUr9L57c/UnckRb7wjC3Qqd811iz+ciBNbdDZkr
	vQC+nmHMW7pjoTfIB6d4TxktCM/pXj0bSZUsYll14OhDDFN7E1F/uuZXiq8Ud8DETEjG
	p/OUR+PZdtg2IO7h+KJNmsuFe17uxo2Kbc2bY5ePjkC5OKmLSnbHxXl2tYQMEZnwJWFQ
	MMbO9DNgbHuZhyNXQZ6/r8D+Arg43OJh/Qca4CtYtb6RwU/cCvUWrLVTT9bzM1tbTlxX
	s3TQ==
X-Gm-Message-State: AJaThX7oFSiXHL4zM9zkW52ISiakqkG5S80Fh0lkZaR+FsrlOVvlGEQF
	bxhCwDzkvN9Fs1F1HPF9ZZ3Zjw==
X-Google-Smtp-Source: AGs4zMYILrAqRH4NH/W7soY1GIEtdER+rYWrlaHdRBfXJeWyM0cjpwgV4TV2gfzvp/y4Xo2XJPIOrA==
X-Received: by 10.55.27.70 with SMTP id b67mr3559233qkb.356.1510851827720;
	Thu, 16 Nov 2017 09:03:47 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id m1sm1107254qkl.93.2017.11.16.09.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Nov 2017 09:03:46 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 16 Nov 2017 15:03:38 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Nov 2017 15:03:37 -0200
Message-Id: <20171116170337.23228-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH] python-asn1crypto: Add native and nativesdk variants
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
X-List-Received-Date: Thu, 16 Nov 2017 17:03:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 3bdb4b235..7accbba18 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
 SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
 
 inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.15.0



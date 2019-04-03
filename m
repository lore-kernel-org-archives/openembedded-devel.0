Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65C797D3B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 18:27:26 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d13so145880qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=kAWtWHgcM8IfuWF91TwI7kduY+6Lvz6gtsklKO/0Hzg=;
	b=mXJ2nrXHI30EfbzCIP7pnW3F4BTPltkciixxEfq6YrcQ8Jgc+kPlC6Uhx3ZYCIc3Bl
	gpyTk9FRTVy88+ayqGFEwN7ddPWsWRKT1LbSNHuprhaQEmz24hpvpM/m3po15wxlF8fp
	EQSKjKCRHJvGjFOkHiUPZq9zkUHE1PnGZboRSOS/m7i8vMgGiBR3DlG03r3cfPU9pDhD
	2CznLOk5Po+lm9wR/dGTSLwLlALrbu/OSMKgGpC9d5sUxqQ1nKINR6Wzc1qyFrJ/A7CV
	yZGIHzORphZfhLhuhNnAp8Fk5rjQyHk6dhr6QT8Ln+4FoopgfjSfYaNPXHhFK9VrJae3
	kUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=kAWtWHgcM8IfuWF91TwI7kduY+6Lvz6gtsklKO/0Hzg=;
	b=OhyWz+9XnTH4qKMXMMwyL8P5I7RequZ9bts6byj9dpZdaEK8fUMEbuOFHEGm+OdNpw
	Mui0Sz6ZZYFYJUja1M1ZEDpoJavOdYk4EJzSuLtOF8goRv84Owj3CoimBNfgI78ct8Of
	Xp5HrwTbeHXKi7L8dbhAAOJ4aaG1dHrNQvtYPaUCwocasxZW2lWS8ltW7YKNHXwmGv/a
	KqzFq5LFV6dRda4hUAlOWgZA97Q4tOJFi8jZKEpNAf/X5oEDv52ufxzWpfOBUZaR5xcn
	SSpuRozCw5H8zwF9uH4sDzxjAsNgbyCyoaoX2PtyyXosEZLVsAYFOLJrskEnLGDw7/Be
	prrw==
X-Gm-Message-State: APjAAAV8QZD43Aj4Od3+u8mCdIMoPU4dm+T1aIEB/NX99MhumWb9IgBn
	OKdpeCEbeOt7kiYKqnRsPqy4yJGwfaFI2g==
X-Google-Smtp-Source: APXvYqzVyxFMqHoiqHtQYwAH3aShIoYpskdWH4elynulLoEzKCejLPPp3CplCm56YWeFy770a0zgnQ==
X-Received: by 2002:aed:22bc:: with SMTP id p57mr1388942qtc.180.1554316047157; 
	Wed, 03 Apr 2019 11:27:27 -0700 (PDT)
Received: from pikachu.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id 11sm11836291qtu.5.2019.04.03.11.27.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 11:27:26 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 15:27:13 -0300
Message-Id: <20190403182713.21560-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python*-requests: Update 2.20.1 -> 2.21.0
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
X-List-Received-Date: Wed, 03 Apr 2019 18:27:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-requests.inc       | 4 ++--
 .../{python-requests_2.20.1.bb => python-requests_2.21.0.bb}  | 0
 ...{python3-requests_2.20.1.bb => python3-requests_2.21.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.20.1.bb => python-requests_2.21.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.20.1.bb => python3-requests_2.21.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 0401ee448..e6337cb32 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a8d5a1d1c2d53025e2282c511033f6f7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
 
-SRC_URI[md5sum] = "2918817ea4688f4ea21cb4b11e353448"
-SRC_URI[sha256sum] = "ea881206e59f41dbd0bd445437d792e43906703fff75ca8ff43ccdb11f33f263"
+SRC_URI[md5sum] = "1bcd0e0977c3f8db1848ba0e2b7ab904"
+SRC_URI[sha256sum] = "502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-requests_2.20.1.bb b/meta-python/recipes-devtools/python/python-requests_2.21.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.20.1.bb
rename to meta-python/recipes-devtools/python/python-requests_2.21.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.20.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.21.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.20.1.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.21.0.bb
-- 
2.20.1



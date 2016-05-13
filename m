Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 883786E681
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 03:24:56 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 145so8199396pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 20:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Qsxvr/kmKeRVjtOPy4thSggISylc1UVcxylvB4KStHw=;
	b=rpN2WWIyu2CdLJIlktclGX6l2AE91wxlRYY7XE4829kdzEhdET/DLIT71yI4XykO9C
	3m6rEBAg+OAH8lsz09JZkxDkRVvMf99MsgPNfq0n11OgDKGsGkNlKThwCA84H0/numsv
	Au0yG69ijITdJMwIvjIy982mRRBRgDERf7RkkNUzJ5/M6Fk/HhHSniK/R3U9ppLFDsA1
	1ZAs0KKu1M7AMKr2c/FMV7b1E5bQTPq72DLghViN+Sdp7mE0SSe7roPDQJvsxpTe2jN2
	otfBwwCuy1OXn1sfFxn0KfjguYFOJKRxqAhHfgwB3tRONtvZj6Lee131N6MeAeVKHce8
	ExuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Qsxvr/kmKeRVjtOPy4thSggISylc1UVcxylvB4KStHw=;
	b=cR56hudHlGXN8Q48o+Z72PqYnS2604cvYiqm5HfMhCbdkLiPcC6eAaf2D2gCBisaUS
	1VRaMiSMofs+VPgaazEg0W0yYQi4oPCPqff5Sa6+roFkhTlgpSdjB5GCVIToDS4sjylW
	DZpLH8FtMCvlh8SrdigUvj7WgNbk9HDnJhbZ0wuJ/fFrrGT6QVNGEf7tBjdPzO7BMnVw
	d4UW1bbgh/YN3HxYfWmtk87LU0CY+gecjPKuMHLN9R9eajD4ofdN2scQqL+Jh3KX38SD
	pEpSOp+as6PMB4IcAHL2CvcmHxa9bqDQlTfkOlmWna27wuiiAyCFlsSm0DxxJIhu8U1Y
	fmPQ==
X-Gm-Message-State: AOPr4FXIpq8zWR3tawnuM6FBJNK91uAhi2xFZfGvtoJSdvkBJSi7Y6JL7Z0UgiZzG207JA==
X-Received: by 10.98.67.143 with SMTP id l15mr19084290pfi.114.1463109896973;
	Thu, 12 May 2016 20:24:56 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	m184sm23065730pfb.22.2016.05.12.20.24.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 May 2016 20:24:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2016 20:24:53 -0700
Message-Id: <1463109893-19155-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][PATCH] pytest: fix runtime issues.
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
X-List-Received-Date: Fri, 13 May 2016 03:24:58 -0000

py.test requires debug, argparse and setuptool modules to run on a target

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-pytest_2.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
index ca53dc4..e21c4f4 100644
--- a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 SRC_URI[md5sum] = "05165740ea50928e4e971378630163ec"
 SRC_URI[sha256sum] = "0d48d27a127644fbe7c8158157e08b35f8255045d4476df694b91eb3a8147e65"
 
-RDEPENDS_${PN} = "python-py"
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
 
 inherit pypi setuptools
-- 
2.3.5



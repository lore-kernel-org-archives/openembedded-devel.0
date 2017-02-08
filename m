Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 08EB071C9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:19:39 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 11so19235670qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 11:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=haK+imj605wr4F/njxcormCTNZkNPonZgD7A2lXKAwY=;
	b=V99wgXyoPWUiq4w9S8liLLfOnImTwjVbwCKHsZinerffoTVqXwDu+giK6hPjK3S4p5
	TubxgaEDsV/syceZdPbbktNu9yM0GKvKdA27pMYJdI4mMM3qQ6palsZCE0SmEiRzX5/e
	bVzuLNQI65oXxXCrxrW5souawqV7tCZGB3k01Ik7wZBTbYGTvN9HImCxBdnie3sZixbP
	HB+lfC7+JlPv+EOU6IihRHoRbSuZn2f+Q5Nlnhz7q5rRJ1lammhvpuG/vrmZvDpMh8l3
	/YVsrJU98Of2Azw+RAMUVru44cWHG6vLBiTAnTETRwO31UPB34N7TBj7CerAZDSpdJ4M
	Qxsg==
X-Gm-Message-State: AMke39mm2xV4Ab5hbPdw1MMsc1s6pK3ZzYAQz6/FkBB5BthgeyDwm5afBR2kYm2LsXof3w==
X-Received: by 10.55.26.218 with SMTP id l87mr23541315qkh.59.1486581579941;
	Wed, 08 Feb 2017 11:19:39 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	k18sm6933092qtc.12.2017.02.08.11.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 11:19:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 14:19:31 -0500
Message-Id: <1486581571-12653-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: change the dependency to be a RDEPENDS and fix build issues
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
X-List-Received-Date: Wed, 08 Feb 2017 19:19:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
index fd35197..7fddf7a 100644
--- a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd66
 
 inherit pypi setuptools
 
-DEPENDS_class-target += " \
+RDEPENDS_${PN}_class-target += " \
         python-pip \
         "
 
-- 
2.7.4



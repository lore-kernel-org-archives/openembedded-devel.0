Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B70C6BB2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:14:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id p4so7535830wrt.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mz5ot8m++U27Py4fwAh7jCblKdJ1P3BSGsGCpgn/2jw=;
	b=seciAHM6A+S9SF+RhsODJv6DXQX+Tjphke9AzDSYpcxda0cCcS4OGsOst79kMZfb56
	cpH4wDkkV0PCYu0bmuao7Tl8b1hAfv3uHhtk5w/jnqBFm+iA4AlboHQCaQVQaDX3HZGV
	XUSi72aiB15Y/gkVdvfzqFu2f2nthbgY1+4zG0JMHamvcVdlcm0lFpu0ITleGDDeOJGT
	tQDy3T1xUZywIVesUcYQ5iye9Locz3I5Emwxm0BK4guuFfTUL41fh2gyP90aWjFbx9zZ
	YCr9uyuLkw67VzOCLPRM66BpN+zSg9WaRkR3J44Ajr8tZEzs0wBPMokxzK0K9Kp1vWON
	teDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mz5ot8m++U27Py4fwAh7jCblKdJ1P3BSGsGCpgn/2jw=;
	b=fuwwaKJRGaPcddL4XX1urwhpsi5G2J+LI6REcNzNc5Bqu1U0Ah2hYrSHgUQWFiNwGQ
	biO/aT+jwIZgjpSc9gIgSZqhHXibdMaZb8YWs/LKHNrZEnokL3tmJMazIuWM7dCaVZCA
	WV84PxW8rTFEr/0QmoiNhqXV29ZQE4mhg0xMtNSaOMa3UHvgjP/J2nXf1QsiGkqUnJe9
	w4kSLC8m6Ce8Y2LqfSR9gDsuPsSuTWTIim/nHLLFr0zxHpg4FxpIOc1Ptlc5YouiXC5M
	jykxHCrxCddMY5ANhY2Pu7ycnxtXBZdcAf/6jbximubXcxgZvpRPTZg9T7gq0ltPTZ/j
	czLw==
X-Gm-Message-State: AJcUukeAKsguteTBJYZUO9NRljHHLS7+nxV73Oz6aMN4A61haSUgkxIP
	vhfLDVnjXEVbIEpQNok68M/0auSF
X-Google-Smtp-Source: ALg8bN6ctg22Ufq31J7/jOTy3ANLc9hmOpfYnFEhuM6zflOUrpS14xdYXjerbwqJLEs/cYrbJ20Xhg==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr8080049wru.226.1548353650798; 
	Thu, 24 Jan 2019 10:14:10 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c10sm100318274wrw.49.2019.01.24.10.14.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 10:14:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:13:52 +0100
Message-Id: <20190124181355.4609-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124181355.4609-1-schnitzeltony@gmail.com>
References: <20190124181355.4609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] python-rdflib: fix SUMMARY
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
X-List-Received-Date: Thu, 24 Jan 2019 18:14:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-python/recipes-devtools/python/python-rdflib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-rdflib.inc b/meta-python/recipes-devtools/python/python-rdflib.inc
index f92734aa7..0eac19788 100644
--- a/meta-python/recipes-devtools/python/python-rdflib.inc
+++ b/meta-python/recipes-devtools/python/python-rdflib.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Character encoding aliases for legacy web content"
+SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
 
-- 
2.20.1



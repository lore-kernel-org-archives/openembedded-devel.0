Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36559606CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 17:43:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w125so8457188qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 09:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=btHdxgMf/g6gmjSlSqyxCc4BkGe/TT4yHmjTLdcwrDk=;
	b=RCDfBBWXdMoS22sU8MGra31ovzRMO1dFY5ZxKrSEpwY2x+8+Y1NPV/EDn2RaNVNtrn
	RVskKwbLc6iUUR/ipLFCgeoHf6dhrpFB1A9uzpwzoWcqFeZflb6CQjk8dcOSE6rJQXAj
	EZkw07cWgz82u9nvY8ZusDdvOSxpoyT9RTihf43kt1PR0Hx43+3JrgCvPlw5bTHgrG8p
	XE61HANQNkDEY4uAhLPMvGvsfce1z61Wl/knrGqvSIHSKZZFdyyGIdQ8EvAsh/jePH7s
	RSWvLYqf4kyxgZuR4m0SPbEBE45yd/cCwh2AVhd+etPIkd+15FnCopSlmTXD3Alq+fOR
	YznQ==
X-Gm-Message-State: AJaThX7AcVvQf6xuQ7b2lFGWA67RwJzZOVzDsyuE8hIjKO6wqQ66a0Gz
	fzGxwbCePF1KJ+Z82i+xFZAzEw==
X-Google-Smtp-Source: AGs4zMYOvQAGDXA/RN6iGamS0V+TDaITWs+P9dNdTXFTmnfq3fvUMww2wqSot+agwf/EHF2R31T4bw==
X-Received: by 10.55.103.76 with SMTP id b73mr22682929qkc.224.1511199820803;
	Mon, 20 Nov 2017 09:43:40 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o138sm7222926qke.76.2017.11.20.09.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Nov 2017 09:43:39 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 20 Nov 2017 15:43:32 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Nov 2017 15:43:29 -0200
Message-Id: <20171120174331.22399-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 1/3] python-asn1crypto: Add native and nativesdk variants
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
X-List-Received-Date: Mon, 20 Nov 2017 17:43:40 -0000

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



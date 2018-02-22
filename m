Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C21278685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:51:26 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d26so5245034qtk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 23:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1cpoE0JEf4UyD4ttKhTq1CRGY1dBpMH7sgiCzaZnVBY=;
	b=olJ7KWtdgejos0QrrTACZL+d0paJvD1xSVU0x5AxvdCtUG1nQ92DbO501QO1AA0Mcd
	JwO4+MJYNXInpnwyohnpcqkSLHYjrD1u94kZbGv7N8+qqyAp8Hui/LJl1aLuS4TlIVXv
	b9QmEXhKOTEC3U56OmI/DAF6qLHWzgXhLpbnnD0cO2o1zSQs7JFtwgLF6H3t8dVOqSXH
	bSa31sOCVN5pvfDVtIcorbrIDNGtP7drRb5hIq55xSyQY1I454zVfke9Za9DXqwegygl
	zauuqgR9sftm5C7JwpTMsqe/5068GeGoKNbYcR1bNTo9KJkfskMC6gVJ71Zgc6594fd3
	evFA==
X-Gm-Message-State: APf1xPCb4jKRwxWeLycF/QBDmRAirXnRxYBdfbYuJgUTe1HaCMPEydkB
	6eEQWVHp1JQ7xhOE847ueoSQIA==
X-Google-Smtp-Source: AH8x226N3/hzKXLF60kga38MaCuxVhiAFkM9cmImqyoKVIoOeY3lO8ZruXl9TcT3YvijmhMG9USdiQ==
X-Received: by 10.200.44.10 with SMTP id d10mr9339452qta.14.1519285887977;
	Wed, 21 Feb 2018 23:51:27 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a17sm6226005qth.71.2018.02.21.23.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 23:51:26 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 04:51:19 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Feb 2018 04:51:15 -0300
Message-Id: <20180222075116.4175-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2 1/2] python3-jsonschema: Remove RDEPENDS on python3-misc
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
X-List-Received-Date: Thu, 22 Feb 2018 07:51:27 -0000

The misc dependency is not need anymore since python3 package rework.

Tested using updatehub's uhu utility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Rework commit log.

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
2.16.2



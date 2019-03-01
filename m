Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 434577CDAE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:55:03 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a48so28766052qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 09:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=8aZfADJvUtkeSAK8hDRtJhgT7z9k0gL9B40pv7vsWpM=;
	b=gVxGfxWCQ6kMmRBxjYgncbyLQc65ru0Dip6ZCJFpP5DlfS5uffoWj0907anHy1zIWP
	N/FypM7AlC3/MhM2uNdzu3GgnQEujN9jb8b/kx/S78O9UlX5wpS5smYZni4XvRBJahxn
	24jCv/du4Hx6NOtnZXMWGugDxNFER4bZlByke2ud/UTpNkVYcSzLxIiq5HP/Q3KLc6eF
	CtZnpDGDrABSyLDi+7yClR/l+nitRsyavTjoMUPhnw1XKzal+XJOxQIrELOmDj/zbLX8
	MdFqxIZEWwp9gW00PFZi2ttgyO/j7GHo79Li+dhQUMIiWSGSdjmWzvYIVWoz3JA4+Yrv
	3FnQ==
X-Gm-Message-State: APjAAAU9br3AIQCuvVYOP/53eEHCyDJULu0epCSNiXrsMVGVXPXhDD2T
	muLmMt6a4vSDlBlFa9yAEcpY0gMH
X-Google-Smtp-Source: APXvYqwwoJE/N8tB6WU+8LrLUFEdMaigBtmZRMcD0IwQmMAfIkloPYfUHXGtw3L7xm65gdObSwZgJw==
X-Received: by 2002:ac8:3931:: with SMTP id s46mr4994098qtb.357.1551462903508; 
	Fri, 01 Mar 2019 09:55:03 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id t1sm3092754qki.65.2019.03.01.09.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 09:55:02 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Mar 2019 14:54:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Mar 2019 14:54:56 -0300
Message-Id: <20190301175457.12210-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 1/2] python-idna: Avoid removing executing bit from `.egg-info/` directory
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
X-List-Received-Date: Fri, 01 Mar 2019 17:55:03 -0000
Content-Transfer-Encoding: 8bit

The chmod was removing the executing bit from the directory and then
the native version was failing to build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-idna.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 436b58606..519812ddc 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -16,7 +16,3 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-do_install_append() {
-    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
-}
\ No newline at end of file
-- 
2.21.0



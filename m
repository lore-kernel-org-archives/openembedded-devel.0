Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEFC7D9E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 12:17:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s15so21619852wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y4g9giDK6I5hrHpRsa6z7IfljwBp2pLtJQnVGBehxV4=;
	b=ficYkkLwFtN1DysjK/8EvGIqM+Ryk55z+CVcWlltIoXQI+ZxRN2PknFPopP5QvERru
	fMXSac/dR8KCMvYSNvq3MpCkWexSPoh1nY1KEM+7SbePEhogjAs9gfIgFizBOzwxq5ic
	bxZsX5LYWgfxKP3Tg4QJHF/eqJGJmt3n6vKUHuK9P8wj2LifzA5eXXHYydDxmjUbK/Ao
	8n3J6peo+Re3aJ5RuFEdI9wH7mrSvvx73uemQnwCgRkAtMYybnF+qaVddh93+vymp0IW
	tYQuOiY7IPUlj1SrZbb9zXZhja3GlkI80y1b9DyiIDae6arU586fnOliv9KyOjKCeIte
	SJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y4g9giDK6I5hrHpRsa6z7IfljwBp2pLtJQnVGBehxV4=;
	b=uMbeq9HPCz3f7Z6kgfOemUUiq8ekYYXS3dRPDGb7shnXO/rn+Da2ALLi2+b+x+iV2k
	ukPQPp+Uj5kUYm5bxyxrbtrhYJXS+4uGmg0x8mzEac9o0HhGxX5qrxooCLXU1Z6Eyz1S
	lIclcOuI5peQvTQNHtwgrB+omZ6W4bdfPZqA/Fm7VSI7vKPwg6Ph/EGa/ch1Vf7/cbVI
	1PdfniaUM3hwdHwQFIrztjeq5TELbp5cB/l1nrJFb8V4nhQPztsYBKaMyZtaqWPwYcsS
	ksaw/xJda1lxI/Uch936szTbZ7L4EPcs97pQraFDkfMO9afufi64zQYvqJJdUzLawbOJ
	cEYA==
X-Gm-Message-State: APjAAAU0XEdC/ypXq6n2LvMK/4RbNDycO6nkt+oIbfrv7vtB+/5HfpDm
	68ZYwBmiaWJtV5LnRxziRwA9jiti
X-Google-Smtp-Source: APXvYqy8R67CaCdcW3Y9tF8Yq1LIZY5meSJC9pg8zLI3RwiR/DFcASS5Qs73+V3Rr5tvWOT+s3ee+Q==
X-Received: by 2002:adf:b60a:: with SMTP id f10mr16179399wre.116.1555330655558;
	Mon, 15 Apr 2019 05:17:35 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1008:9a6c:819a:ad4:9abe:4b09])
	by smtp.gmail.com with ESMTPSA id
	t17sm43453311wrr.26.2019.04.15.05.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Apr 2019 05:17:34 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2019 14:17:27 +0200
Message-Id: <1555330647-27749-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH] layer.conf: Add warrior to compatible release series
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
X-List-Received-Date: Mon, 15 Apr 2019 12:17:35 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b03a608..90236be 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "thud"
+LAYERSERIES_COMPAT_meta-java = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.7.4



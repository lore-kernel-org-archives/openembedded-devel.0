Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 149C677173
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 16:06:22 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g73so134844070ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 08:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=s5brezFJxvh3c+YfKcD1Vw+k7Z49DYZQ8uCKE5u3rZA=;
	b=sXBap+0R80Mhj7y1nRNG+KTUVg3Ul9cBik2L73rXCVeEP+2yfpvf1W1Xg0IPHYIPHP
	QKAPtahMOc3QqfdWDoSyAA20D+lNKg1PMxv3MiPVolPm/pI+i6C3jcYTgeFdOm/fx7Pi
	xq83s7y+WMaz9km+4dBHQX23Tpy/juq4pcClP5tl3OlkqQIE+bCFGc3IhJBVUOwPFHhh
	jbZnKfXw9a0ZIl3x/X1ohlXdAt7SFnQ0SwiLx5H5Tf4i1g6R84v3xsxtgYFoupKL/vsw
	mKYpqIAo4ARINrxfCWpulVysimTsM6+0LvwJxaERdIXsa759qBZ5OaVjSBJi1GB1dRDw
	d4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s5brezFJxvh3c+YfKcD1Vw+k7Z49DYZQ8uCKE5u3rZA=;
	b=GDdT2aqtC337HEO2jvh8ydQ4wGdDYeCKDb0PW1kjjJGISF2rGEV3LA84NPBzEksvr6
	cOigt7qmVCbVHn8MtjJwZFpVZSc1rosn6m5eNxn2orphbX+RzjB2T2vZj1nQOuZ/nSrO
	5ajuXUyK4GW+4zbi/75fGXIkJnyhUDTeoEAybNkXbCcXvE8ayPjSE1fUl5aXqSveLvla
	yBUzovr2fD/myk+az5sfL+4OpjUfQzw9Vxs7Imdr2RcnqY7OmlIBoSZIeLSeCq07WXMn
	qNzgq9u8eyhV4MrVEV/ro3IlIBAeitQZoHWVkkzubd4PzlHxmxLKsTmAmgvYOzec/Mbb
	kFTQ==
X-Gm-Message-State: AG10YOS4wcM90X2VFaQ6k2VsFVp6eRPm291aRQzDvqEtqgAyJrdxfBiAnhxsq3tNgEGIdg==
X-Received: by 10.107.165.1 with SMTP id o1mr22480320ioe.42.1454256383172;
	Sun, 31 Jan 2016 08:06:23 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o62sm373281ioo.14.2016.01.31.08.06.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 31 Jan 2016 08:06:22 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2016 11:06:15 -0500
Message-Id: <1454256375-9313-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [meta-oe][PATCH] scsirastools: autotools_stage not required
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
X-List-Received-Date: Sun, 31 Jan 2016 16:06:23 -0000

The functionality of autotools_stage has been incorporated into autotools,
so openembedded-core removed the autotools_stage class, therefore remove it
here too.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
index 8e34104..13f93cc 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.ta
 SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
 SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
 
-inherit autotools autotools_stage update-rc.d
+inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
 EXTRA_OEMAKE += "CC='${CC}'"
-- 
2.7.0.rc3



Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B9DEE76E70
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 22:46:16 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x185so2118437qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 15:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aafs7iUe/H9VufWe75ZIuKRWSgRQ6KWgc84l7H6+8fo=;
	b=DiNbea1h61fMmPteDw3Ink0/dc6EO3pkOjsnMf2HOVpUb6AHH/0ajDoAtEBl0phWic
	WavtM2yomt9gegm5+Awoe6ISjW9FVTXKvGJYimtLAvSnvZPyrtbJACSwH7NlxPNh8//H
	iipA/VkRvJoryoKopk+oAj4j5N2M9b+jfyflOCoa/PrmmAZU5nvA0qMHB6lrrPKERwkT
	PwcqaM2NCARHHEN6XKyc/pVJsMnLcl+f6Cl92dnee47YxbvTFUxyqbmLLzcACWYQLLth
	jcgCl/62OtCVhTghaFpz8jl7zNotReIFRroJ430qzZVaCcanCiKbvVPW+xFP9RM7ca4K
	w9Kw==
X-Gm-Message-State: AEkooustZIj/G00xDLc+ejVNphZa8eBJUQnn6QrqKMHldEN31qXe64SklSZx16lHzHv4fw==
X-Received: by 10.233.239.149 with SMTP id d143mr1027691qkg.176.1470782776845; 
	Tue, 09 Aug 2016 15:46:16 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	l22sm21689290qtl.34.2016.08.09.15.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 15:46:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 18:46:06 -0400
Message-Id: <1470782766-12719-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libmbim: update to 1.14.0
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
X-List-Received-Date: Tue, 09 Aug 2016 22:46:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libmbim/{libmbim_1.12.2.bb => libmbim_1.14.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.12.2.bb => libmbim_1.14.0.bb} (75%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
similarity index 75%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
index f1ecce5..0a8aaaf 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0 libgudev"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bash-completion
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "921fb5ab3f13f1e00833e009d8f3b4f6"
-SRC_URI[sha256sum] = "949351d3e3d69b81e40a49f1d187944c26149e0647a415f0227ccdc112047b29"
+SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
+SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
-- 
1.9.1



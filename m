Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQRj-0001Uv-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 15:45:11 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so423998bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=u9UKXhJFz516b3gRB6uZJCStUv6cRPUWWBclM4SRclw=;
	b=NZ5JAMh1TRbzh7Pu1lDVVvYW/bxVrToZkKF/HyIlBLJWJr2dXi8XL0dPv/rzmVrmZI
	KW8yT9p+kEOd22J1PqdD7w0qsVHrxHTDA6HabUcMCBMBmfoVpPIuEeKJ1bT0b/i6IY2C
	1wY9rrkU+hPJg9o03dBRM9v3kMwhkpPWw6eY4=
Received: by 10.152.135.179 with SMTP id pt19mr2668587lab.47.1320676740810;
	Mon, 07 Nov 2011 06:39:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id pw12sm8653687lab.13.2011.11.07.06.38.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:38:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:38:34 +0100
Message-Id: <1320676714-3099-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <1320676714-3099-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320676714-3099-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] libav: disable yasm for x86 and x86-64 builds, because we don't have recipe for that
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 14:45:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libav/libav.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index a560999..9d3f3b6 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -54,6 +54,10 @@ EXTRA_OECONF = " \
         ${EXTRA_FFCONF} \
 "
 
+#| yasm not found, use --disable-yasm for a crippled build
+EXTRA_OECONF_append_x86-64 = " --disable-yasm"
+EXTRA_OECONF_append_x86 = " --disable-yasm"
+
 do_configure() {
 	# We don't have TARGET_PREFIX-pkgconfig
 	sed -i '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d' ${S}/configure
-- 
1.7.7.2




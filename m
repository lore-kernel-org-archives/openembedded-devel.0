Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CAA4E7091E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:12 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so4311446wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KyWdvOfKp25hG+ASoFK2wn0PvRX/1F2pvLAwTLyEXqQ=;
	b=NXLdKe6rZoEAxk4Rm6vujwRYeqXmm5hRbaP1F/lstq35GP17HOP5zwaKV63Sk18Dnr
	L2H92JaBBKzzpDoL/KeCKDJjl1r97WeJF+o6CFO6+hQ8uaBUkirx/JaVEd0DaeVNKbTy
	raVUrbEUqjI0LeYCIipBkfpKg3o0RI3N1nuUOmUhnbG0wssPLTawFqx4QdBxkp33Zl5y
	io1Zm8J6iIopNdGl022hZRjX/WMqerHGA59fmwHnAcyiNL2yOHAfqW+RHoUsgjbAN/xx
	p7IMHwS9MacQEYfbyZBGTPMmFkCoEfWCkpEhOs5ggquj4LGvFf13Yr4Fx8wSV+vOLH+Q
	08uA==
X-Gm-Message-State: ALoCoQlFIaizNgYLBkVfEKxxaPUYxUgp76txQH0CBI6938xXfb6JMJYtwYexjOuqk/GTYOFMF2Fx
X-Received: by 10.180.182.161 with SMTP id ef1mr7178088wic.44.1406900113518;
	Fri, 01 Aug 2014 06:35:13 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	ek3sm21025606wjd.17.2014.08.01.06.35.12 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:12 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:51 +0200
Message-Id: <1406900096-31368-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 05/10] libgsf: update to 1.14.29
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Aug 2014 13:35:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/libgsf/{libgsf_1.14.26.bb => libgsf_1.14.29.bb}   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.26.bb => libgsf_1.14.29.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index 7d7776c..881d19e 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -7,12 +7,10 @@ SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 
-PNBLACKLIST[libgsf] = "BROKEN: since glib upgrade error: implicit declaration of function 'g_memmove' [-Werror=implicit-function-declaration]"
-
 inherit autotools pkgconfig gnome gconf
 
-SRC_URI[archive.md5sum] = "3c5a4fbd16a727c36974078e6d0e9575"
-SRC_URI[archive.sha256sum] = "8919e725aadd785380350c8dec7427d82cf33164bc9a9a549df9440a0c3da6d5"
+SRC_URI[archive.md5sum] = "3056b94bb3281dbc8311371bfc23cf72"
+SRC_URI[archive.sha256sum] = "4d8bca33424eb711acdb6a060cb488b132063d699c4fa201db24c2c89c62529c"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.9.0



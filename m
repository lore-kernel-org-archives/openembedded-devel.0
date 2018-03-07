Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id C12CC78A8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:43 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id i6-v6so1857407plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jmVaQxcrUTpjNJNiD3uQ+Akj0JJUN/eDFHGzpNxI7cI=;
	b=nsfdjgqyAVkEkStpga5AAvGFlIJb0StXaRcp2oBhNuGFVdGTO7MQiMbKz+J6oHgxC8
	PN9eMkSfC3Y1GnMsaFO36JKFpxmPjraXU4Iz4uxIJWzH5jsTINUbpnXIsL+GDXm92GNN
	AHJAodX8nQL7NDH62fq4E8j8gMt+v/bZ1tZRLSbP1lgVBYdfTV7kZJL2vByYzNw0PulH
	nOVA+JNaRFVpqv/llaHuaBTrsMBm3g6cMfEQC/jI2wI7OOk7P6JqO2RveuYo2QTZtpMk
	8oW7fhtintpgXca8tRp8sYZvy+uHZEkRrntjnMu7t0ZqHc6mDuBusvhY9vmBkLEmUoJJ
	vU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jmVaQxcrUTpjNJNiD3uQ+Akj0JJUN/eDFHGzpNxI7cI=;
	b=oTiJBr5jIPE8kq/VOImzv11iKZIvSAVgtcDyNzmNhFoTMprLOuDA8PahdDtUkuK5DC
	rewLFKF/xMAY5HSSrIKUZC7YCa5Cr99I+QSJn/Cg4X+zJkax5khjOtStNl0WOWdjGqTy
	slyUcEg6yI74GqedawjCmX8rJJrK87fcbW82U8KsalE6AaLmMb3CFXKo9RjTe/rmZ3up
	QkKBIot3ADGzfbj66rgkizMfE/O7rkxUQk/HQCyNhi+qN+/KtLojJBvR1Ks2FrBqNczi
	N/bCGVtiFCqnWmSsvl+YMrHB6iYchbQj8JlMEXtbgutycR4HMk6P+A0YUK5082KUY3mH
	2vfQ==
X-Gm-Message-State: APf1xPAiN+WEKYYz70FLX3+pdY0F6BZS9R/TEGDAVEdpbosOHuxGSKOF
	hiu8db5+mLrXegv09LvBZTQKmg==
X-Google-Smtp-Source: AG47ELuANfwHBcCzXCGqyJWafJtQ6nRYUbRFLnu3qclMp5hsVqZjogeUSl1rzd7cXI6Opc5nrMZc6w==
X-Received: by 2002:a17:902:7b90:: with SMTP id
	w16-v6mr20795502pll.26.1520449304905; 
	Wed, 07 Mar 2018 11:01:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:15 -0800
Message-Id: <1520449275-29492-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 23/23] gnome-themes: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 1a89f48..c1ecc23 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -15,7 +15,9 @@ EXTRA_OECONF += "--enable-all-themes \
     --with-iconmap=${STAGING_LIBEXECDIR_NATIVE}/icon-name-mapping \
 "
 
-inherit gnomebase perlnative
+inherit distro_features_check gnomebase perlnative
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
 FILES_gnome-theme-crux = "${datadir}/themes/Crux ${datadir}/icons/Crux"
-- 
2.7.4



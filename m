Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id E70B078A12
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:38 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id y8-v6so1846310pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PlFa+gXmScbIBffb9LvdJoMHOUkZW4NQpQZp6So6I+w=;
	b=W023AYw2wmHKUvb9b6irPj84AguidH4pKwIENWpU5t3rNWqW7tFXv/ATXi5FaCvT6Q
	aPnBMKCM3P47SmMdP6KMWw5ByMXv1SG0kHBCxHhhy62nUxLpmhCBTXE5JAPpBze/PUK3
	ap6FrA0wbko9wWCp8B2UOOAEsGowxJJFbVNWDxdICyvFKTzg8Ztj60f+ReJKJelUY7N7
	Q3AKRZ7+JLMWDFHj4DU3N1L2m+htMV1yQY20ZTUmb+okdI6MdWjX/pWHkWIUziSIiK6U
	xvEsaOdC/tFbgizEYQZu3TvnHAhwDNwMBZ+h/zqxjESFr82AtZomw3X+8VaJE4xOrRe5
	Zh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PlFa+gXmScbIBffb9LvdJoMHOUkZW4NQpQZp6So6I+w=;
	b=gUKc240jmHK2vqDCj6FXLD5COKZfyWz3+N00MgkSfRH5nJ/jfexz5gGm/H1hFf4ghn
	xfYzJivAS1ZO7M38A7Dc8nrFoFpjV8fcTsI3ASUKHp+lkrpyWbEILNOgiIRflUhkx1Bs
	wG0l6zqxxI/LJ8qEve0Y9/PP0Fv2bpeDavQEg7JAx6T13uQbfrD2Lf7ZjfuT8ax9vWxh
	Zi7XRqlMIqDh5A9PIpHBKcYCGtDX98GtqZNzV7mbrzIC0j3jIB6av/Iacqopw+CeO0U8
	nBRcEtShyG3Ptx8JJPn4I7vabJuNpTCyQq0mCo43o9LduJOIPv77/Ja/0egA5t4k2kUN
	cbmw==
X-Gm-Message-State: AElRT7HFwh7aIuVZ0g4Ss2bqwkb88NqweqzraS4/0s1sRHSbORFn/hd6
	pX7FT7gsIBHY6wwOrIB0zhA=
X-Google-Smtp-Source: AG47ELs0Hg84IDI3IZ4m8JbUZnIWGhcRdVDKpXBqveWhSakib38tKlLi1M+fAXtXFaNdufoI41jeHA==
X-Received: by 2002:a17:902:7f0c:: with SMTP id
	d12-v6mr13817249plm.350.1520449299944; 
	Wed, 07 Mar 2018 11:01:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:10 -0800
Message-Id: <1520449275-29492-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 18/23] glade3: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:39 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
index 69162bd..6667e29 100644
--- a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
 
-inherit autotools pkgconfig pythonnative gtk-icon-cache
+inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
            file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
-- 
2.7.4



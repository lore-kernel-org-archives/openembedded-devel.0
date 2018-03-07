Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 38DBA78694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:29 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w12-v6so632235plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4Q/2Z3xcbq14C32Cocmlov2UQkynYd4h4rQfzhoO5BQ=;
	b=A564ty729pND7LnwvV/0QcjtQYo1o8DC4aTIotEGp7/3Yqw/nezaGfcLk66+Y2i8ws
	UzoWL3pJvHUSFsxRQJGx0cvOii8zJE/LAlB0oYwhV5+K5pDFkT0dY8q9vivhQUgHhBYV
	yhLA5KNqiAZ5yOj+qLtTwuh9dO/e0y+wpKbwLoRWqLB25Yqmy6FuRWrXj77q84kAmskN
	hDE23HclUjAlcr+CckDClZitG8Ddyd94wN2xLDjEe9/7IHVqMOYdGwIlPRqbgmRF/V+V
	w+uaECNx0mCclqliy+Uz7m68f3+JxKVt4svNKFBM01phhPZgIfZ+KManG+Ij9LKvZseA
	5xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4Q/2Z3xcbq14C32Cocmlov2UQkynYd4h4rQfzhoO5BQ=;
	b=kpRgB3hn4gX+xZ8KfrspWDVTlxiyNBsF+7liB9XAb/8j/ffxnJkrRg3OyAE05ClPz9
	bL3tsc1TZ1wOQNANvruv6sUeQAJPGOjQa9UFav/dGdU/H3M7rUAMy4yLPca6wL48KyD7
	aczkaK3XADpbw/HGXooURPXkkkyQkaTCTriMs45YDdf04ydt9xWj0U9zALKWLGsAPrB+
	UsdY5f7nq2OLEKFW6+gDQ6nubsxlo1gaxDgoOzHa+XNDg5y2yFs2P9ZYXKeoGww38GbY
	rPequundJTsAz9i5WW68oSdw9AKOfpU5tXCHUP8liibjx5cwYV7l+4rCDXRuAbPXmuV/
	6pvg==
X-Gm-Message-State: APf1xPB0S3ynD98eqhjnVgVkmHRbeYfI+kcyXJzRkcl+DqQNAN/OxvTX
	7znqv+nt7TLJFrG3rNUJ3Pw=
X-Google-Smtp-Source: AG47ELsHfqFKURp4blJfg96mQ6QrCBZ/KzRxcqrHytU8xSZGi3f+sJAelJJNoQ9nAkeM9WC6h9V2WA==
X-Received: by 2002:a17:902:7045:: with SMTP id
	h5-v6mr19159545plt.217.1520395410920; 
	Tue, 06 Mar 2018 20:03:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:05 -0800
Message-Id: <1520395408-19266-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 02/25] uim: add distro_features_check for x11
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 271718e..ec1b832 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -21,7 +21,10 @@ RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp
 
 LEAD_SONAME = "libuim.so.1"
 
-inherit autotools pkgconfig gettext qemu gtk-immodules-cache
+inherit distro_features_check autotools pkgconfig gettext qemu gtk-immodules-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
 GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
 
 EXTRA_OECONF += "--disable-emacs \
-- 
2.7.4



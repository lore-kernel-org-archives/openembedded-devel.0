Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E91B47FD59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l127so3464329pfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7StQ38lf/e4RPviBrd7sRKo7US9ch2TZzHQ0NfoskTg=;
	b=OWaTn2aLnkbYSL2YUMBVU0WP+ghS7Oq2+jFFLVCxn3uwAe4/Y8DpRP620Vt0vmZNhH
	vanCj90yn++Uff5P7pU71V3Xb+/dBWOEgqViVuQkT2GSAVRyzKFK6BnOzFUiTQHlMFNc
	B5KC8GvgQw9nZ0mRQdAMwfhg2c74Y1XC58qLFPq+1SyouPb+T/ocEJbWGHvpYMGgjfLZ
	Zr9xvDSvJh/ZPW7N49iBOLNoM5TUcJ+pQF8nR3Qlq7Reph57lNXZmhKw+wbvy1HZgYHQ
	ReOVN1Qz8/0GQyM5cxJa63xEeS4p9YElCTuX/iiRHNdYOYoQXMq6GeeQlI1ymUAdlgzG
	oHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7StQ38lf/e4RPviBrd7sRKo7US9ch2TZzHQ0NfoskTg=;
	b=YH6OttozoZ4L2sbG1KkukfIkcHD4vyLCdif+R1TS9ocYxJkDQeMNIvLtlBfBHjBTsb
	VYN4OXWSG3+a7QVnT2dwSI7Ai6/SGYnlfh9kidC/hM3n3W2sXD0Ktaa1q+jd9nV7BcGz
	tOatV8KRyOHo7ss1o4KPVoItyS53tLsF0omfdJuqR2+FXUgNeDEGAJu4CjmruoOEwLfD
	RwYFOD2Aq/Ag0VNruxToXX1W0dKg70pLaUAyhBFlzUiMJlO9/aJeNJJwOemllAhHay5T
	9HGpo/IgIaGUqzsLcNYkzJNneNJ+CQ7e/twkw7If4wCl6tcWANIAvLWUeM1Kdgs4aljq
	k7mQ==
X-Gm-Message-State: APjAAAV0g7+7t6Kz5xFpCBI9IZmmZ7TMtbEZN/cNFMRfoEpIBnpF8i5l
	G7nsOlKZ+sAK+kO462x1TX4EuKuTCgs=
X-Google-Smtp-Source: APXvYqwI9tf1qLG6wJzTfsru884lvnv4YzB5CxOxdeA9qn8a+a++jZZsoWIAatRj2I9zUK4JsGoSCg==
X-Received: by 2002:a62:6412:: with SMTP id y18mr10276455pfb.235.1576769138637;
	Thu, 19 Dec 2019 07:25:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:23 -0800
Message-Id: <20191219152529.725879-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/8] rsyslog: Do not assume atomic built-ins on ppc
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:38 -0000
Content-Transfer-Encoding: 8bit

Fixes build issue
runtime/../action.c:2019: undefined reference to `__sync_val_compare_and_swap_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index 89ccc6d751..e8afae4ef2 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -40,6 +40,7 @@ inherit autotools pkgconfig systemd update-rc.d ptest
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 EXTRA_OECONF += "--enable-imfile-tests"
 EXTRA_OECONF_remove_mipsarch = "ap_cv_atomic_builtins=yes"
+EXTRA_OECONF_remove_powerpc = "ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.24.1



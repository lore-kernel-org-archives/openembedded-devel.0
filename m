Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0332474A03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:24 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id q72-v6so2673202itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X02+I2Nkr/qPAccvEflJvtNBHEZmxWBozvH8ucM0nFQ=;
	b=OARzA3CjNQ6vZP+QPhIcC0+jdzONwGRUTvOKdA4B3VxuFnIOBjPBp9+uc5gn3ajiVC
	KuIbw2QtMmZ68tRrMppmzgLFtPrllbFFnG+HgYFB570IqZ+Sh8kdMjGOhHuvXg/8DW0a
	PKvA0F0VnWxThKf5t+WPUjn+fszA6H+cUioqSn2MIEhEg5aBbT/35TodWVoVG6jUgRNS
	GoJdogcqHbvvDAT+uR4Rwusf7zgRQYtix0RmCCmo9Lf/1BcrNypQgfkml80UysMFNQYd
	bMQ8xendppCua1kmO7QGnQI84oacYt5wVAV2EmtLwNnOBpIZKjlrknz4yU4Mfe/vXBCp
	81Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X02+I2Nkr/qPAccvEflJvtNBHEZmxWBozvH8ucM0nFQ=;
	b=Kl4x/F8JQmfPQdk0JOlWoSgqNt4Wx5pOWCKrbQAjFUgwlRnBadp7YP7TAdGh4RZ/oa
	F2LL+Z7eijiGkTkafTEciGowrEWDXHKHQSjmb6tkc0fQKASqMNcgcqBO5U9LC04m52K/
	zQ2bGdm/Bv3lEHpNdJOE36u6X+JX5BO/SKxm86/FrqQ739Ew2ez826KSgu8RVYQSz/zq
	82jvT6/sc5YJ/3OydA2f/c/rQNkb/DC/Npk8S3MfWIN1lLjROzH6gDhjmHLmmck8kNab
	klTrBRwl+0hx13u/2cP4nAajtw8n9p0EnFnIMLy2OSZA4hMyPgM8CIkgAId0Vn1OFsHW
	Z1QA==
X-Gm-Message-State: ALKqPwddltuwEPRY9cz/r+Aes1GA/HEjQAWj8UBWr/KEHfG3dYk8/2VM
	/LL+hNyH2bsXLU2LucIXSCFxE5Ac
X-Google-Smtp-Source: AB8JxZoRsAxVX7aEy2siL5ipxs78SBU6QPeUNESeA0Fr2qXw2HIRupyFUoUzFj0jjiZXQ9URHVxC7Q==
X-Received: by 2002:a24:3254:: with SMTP id
	j81-v6mr10320227ita.117.1527172765717; 
	Thu, 24 May 2018 07:39:25 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:49 -0400
Message-Id: <20180524143854.24096-13-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 12/17] libftdi: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:25 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 6bea16582f..a1576b5617 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -26,6 +26,4 @@ inherit cmake binconfig pkgconfig
 
 EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c



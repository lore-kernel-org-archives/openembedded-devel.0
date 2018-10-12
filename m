Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A937D74D03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:23 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g2-v6so5992172pgu.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jc5SXTjOIYv+rmatiCpUkwzHMR22hYueKA9XNdtvt6w=;
	b=rzwo7K6hp+gK6gJkDiyaSHm3uFa0j2RVnTDCMpntylk/8kPNWsDpCvLE//U4L3auaZ
	eC/mabPKBCEjJMM4fPC10GvqC9p9KtD6ZZKsoyiLwBGwD6cUSjziLKg06x7y4qT6T9Ya
	awphf2Y85DtEPQhbY7Pi8+MlRe2x0O/3kuvbsjoq/9rmM2B5NORvwtbng/8eNFZYjv8p
	puPJ1K/POPmvPThgzfxOxSofo2ASxMJl4d51VK6P3PfXSdKzOKabKV5yAO0Q3MZl0cpN
	iz2FB2nW/nwROVoxJSPdaCOEEJ+qsDSidUIEvsN3YjqSbTz+myBCYq8Y9BdAQyDK3wPf
	5tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jc5SXTjOIYv+rmatiCpUkwzHMR22hYueKA9XNdtvt6w=;
	b=tBMgu2j6xAj8GM3VQgqUaEHV/DWtjClSWRZC4nFWPwuldOv9kieX6bYNHtGztRjVuu
	syA9JtSZGhXFFeHc/L+/5kY69rkRfPO+0fTotd+TqypcoWC1r4JWkJ7uFzwEYG5pKA8j
	tqYCPFXeIO4yXtEf8augaG9qgLqyNdqWJb3kWZ6u/Ctb40HT76wx2ncyWtZ3Ov6D32cu
	YWyWI+vTt69yN+a3JSOzoXcuyld0K5UQqag55Vn6uQ4tGaXOS11nKUtlyTt4ahiNTrfk
	RLCH7Rq58dLX+EgrBQ1wh7FAh/bOdjisIfIU8l0On+Miz4zm+kx6ZgzgCHlnW1SQdtfC
	7Lfg==
X-Gm-Message-State: ABuFfog2OLHxCu4b21xlMvemYIEm3y+aI4QJgUVMWQT4O+l6HsEBA1fW
	fgoeThxio7UCTyiCqQbu+Sw=
X-Google-Smtp-Source: ACcGV60Nk4e1fAdafWZPAl9p4xRZa0kIOZcf+ac8LkpUa+CHw2YzC2kUyxzapYUXNUImKBumRARtjg==
X-Received: by 2002:a63:4d09:: with SMTP id
	a9-v6mr5967704pgb.408.1539357984754; 
	Fri, 12 Oct 2018 08:26:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:17 -0700
Message-Id: <1539357981-3675-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 1/5] directfb: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:23 -0000

package has depends on vlc and gtk

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 96aa311..cf8f19a 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -32,7 +32,8 @@ LDFLAGS_append_arm = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -f
 
 BINCONFIG = "${bindir}/directfb-config"
 
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= "linuxinput"
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
-- 
2.7.4



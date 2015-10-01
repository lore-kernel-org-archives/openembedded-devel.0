Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id E516077088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:43 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so39004807wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ml8VW7ITSYikY5b9/Gg/Z9jfHEY4xekyB05lO1GtKaE=;
	b=EoNvQ+K47yNHL2K2rcjOP+Dp5HQDChCXmV/1KLJBW88S3MvV7LBvAZoSLF13lgTzVA
	SHUfQhc7aHZRZbkU0GZ4isQk3vjjqbNfasFCvTghtgEkr2VF9h3rcq5o/o3YWQVFuf1X
	ALEZStfGTp+i3LVqQwJ7WlawEV7LN63QNmbWgWBg9NpVvMi6nX6zxgVD60+05IdrRlJK
	mC4Aq1NvbL8rrnAvnVjBJIHo8tOOddZNw3YJzO2tXhI8mqbbTgp/OcskH6ylfO7QBqQW
	EtTZpf5an2NweUH8Z6vfq9taOSiog3Xoltl5hx6Hzjig51toAkviUXAI0mpiBLPwQyA/
	eOIA==
X-Received: by 10.180.103.35 with SMTP id ft3mr4247220wib.60.1443713383523;
	Thu, 01 Oct 2015 08:29:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o3sm3704784wif.22.2015.10.01.08.29.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:26 +0200
Message-Id: <1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 08/10] elmdentica, azy: blacklist because they are old and fail to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:44 -0000

* they weren't migrated from E_SVN to git and updated in ages, I'm not interested
  in maintaining them and nobody else volunteered to fix it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
 meta-efl/recipes-efl/efl/azy_svn.bb        | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 20a4849..56a74c5 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -19,3 +19,5 @@ SRCREV = "${EFL_SRCREV}"
 RDEPENDS_${PN} = "${PN}-themes"
 
 SRC_URI += "file://configure.patch"
+
+PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 0c3c9d7..dec2475 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -30,3 +30,8 @@ inherit efl
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
+# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
+# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5: error: reference to 'basic_string' is ambiguous
+#     basic_string<_CharT, _Traits, _Alloc>
+#     ^
+PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
-- 
2.6.0



Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42A597C6AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 09:56:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t18so6756551wrx.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 01:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x05AMHKleitW4o+Y9/dOahtbngB1sa4a/cvyxQqS7ls=;
	b=S5pkrVgikSFEPeqXPp7VXx1JLW6ejjYcSXGbLvYVonoRuxu892bpqa0jPwfw7kdlhZ
	5T0lge7VwAELHZbLl0F4d+UGkzhL0b9cpV9Xh/fzQC/y3x8FVvYq0xsrx0MIBO0yrqy6
	W3P0ayanCjZrZKadDx+xvuHBcYVG83gQIwOtKDJOLOD9NSQyBHwrfU35fOfIzniDiHk6
	kMyXqYHujiXNUMJ5I2tdwlj11DPQHjsy8exBTxDn5AdVy4nLOozGrFbKpBulNKQULOQN
	hH04lfd80uTe2rkZW4ZUdWWwyJxclNEu8JBK911mwAPBMhicqSFHXOpI5oUde5o5ia2w
	p02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x05AMHKleitW4o+Y9/dOahtbngB1sa4a/cvyxQqS7ls=;
	b=XS5254H7U+rfCnp6WWx5gvwQUkVjDj066AV4HOrT+nQBOgWjfi0ddeLy+q7PErspe2
	IDwh0dY+Ud6gc6kjwFZocFb39n7WYbIbR0R5FSKHRTUS/Km3u7b7WlYtDJ5JSJ6LiUjC
	vtu53fgxsuPW0JHNCYjJpEtCVd6XfUPVQ1Kh88r5bAhFHhVo+yviIkmEckMvFYX5h18f
	15SCVnY1BVO+pgXLSZZmEpNUC4syK5rf8FyjyBjhVusjjCvpdHeZ0b8fX3Mv5ZwXQjjI
	yhn9N7ClDRY02xk5NF/D80f7txSlq05eCf25n4LmQosHu+uLr4a5DjDW/sJtA2JP396t
	/r/Q==
X-Gm-Message-State: AHQUAuaf9a9OG+N8pzgX9EqbJ1gPy28dqqy6pybfxhzPl1nivr3AO9qS
	85GO06THIiYZ1TDgbTWQ/6R3I7Az
X-Google-Smtp-Source: AHgI3IbdmF2wZkFqT7Rf93vhugO4EyCRwyCFETN72M66zSRVRi/N3e9fGL7l4qchcdYNWZ4GMhwMnA==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr8730408wrm.143.1551002211623; 
	Sun, 24 Feb 2019 01:56:51 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	h137sm8772082wmg.41.2019.02.24.01.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Feb 2019 01:56:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Feb 2019 09:56:50 +0000
Message-Id: <20190224095650.32036-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] vim: use empty PACKAGECONFIG for vim-native
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
X-List-Received-Date: Sun, 24 Feb 2019 09:56:51 -0000

* otherwise it depends on gtk+-native and we don't need gtkgui enabled
  in native builds as vim-native was introduced only for xxd-native in:

  commit 1dff2351aa6cdafa5a501e8956cb853ab17ed9ae
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Fri Mar 10 11:55:44 2017 +0100

    vim: add native BBCLASSEXTEND

    * some recipes might use xxd
    * with stricter host binaries available in PATH:
      http://lists.openembedded.org/pipermail/openembedded-core/2017-March/133886.html
      we cannot use xxd from host and it's not so common to add it into
      HOSTTOOL_NONFATAL
    * there is also smaller solution for xxd -i (which is what I need):
      https://github.com/gregkh/xxdi
      but after creating xxdi-native recipe for this I've discovered that
      perl on my host as well as perlnative doesn't provide File::Slurp
      used by this, so adding BBCLASSEXTEND here is easier solution

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 0705831584..2a3d14a2ce 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -40,6 +40,7 @@ PACKAGECONFIG += " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
 "
+PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.17.1



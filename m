Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7877F332
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 17:13:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x4so13459071wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UuFc/zJMcmq1mDOvA+xGqYRJEwrsuaKGfR2BCSQ38Rc=;
	b=LwcYJi5j37yg9K6/DnfnshDukh2elYFUzb/orEpTNc932hj9n7GCPSeKy2SKFBJH0J
	sIOiV8MaI6X0+0Qijj7y7yplMvhKHC1AUGOAPRnr1f0ClmTwwk9XIgBR5EaZMOyKnstQ
	o56G2GolI8gnc3ed0YPPpkosc/F34q82Rw5ATMfz77knJ7q8BYlsqdQwa37SasTH73qw
	FzXSJ7uKqx4B3DYblNAlxtea2bXlbJE4nw1Ols7/DcksgO8jQ1kYA+3UgiozIen0/vbc
	nyIGYtIkSl5JrJAvWJ0gx679bBxt3ESJxAWHk7jJATfShZEKZe2CkOuPlQ0LE8dJa6W0
	kVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UuFc/zJMcmq1mDOvA+xGqYRJEwrsuaKGfR2BCSQ38Rc=;
	b=oJMd+KqiNbTV8EeL7zERiDxOyrranX3nbepRethV1SEp/orws5/KPYbu1oJdjrjzMt
	wBJMyeywAP2N2H5e8ssYcqnjM6ASc0Sz5nGd18rQNRoxsU1AwnDztyuNypRuKL+59yV+
	rt8C/8K3hO1xIZjCiQtHiqNo43zSv7xnrm1HXavzs4sLnvmgbgweVwMVjyTOyAAtRvwN
	kxEIz+Ul1qUzPzP/OQCZcUvJNGpDkLL+3qvGM0AhyO079+xZ3DqmA6rUSdzBhMKneKM/
	lin+7KrADssNrZ2i1wmD49EkY0HinpCFTDI7f+MI3rMcuzGdLE0t4vHWbmBNLJItxg0h
	6cjg==
X-Gm-Message-State: APjAAAXS6JULhhgOSHRs5HajjDj8l2/evM7i/pT1+lPsVc9aIfvtHbpF
	QnfXEYJNLe7sNGeNV8SBkjhe1FlKEqo=
X-Google-Smtp-Source: APXvYqzfi1lB4JcTZMFLdyNANRqaH8fibPvciXyaI5ia/czFd0egmuy7/b8gWBn8HLDQW9ewMU+2tw==
X-Received: by 2002:adf:db50:: with SMTP id
	f16mr119324709wrj.214.1564506820546; 
	Tue, 30 Jul 2019 10:13:40 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f3sm48696153wrt.56.2019.07.30.10.13.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jul 2019 10:13:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:13:38 +0000
Message-Id: <20190730171338.25-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][master][PATCH] oprofile: drop kernel-vmlinux from RRECOMMENDS
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
X-List-Received-Date: Tue, 30 Jul 2019 17:13:40 -0000

* now with virtual/kernel dependency dropped we don't want to depend on kernel signature just for
  this RRECOMMENDS
* fixes:
   === Comparing signatures for task do_package_write_ipk.sigdata between hammerhead and mako ===
  ERROR: oprofile different signature for task do_package_write_ipk.sigdata between hammerhead and mako
  NOTE: Starting bitbake server...
  runtaskdeps changed:
  ['binutils/binutils_2.32.bb.do_packagedata', -linux/linux-lg-hammerhead_git.bb.do_packagedata, +linux/linux-lg-mako_git.bb.do_packagedata, 'opkg-utils/opkg-utils_0.4.1.bb.do_populate_sysroot:virtual:native oprofile/oprofile_1.3.0.bb.do_package oprofile/oprofile_1.3.0.bb.do_packagedata pseudo/pseudo_git.bb.do_populate_sysroot:virtual:native xz/xz_5.2.4.bb.do_populate_sysroot:virtual:native']
  linux/linux-lg-hammerhead_git.bb.do_packagedata with hash 0c5215deb4737611ad413f57cf5fbdef8a9b2cc6d04035f754a4e93fb38f61d1
   changed to
  linux/linux-lg-mako_git.bb.do_packagedata with hash 0f3b34773ca3e590739754c25959feb7cdcd67cf7904ac7fe6cc535e8d6519a8
  Dependency on task linux/linux-lg-mako_git.bb.do_packagedata was added with hash 0f3b34773ca3e590739754c25959feb7cdcd67cf7904ac7fe6cc535e8d6519a8
  Dependency on task linux/linux-lg-hammerhead_git.bb.do_packagedata was removed with hash 0c5215deb4737611ad413f57cf5fbdef8a9b2cc6d04035f754a4e93fb38f61d1

  ERROR: 1 errors found in /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/sstate-diff/1563368432/signatures.mako.do_package_write_ipk.sigdata.log

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index 515ea8faf7..a9ee775d45 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -12,7 +12,6 @@ SECTION = "devel"
 
 DEPENDS = "popt binutils"
 RDEPENDS_${PN} = "binutils-symlinks"
-RRECOMMENDS_${PN} = "kernel-vmlinux"
 
 FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
-- 
2.17.1



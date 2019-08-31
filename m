Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0E36460234
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:37:40 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id az1so3932885plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cObvIORvosD933V4exuHl7skL3/4xiSNNnhE5ZSSFjQ=;
	b=FskIwRyXL5l+7O7bxfWGCc0KnrdEOoCgEco8IX2yAqrCjmp8GukJZ35ao5KZnS1+d4
	V7YqaG8YJm8h53kyI71naM60DJRrXzWBMLD4lsTC70MpRVwPfupgYZMv06cU8XPU8RQB
	RYHd0odN3NR6whJTGa9hyqTqPno8UKzl1NLaGOfvF3+i5lDUfuvtv1H+WwqpCRJ3M+qO
	k8vvIAFALN+Z//KuoGyya+4afnxy9ffUg4bk2p0xJ+44fu+NgSrYQCt1LJhpJBmcoWx/
	jA5QgoM0gToWU3wKXagfTBSieYiVjNcTktgNPyrvNgtgspx4E44ddn4IDTfhJI/Y09Oq
	/XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cObvIORvosD933V4exuHl7skL3/4xiSNNnhE5ZSSFjQ=;
	b=MsPYfJ+Uq92gyqZgAhrmwGyNAmwOKkq8kj/r+zRbLAxnWGHALQ0edhGXByc6DLGR1A
	JXNhErdE3mYDpBvFmvyS5i4kpi0YsumZ2XbNrCiA2IOB9PdV8GFRS1aOgAVbkYlH0/28
	634jh63UfcNNjYcgt2Vs6Zr9njQ7i7RKvSCmQs1Yl3c5Hp6oeAZGmik+h8mVlUzBoqEB
	GJLx9oywI/nlG0hO1bNtuXZcFiRuHe3xzNstmQdF+nRlafTy5iqmOuebG1/UXh+gLDww
	in3LfcFzZ/M+JVuIyYXGyKMdERMMG7N4WTuo7+PW1gLycsHArBGBj6mrGadjNvNYRu10
	BCuA==
X-Gm-Message-State: APjAAAVvoh4UMdEfiGJxbl/QDpcScXt0ewbl65+K3ZsINM5edEqAV1w6
	4vBk3Ki9B3svi0atBtvnmHBP6lY1
X-Google-Smtp-Source: APXvYqz/ag4rtrjHHH6Dgju00gGVfyNPxwH4hT+W9hFB+lrPMrNkYMSrD1evQANhb7kxNz/HKhO8rA==
X-Received: by 2002:a17:902:aa91:: with SMTP id
	d17mr21868688plr.74.1567287461171; 
	Sat, 31 Aug 2019 14:37:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d6sm9443836pgf.55.2019.08.31.14.37.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:37:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:37:34 -0700
Message-Id: <cover.1567287402.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud 0/4] Patch review
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
X-List-Received-Date: Sat, 31 Aug 2019 21:37:40 -0000

Comment back by Monday

The following changes since commit 9b3b907f30b0d5b92d58c7e68289184fda733d3e:

  netkit-rsh: add tag to CVE patch (2019-05-27 22:22:25 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/thud-nmut
  http://cgit.openembedded.org//log/?h=stable/thud-nmut

Peter Kjellerstedt (1):
  apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS

Qi.Chen@windriver.com (1):
  apache2: set CVE_PRODUCT

Yi Zhao (2):
  apache2: upgrade 2.4.34 -> 2.4.39
  apache2: upgrade 2.4.39 -> 2.4.41

 .../recipes-httpd/apache2/apache2-native_2.4.34.bb |  46 --
 ...nfigure-use-pkg-config-for-PCRE-detection.patch |   8 +-
 ...-up-the-core-size-limit-if-CoreDumpDirec.patch} |  12 +-
 ...ot-export-apr-apr-util-symbols-when-usin.patch} |  10 +-
 ...ache2-log-the-SELinux-context-at-startup.patch} |  23 +-
 ...replace-lynx-to-curl-in-apachectl-script.patch} |   6 +-
 ...-the-race-issue-of-parallel-installation.patch} |   6 +-
 ...apache2-allow-to-disable-selinux-support.patch} |   8 +-
 ...-not-use-relative-path-for-gen_test_char.patch} |   8 +-
 .../apache2/apache2/CVE-2018-11763.patch           | 512 ---------------------
 .../apache2/apache2/apache-configure_perlbin.patch |  27 --
 .../{apache2_2.4.34.bb => apache2_2.4.41.bb}       | 202 ++++----
 meta-webserver/recipes-httpd/apache2/files/init    |   0
 13 files changed, 157 insertions(+), 711 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-corelimit.patch => 0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch} (83%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.4-export.patch => 0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch} (80%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-selinux.patch => 0004-apache2-log-the-SELinux-context-at-startup.patch} (85%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{replace-lynx-to-curl-in-apachectl-script.patch => 0005-replace-lynx-to-curl-in-apachectl-script.patch} (95%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.3-fix-race-issue-of-dir-install.patch => 0006-apache2-fix-the-race-issue-of-parallel-installation.patch} (94%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{configure-allow-to-disable-selinux-support.patch => 0007-apache2-allow-to-disable-selinux-support.patch} (91%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{server-makefile.patch => 0008-apache2-do-not-use-relative-path-for-gen_test_char.patch} (76%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.34.bb => apache2_2.4.41.bb} (61%)
 mode change 100755 => 100644 meta-webserver/recipes-httpd/apache2/files/init

-- 
2.7.4



Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13933608A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 16:37:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so12377803wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N9+QLXPBBq3N919wVVWaFZ2RiA6HORxbqeB0pxa+Zaw=;
	b=JKkSnrJQfyaCk5tjaUeI9FJxnVzw+CY4WTOD3QMg7SJ0wlMrIVrISHZO1BJctRxBsZ
	F0p4X+CKmK8fGikX+dlJxr3zDmKy/97BulkxNBtVbttUTdG+X/9uo+HGvhWCz9wT6hE2
	jp78HgbRqloxCMs59Wy+g/02Q/escwR2wDWDD94ELI0LICrPTzGlZD+3tNSV+cMbxPNc
	Y7k0PaycT/IevKxWYWeQsVz4SVL7/oOzTKYscPQIKe5NUosTX5DwHaO+qlN0xBnRTTjw
	F62vayidVWrm32kdeAkHBk1CaRwK9BUMAnnR5njD162CferDQb9Mn/Kehkp0eSjcejbw
	rduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N9+QLXPBBq3N919wVVWaFZ2RiA6HORxbqeB0pxa+Zaw=;
	b=SBpY0DC/rrjmyBUeL0NUHqJ/IVkLaNmcgUKcPGSklFMrstINP7pHNIDh+HqlRdYKvX
	26C6KiM4KL5lP6N3a6FzyFFym66RTi6OQ/A6j/UgnfjII74bBjEft6sNTEe6YlpvbOus
	nWCavWxOPOnN8pfZiXq09WOJOOq1/WLFyN+Ac0sQ84Sav5Q3FpZctN6ogG4PmQov1YBw
	CE9TLguux3p3icRNdfB+CwExuAWebOtU9uzKPgvcrlO9J/N4Buog61eGuiaOxDDYZqmB
	RdGz0G4JC2UAP7igHeRqWu2bAc3dZt7PqidpYLMhTdzDntu6Ol0AXyYxNh4PrCkns6NG
	5ftg==
X-Gm-Message-State: APjAAAXGrr/lyy9k83woMnuMhZwksCOMhNdT0xcE/4n45TtLXBrpMgbs
	P+uKOIyy+tap8u/bAaU+sjOxTnEY
X-Google-Smtp-Source: APXvYqzuz+VGtno/4I86iZZcTo4Bly8IXZsEzywa5yDaGRXFS0ZP0kMoGI6Zsnv2sij2xGnWEcL6kQ==
X-Received: by 2002:a05:6000:1289:: with SMTP id
	f9mr4929289wrx.381.1580575042336; 
	Sat, 01 Feb 2020 08:37:22 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F01CE208F5D55732A5FC539.dip0.t-ipconnect.de.
	[2003:f0:7f01:ce20:8f5d:5573:2a5f:c539])
	by smtp.gmail.com with ESMTPSA id s1sm8594117wro.66.2020.02.01.08.37.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 08:37:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 17:36:59 +0100
Message-Id: <20200201163703.4264-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/4] mozjs -> python3 / upgrades
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
X-List-Received-Date: Sat, 01 Feb 2020 16:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mozjs was build / run tested with Raspi 32bit. For other targets issues
might pop up - see what autobuilder says - will take care.

Andreas Müller (4):
  mozjs: port build to python3
  poppler: upgrade 0.84.0 -> 0.84.0
  xfce4-whiskermenu-plugin: upgrade 2.3.4 -> 2.3.5
  thunar: upgrade 1.8.10 -> 1.8.12

 .../mozjs/0001-Port-build-to-python3.patch    | 6888 +++++++++++++++++
 ...nclude-RequiredDefines.h-for-depend.patch} |    0
 ...x-cross-compilation-on-i586-targets.patch} |    0
 ...04-do-not-create-python-environment.patch} |    0
 ....patch => 0005-fix-cannot-find-link.patch} |    0
 ...ound-autoconf-2.13-detection-failed.patch} |    0
 ... 0007-fix-do_compile-failed-on-mips.patch} |    0
 ...ort.patch => 0008-add-riscv-support.patch} |    0
 ...mozjs-fix-coredump-caused-by-getenv.patch} |    0
 ...rflow.patch => 0010-format-overflow.patch} |    0
 ... 0011-To-fix-build-error-on-arm32BE.patch} |    0
 ...LIC_API.patch => 0012-JS_PUBLIC_API.patch} |    0
 ...013-riscv-Disable-atomic-operations.patch} |    0
 ... 0014-fallback-to-2011-C++-standard.patch} |    0
 ...-compiling-failure-on-mips64-n32-bsp.patch |    0
 .../0001-support-musl.patch}                  |    0
 .../0002-js-Fix-build-with-musl.patch}        |    0
 .../recipes-extended/mozjs/mozjs_60.9.0.bb    |   56 +-
 .../{poppler_0.84.0.bb => poppler_0.85.0.bb}  |    4 +-
 ...4.bb => xfce4-whiskermenu-plugin_2.3.5.bb} |    4 +-
 .../{thunar_1.8.10.bb => thunar_1.8.12.bb}    |    4 +-
 21 files changed, 6923 insertions(+), 33 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch => 0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0010-fix-cross-compilation-on-i586-targets.patch => 0003-fix-cross-compilation-on-i586-targets.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-do-not-create-python-environment.patch => 0004-do-not-create-python-environment.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0002-fix-cannot-find-link.patch => 0005-fix-cannot-find-link.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0003-workaround-autoconf-2.13-detection-failed.patch => 0006-workaround-autoconf-2.13-detection-failed.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0005-fix-do_compile-failed-on-mips.patch => 0007-fix-do_compile-failed-on-mips.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{add-riscv-support.patch => 0008-add-riscv-support.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-mozjs-fix-coredump-caused-by-getenv.patch => 0009-mozjs-fix-coredump-caused-by-getenv.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{format-overflow.patch => 0010-format-overflow.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-To-fix-build-error-on-arm32BE.patch => 0011-To-fix-build-error-on-arm32BE.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{JS_PUBLIC_API.patch => 0012-JS_PUBLIC_API.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-riscv-Disable-atomic-operations.patch => 0013-riscv-Disable-atomic-operations.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{fallback-to-2011-C++-standard.patch => 0014-fallback-to-2011-C++-standard.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{ => mipsarchn32}/0001-fix-compiling-failure-on-mips64-n32-bsp.patch (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0006-support-musl.patch => musl/0001-support-musl.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/mozjs/{0001-js-Fix-build-with-musl.patch => musl/0002-js-Fix-build-with-musl.patch} (100%)
 rename meta-oe/recipes-support/poppler/{poppler_0.84.0.bb => poppler_0.85.0.bb} (93%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.4.bb => xfce4-whiskermenu-plugin_2.3.5.bb} (66%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.10.bb => thunar_1.8.12.bb} (84%)

-- 
2.21.0



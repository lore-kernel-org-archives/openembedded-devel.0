Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C9A576FFEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 11:33:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so25823108wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CRuDTIT8CSl2oLR60HRM8lJu/QtepIprmIiS1cNWOI0=;
	b=GG1RtvBjkiHPpU8nx/1b9Nrlw8bsc+q1n0Sk/mB/dG/7Or//+DSnOr/YMGtj6iN+bv
	BM7dSrtf5/kTokQ9tO6AKeVFKKXJHxuQjfVnL+AHx406My5izJfCT4OaojAC0Okwuwu5
	IGf082FJT08yOihpFoNHyLeVXtsdCUTxTm5xoqEKESCPThEEnwT6bqyrmt7U0X2/vjXj
	HPH0YY4yY6p1lzQFXcO33Mp2vS1z0Hx8UpFAPkYzuD/FbjcKr1HLIZAoJ5aTIMPBgrGJ
	DlktP1kcbA/CnCUjVtOP7q+ERhcUUczFpT8Noga4hMV7uFGlLlEpcLMOf1SdZaYc4V/g
	OWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CRuDTIT8CSl2oLR60HRM8lJu/QtepIprmIiS1cNWOI0=;
	b=dRAxG3NjmooBRr4TK1U8xnQK9iiSXj9l9t8Nd/h5nigA7OuHRPeL8AC0jlglQaU2iM
	EAcy66/gMpLuAZjMw1RpsyRD6lWzeR3RJ56tl8v905zm1Vq96WAyZxchcGDNoxbfPRZv
	aifA6twV2Gm0YMvS+ywRHpP97gwI0/XNmqZ/dJVHW6SCwdCPdPfBNFDI2ByP2vdkdRwX
	xg4Yt7raeWAXVCYam5lA3Pu10tCEFpd9XpSqAE0hiKI/O8reoBglzIIQ0jbDqLFpDb+L
	KR0E6wKhys42johh4n1AKzl0PF517K4qF7VEucnWNlX0SQVr9lCu/DVuvu1/ZLbA/Kkc
	n4nQ==
X-Gm-Message-State: AD7BkJLcHLIu1Lje3/AsTC8ly06uzG/AFhpHNp1mbI/opQuxNxYhmts1jTtG3DpnnDeKpg==
X-Received: by 10.194.123.35 with SMTP id lx3mr3182413wjb.132.1457609602667;
	Thu, 10 Mar 2016 03:33:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm3100580wmk.13.2016.03.10.03.33.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 03:33:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:36:14 +0100
Message-Id: <1457609775-25093-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
References: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/4] system-config-keyboard: inherit gettext and add dependency on intltool-native
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
X-List-Received-Date: Thu, 10 Mar 2016 11:33:23 -0000

* it actually depends on native intltool:
  NOTE: recipe system-config-keyboard-1.4.0-r0: task do_compile: Started
  ERROR: system-config-keyboard-1.4.0-r0 do_compile: oe_runmake failed
  ERROR: system-config-keyboard-1.4.0-r0 do_compile: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/system-config-keyboard/1.4.0-r0/temp/log.do_compile.16052)
  ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/system-config-keyboard/1.4.0-r0/temp/log.do_compile.16052
  Log data follows:
  | DEBUG: Executing shell function do_compile
  | NOTE: make -j 8 PYTHON=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/python-native/python PYTHON_SITELIB=/usr/lib/python2.7/site-packages
  | make: intltool-merge: Command not found
  | make: *** [system-config-keyboard.desktop] Error 127
  | ERROR: oe_runmake failed
  | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/system-config-keyboard/1.4.0-r0/temp/log.do_compile.16052)
  NOTE: recipe system-config-keyboard-1.4.0-r0: task do_compile: Failed
* and it also used gettext:
  | DEBUG: Executing shell function do_compile
  | NOTE: make -j 8
  PYTHON=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/python-native/python
  PYTHON_SITELIB=/usr/lib/python2.7/site-packages
  | cd po && for i in *.po; do msgfmt $i -o $(echo $i |sed s/.po/.mo/) ||
  exit 1; done
  | echo -e "#!/bin/sh\nexec /usr/bin/pkexec
  /usr/sbin/system-config-keyboard \"\$@\"" > "system-config-keyboard.sh"
  | chmod 755 "system-config-keyboard.sh"
  | /bin/sh: 1: msgfmt: not found
  | make: *** [gettext] Error 1
  | make: *** Waiting for unfinished jobs....
  | Merging translations into system-config-keyboard.desktop.
  | WARNING: exit code 1 from a shell command.
  | ERROR: oe_runmake failed
  | ERROR: Function failed: do_compile (log file is located at
  /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/system-config-keyboard/1.4.0-r0/temp/log.do_compile.23230)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../system-config-keyboard/system-config-keyboard_1.4.0.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
index eaca96d..078fcea 100644
--- a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -6,7 +6,9 @@ SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
 SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
 inherit python-dir
-DEPENDS = "intltool"
+
+inherit python-dir gettext
+DEPENDS = "intltool-native"
 
 EXTRA_OEMAKE = " \
     PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
-- 
2.7.2



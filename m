Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8964770101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:29:12 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a4so162650787wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bbg2vQBWWcwgx+7QUe/Sdi03GNbzMfug7d1CthcIYnU=;
	b=Ql14dk9XQnbOTdfLdQWNSbBI4YVYmeGKS4gNRIw9jBpmRAwdZsusO7mdbktuGjq/RN
	p//QzPSm41tLAB9Sl56joEqY0qJnUnOozTq9wxQd4DxBlv+RSfowrI58lUyBpYOIsQ22
	bXlE6H+C/WZCdBLI9NonFswwvflIu7c537WFi8q0XDWrrnNS8bFVT3vQ3mDLqXJBtwR/
	Lv4gQ6NGorCVmMDgHd6hHwC76jGlraeisTXwxK2QjhzkZm5GYYuCJhgCuh8dIf9wqoF5
	bAQXtiCTmMhG0s2bj9oUNQiSCyta5uOz3LPE7SyUB9Kq0ekHm5H4YfcLs+NOEqQbfqWT
	Lx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bbg2vQBWWcwgx+7QUe/Sdi03GNbzMfug7d1CthcIYnU=;
	b=hJRcJeqyod12Z8xaHnCeg0zLzg5/k+DtrftMdtQ38i2ckf2MyjQ5kAW0ZheV7IZdh8
	0AqlHUi2Y6MG7gQaqfNK+PxGof0hRKNybiyV7h9qCN6tJO1NG+hGTyhBMlr1sAS8pqPm
	5b/wkqegnB/vmKEahywdTEuPSXDL+YFQlqYoVbt7cAl9W0zwEBZuU/rn7YmW77goZKuZ
	ft6Hv8VuJ0mg53U7lVnG+70lRiJYhId/W5wxYpJg26t1xcVpH6xApOGVE5StmxFfGx+q
	bLUkgVjPGoLH7hEY3/pliZ4T8WDdApgA1AqmlDah2zubyr9uoOHoXkL9riwktYIp8OrH
	t7gw==
X-Gm-Message-State: AG10YOS2B84hs2nzevG9KZ/ig1FedbCCjFKUoB4PUuZtTpSAbSXNaQ7DwjdvMDA+2DeDqQ==
X-Received: by 10.28.54.159 with SMTP id y31mr12938022wmh.89.1456147752603;
	Mon, 22 Feb 2016 05:29:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u201sm21120282wmu.11.2016.02.22.05.29.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:29:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:30:01 +0100
Message-Id: <1456147801-7624-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
Subject: [PATCH][meta-oe] source-han-sans-*-fonts: exclude fontconfig dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Mon, 22 Feb 2016 13:29:13 -0000

* fixes following errors reported by sstate-diff-machine.sh:
 === Comparing signatures for task do_package_write_ipk.sigdata between qemux86copy and qemuarm ===
ERROR: source-han-sans-cn-fonts different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-cn-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-cn-fonts_1.004.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-cn-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-cn-fonts_1.004.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash e7fb65be80d659ad30e73c7bad692456
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 96542b26ecfbce93b84889ee4a2e4746
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from e7fb65be80d659ad30e73c7bad692456 to 96542b26ecfbce93b84889ee4a2e4746

ERROR: source-han-sans-jp-fonts different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-jp-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-jp-fonts_1.004.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-jp-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-jp-fonts_1.004.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash e7fb65be80d659ad30e73c7bad692456
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 96542b26ecfbce93b84889ee4a2e4746
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from e7fb65be80d659ad30e73c7bad692456 to 96542b26ecfbce93b84889ee4a2e4746

ERROR: source-han-sans-kr-fonts different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-kr-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-kr-fonts_1.004.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-kr-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-kr-fonts_1.004.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash e7fb65be80d659ad30e73c7bad692456
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 96542b26ecfbce93b84889ee4a2e4746
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from e7fb65be80d659ad30e73c7bad692456 to 96542b26ecfbce93b84889ee4a2e4746

ERROR: source-han-sans-tw-fonts different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-tw-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-tw-fonts_1.004.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.5.bb.do_populate_sysroot:virtual:native', 'ttf-fontssource-han-sans-tw-fonts_1.004.bb.do_package', 'ttf-fontssource-han-sans-tw-fonts_1.004.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash e7fb65be80d659ad30e73c7bad692456
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 96542b26ecfbce93b84889ee4a2e4746
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata changed from e7fb65be80d659ad30e73c7bad692456 to 96542b26ecfbce93b84889ee4a2e4746

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1456139140/signatures.qemuarm.do_package_write_ipk.sigdata.log
ERROR: 4 issues were found in these recipes: source-han-sans-cn-fonts source-han-sans-jp-fonts source-han-sans-kr-fonts source-han-sans-tw-fonts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d37eba0..7237964 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -63,6 +63,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-tlwg->fontconfig \
   ttf-ubuntu-font-family->fontconfig \
   ttf-wqy-zenhei->fontconfig \
+  source-han-sans-cn-fonts->fontconfig \
+  source-han-sans-jp-fonts->fontconfig \
+  source-han-sans-kr-fonts->fontconfig \
+  source-han-sans-tw-fonts->fontconfig \
 "
 
 FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
-- 
2.7.1



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id AE6F97DE5A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 12:00:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q9so13443467wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 04:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YdMde8iumqsUSEhCcpDmqxqFN1Cro24mt10mTjgyzQ4=;
	b=OxgDXwglkR4/bbinbidVtkWx/JGV+pmrZdM5ZTksDEdTB86Fm1yxLycXfmnftzp7Nb
	x6ArIkMi2gpQWmhHjnzJF/c53o4SpMUte/0OEGM7m8JXCfQAZPK9ExlRqhuYC+8BKqWP
	J9gTWWi4IBCmPxo2LKI1ML5aiTPzSubgPkLvvugV+dbGyXW+TcYlLwi9J9EoCEAo8V2W
	iGEXMeAPzz5bvbfDiH8fv5FALKzTCDYCg41NgPjuIqb5BSenYd6n0ExA51wBJtytXNuf
	YOl8YnYkmdEe3ZTbcCPIuSymGbk+7k2MqY6bEE79n5nwn9L8bVfEmPimxdy3gVx85xwR
	qDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YdMde8iumqsUSEhCcpDmqxqFN1Cro24mt10mTjgyzQ4=;
	b=UVZK/KCENlMSrqmBOH8DQBrJZwvdXa6U1GtJsUGpAY4FbvoNmw7PuQlMbLLGoCtTGA
	tY3drsSxku4oKHLUK5RDlGLcqGYABljmUkhyp9cC8fwRJgk4YHIbGShO9rGp83wiTBic
	hr2oCKphCv7jCuG5czzqRpvIJhRtZ07u7ui3EFbKhQgs9zZOjDoY3hkj61Y17dp6mtl/
	OCLMz3oGeBPYjyuHqubqHBqzctN1YO9T1G9CUut0Bfzsucq6GQM2LwbeFtIjJ9cRFwFH
	Aa65MtWKZlXbXZTnnTyLp4GmcRWLoMJc8eG+pJMMf9WY4oeAAthHrRZiPTQREgjedSdq
	/TcQ==
X-Gm-Message-State: APjAAAWcTuYODW/esyd+MQqc17/kEU7QCV2LsGDM+h78pN/HbZ78Wkye
	o0kiFXiVhvnAH+c3kk5e2jXlaVDF
X-Google-Smtp-Source: APXvYqzgFuA1bCIkLg+BaZ/b7Cn+vrfPXcNhXErMqVAWJ9kvNv95mtr3lsfgmC+1sZdIovBOwv6b0A==
X-Received: by 2002:a05:600c:d7:: with SMTP id
	u23mr25211460wmm.145.1579003253027; 
	Tue, 14 Jan 2020 04:00:53 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	y6sm19035583wrl.17.2020.01.14.04.00.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 04:00:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jan 2020 13:00:47 +0100
Message-Id: <20200114120047.13002-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sysprof: fix ARM builds
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
X-List-Received-Date: Tue, 14 Jan 2020 12:00:52 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ot-hardcode-linux-as-host_machine-.s.patch | 42 +++++++++++++++++++
 .../recipes-kernel/sysprof/sysprof_3.34.1.bb  |  4 +-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch

diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
new file mode 100644
index 000000000..235489226
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
@@ -0,0 +1,42 @@
+From 43c39b5685445242d071b3706af2903efa508b4a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 14 Jan 2020 12:58:27 +0100
+Subject: [PATCH] meson.build: do not hardcode 'linux' as
+ host_machine().system() value
+
+In some build environmets such as OpenEmbedded this can be 'linux-gnueabi'
+or otherwise not exactly 'linux'.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/libsysprof/meson.build | 2 +-
+ src/tools/meson.build      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libsysprof/meson.build b/src/libsysprof/meson.build
+index 3449961..3c2d186 100644
+--- a/src/libsysprof/meson.build
++++ b/src/libsysprof/meson.build
+@@ -84,7 +84,7 @@ libsysprof_deps = [
+   polkit_dep,
+ ]
+ 
+-if host_machine.system() == 'linux'
++if host_machine.system().contains('linux')
+   libsysprof_public_sources += [
+     'sysprof-memory-source.c',
+     'sysprof-perf-counter.c',
+diff --git a/src/tools/meson.build b/src/tools/meson.build
+index 670052a..3fb7f0c 100644
+--- a/src/tools/meson.build
++++ b/src/tools/meson.build
+@@ -2,7 +2,7 @@ tools_deps = [
+   libsysprof_capture_dep,
+ ]
+ 
+-if get_option('libsysprof') and host_machine.system() == 'linux'
++if get_option('libsysprof') and host_machine.system().contains('linux')
+   polkit_agent_dep = dependency('polkit-agent-1')
+   sysprof_cli = executable('sysprof-cli', 'sysprof-cli.c',
+     dependencies: tools_deps + [libsysprof_dep, polkit_dep, polkit_agent_dep],
diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index b7e7bee6b..fd1b77ece 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
 SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
 SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
-SRC_URI += " \
-           file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
+SRC_URI += "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
+           file://0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
            "
 
 PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-- 
2.17.1



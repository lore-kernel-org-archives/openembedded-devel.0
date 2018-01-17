Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B74457872E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:35:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r78so13921986wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6Osin/K8dw7Q1oPpT+Zszrgy9Z+JVztSFqgJ4rWdCWA=;
	b=T1YdY4xgBzFwBZOddYU2u4+Hg+u6P0+ifl8Zzc/AqiKE5vE66HjEDoEfdi07VkRXgt
	D/yIp7VVFj6ot0KTIlKILn43VZ6/UFb+7/F3YR+03npYlT0w6abdjZnYvYDXf8dR90pC
	q65MRleU8djmq9pQ4a9trYCP1WuRp8PaVUAzFGUeOstkfG44bNP3qwMgz2IUqmYCy6FB
	jRtP14ekvYxL968Bcx1qfZg6TnHgDLGUnxfBuj4t+jqsRl13xJWoJr1l3MlpC/Jf2m5B
	lpcvxKpIkfZ4iyKYF3ybTHOp+eOI3Y1FC6Dt81NQHIdhbQ1Vi71nrBvkpyxZvdXqFUg5
	/PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6Osin/K8dw7Q1oPpT+Zszrgy9Z+JVztSFqgJ4rWdCWA=;
	b=OuV61CJS4JBAKfbNxsiHq+yRWQYfgOfMm3N5kYPaNJal66aoX6BXPVsyG1S3oiJsju
	AaxD56T6FcSikW3BbHQtMiFkJ2q5jCdoJ0+D6nZaFn78jdeASJz3ziJc/wrFAXoTQUPE
	ca6EBXdn4rH0kiV7bx8TUls/KQzM/EVl5qjHbMRQtTVbUyXnn66SH4SCNeRIXZumaoGn
	GB+dH6VEc07leLJZQchIyzC+rWGR1fzjL+vlCL/Z54cr9q0MZNeBlOuuVjVhx3bFhQBz
	yhCiRa/k0u/MMrohbfAa6QCCblD/QrTpZGlfq2H0chI1+YAVuz+jwMGy2pK9V6zNpw5L
	y8+A==
X-Gm-Message-State: AKwxytcM7D0hCCYPVLlv+R4TpspiIpYrtuq9mviOH4oyAndrqzwpSpvn
	5DVRbPdNjRTLCy/WOvc/gPa2rw==
X-Google-Smtp-Source: ACJfBovz6JaOwHhvXyhj70nD3fQXvz+4+8m1+lRJcFBUy8FDoPS6uKR4J47AmgVnjjgkgqDTuUIyLA==
X-Received: by 10.28.111.90 with SMTP id k87mr1291115wmc.108.1516178103672;
	Wed, 17 Jan 2018 00:35:03 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.35.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:35:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:20 +0100
Message-Id: <20180117083421.30233-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] gtksourceview-classic-light: initial add 1.0
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
X-List-Received-Date: Wed, 17 Jan 2018 08:35:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This theme is helpful when using dark themes as it keeps white background.

Tested with:

* oe-build gedit based on GTK2
* fedora's gedit based on GTK3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtksourceview-classic-light/classic-light.xml  | 131 +++++++++++++++++++++
 .../gtksourceview-classic-light_1.0.bb             |  21 ++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml
new file mode 100644
index 000000000..23b4b9a22
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light/classic-light.xml
@@ -0,0 +1,131 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!--
+
+ Based on gtksourceview 'classic'
+ 
+ This file is part of GtkSourceView
+
+ Copyright (C) 2006-2007 GtkSourceView team
+ Author: Yevgen Muntyan <muntyan@tamu.edu>
+
+ GtkSourceView is free software; you can redistribute it and/or
+ modify it under the terms of the GNU Lesser General Public
+ License as published by the Free Software Foundation; either
+ version 2.1 of the License, or (at your option) any later version.
+
+ GtkSourceView is distributed in the hope that it will be useful,
+ but WITHOUT ANY WARRANTY; without even the implied warranty of
+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ Lesser General Public License for more details.
+
+ You should have received a copy of the GNU Lesser General Public
+ License along with this library; if not, write to the Free Software
+ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+-->
+<style-scheme id="classic-light" _name="Classic-Light" version="1.0">
+  <author>GtkSourceView team</author>
+  <_description>Classic color scheme light</_description>
+
+  <!-- The scheme tries to look like the default GVim scheme,
+       since it is also what the hardwired GtkSourceView 1 color
+       scheme did -->
+
+  <!-- Palette -->
+  <color name="black"      value="#000000"/>
+  <color name="white"      value="#FFFFFF"/>
+  <color name="blue"       value="#0000FF"/>
+  <color name="magenta"    value="#FF00FF"/>
+  <color name="violet"     value="#6A5ACD"/>
+  <color name="cyan"       value="#008A8C"/>
+  <color name="gray"       value="#BEBEBE"/>
+  <color name="lightgray"  value="#E0E0E0"/>
+  <color name="green"      value="#2E8B57"/>
+  <color name="bordeaux"   value="#A52A2A"/>
+  <color name="red"        value="#FF0000"/>
+  <color name="yellow"     value="#FFFF00"/>
+  <color name="purple"     value="#A020F0"/>
+
+  <!-- Global Settings -->
+  <style name="current-line"                background="#eeeeec"/>
+  <style name="current-line-number"         background="#eeeeec"/>
+  <style name="draw-spaces"                 foreground="#babdb6"/>
+  <style name="background-pattern"          background="#f3f3f3"/>
+  <style name="text"                        foreground="black" background="white"/>
+  <style name="selection"                   background="gray"/>
+  <style name="cursor"                      foreground="black"/>
+  <style name="line-numbers"                foreground="black" background="gray"/>
+
+  <!-- Bracket Matching -->
+  <style name="bracket-match"               foreground="white" background="gray"/>
+  <style name="bracket-mismatch"            foreground="white" background="red"/>
+
+  <!-- Right Margin -->
+  <style name="right-margin"                foreground="#000000" background="#000000"/>
+
+  <!-- Search Matching -->
+  <style name="search-match"                background="yellow"/>
+
+  <!-- Comments -->
+  <style name="def:comment"                 foreground="blue"/>
+  <style name="def:shebang"                 foreground="blue" bold="true"/>
+  <style name="def:doc-comment-element"     italic="true"/>
+
+  <!-- Constants -->
+  <style name="def:constant"                foreground="magenta"/>
+  <style name="def:special-char"            foreground="violet"/>
+
+  <!-- Identifiers -->
+  <style name="def:identifier"              foreground="cyan"/>
+
+  <!-- Statements -->
+  <style name="def:statement"               foreground="bordeaux" bold="true"/>
+
+  <!-- Types -->
+  <style name="def:type"                    foreground="green" bold="true"/>
+
+  <!-- Others -->
+  <style name="def:preprocessor"            foreground="purple"/>
+  <style name="def:error"                   background="red" bold="true"/>
+  <style name="def:warning"                 background="yellow"/>
+  <style name="def:note"                    foreground="blue" background="yellow" bold="true"/>
+  <style name="def:underlined"              italic="true" underline="single"/>
+
+  <!-- Heading styles, uncomment to enable -->
+  <!--
+  <style name="def:heading0"                scale="5.0"/>
+  <style name="def:heading1"                scale="2.5"/>
+  <style name="def:heading2"                scale="2.0"/>
+  <style name="def:heading3"                scale="1.7"/>
+  <style name="def:heading4"                scale="1.5"/>
+  <style name="def:heading5"                scale="1.3"/>
+  <style name="def:heading6"                scale="1.2"/>
+  -->
+
+  <!-- Language specific styles -->
+  <style name="diff:added-line"             foreground="#008B8B"/>
+  <style name="diff:removed-line"           foreground="#6A5ACD"/>
+  <style name="diff:changed-line"           use-style="def:preprocessor"/>
+  <style name="diff:special-case"           use-style="def:constant"/>
+  <style name="diff:location"               use-style="def:statement"/>
+  <style name="diff:diff-file"              use-style="def:type"/>
+
+  <style name="xml:tags"                    foreground="cyan"/>
+  <style name="xml:attribute-name"          foreground="violet"/>
+  <style name="xml:namespace"               foreground="green" bold="true"/>
+
+  <style name="js:object"                   foreground="#2E8B57" bold="true"/>
+  <style name="js:constructors"             foreground="#008B8B"/>
+
+  <style name="latex:display-math"          foreground="#6A5ACD"/>
+  <style name="latex:command"               foreground="#2E8B57" bold="true"/>
+  <style name="latex:include"               use-style="def:preprocessor"/>
+
+  <style name="sh:variable"                 foreground="#6A5ACD"/>
+
+  <!-- legacy styles for old lang files -->
+  <style name="Others"                      foreground="#2E8B57" bold="true"/>
+  <style name="Others 2"                    foreground="#008B8B"/>
+  <style name="Others 3"                    foreground="#6A5ACD"/>
+
+</style-scheme>
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
new file mode 100644
index 000000000..e7dc0f865
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Gtksourceview Classic-Light theme"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://classic-light.xml;beginline=6;endline=23;md5=2b4f75364fad00a4d752214dcbd7d7c3"
+
+inherit allarch
+
+SRC_URI = "file://classic-light.xml"
+
+S = "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${datadir}/gtksourceview-2.0/styles
+    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-2.0/styles/
+    install -d ${D}${datadir}/gtksourceview-3.0/styles
+    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-3.0/styles/
+}
+
+FILES_${PN} = " \
+    ${datadir}/gtksourceview-2.0/styles \
+    ${datadir}/gtksourceview-3.0/styles \
+"
-- 
2.14.3



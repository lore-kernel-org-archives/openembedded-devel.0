Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 757926E3EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 19:35:19 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so441782eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2014 11:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=F4K4BLQ8cHCJOFOP+7H2kNfJgmF0gE/h/zT82BFbrRk=;
	b=I0ZmLir3vuppslyGLwUEQzOLcoCyjjcbODtiGRyMEJVUIwPkgBbETFqyaLE7RVtdze
	eXbJg+0Mruml613n5zkXp3638/Wl8eYFtt94CgoXSsGyqKClzTuy6YtK40hvqLv2K+f5
	rb3eCwhtb7Qz4ljxbvqBInZCz+55tDFCNNWMufXiQqH9HaPr3uHKguUHFzEfHhANhz/m
	r0+auiQ/2oM3Q2sE0m3UQGj2HT2+ocyf2ED2MswXaaRCP+tDNxWF6uxlysdAZz1cWU52
	DfVJo9Pq23RMNqoH25m4py3/vdUiyRxnKMpXl456TAoGd1OfJEb7b/qIqRgpQ4Dohvx4
	uDDA==
X-Received: by 10.14.111.201 with SMTP id w49mr4076384eeg.92.1391628920138;
	Wed, 05 Feb 2014 11:35:20 -0800 (PST)
Received: from localhost.localdomain (ip-178-200-247-214.unitymediagroup.de.
	[178.200.247.214]) by mx.google.com with ESMTPSA id
	y47sm58045298eel.14.2014.02.05.11.35.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 11:35:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2014 20:35:12 +0100
Message-Id: <1391628912-17880-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1391628912-17880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1391628912-17880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5 2/2] qtwayland: fix qml-compositor shader
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
X-List-Received-Date: Wed, 05 Feb 2014 19:35:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

running

| qmlcompositor -platform eglfs
| qmlscene -platform wayland foo.qml

causes

QOpenGLShader::compile(Fragment): Compile failed.
ERROR: 0:6: 'float' : No precision defined for this type
ERROR: 0:7: 'vec4' : No precision defined for this type
ERROR: 0:8: 'float' : No precision defined for this type
ERROR: 0:11: 'vec4' : No precision defined for this type
ERROR: 0:12: 'vec3' : No precision defined for this type
ERROR: 0:13: 'vec3' : No precision defined for this type
ERROR: 6 compilation errors. No code generated.

*** Problematic Fragment shader source code ***

    uniform sampler2D source;
    uniform float qt_Opacity;
    uniform vec4 color;
    uniform float blend;
    varying highp vec2 qt_TexCoord0;
    void main() {
        vec4 sourceColor = texture2D(source, qt_TexCoord0);
        vec3 delta = sourceColor.rgb - vec3(0.5);
        vec3 lowerContrast = vec3(0.5) + 0.4 * delta;
        gl_FragColor = qt_Opacity * mix(sourceColor, color * sourceColor.a * dot(lowerContrast, vec3(11, 16, 5) * (1. /  32.)), blend);
    }

***

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...002-Fix-ConstrastEffect-in-qml-compositor.patch | 48 ++++++++++++++++++++++
 recipes-qt/qt5/qtwayland_git.bb                    |  4 ++
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-compositor.patch

diff --git a/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-compositor.patch b/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-compositor.patch
new file mode 100644
index 0000000..1b40be6
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0002-Fix-ConstrastEffect-in-qml-compositor.patch
@@ -0,0 +1,48 @@
+From 309e9b03d24eb6b0b8fff04d883329c2f93a6a1c Mon Sep 17 00:00:00 2001
+From: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
+Date: Sun, 29 Dec 2013 14:15:41 +0100
+Subject: [PATCH] Fix ConstrastEffect in qml-compositor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Specify precision to make the shader working.
+
+Change-Id: I055fe47e1073403dc981274236fa82e091e0eca4
+Reviewed-by: Jørgen Lind <jorgen.lind@digia.com>
+Reviewed-by: Andy Nichols <andy.nichols@digia.com>
+Upstream-status: applied
+---
+ examples/qml-compositor/ContrastEffect.qml | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/examples/qml-compositor/ContrastEffect.qml b/examples/qml-compositor/ContrastEffect.qml
+index 5159950..c284b29 100644
+--- a/examples/qml-compositor/ContrastEffect.qml
++++ b/examples/qml-compositor/ContrastEffect.qml
+@@ -75,15 +75,15 @@ ShaderEffect {
+     vertexShader: source && source.isYInverted ? vShaderInvertedY : vShader
+ 
+     fragmentShader: "
+-    uniform sampler2D source;
+-    uniform float qt_Opacity;
+-    uniform vec4 color;
+-    uniform float blend;
++    uniform lowp sampler2D source;
++    uniform highp float qt_Opacity;
++    uniform highp vec4 color;
++    uniform highp float blend;
+     varying highp vec2 qt_TexCoord0;
+     void main() {
+-        vec4 sourceColor = texture2D(source, qt_TexCoord0);
+-        vec3 delta = sourceColor.rgb - vec3(0.5);
+-        vec3 lowerContrast = vec3(0.5) + 0.4 * delta;
++        highp vec4 sourceColor = texture2D(source, qt_TexCoord0);
++        highp vec3 delta = sourceColor.rgb - vec3(0.5);
++        highp vec3 lowerContrast = vec3(0.5) + 0.4 * delta;
+         gl_FragColor = qt_Opacity * mix(sourceColor, color * sourceColor.a * dot(lowerContrast, vec3(11, 16, 5) * (1. /  32.)), blend);
+     }
+     "
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 640373e..cf91908 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -5,3 +5,7 @@ require ${PN}.inc
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.0
 
 SRCREV = "3e9412e2fd91e64a565ed8ddbef76f57ca9413d5"
+
+SRC_URI += " \
+    file://0002-Fix-ConstrastEffect-in-qml-compositor.patch \
+"
-- 
1.8.3.1



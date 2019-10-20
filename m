Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 889E260017
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2019 15:59:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f22so10353233wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2019 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YVrOI3Nk4ufoXYup4P7MziERx8zV62cq883cEyYWs6s=;
	b=e8feu1IYifl+dQqYJn162JXbNHnPq9+aaYGFIHHJRDhcigS4yTu/9bEy0tORPwljMN
	uUhwEfnTGSf6UrmBRfwd4K4ALJE1dgl0a4oYWhdKKBaPDm/qRBMH0Ado0ObrXlH1PKmp
	8nQUKBPPCc1NKnAgcDZiD13zqb8fHmLn3Spjngl9qqPMqoT8kD9nW11+v45SHGloQsP5
	hvHXhVuSlEiog5DEj7JH2tXXJcphFyeh5TTqLN9wWI2eneFSWcDV6VrFbDhNndlzI+19
	xdcWsoauG1K28y6nYUUfUyiLaUjt1PVbLSOUYBCKrvVA8pDu+OM2AjjMRap3IfclCoDX
	h4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YVrOI3Nk4ufoXYup4P7MziERx8zV62cq883cEyYWs6s=;
	b=cKZ/GqGuriJ0p7ASzMpZdo7+D0nb5U/7GJMO6atOAUgOoeN293ArL7hgxnnoUJrVNS
	eZt0S6kJiCaGWfRJ0JRoykm3fXKOM16hOjmV5GG8cEX5c6VC2JQnYNh/8eG/LMjAMNm/
	OUq23/9wcniOYeNv9rgKhFMqQ1B47Wzc4of+S0Ci6Ip/pLmu4DQn3Y9bHO/hlFF6n6uU
	7jkL26Rcje2+OhcoFYqy5n9Opr720+uKwCE8AuIm82ioyUd59gPMRsONJOZcQEUuTAI1
	i6h3TQ6P0z7KEfPLoUctOSW5gQ0sRYsAiZZfXydzL5SD4H0C2mpx+JswhGflWxKTf6j1
	XKCA==
X-Gm-Message-State: APjAAAWy+k9z7f72bd7HNkTsr3LylpPgxrPnhHN7EqAePXKavqMeSU32
	3SbHe9YHZQEf6drcc41selAAGWCm
X-Google-Smtp-Source: APXvYqwRouOQo+ZtF3Sm8ul+8u6epc1VTaZt/bqbevWJxkQpkwy3wBpqtbX+NyMDiftFQhS2HuSfiw==
X-Received: by 2002:a1c:2884:: with SMTP id
	o126mr16911387wmo.153.1571587182090; 
	Sun, 20 Oct 2019 08:59:42 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F405267812FFCF570F737A6.dip0.t-ipconnect.de.
	[2003:f0:7f40:5267:812f:fcf5:70f7:37a6])
	by smtp.gmail.com with ESMTPSA id
	a71sm11428293wme.11.2019.10.20.08.59.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 20 Oct 2019 08:59:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 20 Oct 2019 17:59:34 +0200
Message-Id: <20191020155934.2476-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] dconf: Fix build with meson 0.52
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
X-List-Received-Date: Sun, 20 Oct 2019 15:59:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Slightly adjusted patch sent to mailing list [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288108.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

Should apply on master-next

 .../dconf/dconf/fix-meson-0.52.patch          | 25 +++++++++++++++++++
 .../recipes-gnome/dconf/dconf_0.34.0.bb       |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch

diff --git a/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch b/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
new file mode 100644
index 000000000..485c46509
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
@@ -0,0 +1,25 @@
+With meson 0.52 the build fails due to duplicate symbols. There is a fix
+to meson but the dconf build also needs tweaking.
+
+https://gitlab.gnome.org/GNOME/dconf/issues/59
+https://github.com/mesonbuild/meson/pull/5936
+
+Despite the comments there about this being incorrect, libdconf is unchanged
+between 0.51 and 0.52 and this patch.
+
+Upstream-Status: Pending [under discussion, see above links]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: dconf-0.34.0/client/meson.build
+===================================================================
+--- dconf-0.34.0.orig/client/meson.build
++++ dconf-0.34.0/client/meson.build
+@@ -28,7 +28,7 @@ libdconf_client = static_library(
+ 
+ libdconf_client_dep = declare_dependency(
+   dependencies: gio_dep,
+-  link_whole: libdconf_client,
++  link_with: libdconf_client,
+ )
+ 
+ libdconf = shared_library(
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
index a1996a1a3..ef549432e 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
@@ -12,6 +12,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase bash-completion vala
 
+SRC_URI += "file://fix-meson-0.52.patch"
+
 # I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.21.0



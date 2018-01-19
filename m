Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88D51787BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:19:45 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o7so1882935wro.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VQClStHEetadvgzh4jeYfBSIPM+zDnCd1GbVLfgsWCo=;
	b=RMjLnVCdtB3JqIjo5Br8W1Dv+M6VR2Nf8kkj1b8EgvY+8pgHWGyuoTUe1AOjIsahSU
	gxf6fwDdEVLhfTDhybkNpjRIl2T7yezvDdEQ5UWIJfwANbSEwYMdu0/MBfY8Hsh80fzU
	p/4DJ8yDTFJaMtZQ9jnyFIplj7d9BEG+H8CYnkqO41upM/qFHoQkkGQLRF4QxzI4GCqm
	dp+/1vDBFFtLPqXl7S2OSPWFjZOOYJs7PBJAAYQOrYgUXtHjubVLbzDh7EsLYRtIvilg
	gFlUanUWWJpUENvDjuF10ocxrEbcETFhp+87M+7mGl+nkk96A4QrFRRydwDLSQ1ex0Uo
	+kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VQClStHEetadvgzh4jeYfBSIPM+zDnCd1GbVLfgsWCo=;
	b=Rs2Bf8UiYPgXqhQ3Jsk7Xhszd8d/gTshbCKv496xybVzDG/XDb9TfotBMt2a9O1Xgz
	5UKHoCjloiJiwOPrGb4RlxRGdSv1kFKm/VEU/WA6zTrylMkYrLuc9xaV81PIl89m1PdU
	Cz9hCOAKVetqBi8UDX9n4sETrMydMbqbtrCZ7VOlsshLprryBKYOoiq8rHwxe2MgS1NZ
	oNz+9frOxuyas4Z2Y8DLtdd+hJkmMZR3F6UrO4SSaqSgM8XXP8Hv+dLeo5zM8Wy+5Cxe
	++/l4VsXbWJfxWPnAjNTb0Xru9+vUTHw9O3XxsLB7AEc++JnFNjyoKjC8bWP+zgxkrPq
	+R0Q==
X-Gm-Message-State: AKwxytd0o/xuXKD800qy+wTa+vNaWW5UdaGHCYikHBqn7e0LOjb8WvV6
	//D+nGZ77UKuTX8DiTQ5nLyqxQ==
X-Google-Smtp-Source: ACJfBouxRWC1ZXsjJNlFOsboOCLxIy7lhtdcCDkYAxjiY7LNs6bpJxj3atj5nXGQmH3oDuFvDxpeFg==
X-Received: by 10.223.185.21 with SMTP id k21mr10372941wrf.37.1516375186051;
	Fri, 19 Jan 2018 07:19:46 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m6sm1722598wmd.37.2018.01.19.07.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Jan 2018 07:19:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jan 2018 15:19:40 +0000
Message-Id: <20180119151942.19731-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH 1/3] fontforge: explicitly depend on gettext-native
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
X-List-Received-Date: Fri, 19 Jan 2018 15:19:46 -0000

* fixes:
  Making all in po
  make[2]: Entering directory
  `TOPDIR/BUILD/work/x86_64-linux/fontforge-native/20170731-r0/build/po'
  msgfmt --check --output-file=ca.mo ../../git/po/ca.po
  msgfmt --check --output-file=el.mo ../../git/po/el.po
  msgfmt --check --output-file=es.mo ../../git/po/es.po
  msgfmt --check --output-file=it.mo ../../git/po/it.po
  /bin/bash: msgfmt: command not found
  /bin/bash: msgfmt: command not found
  /bin/bash: msgfmt: command not found
  /bin/bash: msgfmt: command not found
  make[2]: *** [ca.mo] Error 127
  make[2]: *** Waiting for unfinished jobs....
  make[2]: *** [el.mo] Error 127
  make[2]: *** [es.mo] Error 127
  make[2]: *** [it.mo] Error 127
  make[2]: Leaving directory
  `TOPDIR/BUILD/work/x86_64-linux/fontforge-native/20170731-r0/build/po'

* as Ross explained:
  needs explicit dependency on gettext-native
  native disables NLS so just has gettext-minimal-native in the depends

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
index d9f086749f..481fedf983 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=3f922b42ed0033fa0fd4cd3268f6429c \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib"
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib gettext-native"
 DEPENDS_append_class-target = " libxi"
 
 inherit autotools pkgconfig pythonnative distro_features_check gettext
-- 
2.15.1



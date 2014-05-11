Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (unknown [209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id BFD0C60167
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:47 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id el20so1041495lab.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s9bWoFsx6mfsOqBOg7Jry15E22VAuSEOn6ft7hRw0JY=;
	b=oR+Gv7fsgVMmT0JKD822NsRGBy0uGtZVreJV3XhQt4KBNYssNPhrS9PdJLKkZwRU6c
	9tefQEZwIYkdbColuRgGqDqdIpaNi2ieI3tLN1vRDIKSEEZuUSsMCV+6JMH2cBYaISuF
	0m0CJdOzRN6Rqp0z9MP+nwl4agWqEYuCUbnHeVRPvnlqNAbC5ciKul7ksAIk+tmoDBnG
	BzrAPYlKaW+7wizwihGu+d1hPp9dnE/Cf3jVVXSi7uTIfEV6FEpO/x+XzoJD+DmWVBro
	mX5CLWqtkC7NXXC4uwZMPnya81phLpa32X24XvYdqW7Mw+T1BH6+bTbgTnhoKT+Id9Fb
	fqxQ==
X-Received: by 10.112.27.133 with SMTP id t5mr18685845lbg.21.1399790987350;
	Sat, 10 May 2014 23:49:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa8sm9567634lbc.18.2014.05.10.23.49.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:46 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:05 +0200
Message-Id: <1399791009-2718-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] libao: add PACKAGECONFIG for alsa and pulseaudio
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
X-List-Received-Date: Sun, 11 May 2014 06:49:48 -0000

* fixes following issues from test-dependencies report:
  Found errors:
  libao/libao-plugin-libalsa/latest doesn't exist
  libao/libao-plugin-libalsa-dbg/latest doesn't exist
  libao/libao-plugin-libpulse/latest doesn't exist
  libao/libao-plugin-libpulse-dbg/latest doesn't exist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index d2da08e..1a22604 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -26,5 +26,7 @@ python populate_packages_prepend () {
     do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d) ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)"
 PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-- 
1.9.2



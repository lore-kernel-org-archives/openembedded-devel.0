Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 222A1705FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 04:08:27 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu12so10233006vcb.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uUendagu4Mw+y5w9wlgvUFUlpqgZF8tzUf/tNdzLHVw=;
	b=Pl4/sgJ/o5SY3RwjS+Tyoh+4Q+pT9DzoS6EKrqxXxeCmJd20HPMAIzablEb41rxS3i
	JQSyokx5g1oTTZGC6Hlcze3chpceBKVMWCYxoutO8sB/iRciiB5plq6dQiRuC0eYchNy
	bGkAeX2JdmrffYCFeMQdouS+N2WWWQSTNMI8IzCMy0xizpKOLBfNoAGUBD9O3N+920yS
	ITlbYJE1b+4fd8lpgct7Bh2d9z/ntAZyDRdGNQdnjfaN07MiUaugKA9z9ae9wRaCfnPF
	Wbm/bBBkf9ktZKEBKneLTq3RQscDTRqh8NS77Rxl9nuXCTqHnwaw3nQ3Mioq50UI7pk6
	zF6w==
X-Received: by 10.52.63.226 with SMTP id j2mr15605952vds.43.1405829308533;
	Sat, 19 Jul 2014 21:08:28 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id n7sm2868785ven.1.2014.07.19.21.08.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jul 2014 21:08:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jul 2014 21:07:40 -0700
Message-Id: <1405829260-13293-5-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-multimedia][PATCH 4/4] vlc: add patches to fix B!=S and pkg-config
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
X-List-Received-Date: Sun, 20 Jul 2014 04:08:34 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
index 46a2712..f9be48d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
@@ -5,6 +5,8 @@ EXTRA_OECONF += " --enable-libxml2=no"
 
 SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0002-glibc-does-not-provide-strlcpy.patch \
+            file://0003-use-am-path-libgcrypt.patch \
+            file://0004-modules-gui-qt4-out-of-tree-build.patch \
 "
 
 SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
-- 
1.9.3



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6HB-0006fd-Ka
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:34 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CBEqc3lCVoOyBmCrWuvIB5uD757Yl2pJ/xxyfnLCzVA=;
	b=A/LgCvegcaPpMyHWkwio7aN/HEM+mVLKwjIbqwClChOLuwBtC0JEuEoj6Q2rwYpsbe
	+LOh3gpVKIMChmPxTi3Z7Jwx4mWRDOYpvpYROkkX+tSNHfnsEoRKYMemH4IAEMoUft5q
	AcXK46oNbSv4uRCC6NrBdCWaoUSJ2AiPK6dDk=
Received: by 10.223.76.11 with SMTP id a11mr13058588fak.1.1319884231298;
	Sat, 29 Oct 2011 03:30:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d21sm20443384fac.4.2011.10.29.03.30.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:07 +0200
Message-Id: <1dd29bc4f6b05d60b8b7a5d01c3c2cb94c9d9c46.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 11/12] systemd-serialgetty: use better default SERIAL_CONSOLE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Oct 2011 10:37:02 -0000

* having /dev/ttySO fails with:
  | ln: failed to create symbolic link
  `/OE/shr-core/tmp/work/nokia900-oe-linux-gnueabi/systemd-serialgetty-1.0-r0/image/etc/systemd/system/getty.target.wants/serial-getty@/dev/ttyS0.service':
  No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/systemd-serialgetty.bb    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index 86d833e..9294869 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Systemd serial config"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
+SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://LICENSE \
            file://serial-getty@.service"
-- 
1.7.7.1




Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3K-0006Q0-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:06 +0200
Received: by ey-out-1920.google.com with SMTP id 26so226051eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6a57sSn28mhsHaFGUZqnEYoTZSwKU9jorN32TB/0nwA=;
	b=lv9qQqrZJw5Us/AiXm0vaVJrYVrvo6w4vj4C3XCJAln34cqAXb/eZ//XNqwM/yqLtk
	9+RHLYUgsVB3tMnUVp42WpRmSJMtDJK1v87nBqWFwm6XQtU9LV9Z8gI3r+PKkTcRwBId
	ySQr0RxlKhkKrIfbX3X4qqBSED2Nia/b82GOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iLUJAPBwDmB/tq9WD7+g+WH60E9FjVRgahMTgjGlqU/OQwjJlkLwIr3/8oRUChFfEW
	EEuhLD7YvKDitG2OjolpJes+64X74Ez4HJ6RUYoecs1RfEKgMFhfwmf2PFFohDgUQUgO
	+a3jqwNP3KvoeEPqx2mvhMYrs9fLToS02UjeY=
Received: by 10.210.79.3 with SMTP id c3mr932951ebb.41.1242207624031;
	Wed, 13 May 2009 02:40:24 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm1233541eyg.24.2009.05.13.02.40.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:23 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:04 +0200
Message-Id: <1242207556-15601-26-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 25/37] libart-lgpl: remove INSTALL variable as install should be provided by autotools
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
X-List-Received-Date: Wed, 13 May 2009 09:47:06 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gnome/libart-lgpl.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/libart-lgpl.inc b/recipes/gnome/libart-lgpl.inc
index 8ff3b21..1af5b0e 100644
--- a/recipes/gnome/libart-lgpl.inc
+++ b/recipes/gnome/libart-lgpl.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPL"
 
 ART_CONFIG = "${HOST_ARCH}/art_config.h"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 # can't use gnome.oeclass due to _ in filename
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
@@ -31,7 +31,6 @@ EXTRA_OECONF = "--disable-gtk-doc"
 # enforced.
 export MKDIR_P = "mkdir -p"
 export mkdir_p = "mkdir -p"
-export INSTALL = "${STAGING_BINDIR_NATIVE}/install"
 
 do_stage() {
 	autotools_stage_includes
-- 
1.6.1




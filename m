Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 020CD610F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Aug 2014 16:01:04 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so6553998wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Aug 2014 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4o917JuUfsJIl29DocARqZWD4Xr+fXcxuHdLMtbMbDA=;
	b=TEJzyOVWZd4uDC+doWFu0lrqwJ8VhFviObVMu+UNN+JchzWi1IUrAozDTqEBrJQtW/
	HE3TAq60nGQzOG9Dj+lzMxosoGKsPFlPl0AYcvlcfGxEZ68dFV6+UVIGPK55vQU389Fd
	RxUGz9nztVnYmZXWzHvETGpS6qqJz53inliL259NTDWfkTdXoTTFi/SiJgPaHIwl/QrR
	lniHP4/XyjRJaI/tI+//1haobRi80/GH0t9Uh6FPLmixoqkHk7u1GZsQAoSo/x+W4+Gu
	U7E4QlUakbhGQ68s8DWcrC04kjgOk7toCs1qZCDK0J3Ei1aTW5C0dsAAqs/xck8jO/1C
	GuDw==
X-Received: by 10.194.2.132 with SMTP id 4mr24567063wju.49.1407081665597;
	Sun, 03 Aug 2014 09:01:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs3sm31131499wic.20.2014.08.03.09.01.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Aug 2014 09:01:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Aug 2014 18:01:29 +0200
Message-Id: <1407081689-21804-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1407081689-21804-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407081689-21804-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] concurrencykit: fix SRC_URI, add PV, inherit autotools-brokensep
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
X-List-Received-Date: Sun, 03 Aug 2014 16:01:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index fe57d9e..eebccf0 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,9 +7,10 @@ LICENSE = "BSD & Apache-2.0"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
+PV = "0.4.3+git${SRCPV}"
 SRCREV = "900d203aa9e41288545368ea40da0bee89f7907f"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f12611e65e064515ce264249b2bdea98"
-SRC_URI = "git://git.concurrencykit.org/ck.git \
+SRC_URI = "git://github.com/concurrencykit/ck.git;protocol=https \
            file://cross.patch \
 "
 
@@ -17,7 +18,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64).*-linux*"
 
-inherit autotools
+inherit autotools-brokensep
 
 PLAT_powerpc64 = "ppc64"
 PLAT ?= "${HOST_ARCH}"
-- 
2.0.2



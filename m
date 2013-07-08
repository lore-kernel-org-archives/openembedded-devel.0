Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D08626B12C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2672153eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sHez5KSgFw3TAgd+0H2HOHUaSHslAk5yHptFDpo50Ws=;
	b=vEsSBvZip+vTJL+yKDikNb/8dI0pnTJ2Z+1fcQDmZfcgZetlK2OoqgZXvh9UQHP7jK
	Zuulm+pe/2UrEMZkDiAPS4EVjNfBBIDI4oQNCn0s5JmNzMMbghf2piAVjVGCFa0lq3TR
	XhVgvlaOmrYSqOParQNOe5+jfZbEW66o3IE2y6dP62Kx3wzabNynUX87SN8ZfloIaswb
	vaC1NADMEnxZdO4G0IGgbwshck7acYvpX+0QsvIQQbzwxCBE2YGwDS6a4JXgoqz3OG+D
	059+Xt6LW6swwbMs4Tpo7kj6QGAwIDHuCnwtU15f2vgO7dHYyM5YQ0UzKekeDFcXydVS
	pgcQ==
X-Received: by 10.15.31.198 with SMTP id y46mr23953938eeu.135.1373272892403;
	Mon, 08 Jul 2013 01:41:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm40363666eed.9.2013.07.08.01.41.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:30 +0200
Message-Id: <1373272893-26013-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] portaudio: inherit pkgconfig
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
X-List-Received-Date: Mon, 08 Jul 2013 08:41:32 -0000

* without pkgconfig it's failing to expand PKG_CHECK_MODULES macro:
  | portaudio-v19/v19+svnr1387-r0/trunk/configure:
    line 11721: syntax error near unexpected token `JACK,'
  | portaudio-v19/v19+svnr1387-r0/trunk/configure:
    line 11721: `PKG_CHECK_MODULES(JACK, jack, have_jack=yes, have_jack=no)'
  | Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index b35d1d8..ced4b6b 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -4,12 +4,11 @@ LICENSE = "PortAudio"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 SRCREV = "1387"
 PV = "v19+svnr${SRCPV}"
-PR = "r0"
 
 SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
-inherit autotools
+inherit autotools pkgconfig
 
 TESTS = "  pa_devs patest1      patest_hang patest_many                   patest_prime patest_sine patest_stop     patest_write_sine        \
 pa_fuzz    patest_buffer        patest_in_overflow  patest_maxsines       patest_read_record  patest_sine8         patest_sync              \
-- 
1.8.2.1



Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlYX-0007YZ-9E
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:45 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=YGFQl7BnisuqKkyRzDzYRaehzsqUSkdniLeB7Hd6rLs=;
	b=eOyCXm+5wozDIoPivwpvMYDasZVu9vGCVkKdAUg+5Na/l3AURV/+KmaTgA6nSLo61p
	jeWmZicSy1S22REw043WhuqSGezURLIQWtSziaWuCct+xntt2Wuxs1Vk77rgnY3e86oV
	GWLPI5lanEXaX4CBIDN/5WHUl95V7TtLZ/q88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=THTgCZJZrz3njjhNyhNUzZnXGTZHRW9bnMQsr33Lu8aFEZMdgfHS45a6CSxDjf7aPr
	U1ACt8raBNUBEFYElhhv52L/yiYFKWrcGhKgUnDVdUmjniWZqb5Sjv5Od11tvwuil/QT
	ToVMfX28VBRLtVPvv3enDIVu1yuv5eP5mnwpw=
Received: by 10.223.68.193 with SMTP id w1mr4773083fai.42.1306696700847;
	Sun, 29 May 2011 12:18:20 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l26sm497952fah.14.2011.05.29.12.18.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:22 +0200
Message-Id: <fa4ed171dfb0c9d8ce5400a508ef4b1479f34101.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/16] portaudio: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:22:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/portaudio/portaudio-v19_svn.bb |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
new file mode 100644
index 0000000..a897a3d
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A portable audio library"
+SECTION = "libs/multimedia"
+PRIORITY = "optional"
+LICENSE = "PortAudio"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
+SRCREV = "1387"
+PV = "v19+svnr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "svn://www.portaudio.com/repos/portaudio;module=trunk;proto=http"
+S = "${WORKDIR}/trunk"
+
+inherit autotools
+
+TESTS = "  pa_devs patest1      patest_hang patest_many                   patest_prime patest_sine patest_stop     patest_write_sine        \
+pa_fuzz    patest_buffer        patest_in_overflow  patest_maxsines       patest_read_record  patest_sine8         patest_sync              \
+pa_minlat  patest_callbackstop  patest_latency      patest_multi_sine     patest_record       patest_sine_formats  patest_toomanysines      \
+paqa_devs  patest_clip          patest_leftright    patest_out_underflow  patest_ringmix      patest_sine_time     patest_underflow         \
+paqa_errs  patest_dither        patest_longsine     patest_pink           patest_saw          patest_start_stop    patest_wire"
+
+# DEFINES = PA_USE_OSS=1 HAVE_LIBPTHREAD=1
+# DEFINES += PA_LITTLE_ENDIAN
+
+# INCLUDEPATH = ../pa_common
+
+PACKAGES += "portaudio-examples"
+FILES_portaudio-examples = "${bindir}"
-- 
1.7.5.rc3




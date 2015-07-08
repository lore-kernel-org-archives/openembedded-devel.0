Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DE8E875CFB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68H0vbT003458 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 18:01:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ack4q9vubQNF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 18:01:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68H0sGj003436
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 18:01:05 +0100
Message-ID: <1436374854.9778.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 08 Jul 2015 18:00:54 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH][meta-multimedia] gst-ffmpeg: Add explict getVar expansion parameter
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
X-List-Received-Date: Wed, 08 Jul 2015 17:01:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Bitbake is likely to require this parameter in future, add
the default value.

Patch generated with the command: 

sed -e 's:\(getVar([^,()]*\)\s*):\1, False):g' -i `grep -ril getVar *`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
index 7bd7ec3..8909f37 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
@@ -79,8 +79,8 @@ GSTREAMER_DEBUG ?= "--disable-debug"
 FFMPEG_EXTRA_CONFIGURE = "--with-ffmpeg-extra-configure"
 # pass --cpu for powerpc. get cpu name by stripping "ppc" or "ppc64"
 # from DEFAULTTUNE
-FFMPEG_CPU_powerpc = "--cpu=${@d.getVar('DEFAULTTUNE')[3:]}"
-FFMPEG_CPU_powerpc64 = "--cpu=${@d.getVar('DEFAULTTUNE')[5:]}"
+FFMPEG_CPU_powerpc = "--cpu=${@d.getVar('DEFAULTTUNE', False)[3:]}"
+FFMPEG_CPU_powerpc64 = "--cpu=${@d.getVar('DEFAULTTUNE', False)[5:]}"
 FFMPEG_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux ${FFMPEG_CPU} \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \




Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id CF7926BD79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:02 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so341280eak.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qFxE54/ZvcIEiq4T4H80sZhchZMc1Omex6f8LsU7n9w=;
	b=vKkkGnDyCE+yGYHnMh6eXfF06bq3F//lI48LlWvZIYIbqRvt2jXTJTsd0O14w9m5XV
	OgmXZjtHXDeRkjfRcb6ZBYI+MpIJe7VuBucpT1ZVoXGylGAt6SelJqQ6qEtDOUH7i+ac
	bkaRmqlF26+blDWFgQUR7EIMbxSFKfx2lKDCX6oHqcoaSmgod4+3g2g6M2b5nny9ZS47
	I3VerLvX7bYXQmoj8tUmvCuaCDhQ/of4LuKFOcpPmg7Y8oaPRr+p6xu7f3eV4GV09LB+
	J6aTpcm2c04TwKE000gSaGL3OXN3VCgq6GrXVlFoTmwOCisUKWDgdAOXgiZHlvxHoOxd
	CIJw==
X-Received: by 10.15.35.196 with SMTP id g44mr5410488eev.18.1377791463296;
	Thu, 29 Aug 2013 08:51:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm47156370eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:04 +0200
Message-Id: <f1d740d18e36056e674086935d2045faf004f18f.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 11/66] mkvtoolnix: Add PACKAGECONFIG for flac
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index 0106594..3b8eb32 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -18,6 +18,9 @@ inherit autotools gettext
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[flac] = "--with-flac,--without-flac,flac"
+
 EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 "
 
-- 
1.8.3.2



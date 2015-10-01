Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id DA8BB762A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:06 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so38976741wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eSCoTNzBDWqr9bEiDf8HyvrqMwvUWzOo2Tm2kCf0r9U=;
	b=JvGlIhiWTcIdZMxsxgS+KcNmlKeDesjeVbh4XjGAqlzJ+N+mLFTIfLoKETwLtBzDSn
	lucFHbeRtVDV4hR5VjctuHcdQK9KkXhPuGTpICItNFPA4vt7SPwW3jMkJ2yRxfEn30mh
	1bHNwrE8ZO76JzCNgjJtHbLm6xa6owA6vNWFJ/Zi66ZSc1OmbSzDX6JTt8aMD9DUUnuk
	dkwrn2oF0J1kKwRf4oFdEPtIR4pecZ5u+/6Ugxv9WNehnvzGzMQuCL9kV+0SGx4/lIqJ
	sFL8MN/tyx3h+HH9RKnTeqzOGQsW6aEoSTjdKiHjr/CzmfafOmTFcmsMY49lZBDSgjrN
	g/cg==
X-Received: by 10.180.186.195 with SMTP id fm3mr4168491wic.1.1443713346269;
	Thu, 01 Oct 2015 08:29:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l1sm6686842wjx.13.2015.10.01.08.29.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:29:59 +0200
Message-Id: <1443713401-8584-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/4] mplayer2: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index b208144..2f0369a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -153,3 +153,6 @@ do_install() {
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
     [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
 }
+
+# | libmpdemux/demux_ogg.o:demux_ogg.c:function demux_ogg_read_packet: error: undefined reference to '_ilog'
+PNBLACKLIST[mplayer2] ?= "BROKEN, fails to build with gcc-5"
-- 
2.6.0



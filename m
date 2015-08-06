Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3688C60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:53:17 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so17408913wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Hhcn/BjtX+8rOI+kY6O1sWvfYucsSQr6bZub9o1rSEU=;
	b=mvWtPIYrsmvX3tTpjii2bFgMqlEz9Gv4/J/E0s+zitfTRKT3qhjr3Mi7vhJhj7BZ8e
	fanosRoynC3J++TV5qw2CAvi84cLb1ZFvoz/n/0+VZ2PZuE4LXe+UjlfYuxcl7YTuzab
	QNPSk8pB6vaujpv465rmCkZy5AQbafrGGhNyv/5C/l++DrjQyxyRqjMizIznBnMG0w3N
	+dGJWbKAI9g/TYxBlIKe5llfnWclNNiCohbIaxjXWk0pDkKw3rii+K4Q6flYUGqlPew8
	700QPzaYnZw8D9ShmdsvgO7Rf4bIFVD/bQ13GR7Lmd3aaGADVVgpwJO5eH5Rr9xaJfOF
	j6YQ==
X-Received: by 10.194.238.168 with SMTP id vl8mr2190271wjc.128.1438858397490; 
	Thu, 06 Aug 2015 03:53:17 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-180.hsi12.unitymediagroup.de. [109.91.251.180])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm8881944wjb.9.2015.08.06.03.53.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Aug 2015 03:53:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:52:08 +0200
Message-Id: <1438858328-5247-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] add libx11-locale to qtbase-plugins RRECOMMENDS
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
X-List-Received-Date: Thu, 06 Aug 2015 10:53:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

| Qt Warning: Could not find a location of the system's Compose files. Consider setting the QTCOMPOSE environment variable

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 33620cb..6ba7c8b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -265,6 +265,8 @@ FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_LIBS}/fonts/*.qpf*"
 FILES_${PN}-fonts                = "${OE_QMAKE_PATH_LIBS}/fonts/README \
                                     ${OE_QMAKE_PATH_LIBS}/fonts/fontdir"
 
+RRECOMMENDS_${PN}-plugins += "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
+
 sysroot_stage_dirs_append() {
     # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
     rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
-- 
2.1.0



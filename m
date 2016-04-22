Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBD7612E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:12:15 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id c6so63999693qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K9lTJGd4J5j1+QXGMPkvKXHeNVX4cqA1F1VLCU+zrAk=;
	b=UNrpzgzPCMDfJuMwuww0oTJL2E+p/F4B0tx6uOBTyjPmgUXot3wkzRQrILFtJV5cxT
	hzRBofE2n+0dWk0Z0rYxjdlpRhVQVDmQZsm8I6CiYOKozyFMvH8YPDYOoiHkvgQY28Th
	plioctt2QqSPFSPljU0OtyDmt+lO6dwkZJPoN8zV3qU7zUOxC2EbkUWLfMhzwH7NnXkc
	MgFteNfBKXKYdToo6MJqSMOMrdnT9+qLTkCT+VK93MUJnzhemRQWsknjs45zE1LEj/mQ
	lmY/a3QHnfHSLRuJdq10HU77utKh7ubwvhDuRlvhuAe5i6GdHwvF4KLu6gZVJMNl+Qtp
	bVZA==
X-Gm-Message-State: AOPr4FUuVY0BZra4WmOQ1p2XdDRUku200N+05ywi7Bo7Bc2eL6ZXeCF1KbVErxn/tTCg0w==
X-Received: by 10.141.41.130 with SMTP id s124mr24161011qhe.69.1461348736469; 
	Fri, 22 Apr 2016 11:12:16 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id e63sm256680qge.45.2016.04.22.11.12.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 11:12:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 14:12:05 -0400
Message-Id: <1461348725-16440-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] bootchart: update to 1.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2016 18:12:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/bootchart/bootchart_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
index a8b8184..2b75eaa 100644
--- a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
+++ b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
@@ -4,16 +4,16 @@ HOMEPAGE = "http://meego.gitorious.org/meego-developer-tools/bootchart"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 
-PV = "1.16"
+PV = "1.17"
 PR = "r1"
 PE = "1"
 
-SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git \
+SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git;protocol=https \
            file://0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch \
            file://0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch \
 "
 
-SRCREV = "872fb107028e377eef3c0c7c8a6e0f7c32b8ebb8"
+SRCREV = "a2c7561d4060a9f075339bda89e793c76f2ff6dd"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



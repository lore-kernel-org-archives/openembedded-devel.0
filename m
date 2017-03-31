Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8174E77E53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so18541678pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qvIhCWCgn6FPtXcPC6TcnwZbU9lLGsOx9ciMTW7breE=;
	b=SN3CpkbiPKs/oNPR/ps7sVeueiatwGt7PtFdVgeF3lwiAi2JfTR6x/GwcvUeY21WfU
	VEKykTPglt3IL65mJY5xhCY5VikYcIQSi1q0bjcPJ5Xy6T2Gz+yhNHlf0aW0Otv8Em88
	c6F4JnYmGbjka/RarkdOuGNseY+JfxyCBoyLwXyNdByDwhGdSFar0bie51OJW036r3q8
	4aiK5FtpO0weDqLTHB6xgz0OMELLQsQr3rAMGZq4sWjdbWLQ9jsj8fK5Ea657gNDnpdE
	RrhF77Fp+d5Bj1Hh/qX0P5Ghkfveo+w4KuXYC4CfkA6QOCyevWwmiHrxTixluJW82j/Q
	qeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qvIhCWCgn6FPtXcPC6TcnwZbU9lLGsOx9ciMTW7breE=;
	b=UTH6qPSle8JI+S6suWk52AIZNqiqyQBJ06KUfUbC7VYLwk2melalxl29tCjaIE+/7k
	TDki0pVBZpd0okbUWB1nSuztqY/OUekjWyGL3QSfk2HGeLiNoMewt9NsMXvtPph5PlmE
	I7Lf3LWmrs9/Nw2pf/1xgljewFKGlPJ2C521C4RezJ53qwd6kIvfSPmo0GxvyTF+9O22
	EQnDkrWzwf1Tff8N7ZxD0dLBRmeM+VexIVGzIsZiHaO3HJNv54jM4XnMcb1khNZPdBEg
	vhYEACGj0VnHKOWYcW3KC+BidSaClfqMaBwR9oprrbLrpq/zTa51OqclRZfbmxptpoAl
	tZDA==
X-Gm-Message-State: AFeK/H0JPfk/SOWQzht2dDZ04mMfmqvxzpIAQfWfNW2vF5+zalcOOAUwksjV5GQHGUUTvw==
X-Received: by 10.84.218.69 with SMTP id f5mr4579780plm.114.1490978600770;
	Fri, 31 Mar 2017 09:43:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:22 -0700
Message-Id: <20170331164247.5052-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/43] ttf-inconsolata: Move copying of .otf to .ttf into do_compile
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:19 -0000

Fixes errors like

| mv: cannot stat '/mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf': No such file or directory
| WARNING: /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/temp/run.do_configure.2485:1 exit 1 from 'mv /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/Inconsolata.otf /mnt/b/build/tmp-musl/work/all-oe-linux/ttf-inconsolata/20100526-r0/ttf-inconsolata-20100526/Inconsolata.ttf'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 20041bb7b..0d6df242a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -13,13 +13,14 @@ S = "${WORKDIR}/ttf-inconsolata-${PV}"
 FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
     ${datadir}/doc/ttf-inconsolata/*"
 
-do_configure() {
+deltask do_configure
+
+do_compile_prepend() {
     mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
 }
 
 do_install_append() {
-    install -d ${D}${datadir}/doc/ttf-inconsolata/
-    install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
+    install -D -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/OFL.txt
 }
 
 SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
-- 
2.12.1



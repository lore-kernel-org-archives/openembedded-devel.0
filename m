Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id ECF55780A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:37:39 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id v27so66080967qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFDolR0YFHDJWuP/T17adckMps1DRKFw3Mc4xz8rQMI=;
	b=oCFavP/zpXzWrHQqw3S8ii6Xy4f1MVuCSkKUnbY0A8BNYFbYe4Xcje3bjR/EAbEtTC
	E2MVhBqgT2xu4fhtLfLv0VDeaIC7jfC/1R2hywVfMofMY+0fhHEJiDj4GQix/YuR1JST
	NiEfieLc1ESluN8avDKqzsfZvXKBwkyNhQWKDGIzI/NnH0/VcT3jcfBD0UzY+eAwuVhx
	Eyw0glocxXGv3C9AzPUe1bOpJZYW4aHQJiyCzNfw5Zq/BcOI4zz8cLw1BDU5Wm+Ddxdj
	zdsoScNvHEYbuj/frZwVU6+U0rnUmvB2lc7n0alUwJSYp/fqw94X5QJoeMY2ao9LG4sm
	JR2g==
X-Gm-Message-State: AODbwcDe8nwv/EyVuPpvksm40PwHfplCHbJ1IvSHDPda2Hd6QD8QFFwI
	4JoGYrmnNy/5+xjdJMs=
X-Received: by 10.200.56.152 with SMTP id f24mr10561367qtc.287.1495222660568; 
	Fri, 19 May 2017 12:37:40 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	t136sm6680165qke.40.2017.05.19.12.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 12:37:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 15:37:30 -0400
Message-Id: <1495222650-8221-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libsub-exporter-progressive-perl: update to version 0.001013
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
X-List-Received-Date: Fri, 19 May 2017 19:37:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...erl_0.001011.bb => libsub-exporter-progressive-perl_0.001013.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libsub/{libsub-exporter-progressive-perl_0.001011.bb => libsub-exporter-progressive-perl_0.001013.bb} (79%)

diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
similarity index 79%
rename from meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb
rename to meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index a2a1305..64d19c0 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001011.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -11,13 +11,13 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Sub-Exporter-Progressive/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=51;endline=53;md5=a171d2e9f8688a44e5f1b6dcc62029e6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
 
 DEPENDS_${PN} = " perl-module-test-more"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
-SRC_URI[md5sum] = "bb50b3ba1538902b197c04818a84230a"
-SRC_URI[sha256sum] = "0618c6e69c6c0540c41e7560d51981407a6a0768f1330bef6d6ac3c6f1fa7c06"
+SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
+SRC_URI[sha256sum] = "d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056"
 
 S = "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
 
-- 
2.7.4



Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id AC45E73D27
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:48 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f92so56354756qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ICpg6/6aYg5ztaD9lLixVw7oL5kvthIn3lft0aEDvKI=;
	b=XdVsygru9N8Ca+syb8yRuN5FbtSUdZ4vs56e58C73zt6iYQ8c+fYrj10wFwjT8IPQq
	ETAD2i127tBzXBlrfnkUtLCGVVEOPBBTQyGXVKwx99WSbn4FOaEJjLCf+3IG+gEz8F03
	IBCMPXX8MP7Z8kBn/h4piwnqVYt9bPBSLc/A6+2TRL+eygt/zhr9VPB095nPTPHLK8ib
	RosegtHXtd7/+7yDUD6LWcLI+J3LAeUN70GT6PrdkizkyNqcEm2DAOi8hRcOjqTNCl/X
	K5BoM/o1L+FNSbX/BHqU9Q3kL1pAMN6PqqzlJRUmYyO8SnlNX3VvAZV54PWhhmqwmDKv
	ja0w==
X-Gm-Message-State: AOPr4FX3GxibEVrAaLYto5Ok39dr67yCWECiR1Jrsb6EcQp8WX/jSs9Ros49/5dtknjRIQ==
X-Received: by 10.140.93.247 with SMTP id d110mr19850617qge.28.1462543369256; 
	Fri, 06 May 2016 07:02:49 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	d31sm5771416qgd.44.2016.05.06.07.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:48 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:56 -0300
Message-Id: <1462543259-7206-19-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 19/22] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Fri, 06 May 2016 14:02:48 -0000

The opencv-java is not always generated so we ought to include it,
only if it is available. The opencv-locales is not available and ought
to be skipped.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

 meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c1f9802..789512f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -79,7 +79,8 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+PACKAGES += "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
+             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)}"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
@@ -104,7 +105,7 @@ python populate_packages_prepend () {
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
     bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 
-- 
2.8.2


